#Copyright © 2022-2023 TubbyCat
#MIT and CREDIT files for elaborated copyright.

#!/bin/env bash 

com_android_list=(
com.android.chrome
com.android.egg
com.android.printspooler #kills printing. could have yes/no prompt but i don't care
com.android.bips # kills printing
com.android.bluetoothmidiservice
com.android.traceur
com.android.aftersaleservice
com.android.musicfx
)

echo "Debloating com.android apk variants."

for x in ${com_android_list[@]}; do 
adb shell pm uninstall --user 0 $x && echo $x >> com_android.debloated.$(date +"%m_%d_%Y").success
done
