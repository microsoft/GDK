---
author: joannaleecy
title: XblMultiplayerSessionWriteMode
description: Defines values that indicate the mode used when creating or writing to a multiplayer session.
kindex: XblMultiplayerSessionWriteMode
ms.author: migreen
ms.topic: reference
security: public
edited: 00/00/0000
quality: good
applies-to: pc-gdk
---

# XblMultiplayerSessionWriteMode  

Defines values that indicate the mode used when creating or writing to a multiplayer session.    

## Syntax  
  
```cpp
enum class XblMultiplayerSessionWriteMode  : uint32_t  
{  
    CreateNew,  
    UpdateOrCreateNew,  
    UpdateExisting,  
    SynchronizedUpdate,  
}  
```  
  
## Constants  
  
| Constant | Description |
| --- | --- |
| CreateNew | Create a multiplayer session. Fails if the session already exists. |  
| UpdateOrCreateNew | Either update or create a session. Doesn't care whether the session exists. |  
| UpdateExisting | Updates an existing multiplayer session. Fails if the session doesn't exist. |  
| SynchronizedUpdate | Updates an existing multiplayer session. Fails with HTTP_E_STATUS_PRECOND_FAILED (HTTP status 412) if the ETag on the local session doesn't match the ETag on the server. Fails if the session does not exist. |  
  
## Argument of
  
[XblMultiplayerWriteSessionAsync](../functions/xblmultiplayerwritesessionasync.md)  
[XblMultiplayerWriteSessionByHandleAsync](../functions/xblmultiplayerwritesessionbyhandleasync.md)
  
## Requirements  
  
**Header:** multiplayer_c.h
  
## See also  
[multiplayer_c](../multiplayer_c_members.md)  
  
  