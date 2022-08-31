#Copyright © 2022-2023 TubbyCat
#MIT and CREDIT files for elaborated copyright.

#!/bin/env bash 

function caution(){
printf "THIS SCRIPT IS NOT CONSERVATIVE IN REMOVAL OF PACKAGES. BREAKAGE IS POSSIBLE.\n\nPrecaution: Pre-download desired side-loadable apps e.g. alternative file manager, GUI in case things go wrong.\nSo you may then adb shell install pkg_name.\n"
sleep 1
printf "\nADB debloat snippet for ZTE-related packages.\n" 
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
com.qiyi.video                #Asian shows. src /etc/autolaunch_blacklist*.xml
com.qiyi.video.zte
com.sohu.inputmethod.sogou    # non-english input method. src /etc/autolaunch_blacklist*.xml
com.zte.smartpay              #untested on phys HW
cn.com.zte.app.redenvelope    # ""
cn.com.zte.android.teamshare  #untested on phys HW
cn.com.zte.mobilemail
com.baidu.BaiduMap.zte
com.autonavi.minimap.carmode  
org.zx.AuthComp               # untested, little record of existence
com.ume.browser
com.ume.browser.cust
cuuca.sendfiles.Activity     # weshare
cn.com.zte.app.zel            # untested, may be related to "zlink"
com.zte.camera
com.zte.mirrorcamera
com.zte.voicesecretary
com.zte.softda
cn.zte.music
com.zte.beautify
cn.zte.recorder
com.zte.weather
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
com.zte.handservice  # not related to com.borat.handrelief, unfortunately
com.zte.privacyzone
com.zte.backup.mmi  # untested on phys HW 
cn.com.zte.zxmreader
com.zte.privacypolicy
zpub.res
com.debug.loggerui
com.zte.emode
com.zte.zdm.omacp          #some Qs about over-air breakage - needs testing
)

caution
for x in ${rmv_list[@]}; do
adb shell pm uninstall --user 0 $x && echo $x >> zte_pkg.heavy.debloated.$(date +"%m_%d_%Y-%T").success
done
echo "COMPLETED ZTE HEAVY DEBLOAT. Check working directory for zte_pkg.heavy.debloated.theDate.success"
