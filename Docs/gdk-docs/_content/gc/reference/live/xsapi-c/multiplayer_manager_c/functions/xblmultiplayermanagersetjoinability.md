---
author: joannaleecy
title: XblMultiplayerManagerSetJoinability
description: Restricts who can join the game.
kindex: XblMultiplayerManagerSetJoinability
ms.author: migreen
ms.topic: reference
security: public
edited: 00/00/0000
applies-to: pc-gdk
---

# XblMultiplayerManagerSetJoinability  

Restricts who can join the game.  

## Syntax  
  
```cpp
HRESULT XblMultiplayerManagerSetJoinability(  
         XblMultiplayerJoinability joinability,  
         void* context  
)  
```  
  
### Parameters  
  
*joinability* &nbsp;&nbsp;\_In\_  
Type: [XblMultiplayerJoinability](../enums/xblmultiplayerjoinability.md)  
  
The joinability value you want to set.  
  
*context* &nbsp;&nbsp;\_In\_opt\_  
Type: void*  
  
The application-defined data to correlate the XblMultiplayerEvent to the initiating call. (Optional)  
  
  
### Return value  
Type: HRESULT
  
HRESULT return code for this API operation.
  
## Remarks  
  
Defaults to JoinableByFriends, meaning only local users and users who are followed by an existing member of the lobby can join without an invite. The result is delivered via XblMultiplayerEvent of type JoinabilityStateChanged through XblMultiplayerManagerDoWork(). Changes are batched and written to the service on the next XblMultiplayerManagerDoWork. All session properties and members contain updated response returned from the server upon calling XblMultiplayerManagerDoWork.
  
## Requirements  
  
**Header:** multiplayer_manager_c.h
  
**Library:** Microsoft.Xbox.Services.141.GSDK.C.lib
  
## See also  
[multiplayer_manager_c](../multiplayer_manager_c_members.md)  
  
  