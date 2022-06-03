---
author: joannaleecy
title: XblMultiplayerSessionPropertiesSetKeywords
description: A collection of keywords associated with the session. (Optional, might be empty)
kindex: XblMultiplayerSessionPropertiesSetKeywords
ms.author: migreen
ms.topic: reference
security: public
edited: 00/00/0000
applies-to: pc-gdk
---

# XblMultiplayerSessionPropertiesSetKeywords  

A collection of keywords associated with the session. (Optional, might be empty)  

## Syntax  
  
```cpp
HRESULT XblMultiplayerSessionPropertiesSetKeywords(  
         XblMultiplayerSessionHandle handle,  
         const char** keywords,  
         size_t keywordsCount  
)  
```  
  
### Parameters  
  
*handle* &nbsp;&nbsp;\_In\_  
Type: [XblMultiplayerSessionHandle](../handles/xblmultiplayersessionhandle.md)  
  
Handle to the multiplayer session.  
  
*keywords* &nbsp;&nbsp;\_In\_  
Type: char**  
  
The keywords to associate with the session. Overwrites existing keywords.  
  
*keywordsCount* &nbsp;&nbsp;\_In\_  
Type: size_t  
  
The size of the keywords array.  
  
  
### Return value  
Type: HRESULT
  
HRESULT return code for this API operation.
  
## Requirements  
  
**Header:** multiplayer_c.h
  
**Library:** Microsoft.Xbox.Services.141.GSDK.C.lib
  
## See also  
[multiplayer_c](../multiplayer_c_members.md)  
  
  