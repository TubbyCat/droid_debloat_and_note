Copyright © 2022-2023 TubbyCat

This document is provided without warranty and the author disclaims all liability. 
See the files MIT and CREDIT for copyright information.

------

# Experimental debloat of ZTE phone 

**BACKGROUND**
- Device/Brand raises security questions. 
- _See:_ 
1.  https://github.com/hackerhouse-opensource/exploits/blob/master/zte-emode.txt
2.  https://www.zdnet.com/article/backdoor-found-in-zte-android-phones/
 3. https://media.defcon.org/DEF%20CON%2026/DEF%20CON%2026%20presentations/Ryan%20Johnson%20and%20Angelos%20Stavrou%20-%20Updated/DEFCON-26-Johnson-and-Stavrou-Vulnerable-Out-of-the-Box-An-Eval-of-Android-Carrier-Devices-WP-Updated.pdf

- Public information regarding preloaded ZTE packages is scarce

**Initial Objectives** 
- Debloat ZTE device insofar possible

  As it is unfeasible (time) to dump and analyze all packages contained on this android platform, a reduction of [_Attack-Surface_](https://wikipedia.org/wiki/Attack_surface) is sought instead. 'Debloating' facilitates a reduction in attack surface by reducing the overall number of packages for which there could exist vulnerabilities. Reducing attack surface alone will not render the device markedly secure. Reducing the net number of potentially vulnerable packages is better than nothing, but not a big something, either.


  Aforesaid measures should be paired with logging, intrusion-detection (if it exists for android), and ensuring SELinux is enforcing on said device. 

- collate data wrt. onboard packages
- create generalized script for safe removal of zte bloatware irrespective of ZTE android device
  
  
 **Opinion:** Rx for such a device would be to debloat and distrust the infrastructure entirely. Assume it is compromised and use accordingly.
If you purchased this device/brand for business,medical,banking etc. purposes, and are reading this: proceed to cry into a dirty sock and hope for a refund. 
