---
author: M-Stahl
title: XSystemDeviceType
description: Indicates the system device type returned by calling [XSystemGetDeviceType](../functions/xsystemgetdevicetype.md).
kindex: XSystemDeviceType
ms.author: mstahl
ms.topic: reference
edited: 02/02/2021
security: public
applies-to: pc-gdk
---

# XSystemDeviceType

Indicates the system device type returned by calling [XSystemGetDeviceType](../functions/xsystemgetdevicetype.md).

<a id="syntaxSection"></a>

## Syntax

```cpp
enum class XSystemDeviceType  : uint32_t
{
    Unknown              = 0x00,
    Pc                   = 0x01,
    XboxOne              = 0x02,
    XboxOneS             = 0x03,
    XboxOneX             = 0x04,
    XboxOneXDevkit       = 0x05,
    XboxScarlettLockhart = 0x06,
    XboxScarlettAnaconda = 0x07,
    XboxScarlettDevkit   = 0x08
}
```

<a id="constantsSection"></a>

## Constants

| Constant | Description |
| --- | --- |
| Unknown | Device type is unknown. This value is returned by `XSystemGetDeviceType` when the device type can't be determined. |
| Pc | The device is a PC. |
| XboxOne | The device is an Xbox One. |
| XboxOneS | The device is an Xbox One S. |
| XboxOneX | The device is an Xbox One X. |
| XboxOneXDevkit | The device is an Xbox One X Dev Kit. |
| XboxScarlettLockhart | The device is an Xbox Series S. |
| XboxScarlettAnaconda | The device is an Xbox Series X. |
| XboxScarlettDevkit | The device is an Xbox Series X Dev Kit. |

<a id="remarksSection"></a>

## Remarks

The `XSystemGetDeviceType` function has no explicit error state. It returns a value of `XSystemDeviceType::Unknown` if it is unable to determine the system device type.

You can call `XSystemGetDeviceType` before calling [XGameRuntimeInitialize](../../xgameruntimeinit/functions/xgameruntimeinitialize.md), during early title initialization.

The following code example gets the type of system device currently in use. If it's running on a dev kit, then it runs custom code to enable developer features within the game.

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

<a id="requirementsSection"></a>

## Requirements

**Header:** XSystem.h

**Supported platforms:** Windows, Xbox One family consoles and Xbox Series consoles

<a id="seealsoSection"></a>

## See also

[XSystem](../xsystem_members.md)  
[XSystemGetDeviceType](../functions/xsystemgetdevicetype.md)  
[XGameRuntimeInitialize](../../xgameruntimeinit/functions/xgameruntimeinitialize.md)  