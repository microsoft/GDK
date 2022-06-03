---
author: joannaleecy
title: XblMultiplayerSessionQuery
description: Queries the visible multiplayer sessions based on the configuration of this request.
kindex: XblMultiplayerSessionQuery
ms.author: migreen
ms.topic: reference
security: public
edited: 00/00/0000
quality: good
applies-to: pc-gdk
---

# XblMultiplayerSessionQuery  

Queries the visible multiplayer sessions based on the configuration of this request.  

## Syntax  
  
```cpp
typedef struct XblMultiplayerSessionQuery {  
    char Scid[XBL_SCID_LENGTH];  
    uint32_t MaxItems;  
    bool IncludePrivateSessions;  
    bool IncludeReservations;  
    bool IncludeInactiveSessions;  
    uint64_t* XuidFilters;  
    size_t XuidFiltersCount;  
    const char* KeywordFilter;  
    char SessionTemplateNameFilter[XBL_MULTIPLAYER_SESSION_TEMPLATE_NAME_MAX_LENGTH];  
    XblMultiplayerSessionVisibility VisibilityFilter;  
    uint32_t ContractVersionFilter;  
} XblMultiplayerSessionQuery  
```
  
### Members  
  
*Scid*  
Type: char[XBL_SCID_LENGTH]  
  
The service configuration id that the session is a part of.
  
*MaxItems*  
Type: uint32_t  
  
The maximum number of items to return.
  
*IncludePrivateSessions*  
Type: bool  
  
Include private sessions to the result.
  
*IncludeReservations*  
Type: bool  
  
Include sessions that the user hasn't accepted. Must specify xboxUserIdFilter to use.
  
*IncludeInactiveSessions*  
Type: bool  
  
Include inactive sessions to the result. Must specify xboxUserIdFilter to use.
  
*XuidFilters*  
Type: uint64_t*  
  
Filter result to just sessions these Xbox User IDs in it. (Optional) You must specify at least one Xuid filter OR a keyword filter.
  
*XuidFiltersCount*  
Type: size_t  
  
The number of Xuids in the XuidsFilters array.
  
*KeywordFilter*  
Type: const char*  
  
Filter result to just sessions with this keyword. (Optional) You must specify at least one Xuid filter OR a keyword filter.
  
*SessionTemplateNameFilter*  
Type: char[XBL_MULTIPLAYER_SESSION_TEMPLATE_NAME_MAX_LENGTH]  
  
The name of the template for the multiplayer session to filter on.
  
*VisibilityFilter*  
Type: [XblMultiplayerSessionVisibility](../enums/xblmultiplayersessionvisibility.md)  
  
Filter result to just sessions with the specified visibility.
  
*ContractVersionFilter*  
Type: uint32_t  
  
Filter result to just sessions with this major version or less of the contract. Use 0 to ignore.
  
## Requirements  
  
**Header:** multiplayer_c.h
  
## See also  
[multiplayer_c](../multiplayer_c_members.md)  
  
  