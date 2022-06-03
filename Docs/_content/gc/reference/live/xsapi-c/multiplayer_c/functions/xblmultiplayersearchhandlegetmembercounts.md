---
author: joannaleecy
title: XblMultiplayerSearchHandleGetMemberCounts
description: Get the current and max number of members in the associated session.
kindex: XblMultiplayerSearchHandleGetMemberCounts
ms.author: migreen
ms.topic: reference
security: public
edited: 00/00/0000
applies-to: pc-gdk
quality: good
---

# XblMultiplayerSearchHandleGetMemberCounts  

Get the current and max number of members in the associated session.  

## Syntax  
  
```cpp
HRESULT XblMultiplayerSearchHandleGetMemberCounts(  
         XblMultiplayerSearchHandle handle,  
         size_t* maxMembers,  
         size_t* currentMembers  
)  
```  
  
### Parameters  
  
*handle* &nbsp;&nbsp;\_In\_  
Type: [XblMultiplayerSearchHandle](../handles/xblmultiplayersearchhandle.md)  
  
Handle to the search handle details.  
  
*maxMembers* &nbsp;&nbsp;\_Out\_opt\_  
Type: size_t*  
  
Passes back the max members allowed in session.  
  
*currentMembers* &nbsp;&nbsp;\_Out\_opt\_  
Type: size_t*  
  
Passes back the current number of members in session.  
  
  
### Return value  
Type: HRESULT
  
HRESULT return code for this API operation.
  
## Requirements  
  
**Header:** multiplayer_c.h
  
**Library:** Microsoft.Xbox.Services.141.GSDK.C.lib
  
## See also  
[multiplayer_c](../multiplayer_c_members.md)  
  
  