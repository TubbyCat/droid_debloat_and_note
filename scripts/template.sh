#Copyright © 2022-2023 TubbyCat
#MIT and CREDIT files for elaborated copyright.
#!/bin/env bash


~apktype_placeholder~_list=( 

)

echo "Debloating APKTYPEPLACEHOLDER"

for x in ${~REMOVAL_LIST_PLACEHOLDER~[@]}; do 
adb shell pm uninstall --user 0 $x && echo $x >> APKTYPEPLACEHOLDER.debloated.$(date +"%m_%d_%Y-%T").success
done
