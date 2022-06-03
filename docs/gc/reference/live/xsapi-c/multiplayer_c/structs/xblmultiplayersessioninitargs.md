---
author: joannaleecy
title: XblMultiplayerSessionInitArgs
description: Optional args when creating a new local multiplayer session.
kindex: XblMultiplayerSessionInitArgs
ms.author: migreen
ms.topic: reference
security: public
edited: 00/00/0000
quality: good
applies-to: pc-gdk
---

# XblMultiplayerSessionInitArgs  

Optional args when creating a new local multiplayer session.  

## Syntax  
  
```cpp
typedef struct XblMultiplayerSessionInitArgs {  
    uint32_t MaxMembersInSession;  
    XblMultiplayerSessionVisibility Visibility;  
    const uint64_t* InitiatorXuids;  
    size_t InitiatorXuidsCount;  
    const char* CustomJson;  
} XblMultiplayerSessionInitArgs  
```
  
### Members  
  
*MaxMembersInSession*  
Type: uint32_t  
  
The maximum number of members in this session. This value can only be set if the maximum is not specified in the title's multiplayer session template. If the maximum is specified in the title's multiplayer session template, then set to 0 to ignore this parameter.
  
*Visibility*  
Type: [XblMultiplayerSessionVisibility](../enums/xblmultiplayersessionvisibility.md)  
  
The visibility of this session.
  
*InitiatorXuids*  
Type: const uint64_t*  
  
A collection of Xbox User IDs indicating who initiated the session. (Optional)
  
*InitiatorXuidsCount*  
Type: size_t  
  
The number of Xuids in the Initiator XuidsArray.
  
*CustomJson*  
Type: const char*  
  
JSON that specifies the custom constants for the session.These can not be changed after the session is created. (Optional)
  
## Requirements  
  
**Header:** multiplayer_c.h
  
## See also  
[multiplayer_c](../multiplayer_c_members.md)  
  
  