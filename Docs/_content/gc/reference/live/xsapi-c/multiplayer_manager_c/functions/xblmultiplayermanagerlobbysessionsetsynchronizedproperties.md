---
author: joannaleecy
title: XblMultiplayerManagerLobbySessionSetSynchronizedProperties
description: Sets the value of a custom property for the lobby session, using `XblMultiplayerSessionWriteMode::SynchronizedUpdate`.
kindex: XblMultiplayerManagerLobbySessionSetSynchronizedProperties
ms.author: migreen
ms.topic: reference
security: public
edited: 00/00/0000
applies-to: pc-gdk
---

# XblMultiplayerManagerLobbySessionSetSynchronizedProperties  

Sets the value of a custom property for the lobby session, using `XblMultiplayerSessionWriteMode::SynchronizedUpdate`.  

## Syntax  
  
```cpp
HRESULT XblMultiplayerManagerLobbySessionSetSynchronizedProperties(  
         const char* name,  
         const char* valueJson,  
         void* context  
)  
```  
  
### Parameters  
  
*name* &nbsp;&nbsp;\_In\_z\_  
Type: char*  
  
The name of the custom property to set.  
  
*valueJson* &nbsp;&nbsp;\_In\_z\_  
Type: char*  
  
The value to assign to the property, as a JSON string.  
  
*context* &nbsp;&nbsp;\_In\_opt\_  
Type: void*  
  
Optional. The application-defined data to correlate the [XblMultiplayerEvent](../structs/xblmultiplayerevent.md) to the initiating call.  
  
  
### Return value  
Type: HRESULT
  
HRESULT return code for this API operation.
  
## Remarks  
  
This function sets the value, represented as a JSON string, of a custom property for the lobby session. Custom properties can be changed at any time. If custom properties are shared between devices, or may be updated by several devices at the same time, use this function to ensure atomicity and resolve any conflicts between devices while changing the values of those cusotm properties. If a custom property isn't shared across devices, use the [XblMultiplayerManagerLobbySessionSetProperties](xblmultiplayermanagerlobbysessionsetproperties.md) function instead to change the value of that custom property. <br />The service may reject the request to change the custom property if a race condition occurs due to a conflict. If the request is rejected, the service returns `HTTP_E_STATUS_PRECOND_FAILED`. If a conflict occurs, re-evaluate the need to change the custom property and, if needed, call this function again to re-submit the request.  <br />The result of this function is delivered as a multiplayer event with an event type set to `XblMultiplayerEventType::SessionSynchronizedPropertyWriteCompleted`. You can call [XblMultiplayerManagerDoWork](xblmultiplayermanagerdowork.md) to retrieve multiplayer events.
  
## Requirements  
  
**Header:** multiplayer_manager_c.h
  
**Library:** Microsoft.Xbox.Services.141.GSDK.C.lib
  
## See also  
[multiplayer_manager_c](../multiplayer_manager_c_members.md)  
[XblMultiplayerManagerLobbySessionSetSynchronizedHost](xblmultiplayermanagerlobbysessionsetsynchronizedhost.md)  
[XblMultiplayerEvent](../structs/xblmultiplayerevent.md)
  
  