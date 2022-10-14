# Flashing Stock Firmware
Copyright © 2022-2023 TubbyCat.
See MIT and CREDIT for copyright.

**Summary of Procedure**
-----
1. Ensure device has unlocked bootloader. 
2. Boot into fastboot via powerbutton + volume key wizardry
3. Obtain stock firmware from hopefully legitimate source. 
4. Parse **_flashfile.xml_** or comparably named xml file and convert into shell or batch script therefrom
    * **Always Ignore**  
     ```xml 
    <step operation="getvar" var="max-sparse-size"/>
     ``` 
   
    **Example xml** 
    ```xml
    <step operation="oem" var="fb_mode_set"/> 
    <step MD5="blahblah" filename="gpt.bin" operation="flash" partition="partition"/> 
    ```
   **Translates to Shell, as:**
   ```sh
   fastboot oem fb_mode_set
   fastboot flash partition gpt.bin
   ```

5. Execute derived commands in order.
6. Reboot
