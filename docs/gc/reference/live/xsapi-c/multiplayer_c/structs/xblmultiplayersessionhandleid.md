---
author: joannaleecy
title: XblMultiplayerSessionHandleId
description: Represents a handle ID of a multiplayer session.
kindex: XblMultiplayerSessionHandleId
ms.author: migreen
ms.topic: reference
security: public
edited: 00/00/0000
quality: good
applies-to: pc-gdk
---

# XblMultiplayerSessionHandleId  

Represents a handle ID of a multiplayer session.  

## Syntax  
  
```cpp
typedef struct XblMultiplayerSessionHandleId {  
    char value[XBL_GUID_LENGTH];  
} XblMultiplayerSessionHandleId  
```
  
### Members  
  
*value*  
Type: char[XBL_GUID_LENGTH]  
  
The ID of the handle that MSPD created.
  
## Remarks  
  
Multiplayer Session Directory (MPSD) can create various handles that refer to a session. They are immutable and can only be created, read, and deleted. Note that this handle ID references to a service side object.
  
## Argument of
  
[XblMultiplayerSetTransferHandleResult](../functions/xblmultiplayersettransferhandleresult.md)
  
## Requirements  
  
**Header:** multiplayer_c.h
  
## See also  
[multiplayer_c](../multiplayer_c_members.md)  
  
  