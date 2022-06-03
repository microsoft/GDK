---
author: M-Stahl
title: XGameInviteEventCallback
description: A callback an application defines for a game invite event.
kindex: XGameInviteEventCallback
ms.author: v-sahain
ms.topic: reference
edited: 01/06/2020
quality: good
security: public
applies-to: pc-gdk
---

# XGameInviteEventCallback  

A callback an application defines for a game invite event.  

## Syntax  
  
```cpp
void XGameInviteEventCallback(  
         void* context,  
         const char* inviteUri  
)  
```  
  
### Parameters  
  
*context* &nbsp;&nbsp;\_In\_opt\_  
Type: void*  

The context we pass to [XGameInviteRegisterForEvent](xgameinviteregisterforevent.md).  

*inviteUri* &nbsp;&nbsp;\_In\_  
Type: char*  

  The URI for joining the game session.  > [!NOTE]
> XSAPI knows how to consume the URI.  

### Return value

Type: void
  
<a id="ID_XGameInviteEventCallback_Remarks"></a>  

## Remarks  
  
To register a callback for a game invite event, call [XGameInviteRegisterForEvent](xgameinviteregisterforevent.md). The function uses a pointer to an **XGameInviteEventCallback** as an argument.

To un-register a callback for a game invite event, call [XGameInviteUnregisterForEvent](xgameinviteunregisterforevent.md).

The following code sample registers for a game invite callback.  

```cpp
#include <XTaskQueue.h>
#include <XGameInvite.h>  
  
XTaskQueueHandle g_taskQueue;  
XTaskQueueRegistrationToken g_gameInviteEventToken;  
  
void OnGameInvite(void* context, const char* inviteUri)  
{  
    if (inviteUri != nullptr)
    {
        std::string inviteString(inviteUri);
        auto pos = inviteString.find("handle=");
        auto inviteHandeId = inviteString.substr(pos + 7, 36);
        // Now call XblMultiplayerManagerJoinLobby if using MPM
        // or call XblMultiplayerWriteSessionByHandleAsync if using MPSD APIs
    }
}  
  
void InitializeGame()  
{  
    XGameInviteRegisterForEvent(g_taskQueue, nullptr, OnGameInvite, &g_gameInviteEventToken);  
}  
  
void ShutdownGame()  
{  
    XGameInviteUnregisterForEvent(g_gameInviteEventToken);  
}  
```
  
## Requirements  
  
**Header:** XGameInvite.h
  
**Library:** xgameruntime.lib
  
**Supported platforms:** Windows, Xbox One family consoles and Xbox Series consoles  
  
## See also

[XGameInvite](../xgameinvite_members.md)
  
[XGameInviteRegisterForEvent](xgameinviteregisterforevent.md)

[XGameInviteUnregisterForEvent](xgameinviteunregisterforevent.md)