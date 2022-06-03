---
author: joannaleecy
title: XblMultiplayerSessionCurrentUserSetSecureDeviceAddressBase64
description: Set the base64 encoded secure device address of the member. The member must first be joined to the session.
kindex: XblMultiplayerSessionCurrentUserSetSecureDeviceAddressBase64
ms.author: migreen
ms.topic: reference
security: public
edited: 00/00/0000
applies-to: pc-gdk
---

# XblMultiplayerSessionCurrentUserSetSecureDeviceAddressBase64  

Set the base64 encoded secure device address of the member. The member must first be joined to the session.  

## Syntax  
  
```cpp
HRESULT XblMultiplayerSessionCurrentUserSetSecureDeviceAddressBase64(  
         XblMultiplayerSessionHandle handle,  
         const char* value  
)  
```  
  
### Parameters  
  
*handle* &nbsp;&nbsp;\_In\_  
Type: [XblMultiplayerSessionHandle](../handles/xblmultiplayersessionhandle.md)  
  
Handle to the multiplayer session.  
  
*value* &nbsp;&nbsp;\_In\_  
Type: char*  
  
Indicates the value of the current user's secure device address encoded in base64.  
  
  
### Return value  
Type: HRESULT
  
HRESULT return code for this API operation.
  
## Remarks  
  
On platforms that don't have a secure device address, call XblFormatSecureDeviceAddress to generate a value that can be used by this function.
  
## Requirements  
  
**Header:** multiplayer_c.h
  
**Library:** Microsoft.Xbox.Services.141.GSDK.C.lib
  
## See also  
[multiplayer_c](../multiplayer_c_members.md)  
  
  