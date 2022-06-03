---
author: aablackm
title: XtfConsoleFieldId Enumeration
description: Identifies the value to return from [XtfGetConsoleFieldValue](../functions/xtfgetconsolefieldvalue-xbox-microsoft-m.md).
ms.assetid: T:Windows.Xbox.XtfConsoleFieldId
kindex: XtfConsoleFieldId enumeration
ms.author: stevenpr
ms.topic: reference
edited: 04/01/2020
security: public
---

# XtfConsoleFieldId Enumeration
  
Identifies the value to return from [XtfGetConsoleFieldValue](../functions/xtfgetconsolefieldvalue-xbox-microsoft-m.md).  
  
<a id="syntaxSection"></a>
  
## Syntax

```cpp
typedef enum XtfConsoleFieldId
{
    ToolsIpAddress,
    ConsoleIPAddress,
    AccessKey,
    ConsoleId,
    CertType,
    HostName,
    DeviceId,
    SystemMajorVersion,
    SystemMinorVersion,
    SystemBuildVersion,
    SystemRevisionVersion,
    MaximumConsoleFieldId
} XtfConsoleFieldId;  
```
  
<a id="constantsSection"></a>
  
## Constants
  
| Constant | Description |
| -------- | ----------- |
| ToolsIpAddress | Tools IP address (IPv4 by default, IPv6 if the console is on an IPv6-only network). |
| ConsoleIPAddress | Console IP address (IPv4 by default, IPv6 if the console is on an IPV6-only network). |
| AccessKey | Console access key |
| ConsoleId | Console ID |
| CertType | Reserved for internal use. |
| HostName | Console host name |
| DeviceId | Console device ID |
| SystemMajorVersion | System major version |
| SystemMinorVersion | System minor version |
| SystemBuildVersion | System build version |
| SystemRevisionVersion | System revision version |
| MaximumConsoleFieldId | Maximum console field ID |
  
<a id="remarksSection"></a>
  
## Remarks
  
This enumeration indicates which console field value is returned by the [XtfGetConsoleFieldValue](../functions/xtfgetconsolefieldvalue-xbox-microsoft-m.md) function. Use the value returned in the `fieldType` parameter of that function to identify the type of the returned console field value. For more information about console settings, see [Managing console settings (NDA topic)](../../../../../tools-console/xbox-tools-and-apis/xbom/manager-tool-console-settings.md).  
  
<a id="requirements"></a>
  
## Requirements
  
**Header:** xtfapi.h  
  
**Library:** xtfapi.lib  
  
**Supported platforms:** Windows (for Xbox console tools)  
  
<a id="seealsoSection"></a>
  
## See also
  
[XtfConsoleFieldType Enumeration](xtfconsolefieldtype-xbox-windows-t.md)  
[Additional Xtf APIs](../atoc-xtfapi.md)  
[Xbox Tools Framework native API reference](../../atoc-xtf-native.md)  
  