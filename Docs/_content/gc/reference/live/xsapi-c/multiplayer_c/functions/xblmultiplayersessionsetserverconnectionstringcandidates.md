---
author: joannaleecy
title: XblMultiplayerSessionSetServerConnectionStringCandidates
description: The ordered list of case-insensitive connection strings that the session could use to connect to a game server. Generally titles should use the first on the list, but sophisticated titles could use a custom mechanism for choosing one of the others (e.g. based on load).
kindex: XblMultiplayerSessionSetServerConnectionStringCandidates
ms.author: migreen
ms.topic: reference
security: public
edited: 00/00/0000
applies-to: pc-gdk
---

# XblMultiplayerSessionSetServerConnectionStringCandidates  

The ordered list of case-insensitive connection strings that the session could use to connect to a game server. Generally titles should use the first on the list, but sophisticated titles could use a custom mechanism for choosing one of the others (e.g. based on load).  

## Syntax  
  
```cpp
HRESULT XblMultiplayerSessionSetServerConnectionStringCandidates(  
         XblMultiplayerSessionHandle handle,  
         const char** serverConnectionStringCandidates,  
         size_t serverConnectionStringCandidatesCount  
)  
```  
  
### Parameters  
  
*handle* &nbsp;&nbsp;\_In\_  
Type: [XblMultiplayerSessionHandle](../handles/xblmultiplayersessionhandle.md)  
  
Handle to the multiplayer session.  
  
*serverConnectionStringCandidates* &nbsp;&nbsp;\_In\_reads\_(serverConnectionStringCandidatesCount)  
Type: char**  
  
The collection of connection paths.  
  
*serverConnectionStringCandidatesCount* &nbsp;&nbsp;\_In\_  
Type: size_t  
  
The size of the candidates array.  
  
  
### Return value  
Type: HRESULT
  
HRESULT return code for this API operation.
  
## Requirements  
  
**Header:** multiplayer_c.h
  
**Library:** Microsoft.Xbox.Services.141.GSDK.C.lib
  
## See also  
[multiplayer_c](../multiplayer_c_members.md)  
  
  