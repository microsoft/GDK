---
author: joannaleecy
title: XblMultiplayerActivityPlatform
description: Enumerates the platforms on which a title can be activated.
kindex: XblMultiplayerActivityPlatform
ms.author: migreen
ms.topic: reference
security: public
edited: 00/00/0000
quality: good
applies-to: pc-gdk
---

# XblMultiplayerActivityPlatform  

Enumerates the platforms on which a title can be activated.    

## Syntax  
  
```cpp
enum class XblMultiplayerActivityPlatform  : uint32_t  
{  
    Unknown = 0,  
    XboxOne = 1,  
    WindowsOneCore = 2,  
    Win32 = 3,  
    Scarlett = 4,  
    iOS = 20,  
    Android = 30,  
    Nintendo = 40,  
    PlayStation = 50,  
    All = 60  
}  
```  
  
## Constants  
  
| Constant | Description |
| --- | --- |
| Unknown | Unknown device. |  
| XboxOne | Xbox One device. |  
| WindowsOneCore | Windows OneCore (Universal Windows Platform [UWP] and Microsoft Game Development Kit (GDK) on PC). |  
| Win32 | Win32-based device. |  
| Scarlett | Xbox Series X&#124;S device. |  
| iOS | iOS device. |  
| Android | Android device. |  
| Nintendo | Nintendo device. |  
| PlayStation | PlayStation device. |  
| All | Activity is joinable on all platforms supported by the title. |  
  
## Member of
  
[XblMultiplayerActivityInfo](../structs/xblmultiplayeractivityinfo.md)
  
## Argument of
  
[XblMultiplayerActivitySetActivityAsync](../functions/xblmultiplayeractivitysetactivityasync.md)
  
## Requirements  
  
**Header:** multiplayer_activity_c.h
  
## See also  
[multiplayer_activity_c](../multiplayer_activity_c_members.md)  
  
  