#Copyright © 2022-2023 TubbyCat
#MIT and CREDIT files for elaborated copyright.

#!/bin/env bash 

function caution(){
echo "Precautionary! Pre-download desired side-loadable apps e.g. alternative file manager, gui in case things go awry. So you may then adb shell install $package."
echo " ADB debloat snippet for zte only. TESTING." 
sleep 1
}

rmv_list=(
zte.com.cn.alarmclock
com.moji.zteweather
com.icoolme.bestweather
zte.android.flashlight
zte.com.market
zte.com.cn.filer               # file mgr
zte.com.game
zte.com.cn.cloudnotepad
com.zte.smartpay              #untested on phys HW
cn.com.zte.app.redenvelope    # ""
cn.com.zte.android.teamshare  #untested on phys HW
cn.com.zte.mobilemail
com.baidu.BaiduMap.zte
com.autonavi.minimap.carmode  
org.zx.AuthComp               # untested, little record of existence
com.ume.browser.cust
cuuca.sendfiles.Activity     # weshare
cn.com.zte.app.zel            # untested, may be related to zlink 
com.zte.camera
com.zte.mirrorcamera
com.zte.voicesecretary
com.zte.softda
cn.zte.music
com.zte.beautify
cn.zte.recorder
com.zte.weather
com.zte.zdm.omacp          #some Qs about over-air breakage - needs testing
com.zte.videoplayer
com.zte.assistant
com.zte.heartyservice.strategy
com.zte.burntest.camera
com.zte.contacts.sub
com.android.mipop     # ZTE user-navigation gimmick
cn.com.zte.tescobag   #unconfirmed
zte.com.cn.jr.magzine #unconfirmed not a typo
com.zte.positionenglish  # possibly gps related , unconfirmed, remove w caution
com.zte.UserHelp
com.zte.handservice
com.zte.privacyzone
com.zte.backup.mmi  # untested on phys HW 
cn.com.zte.zxmreader
com.zte.privacypolicy
zpub.res
)

caution
for x in ${rmv_list[@]}; do
adb shell pm uninstall --user 0 $x && echo $x >> zte_pkg.debloated.$(date +"%m_%d_%Y-%T").success
done
