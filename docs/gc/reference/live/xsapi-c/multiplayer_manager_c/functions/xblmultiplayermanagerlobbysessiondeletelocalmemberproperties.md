---
author: joannaleecy
title: XblMultiplayerManagerLobbySessionDeleteLocalMemberProperties
description: Deletes a custom property from a local member of the lobby session.
kindex: XblMultiplayerManagerLobbySessionDeleteLocalMemberProperties
ms.author: migreen
ms.topic: reference
security: public
edited: 00/00/0000
applies-to: pc-gdk
---

# XblMultiplayerManagerLobbySessionDeleteLocalMemberProperties  

Deletes a custom property from a local member of the lobby session.  

## Syntax  
  
```cpp
HRESULT XblMultiplayerManagerLobbySessionDeleteLocalMemberProperties(  
         XblUserHandle user,  
         const char* name,  
         void* context  
)  
```  
  
### Parameters  
  
*user* &nbsp;&nbsp;\_In\_  
Type: XblUserHandle  
  
The user handle of the local member.  
  
*name* &nbsp;&nbsp;\_In\_z\_  
Type: char*  
  
The name of the custom property to delete.  
  
*context* &nbsp;&nbsp;\_In\_opt\_  
Type: void*  
  
Optional. The application-defined data to correlate the [XblMultiplayerEvent](../structs/xblmultiplayerevent.md) to the initiating call.  
  
  
### Return value  
Type: HRESULT
  
HRESULT return code for this API operation.
  
## Remarks  
  
This function deletes a custom property from a local member of the lobby session. Custom properties can be changed at any time. Changes are batched and written to the service when [XblMultiplayerManagerDoWork](xblmultiplayermanagerdowork.md) is called. <br />The result of this function is delivered as a multiplayer event with an event type set to `XblMultiplayerEventType::LocalMemberPropertyWriteCompleted`. You can call [XblMultiplayerManagerDoWork](xblmultiplayermanagerdowork.md) to retrieve multiplayer events.
  
## Requirements  
  
**Header:** multiplayer_manager_c.h
  
**Library:** Microsoft.Xbox.Services.141.GSDK.C.lib
  
## See also  
[multiplayer_manager_c](../multiplayer_manager_c_members.md)  
[XblMultiplayerManagerLobbySessionSetLocalMemberConnectionAddress](xblmultiplayermanagerlobbysessionsetlocalmemberconnectionaddress.md)  
[XblMultiplayerManagerLobbySessionSetLocalMemberProperties](xblmultiplayermanagerlobbysessionsetlocalmemberproperties.md)
  
  