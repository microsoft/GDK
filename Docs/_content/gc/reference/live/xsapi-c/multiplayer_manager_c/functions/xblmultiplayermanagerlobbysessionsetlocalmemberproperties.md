---
author: joannaleecy
title: XblMultiplayerManagerLobbySessionSetLocalMemberProperties
description: Set a custom property for a local member to the specified JSON string.
kindex: XblMultiplayerManagerLobbySessionSetLocalMemberProperties
ms.author: migreen
ms.topic: reference
security: public
edited: 00/00/0000
applies-to: pc-gdk
---

# XblMultiplayerManagerLobbySessionSetLocalMemberProperties  

Set a custom property for a local member to the specified JSON string.  

## Syntax  
  
```cpp
HRESULT XblMultiplayerManagerLobbySessionSetLocalMemberProperties(  
         XblUserHandle user,  
         const char* name,  
         const char* valueJson,  
         void* context  
)  
```  
  
### Parameters  
  
*user* &nbsp;&nbsp;\_In\_  
Type: XblUserHandle  
  
The user you want to set the property for.  
  
*name* &nbsp;&nbsp;\_In\_z\_  
Type: char*  
  
The name of the property to set.  
  
*valueJson* &nbsp;&nbsp;\_In\_z\_  
Type: char*  
  
Optional. The JSON value to assign to the property.  
  
*context* &nbsp;&nbsp;\_In\_opt\_  
Type: void*  
  
Optional. The application-defined data to correlate the [XblMultiplayerEvent](../structs/xblmultiplayerevent.md) to the initiating call.  
  
  
### Return value  
Type: HRESULT
  
HRESULT return code for this API operation.
  
## Remarks  
  
This function sets the value, represented as a JSON string, of a custom property for a local member in the lobby session. Custom properties can be changed at any time. Changes are batched and written to the service when [XblMultiplayerManagerDoWork](xblmultiplayermanagerdowork.md) is called. <br />The result of this function is delivered as a multiplayer event with an event type set to `XblMultiplayerEventType::LocalMemberPropertyWriteCompleted`. You can call [XblMultiplayerManagerDoWork](xblmultiplayermanagerdowork.md) to retrieve multiplayer events.
  
## Requirements  
  
**Header:** multiplayer_manager_c.h
  
**Library:** Microsoft.Xbox.Services.141.GSDK.C.lib
  
## See also  
[multiplayer_manager_c](../multiplayer_manager_c_members.md)  
[XblMultiplayerManagerGameSessionSetSynchronizedHost](xblmultiplayermanagergamesessionsetsynchronizedhost.md)  
[XblMultiplayerEvent](../structs/xblmultiplayerevent.md)
  
  