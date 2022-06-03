---
author: joannaleecy
title: XblSocialAddSocialRelationshipChangedHandler
description: Registers an event handler for notifications of social relationship changes caused by the registering user.
kindex: XblSocialAddSocialRelationshipChangedHandler
ms.author: migreen
ms.topic: reference
security: public
edited: 00/00/0000
applies-to: pc-gdk
quality: good
---

# XblSocialAddSocialRelationshipChangedHandler  

Registers an event handler for notifications of social relationship changes caused by the registering user.  

## Syntax  
  
```cpp
XblFunctionContext XblSocialAddSocialRelationshipChangedHandler(  
         XblContextHandle xboxLiveContext,  
         XblSocialRelationshipChangedHandler handler,  
         void* handlerContext  
)  
```  
  
### Parameters  
  
*xboxLiveContext* &nbsp;&nbsp;\_In\_  
Type: [XblContextHandle](../../types_c/handles/xblcontexthandle.md)  
  
An xbox live context handle created with XblContextCreateHandle.  
  
*handler* &nbsp;&nbsp;\_In\_  
Type: XblSocialRelationshipChangedHandler  
  
The callback function that receives notifications.  
  
*handlerContext* &nbsp;&nbsp;\_In\_opt\_  
Type: void*  
  
Client context pointer to be passed back to the handler.  
  
  
### Return value  
Type: XblFunctionContext
  
A XblFunctionContext used to remove the handler.
  
## Remarks  
  
This handler triggers only if the user changes the relationship with another user. This handler does not trigger if another user changes the relationship with the user. Call [XblSocialRemoveSocialRelationshipChangedHandler](xblsocialremovesocialrelationshipchangedhandler.md) to un-register event handler.
  
## Requirements  
  
**Header:** social_c.h
  
**Library:** Microsoft.Xbox.Services.141.GSDK.C.lib
  
## See also  
[social_c](../social_c_members.md)  
  
  