# MetroVR

This is a virtual reality video game developped for a software engineering project at [ENSSAT](https://enssat.fr) by the Team Kiwi. This game is made with the [Godot engine](https://godotengine.org) ``v4.3`` and is configured to run on the Meta Quest VR headsets (tested with the Meta Quest 2 and 3). The game uses [Bastiaan Olij](https://github.com/BastiaanOlij)'s [OpenXR Vendors plugin](https://github.com/GodotVR/godot_openxr_vendors/releases) where every basic VR feature has been implemented in GDscript.  
  
Thank you for playing our game on behalf of the whole team, if you want to contact us, feel free to join our [official discord server](https://youtu.be/dQw4w9WgXcQ). Enjoy ;)  

# Contents
- [Installation guide](#installation-guide)
    - [Build your own apk](#build-your-own-apk)
        - [Prerequisites](#prerequisites)
        - [Create the export preset](#create-the-export-preset)
        - [Building on your headset](#building-on-your-headset)
    - [Use an already existing apk](#use-an-already-existing-apk)

# Installation guide

In order to install the project and build the game in yout VR headset, you need the game ``.apk`` file. To doo so, you have the choice between pulling the project and compiling the ``.apk`` file and building it on the VR headset with Godot or if you already have the ``.apk`` file, you can directly build it on the headset with the [Meta Quest Developer Hub](https://developers.meta.com/horizon/documentation/unity/ts-odh/) app.

## Build your own apk

### Prerequisites
- Install [Godot engine ``v4.3``](https://godotengine.org)
- Install [OpenJDK 17](https://www.oracle.com/java/technologies/javase/jdk17-archive-downloads.html)
- Install [Android studio](https://developer.android.com/studio?hl=fr) and make sure to run it once in order to create all the configuration files :  
    - **Windows/MacOs :** simpy launch the Android Studio application
    - **Linux :** run the following commands :
        ```bash
        cd {installation home}/bin
        ./studio.sh
        ```

### Set the SDK paths
After installing the prerequisites, you need to configure the SDK paths in Godot's Editor settings :  
  
![alt text](doc/image6.png)  
  
Scroll down to the section where the Android settings are located : 
   
![alt text](doc/image7.png)
  
Then you will need to set the right SDK paths, if you let the default ones during installation it should be :  
- **Windows :**
    - Java SDK Path : ``C:/Program Files/Eclipse Adoptium/jdk-17.0.13.11-hotspot``
    - Android SDK Path : ``C:/Users/{your_username}/appdata/Local/Android/Sdk ``
- **Linux :**
    - Java SDK Path : ``/usr/lib/jvm/jdk-17.0.12-oracle-x64``
    - Android SDK Path : ``~/Android/Sdk``
- **MacOS :**
    - Java SDK Path : ``/Library/Java/JavaVirtualMachines/jdk-17.jdk/Contents/Home``
    - Android SDK Path : ``/Users/{your_username}/Library/Android/sdk ``

### Create the export preset
To be able to build the project into an apk file, we need to create an android runnable export preset :
  
![alt text](doc/image.png)  
  
After that, the gradle build needs to be enabled :
  
![alt text](doc/image1.png)
  
Then, OpenXR must be selected as XR Mode in the XR Features menu : 
   
![alt text](doc/image2.png)
  
Finally the Meta Plugin must be enabled :
  
![alt text](doc/image3.png)  

### Building on your headset
Now that the preset has been configured, all you need to do is to build the game on your Meta Quest with the remote debug option :  
  
![alt text](doc/image4.png)  
  
**Troubleshooting :** if you are on Linux and you get an error concerning adb, you need to delete the previous version by running the following command :   
```bash
adb uninstall {your_project}
# Example: adb uninstall com.example.metrovr
```



## Use an already existing apk
If you already have an apk file on your computer, you only need to launch the Meta Quest Developer Hub app and to add the build : 
  
![alt text](doc/image5.png)

