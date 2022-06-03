---
author: M-Stahl
title: XGameInviteRegisterForEvent
description: Registers a callback for a game invite event.
kindex: XGameInviteRegisterForEvent
ms.author: v-sahain
ms.topic: reference
edited: 02/10/2020
quality: good
security: public
applies-to: pc-gdk
---

# XGameInviteRegisterForEvent

Registers a callback for a game invite event.  

## Syntax  
  
```cpp
HRESULT XGameInviteRegisterForEvent(  
         XTaskQueueHandle queue,  
         void* context,  
         XGameInviteEventCallback* callback,  
         XTaskQueueRegistrationToken* token  
)  
```  
  
### Parameters  
  
*queue* &nbsp;&nbsp;\_In\_opt\_  
Type: XTaskQueueHandle  

The task queue that dispatches the event callback.  

*context* &nbsp;&nbsp;\_In\_opt\_  
Type: void*  

The context we pass to the event callback.  

*callback* &nbsp;&nbsp;\_In\_  
Type: XGameInviteEventCallback*  

The event callback function.  

*token* &nbsp;&nbsp;\_Out\_  
Type: [XTaskQueueRegistrationToken*](../../xtaskqueue/structs/xtaskqueueregistrationtoken.md)  

A token from the task queue that represents the registration. Use the token to un-register the callback for the game invite event.  

### Return value

Type: HRESULT
  
HRESULT success or error code.  
For a list of error codes, see [Error Codes](../../../errorcodes.md).  
  
## Remarks  
  > [!NOTE]
> This function isn't safe to call on a time-sensitive thread. For more information, see [Time-sensitive threads](../../../../system/overviews/time-sensitive-threads.md).  
  
The **XGameInviteRegisterForEvent** function uses an [XGameInviteEventCallBack](xgameinviteeventcallback.md) as an argument.

To un-register a callback for a game invite event, call [XGameInviteUnregisterForEvent](xgameinviteunregisterforevent.md).

For an example of calling this function, see the remarks section of the [XGameInviteEventCallback](xgameinviteeventcallback.md#ID_XGameInviteEventCallback_Remarks) topic.  

## Requirements  
  
**Header:** XGameInvite.h
  
**Library:** xgameruntime.lib
  
**Supported platforms:** Windows, Xbox One family consoles and Xbox Series consoles  
  
## See also

[XGameInvite](../xgameinvite_members.md)
  
[XGameInviteEventCallBack](xgameinviteeventcallback.md)

[XGameInviteUnregisterForEvent](xgameinviteunregisterforevent.md)