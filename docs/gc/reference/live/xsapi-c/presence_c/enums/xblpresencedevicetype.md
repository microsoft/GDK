---
author: joannaleecy
title: XblPresenceDeviceType
description: Defines values used to indicate the device type associate with an XblSocialManagerPresenceTitleRecord.
kindex: XblPresenceDeviceType
ms.author: migreen
ms.topic: reference
security: public
edited: 00/00/0000
quality: good
applies-to: pc-gdk
---

# XblPresenceDeviceType  

Defines values used to indicate the device type associate with an XblSocialManagerPresenceTitleRecord.    

## Syntax  
  
```cpp
enum class XblPresenceDeviceType  : uint32_t  
{  
    Unknown,  
    WindowsPhone,  
    WindowsPhone7,  
    Web,  
    Xbox360,  
    PC,  
    Windows8,  
    XboxOne,  
    WindowsOneCore,  
    WindowsOneCoreMobile,  
    iOS,  
    Android,  
    AppleTV,  
    Nintendo,  
    PlayStation,  
    Win32,  
    Scarlett  
}  
```  
  
## Constants  
  
| Constant | Description |
| --- | --- |
| Unknown | Unknown device. |  
| WindowsPhone | Windows Phone device. |  
| WindowsPhone7 | Windows Phone 7 device. |  
| Web | Web device, like Xbox.com. |  
| Xbox360 | Xbox360 device. |  
| PC | PC Games for Windows Live. |  
| Windows8 | Xbox Live for Windows device. |  
| XboxOne | Xbox One device. |  
| WindowsOneCore | Windows One Core devices. |  
| WindowsOneCoreMobile | Windows One Core Mobile devices. |  
| iOS | iOS device. |  
| Android | Android device. |  
| AppleTV | AppleTV device. |  
| Nintendo | Nintendo device. |  
| PlayStation | PlayStation device. |  
| Win32 | Win32 based device. |  
| Scarlett | Scarlett device. |  
  
## Member of
  
[XblPresenceDeviceRecord](../structs/xblpresencedevicerecord.md)  
[XblPresenceQueryFilters](../structs/xblpresencequeryfilters.md)
  
## Argument of
  
[XblPresenceDevicePresenceChangedHandler](../functions/xblpresencedevicepresencechangedhandler.md)
  
## Requirements  
  
**Header:** presence_c.h
  
## See also  
[presence_c](../presence_c_members.md)  
  
  