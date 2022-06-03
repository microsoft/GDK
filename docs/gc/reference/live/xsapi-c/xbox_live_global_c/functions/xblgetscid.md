---
author: joannaleecy
title: XblGetScid
description: Get the service configuration Id for the application. This is set during XblInitialize.
kindex: XblGetScid
ms.author: migreen
ms.topic: reference
security: public
edited: 00/00/0000
applies-to: pc-gdk
quality: good
---

# XblGetScid  

Get the service configuration Id for the application. This is set during XblInitialize.  

## Syntax  
  
```cpp
HRESULT XblGetScid(  
         const char** scid  
)  
```  
  
### Parameters  
  
*scid* &nbsp;&nbsp;\_Out\_  
Type: char**  
  
The service configuration Id for the app.  
  
  
### Return value  
Type: HRESULT
  
HRESULT return code for this API operation.
  
## Remarks  
  
This string will be valid until XblCleanup is called.
  
## Requirements  
  
**Header:** xbox_live_global_c.h
  
**Library:** Microsoft.Xbox.Services.141.GSDK.C.lib
  
## See also  
[xbox_live_global_c](../xbox_live_global_c_members.md)  
  
  