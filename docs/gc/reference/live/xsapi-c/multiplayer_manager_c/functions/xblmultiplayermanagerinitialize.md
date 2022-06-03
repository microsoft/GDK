---
author: joannaleecy
title: XblMultiplayerManagerInitialize
description: Initializes Multiplayer Manager (MPM).
kindex: XblMultiplayerManagerInitialize
ms.author: migreen
ms.topic: reference
security: public
edited: 00/00/0000
applies-to: pc-gdk
---

# XblMultiplayerManagerInitialize  

Initializes Multiplayer Manager (MPM).  

## Syntax  
  
```cpp
HRESULT XblMultiplayerManagerInitialize(  
         const char* lobbySessionTemplateName,  
         XTaskQueueHandle asyncQueue  
)  
```  
  
### Parameters  
  
*lobbySessionTemplateName* &nbsp;&nbsp;\_In\_z\_  
Type: char*  
  
The name of the session template for the lobby session to be based on.  
  
*asyncQueue* &nbsp;&nbsp;\_In\_opt\_  
Type: XTaskQueueHandle  
  
The task queue where all Multiplayer Manager work should be scheduled.  
  
  
### Return value  
Type: HRESULT
  
HRESULT return code for this API operation.
  
## Remarks  
  
This function initializes the lobby session with which Multiplayer Manager (MPM) interacts, based on a session template configured for the title. You must call this function before calling other MPM functions, otherwise errors may occur. For more information about configuring session templates, see [Configuring the Multiplayer service](../../../../../live/features/multiplayer/concepts/live-configure-the-multiplayer-service.md).
  
## Requirements  
  
**Header:** multiplayer_manager_c.h
  
**Library:** Microsoft.Xbox.Services.141.GSDK.C.lib
  
## See also  
[multiplayer_manager_c](../multiplayer_manager_c_members.md)  
[XblMultiplayerManagerDoWork](xblmultiplayermanagerdowork.md)
  
  