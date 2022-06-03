---
author: joannaleecy
title: XblHttpCallCloseHandle
description: Decrements the reference count on the call object.
kindex: XblHttpCallCloseHandle
ms.author: migreen
ms.topic: reference
security: public
edited: 00/00/0000
applies-to: pc-gdk
quality: good
---

# XblHttpCallCloseHandle  

Decrements the reference count on the call object.  

## Syntax  
  
```cpp
void XblHttpCallCloseHandle(  
         XblHttpCallHandle call  
)  
```  
  
### Parameters  
  
*call* &nbsp;&nbsp;\_In\_  
Type: [XblHttpCallHandle](../handles/xblhttpcallhandle.md)  
  
The handle of the HTTP call.  
  
  
### Return value  
Type: void
  

  
## Remarks  
  
When the XblHttpCallHandle ref count is 0, XblHttpCallCloseHandle() will free the memory associated with the XblHttpCallHandle.
  
## Requirements  
  
**Header:** http_call_c.h
  
**Library:** Microsoft.Xbox.Services.141.GSDK.C.lib
  
## See also  
[http_call_c](../http_call_c_members.md)  
  
  