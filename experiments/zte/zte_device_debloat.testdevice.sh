#Copyright © 2022-2023 TubbyCat
#MIT and CREDIT files for elaborated copyright.

#!/bin/env bash 

function caution(){
echo "Precautionary! Pre-download desired side-loadable apps e.g. alternative file manager, gui in case things go awry. So you may then adb shell install $package."
echo " ADB debloat snippet for zte only. TESTING." 
sleep 1
}

rmv_list=(

com.zte.beautify
cn.zte.recorder
com.zte.weather
com.zte.zdm.omacp
com.zte.videoplayer
com.zte.assistant
com.zte.heartyservice.strategy
com.zte.burntest.camera
com.zte.contacts.sub
com.zte.privacypolicy
zpub.res
)

caution 
for x in ${rmv_list[@]}; do 
adb shell pm uninstall --user 0 $x
done
