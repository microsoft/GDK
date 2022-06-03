---
author: joannaleecy
title: XblSocialRemoveSocialRelationshipChangedHandler
description: Removes a social relationship change handler.
kindex: XblSocialRemoveSocialRelationshipChangedHandler
ms.author: migreen
ms.topic: reference
security: public
edited: 00/00/0000
applies-to: pc-gdk
quality: good
---

# XblSocialRemoveSocialRelationshipChangedHandler  

Removes a social relationship change handler.  

## Syntax  
  
```cpp
HRESULT XblSocialRemoveSocialRelationshipChangedHandler(  
         XblContextHandle xboxLiveContext,  
         XblFunctionContext handlerFunctionContext  
)  
```  
  
### Parameters  
  
*xboxLiveContext* &nbsp;&nbsp;\_In\_  
Type: [XblContextHandle](../../types_c/handles/xblcontexthandle.md)  
  
An xbox live context handle created with XblContextCreateHandle.  
  
*handlerFunctionContext* &nbsp;&nbsp;\_In\_  
Type: XblFunctionContext  
  
Context for the handler to remove.  
  
  
### Return value  
Type: HRESULT
  

  
## Remarks  
  
<prereq /> Call this API only if [XblSocialAddSocialRelationshipChangedHandler](xblsocialaddsocialrelationshipchangedhandler.md) was used to register an event handler.
  
## Requirements  
  
**Header:** social_c.h
  
**Library:** Microsoft.Xbox.Services.141.GSDK.C.lib
  
## See also  
[social_c](../social_c_members.md)  
  
  