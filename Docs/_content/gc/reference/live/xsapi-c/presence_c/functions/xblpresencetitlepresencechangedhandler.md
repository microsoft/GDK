---
author: joannaleecy
title: XblPresenceTitlePresenceChangedHandler
description: Event handler for title presence change notifications.
kindex: XblPresenceTitlePresenceChangedHandler
ms.author: migreen
ms.topic: reference
security: public
edited: 00/00/0000
applies-to: pc-gdk
---

# XblPresenceTitlePresenceChangedHandler  

Event handler for title presence change notifications.  

## Syntax  
  
```cpp
void XblPresenceTitlePresenceChangedHandler(  
         void* context,  
         uint64_t xuid,  
         uint32_t titleId,  
         XblPresenceTitleState titleState  
)  
```  
  
### Parameters  
  
*context* &nbsp;&nbsp;\_In\_opt\_  
Type: void*  
  
Caller context that will be passed back to the handler.  
  
*xuid* &nbsp;&nbsp;\_In\_  
Type: uint64_t  
  
The XboxUserID of the User whose title presence changed.  
  
*titleId* &nbsp;&nbsp;\_In\_  
Type: uint32_t  
  
The title ID.  
  
*titleState* &nbsp;&nbsp;\_In\_  
Type: [XblPresenceTitleState](../enums/xblpresencetitlestate.md)  
  
The title presence state for the user.  
  
  
### Return value  
Type: void
  

  
## Argument of
  
[XblPresenceAddTitlePresenceChangedHandler](xblpresenceaddtitlepresencechangedhandler.md)
  
## Requirements  
  
**Header:** presence_c.h
  
**Library:** Microsoft.Xbox.Services.141.GSDK.C.lib
  
## See also  
[presence_c](../presence_c_members.md)  
  
  