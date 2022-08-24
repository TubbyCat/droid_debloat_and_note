Copyright © 2022-2023 TubbyCat

See CREDIT and MIT files for elaborated copyright information.

# Android Debug Bridge Commands for Debloating. 
This is a summary. The upstream documentation, in my opinion, is needlessly dense and could have been better written by a gibbon fed a steady diet of beatings and neurotoxic research pharmaceuticals.
> NOTE: Gather info on a package prior to removal. Backup all extant packages and settings prior to execution of adb

**TO USE:** Download android debug bridge on PC (or equivalent) and enable developer-mode + debug bridge on android device
  - If you cannot figure out the above, pay someone to do all this for you -- preferably not someone standing in an alley wearing a tan tenchcoat. Your phone will last longer.
  
***The following commands are essential for android debloat and consequent install of desired software.***

**Note:** For commands listed bellow "adb shell" can be _excluded_ if you are already inside your phone's commandline shell and are executing commands therein.

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
  adb shell pm path com.foo.bar
  ```
- **List users on a system**
  ```sh  
    adb shell pm list users   # executed outside phone's shell. Preferable for scripts.
    pm list users             # executed within phone's shell
   ```
## Uninstalling Packages ##
```sh
adb shell pm uninstall --user 0

# if NO ROOT ON PHONE: must specify --user 0
# this removal is temporary, such that Over-The-Air updates / factory reset can restore removed package(s)
# therefore, having a debloating script is useful. Post-update simply run the script to remove bloatware. 
```
- **Uninstall While Preserving User Data & Cache**
```sh
pm uninstall -k 
# inside shell
adb shell pm uninstall -k 
# Outside phone's shell
# as above can specify --user 0. e.g. adb shell pm uninstall -k --user 0 
```
**If root available simply su to root user and remove permanently**

## Installing APKs ##
```sh
#from OUTSIDE phone's shell 

adb install ./abc.apk 
adb -d install ./abc.apk
  #ideal for USB based android debug connection. 
```
## Moving Data to and from your Phone ##
```sh
adb pull dirPhone dirPC
#move data from dirPhone to dirPC. use full paths e.g. /home/Johnny/Desktop

adb push dirPC dirPhone
# move data from your pc to your phone
```
## Backing up your Phone ##
  Can be done somewhat selectively using adb pull or if most of your data is on an SD card, simply copy that to 2° storage, depending upon your needs.

  A traditional backup can be achieved using **"adb backup"**

```sh
adb backup [-f file] -apk/-noapk -obb/-noobb -shared/-noshared -all -system/-nosystem [optional_list_of_apks]

```
 **Opts:**
  
_-f_ file. Outputs backup to backup.ab, by default in current working directory
  
_-apk & -noapk(default)_ selects whether to backup installed packages
  
_-obb & -noobb(default)_ selects inclusion of apk expansion files associated with installed apps
  
_-shared & -noshared(default)_ whether to backup shared storage 
  
_-all_ backs up ALL installed apps
  
_-system & -nosystem_ selects backup of system apps. Subsumed by -all 
  
_[optional_list_of_apks]_ as above = optional list of packages. Rendered irrelevant by -all / -shared 

**Recommended use for Pre-Debloat Backup**
```sh
adb backup -f filename.ab -all -obb -shared 
```
## Restore a Backup. In Case of Oopsies. ##
```sh 
adb restore filename
e.g. adb restore backup.ab
```
## Package Analysis ##
```sh
adb shell dumpsys package com.foo.bar
adb shell dumpsys package com.foo.bar | grep $ofinterest #accepts regex
```
