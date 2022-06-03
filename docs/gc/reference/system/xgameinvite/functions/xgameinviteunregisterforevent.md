---
author: M-Stahl
title: XGameInviteUnregisterForEvent
description: Un-registers a callback for a game invite event.
kindex: XGameInviteUnregisterForEvent
ms.author: v-sahain
ms.topic: reference
edited: 02/10/2020
quality: good
security: public
applies-to: pc-gdk
---

# XGameInviteUnregisterForEvent

Un-registers a callback for a game invite event.  

## Syntax  
  
```cpp
bool XGameInviteUnregisterForEvent(  
         XTaskQueueRegistrationToken token,  
         bool wait  
)  
```  
  
### Parameters  
  
*token* &nbsp;&nbsp;\_In\_  
Type: [XTaskQueueRegistrationToken](../../xtaskqueue/structs/xtaskqueueregistrationtoken.md)  

The token that [XGameInviteRegisterForEvent](xgameinviteregisterforevent.md) returns.  

*wait* &nbsp;&nbsp;\_In\_  
Type: bool  

Wait for pending event callbacks to complete.  

### Return value

Type: bool
  
Returns false if *wait* is false and the un-register is pending. Returns true otherwise.  
  
## Remarks  
  > [!NOTE]
> This function isn't safe to call on a time-sensitive thread. For more information, see [Time-sensitive threads](../../../../system/overviews/time-sensitive-threads.md).  
  
To register a callback for a game invite event, call [XGameInviteRegisterForEvent](xgameinviteregisterforevent.md). The function uses a pointer to an [XGameInviteEventCallback](xgameinviteeventcallback.md) as an argument.

For an example of calling this function, see the remarks section of the [XGameInviteEventCallback](xgameinviteeventcallback.md#ID_XGameInviteEventCallback_Remarks) topic.  

## Requirements  
  
**Header:** XGameInvite.h
  
**Library:** xgameruntime.lib
  
**Supported platforms:** Windows, Xbox One family consoles and Xbox Series consoles  
  
## See also

[XGameInvite](../xgameinvite_members.md)
  
[XGameInviteRegisterForEvent](xgameinviteregisterforevent.md)

[XGameInviteEventCallback](xgameinviteeventcallback.md)