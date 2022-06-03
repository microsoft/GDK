---
author: joannaleecy
title: XblHttpCallPerformAsync
description: Perform an HTTP call using the XblHttpCallHandle.
kindex: XblHttpCallPerformAsync
ms.author: migreen
ms.topic: reference
security: public
edited: 00/00/0000
applies-to: pc-gdk
---

# XblHttpCallPerformAsync  

Perform an HTTP call using the XblHttpCallHandle.  

## Syntax  
  
```cpp
HRESULT XblHttpCallPerformAsync(  
         XblHttpCallHandle call,  
         XblHttpCallResponseBodyType type,  
         XAsyncBlock* asyncBlock  
)  
```  
  
### Parameters  
  
*call* &nbsp;&nbsp;\_In\_  
Type: [XblHttpCallHandle](../handles/xblhttpcallhandle.md)  
  
The handle of the HTTP call.  
  
*type* &nbsp;&nbsp;\_In\_  
Type: [XblHttpCallResponseBodyType](../enums/xblhttpcallresponsebodytype.md)  
  
The response body type to read the results of this HTTP call. Note: this does not influence the content-type header, which must be supplied by calling [XblHttpCallRequestSetHeader](xblhttpcallrequestsetheader.md).  
  
*asyncBlock* &nbsp;&nbsp;\_Inout\_  
Type: XAsyncBlock*  
  
The XAsyncBlock that defines the async operation.  
  
  
### Return value  
Type: HRESULT
  
Result code for this API operation. Possible values are S_OK, E_INVALIDARG, E_OUTOFMEMORY, or E_FAIL.
  
## Remarks  
  
First create a HTTP handle using XblHttpCallCreate(). Then call XblHttpCallRequestSet*() to prepare the XblHttpCallHandle. Then call XblHttpCallPerformAsync() to perform HTTP call using the XblHttpCallHandle. This call is asynchronous, so the work will be done on a background thread and will return via the callback. The perform call is asynchronous, so the work will be done on a background thread which calls XTaskQueueDispatch(..., XTaskQueuePort::Work). The results will return to the callback on the thread that calls XTaskQueueDispatch(..., XTaskQueuePort::Completion), then get the result of the HTTP call by calling XblHttpCallResponseGet*() to get the HTTP response of the XblHttpCallHandle. When the XblHttpCallHandle is no longer needed, call XblHttpCallCloseHandle() to free the memory associated with the XblHttpCallHandle. XblHttpCallPerformAsync can only be called once. Create new XblHttpCallHandle to repeat the call.
  
## Requirements  
  
**Header:** http_call_c.h
  
**Library:** Microsoft.Xbox.Services.141.GSDK.C.lib
  
## See also  
[http_call_c](../http_call_c_members.md)  
  
  