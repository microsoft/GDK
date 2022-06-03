---
author: M-Stahl
title: XSystemGetDeviceType
description: Returns an [XSystemDeviceType](../enums/xsystemdevicetype.md) value corresponding to the device currently being used.
kindex: XSystemGetDeviceType
ms.author: mstahl
ms.topic: reference
edited: 01/06/2020
quality: good
security: public
applies-to: pc-gdk
---

# XSystemGetDeviceType  

Returns an [XSystemDeviceType](../enums/xsystemdevicetype.md) value corresponding to the device currently being used.  

## Syntax  
  
```cpp
XSystemDeviceType XSystemGetDeviceType(  
)  
```  
  
### Parameters  
  
None.
  
  
### Return value
Type: [XSystemDeviceType](../enums/xsystemdevicetype.md)
  
[XSystemDeviceType](../enums/xsystemdevicetype.md) enumeration value corresponding to the device currently being used.  > [!NOTE]
> This function has no explicit error state, but will return a value of **XSystemDeviceType::Unknown** if it is not possible to determine the device type in use.  
  
## Remarks  

This query will return the console mode, as opposed to the actual hardware type, meaning that it is possible for a developer console to masquerade as a different device type when polled by a title.  
> [!NOTE]
> A Microsoft Game Development Kit (GDK) title built for the Xbox One family will not return a 
> device code within the Xbox Series consoles unless the XboxCompatibility setting in the [MicrosoftGame.config](../../microsoftgameconfig/microsoftgameconfig-schema.md) file is set to Scarlett. Instead, it will return a code from the Xbox One family
> based on the current device. 
> 
> | Actual Device / Mode | Built for Xbox One family | Built for Xbox Series consoles |
> | --------------------- | ----------------------------- | ------------------------------------ |
> | Xbox Series X Dev Kit | XboxOneXDevkit | XboxScarlettDevkit |
> | Xbox Series X<br>Anaconda Profiling Mode | XboxOneX | XboxScarlettAnaconda |
> | Xbox Series S<br>Lockhart Profiling Mode<br>Xbox Series S Test Kit | XboxOneS | XboxScarlettLockhart |
> 
> For more information on the target device family usage, see 
> [MicrosoftGame.config overview](../../../../system/overviews/microsoft-game-config/MicrosoftGameConfig-Overview.md).

It is possible to execute this query before calling [XGameRuntimeInitialize](../../xgameruntimeinit/functions/xgameruntimeinitialize.md) in order to allow its usage during early title initialization.  
  
This example gets the type of the device currently being used. If it is running on a devkit, it runs custom code to enable developer features within the game.  
  
```cpp
const XSystemDeviceType deviceType = XSystemGetDeviceType(); 
const bool deviceIsDevkit = 
    deviceType == XSystemDeviceType::XboxOneXDevkit || 
    deviceType == XSystemDeviceType::XboxScarlettDevkit; 
 
if (deviceIsDevkit) 
{ 
    EnableGameSpecificDevkitFeatures(); 
}
```
  
## Requirements  
  
**Header:** XSystem.h
  
**Library:** xgameruntime.lib
  
**Supported platforms:** Windows, Xbox One family consoles and Xbox Series consoles  
  
## See also  
[XSystemDeviceType](../enums/xsystemdevicetype.md)  
[XSystem](../xsystem_members.md)  