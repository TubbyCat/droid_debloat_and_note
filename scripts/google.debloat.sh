#Copyright © 2022-2023 TubbyCat
#MIT and CREDIT files for elaborated copyright.
#!/bin/env bash
# COMMENT OUT LINES: 8,17,22,25, IF VISION IMPAIRED OR OTHERWISE USE ACCESSIBILITY FEATURES.
google_list=( 
 com.google.android.youtube
 com.google.android.apps.cameralite
 com.google.android.marvin.talkback
 com.google.android.deskclock
 com.google.android.gm  
 com.google.android.apps.tachyon
 com.google.android.apps.wellbeing
 com.google.android.apps.docs
 com.google.android.apps.nbu.files
 com.google.android.syncadapters.contacts
 com.google.android.calculator
 com.google.android.tts
 com.google.android.videos
 com.google.android.feedback
 com.google.android.printservice.recommendation
 com.google.android.calendar
 com.google.android.apps.speechservices
 com.google.android.apps.photosgo
 com.google.android.apps.turbo
 com.google.android.apps.assistant
 com.google.android.apps.youtube.music
 com.google.android.inputmethod.latin
)

echo "debloating com.google types"

for x in ${google_list[@]}; do 
adb shell pm uninstall --user 0 $x && echo $x >> com.google.debloated.$(date +"%m_%d_%Y").success
done
echo "com.google apk types removal = success."
