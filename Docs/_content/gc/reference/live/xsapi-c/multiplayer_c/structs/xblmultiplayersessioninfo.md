---
author: joannaleecy
title: XblMultiplayerSessionInfo
description: Basic info about a local multiplayer session.
kindex: XblMultiplayerSessionInfo
ms.author: migreen
ms.topic: reference
security: public
edited: 00/00/0000
applies-to: pc-gdk
---

# XblMultiplayerSessionInfo  

Basic info about a local multiplayer session.  

## Syntax  
  
```cpp
typedef struct XblMultiplayerSessionInfo {  
    uint32_t ContractVersion;  
    char Branch[XBL_GUID_LENGTH];  
    uint64_t ChangeNumber;  
    char CorrelationId[XBL_GUID_LENGTH];  
    time_t StartTime;  
    time_t NextTimer;  
    char SearchHandleId[XBL_GUID_LENGTH];  
} XblMultiplayerSessionInfo  
```
  
### Members  
  
*ContractVersion*  
Type: uint32_t  
  
The contract version of the session.
  
*Branch*  
Type: char[XBL_GUID_LENGTH]  
  
The branch of the session used to scope change numbers.
  
*ChangeNumber*  
Type: uint64_t  
  
The change number of the session.
  
*CorrelationId*  
Type: char[XBL_GUID_LENGTH]  
  
A unique ID to the session used to query trace logs for entries that relate to the session.
  
*StartTime*  
Type: time_t  
  
The time that the session began.
  
*NextTimer*  
Type: time_t  
  
If any timeouts are in progress, this is the date when the next timer will fire.
  
*SearchHandleId*  
Type: char[XBL_GUID_LENGTH]  
  
A unique search handle ID to the session.
  
## Requirements  
  
**Header:** multiplayer_c.h
  
## See also  
[multiplayer_c](../multiplayer_c_members.md)  
  
  