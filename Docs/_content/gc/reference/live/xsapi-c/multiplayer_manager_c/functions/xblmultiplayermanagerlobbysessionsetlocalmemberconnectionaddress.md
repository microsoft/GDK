---
author: joannaleecy
title: XblMultiplayerManagerLobbySessionSetLocalMemberConnectionAddress
description: Sets the connection address for the local member.
kindex: XblMultiplayerManagerLobbySessionSetLocalMemberConnectionAddress
ms.author: migreen
ms.topic: reference
security: public
edited: 00/00/0000
applies-to: pc-gdk
---

# XblMultiplayerManagerLobbySessionSetLocalMemberConnectionAddress  

Sets the connection address for the local member.  

## Syntax  
  
```cpp
HRESULT XblMultiplayerManagerLobbySessionSetLocalMemberConnectionAddress(  
         XblUserHandle user,  
         const char* connectionAddress,  
         void* context  
)  
```  
  
### Parameters  
  
*user* &nbsp;&nbsp;\_In\_  
Type: XblUserHandle  
  
The user you want to set the property for.  
  
*connectionAddress* &nbsp;&nbsp;\_In\_z\_  
Type: char*  
  
The network connection address to set.  
  
*context* &nbsp;&nbsp;\_In\_opt\_  
Type: void*  
  
Optional. The application-defined data to correlate the [XblMultiplayerEvent](../structs/xblmultiplayerevent.md) to the initiating call.  
  
  
### Return value  
Type: HRESULT
  
HRESULT return code for this API operation.
  
## Remarks  
  
This function sets the network connection address of a local member in the lobby session. You can use the connection address for network and secure socket connections to that local member. Changes are batched and written to the service when [XblMultiplayerManagerDoWork](xblmultiplayermanagerdowork.md) is called. <br />The result of this function is delivered as a multiplayer event with an event type set to `XblMultiplayerEventType::LocalMemberConnectionAddressWriteCompleted`. You can call [XblMultiplayerManagerDoWork](xblmultiplayermanagerdowork.md) to retrieve multiplayer events.
  
## Requirements  
  
**Header:** multiplayer_manager_c.h
  
**Library:** Microsoft.Xbox.Services.141.GSDK.C.lib
  
## See also  
[multiplayer_manager_c](../multiplayer_manager_c_members.md)  
[XblMultiplayerManagerLobbySessionSetLocalMemberProperties](xblmultiplayermanagerlobbysessionsetlocalmemberproperties.md)  
[XblMultiplayerEvent](../structs/xblmultiplayerevent.md)
  
  