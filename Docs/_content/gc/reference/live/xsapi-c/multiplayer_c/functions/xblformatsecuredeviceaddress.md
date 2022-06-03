---
author: joannaleecy
title: XblFormatSecureDeviceAddress
description: Formats a secure device address given a unique device id for platforms that don't support SDAs.
kindex: XblFormatSecureDeviceAddress
ms.author: migreen
ms.topic: reference
security: public
edited: 00/00/0000
applies-to: pc-gdk
quality: good
---

# XblFormatSecureDeviceAddress  

Formats a secure device address given a unique device id for platforms that don't support SDAs.  

## Syntax  
  
```cpp
HRESULT XblFormatSecureDeviceAddress(  
         const char* deviceId,  
         XblFormattedSecureDeviceAddress* address  
)  
```  
  
### Parameters  
  
*deviceId* &nbsp;&nbsp;\_In\_  
Type: char*  
  
A unique id to represent this device for the lifetime of the local game process/instance.  
  
*address* &nbsp;&nbsp;\_Inout\_  
Type: [XblFormattedSecureDeviceAddress*](../structs/xblformattedsecuredeviceaddress.md)  
  
Passes back the formatted secure device address.  
  
  
### Return value  
Type: HRESULT
  
HRESULT return code for this API operation.
  
## Remarks  
  
Formats the deviceId string according to the following recommendation: Generate 16 random bytes(e.g., a GUID) to be used for the lifetime of the local game process/instance to uniquely represent the device. Format the 'secureDeviceAddress' to be a string with the prefix "AAAAAAAA" (8 capital letter As) followed by the 32 character hexadecimal representation of the random bytes(upper or lower case letters don't matter, nor does the byte order if the bytes are an actual structured GUID). For example, "AAAAAAAA00112233445566778899AABBCCDDEEFF". Call XblMultiplayerSessionCurrentUserSetSecureDeviceAddressBase64 using the formatted SDA to set the SDA for the user.
  
## Requirements  
  
**Header:** multiplayer_c.h
  
**Library:** Microsoft.Xbox.Services.141.GSDK.C.lib
  
## See also  
[multiplayer_c](../multiplayer_c_members.md)  
  
  