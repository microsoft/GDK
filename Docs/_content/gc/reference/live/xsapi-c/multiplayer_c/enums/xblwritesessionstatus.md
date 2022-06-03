---
author: joannaleecy
title: XblWriteSessionStatus
description: Defines values that indicate the write status of a multiplayer session.
kindex: XblWriteSessionStatus
ms.author: migreen
ms.topic: reference
security: public
edited: 00/00/0000
quality: good
applies-to: pc-gdk
---

# XblWriteSessionStatus  

Defines values that indicate the write status of a multiplayer session.    

## Syntax  
  
```cpp
enum class XblWriteSessionStatus  : uint32_t  
{  
    Unknown,  
    AccessDenied,  
    Created,  
    Conflict,  
    HandleNotFound,  
    OutOfSync,  
    SessionDeleted,  
    Updated  
}  
```  
  
## Constants  
  
| Constant | Description |
| --- | --- |
| Unknown | Unknown write result. |  
| AccessDenied | User does not have permission to write to the session (HTTP status 403). |  
| Created | The write operation created the session (HTTP status 201). |  
| Conflict | A conflict occurred during the write operation (HTTP status 409). |  
| HandleNotFound | The session was not found (HTTP status 404). |  
| OutOfSync | The session was updated by another user (HTTP status 412). |  
| SessionDeleted | The session was deleted successfully (HTTP status 204). |  
| Updated | The session was updated successfully (HTTP status 200). |  
  
## Requirements  
  
**Header:** multiplayer_c.h
  
## See also  
[multiplayer_c](../multiplayer_c_members.md)  
  
  