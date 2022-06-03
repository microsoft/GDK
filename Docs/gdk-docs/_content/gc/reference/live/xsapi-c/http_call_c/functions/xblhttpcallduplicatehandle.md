---
author: joannaleecy
title: XblHttpCallDuplicateHandle
description: Duplicates the XblHttpCallHandle object.
kindex: XblHttpCallDuplicateHandle
ms.author: migreen
ms.topic: reference
security: public
edited: 00/00/0000
applies-to: pc-gdk
quality: good
---

# XblHttpCallDuplicateHandle  

Duplicates the XblHttpCallHandle object.  

## Syntax  
  
```cpp
HRESULT XblHttpCallDuplicateHandle(  
         XblHttpCallHandle call,  
         XblHttpCallHandle* duplicateHandle  
)  
```  
  
### Parameters  
  
*call* &nbsp;&nbsp;\_In\_  
Type: [XblHttpCallHandle](../handles/xblhttpcallhandle.md)  
  
The handle of the HTTP call.  
  
*duplicateHandle* &nbsp;&nbsp;\_Out\_  
Type: [XblHttpCallHandle*](../handles/xblhttpcallhandle.md)  
  
The duplicated handle.  
  
  
### Return value  
Type: HRESULT
  
Result code for this API operation.
  
## Remarks  
  
Use XblHttpCallCloseHandle to close it.
  
## Requirements  
  
**Header:** http_call_c.h
  
**Library:** Microsoft.Xbox.Services.141.GSDK.C.lib
  
## See also  
[http_call_c](../http_call_c_members.md)  
  
  