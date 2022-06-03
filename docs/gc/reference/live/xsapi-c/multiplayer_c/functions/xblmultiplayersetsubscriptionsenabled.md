---
author: joannaleecy
title: XblMultiplayerSetSubscriptionsEnabled
description: >-
  Explicitly starts or stops the multiplayer service connectivity via RTA. Enabling the RTA subscription enables: 1. Callbacks when the local Users's sessions change, using the MultiplayerSession object. Handlers are added with [XblMultiplayerAddSessionChangedHandler](xblmultiplayeraddsessionchangedhandler.md). 2. Automatic
  removal of members from sessions when the RTA connection underlying this multiplayer subscription is broken.
kindex: XblMultiplayerSetSubscriptionsEnabled
ms.author: migreen
ms.topic: reference
security: public
edited: 00/00/0000
applies-to: pc-gdk
---

# XblMultiplayerSetSubscriptionsEnabled  

Explicitly starts or stops the multiplayer service connectivity via RTA. Enabling the RTA subscription enables: 1. Callbacks when the local Users's sessions change, using the MultiplayerSession object. Handlers are added with [XblMultiplayerAddSessionChangedHandler](xblmultiplayeraddsessionchangedhandler.md). 2. Automatic removal of members from sessions when the RTA connection underlying this multiplayer subscription is broken.  

## Syntax  
  
```cpp
HRESULT XblMultiplayerSetSubscriptionsEnabled(  
         XblContextHandle xblContext,  
         bool subscriptionsEnabled  
)  
```  
  
### Parameters  
  
*xblContext* &nbsp;&nbsp;\_In\_  
Type: [XblContextHandle](../../types_c/handles/xblcontexthandle.md)  
  
Xbox live context for the local user.  
  
*subscriptionsEnabled* &nbsp;&nbsp;\_In\_  
Type: bool  
  
True to enable subscriptions and false to stop them.  
  
  
### Return value  
Type: HRESULT
  
HRESULT return code for this API operation.
  
## Remarks  
  
This method immediately enables the RTA connection, but the in order to receive session changed callbacks, the session must be written again after enabling sunscriptions.
  
## Requirements  
  
**Header:** multiplayer_c.h
  
**Library:** Microsoft.Xbox.Services.141.GSDK.C.lib
  
## See also  
[multiplayer_c](../multiplayer_c_members.md)  
  
  