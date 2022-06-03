---
author: joannaleecy
title: XblHttpCallCreate
description: Creates an HTTP call handle.
kindex: XblHttpCallCreate
ms.author: migreen
ms.topic: reference
security: public
edited: 00/00/0000
applies-to: pc-gdk
quality: good
---

# XblHttpCallCreate  

Creates an HTTP call handle.  

## Syntax  
  
```cpp
HRESULT XblHttpCallCreate(  
         XblContextHandle xblContext,  
         const char* method,  
         const char* url,  
         XblHttpCallHandle* call  
)  
```  
  
### Parameters  
  
*xblContext* &nbsp;&nbsp;\_In\_  
Type: [XblContextHandle](../../types_c/handles/xblcontexthandle.md)  
  
Xbox Live context that provides user context for authorizing the call.  
  
*method* &nbsp;&nbsp;\_In\_z\_  
Type: char*  
  
UTF-8 encoded method for the HTTP call.  
  
*url* &nbsp;&nbsp;\_In\_z\_  
Type: char*  
  
UTF-8 encoded URL for the HTTP call.  
  
*call* &nbsp;&nbsp;\_Out\_  
Type: [XblHttpCallHandle*](../handles/xblhttpcallhandle.md)  
  
The handle of the HTTP call.  
  
  
### Return value  
Type: HRESULT
  
Result code for this API operation. Possible values are S_OK, E_INVALIDARG, or E_FAIL.
  
## Remarks  
  
First create an HTTP handle using XblHttpCallCreate(). Then call XblHttpCallRequestSet*() to prepare the XblHttpCallHandle. Then call XblHttpCallPerformAsync() to perform HTTP call using the XblHttpCallHandle. This call is asynchronous, so the work will be done on a background thread and will return via the callback. The perform call is asynchronous, so the work will be done on a background thread which calls XTaskQueueDispatch(..., XTaskQueuePort::Work). The results will return to the callback on the thread that calls XTaskQueueDispatch(..., XTaskQueuePort::Completion), then get the result of the HTTP call by calling XblHttpCallResponseGet*() to get the HTTP response of the XblHttpCallHandle. When the XblHttpCallHandle is no longer needed, call [XblHttpCallCloseHandle](xblhttpcallclosehandle.md) to free the memory associated with the XblHttpCallHandle.
  
## Requirements  
  
**Header:** http_call_c.h
  
**Library:** Microsoft.Xbox.Services.141.GSDK.C.lib
  
## See also  
[http_call_c](../http_call_c_members.md)  
  
  