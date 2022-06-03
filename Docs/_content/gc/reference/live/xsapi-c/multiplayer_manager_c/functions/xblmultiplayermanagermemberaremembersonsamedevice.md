---
author: joannaleecy
title: XblMultiplayerManagerMemberAreMembersOnSameDevice
description: Determines whether two members are on the same device.
kindex: XblMultiplayerManagerMemberAreMembersOnSameDevice
ms.author: migreen
ms.topic: reference
security: public
edited: 00/00/0000
quality: good
applies-to: pc-gdk
---

# XblMultiplayerManagerMemberAreMembersOnSameDevice  

Determines whether two members are on the same device.  

## Syntax  
  
```cpp
bool XblMultiplayerManagerMemberAreMembersOnSameDevice(  
         const XblMultiplayerManagerMember* first,  
         const XblMultiplayerManagerMember* second  
)  
```  
  
### Parameters  
  
*first* &nbsp;&nbsp;\_In\_  
Type: [XblMultiplayerManagerMember*](../structs/xblmultiplayermanagermember.md)  
  
The first member.  
  
*second* &nbsp;&nbsp;\_In\_  
Type: [XblMultiplayerManagerMember*](../structs/xblmultiplayermanagermember.md)  
  
The second member.  
  
  
### Return value  
Type: bool
  
Returns true if both members are on the same device, false if both members are not on the same device.
  
## Remarks  
  
This function compares the device tokens of both members. If the device tokens match, both members are on the same device. For more information, see [XblDeviceToken](../../multiplayer_c/structs/xbldevicetoken.md).
  
## Requirements  
  
**Header:** multiplayer_manager_c.h
  
**Library:** Microsoft.Xbox.Services.141.GSDK.C.lib
  
## See also  
[multiplayer_manager_c](../multiplayer_manager_c_members.md)  
  
  