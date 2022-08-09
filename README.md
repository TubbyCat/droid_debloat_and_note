Copyright © 2022-2023 TubbyCat

See MIT and CREDIT for copyright. 

# TubbyCat's Android Security Notes

An array of package lists, debloat scripts and notes for android. 

# Preface

   As it is unfeasible (time, effort) to dump and analyze all packages contained on an android platform, a reduction of attack-surface is sought instead. 'Debloating' facilitates this by reducing the overall number of installed packages for which there could exist vulnerabilities. 
   
   Reducing attack-surface alone will not render the device markedly secure. This is better than nothing, but not a big something, either. Despite the debloat -- hardware still interacts with software and the phone still interacts with a multivariate world, thus risk still exists.

  The aforesaid measure ought to be paired with prudent user behavior, logging, intrusion-detection (if it exists for android), and ensuring SELinux (Mandatory Access Control) is enforcing on said device.

