---
author: joannaleecy
title: XblMultiplayerSessionCurrentUserSetEncounters
description: Sets a list of group names for the current user indicating which groups that user encountered during a multiplayer session. An encounter is a brief interaction with another group.
kindex: XblMultiplayerSessionCurrentUserSetEncounters
ms.author: migreen
ms.topic: reference
security: public
edited: 00/00/0000
applies-to: pc-gdk
quality: good
---

# XblMultiplayerSessionCurrentUserSetEncounters  

Sets a list of group names for the current user indicating which groups that user encountered during a multiplayer session. An encounter is a brief interaction with another group.  

## Syntax  
  
```cpp
HRESULT XblMultiplayerSessionCurrentUserSetEncounters(  
         XblMultiplayerSessionHandle handle,  
         const char** encounters,  
         size_t encountersCount  
)  
```  
  
### Parameters  
  
*handle* &nbsp;&nbsp;\_In\_  
Type: [XblMultiplayerSessionHandle](../handles/xblmultiplayersessionhandle.md)  
  
Handle to the multiplayer session.  
  
*encounters* &nbsp;&nbsp;\_In\_reads\_(encountersCount)  
Type: char**  
  
Array of encounter strings.  
  
*encountersCount* &nbsp;&nbsp;\_In\_  
Type: size_t  
  
Size of the encounters array.  
  
  
### Return value  
Type: HRESULT
  
HRESULT return code for this API operation.
  
## Requirements  
  
**Header:** multiplayer_c.h
  
**Library:** Microsoft.Xbox.Services.141.GSDK.C.lib
  
## See also  
[multiplayer_c](../multiplayer_c_members.md)  
  
  