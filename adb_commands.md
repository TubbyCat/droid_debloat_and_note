Copyright © 2022-2023 TubbyCat

See CREDIT and MIT files for elaborated copyright information.



# Debloat ADB Commands, Explained
This is a summary. The upstream documentation, in my opinion, is needlessly dense and could have been better written by a gibbon fed a steady diet of beatings and neurotoxic research pharmaceuticals.
> NOTE: Gather info on a package prior to removal. Backup all extant packages and settings prior to execution of adb

**TO USE:** Download android debug bridge on PC (or equivalent) and enable developer-mode + debug bridge on android device
  - If you cannot figure out the above, pay someone to do all this for you -- preferably not someone standing in an alley wearing a tan tenchcoat. Your phone will last longer.
  
***Following commands are essential for android debloat and consequent install of desired software.***

**Note:** For all commands listed bellow "adb shell" can be excluded if you are already inside your phone's commandline shell and are executing commands therein.

Adb shell $command is useful for scripts executed outside of the phone's shell.

## Listing Packages ##
- **list packages in format** "_package:com.hopefully.a.backdoor_"
  ```sh
  #for running outside your phone's CLI shell
  adb shell pm list packages
  
  #if already inside your phone's shell by manually running "adb shell" once
  pm list packages
  
  ```
- **List all packages without "package:"**
  ```sh
  adb shell pm list packages | cut -f 2 -d ":"
  ```
- **Create prettied list by keyword**
  ```sh
  adb shell pm list packages | cut -f 2 -d ":" | grep #keyword
  #e.g.adb shell pm list packages | cut -f 2 -d ":" | grep com.google
  ```
- **List user installed packages. Grep-able.**
  ```sh
  adb shell pm list packages -3 
  ```

- **List package location**
  ```sh
  adb shell pm -f com.foo.bar
  ```
## Uninstalling Packages ##
```sh
adb shell pm uninstall --user 0

# if NO ROOT ON PHONE: must specify --user 0
# this removal is temporary, such that Over-The-Air updates / factory reset can restore removed package(s)
# therefore, having a debloating script is useful. Post-update simply run the script to remove bloatware. 

## If root available simply su to root user and remove permanently
```
## Package Analysis ##
```sh
adb shell dumpsys package com.foo.bar
adb shell dumpsys package com.foo.bar | grep $ofinterest 
```

- Again, this is a summary. 
- Fun fact, you can checksum packages inside the adb shell, albeit SELinux seems to prevent outputting checksums of priv'd directories such as /system/bin/ to a textfile owned by the user. 
  - may be useful for comparing checksums of binaries to malware databases if so desired.
