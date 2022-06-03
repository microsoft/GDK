---
author: joannaleecy
title: XblMultiplayerSessionSetHostDeviceToken
description: Sets the device token of the host.
kindex: XblMultiplayerSessionSetHostDeviceToken
ms.author: migreen
ms.topic: reference
security: public
edited: 00/00/0000
applies-to: pc-gdk
---

# XblMultiplayerSessionSetHostDeviceToken  

Sets the device token of the host.  

## Syntax  
  
```cpp
void XblMultiplayerSessionSetHostDeviceToken(  
         XblMultiplayerSessionHandle handle,  
         XblDeviceToken hostDeviceToken  
)  
```  
  
### Parameters  
  
*handle* &nbsp;&nbsp;\_In\_  
Type: [XblMultiplayerSessionHandle](../handles/xblmultiplayersessionhandle.md)  
  
Handle to the multiplayer session.  
  
*hostDeviceToken* &nbsp;&nbsp;\_In\_  
Type: [XblDeviceToken](../structs/xbldevicetoken.md)  
  
The host device token.  
  
  
### Return value  
Type: void
  

  
## Remarks  
  
If "peerToHostRequirements" is set and this is set, the measurement stage assumes the given host is the correct host and only measures metrics to that host.
  
## Requirements  
  
**Header:** multiplayer_c.h
  
**Library:** Microsoft.Xbox.Services.141.GSDK.C.lib
  
## See also  
[multiplayer_c](../multiplayer_c_members.md)  
  
  