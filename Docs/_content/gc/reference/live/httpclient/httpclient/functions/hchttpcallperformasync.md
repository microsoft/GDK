---
author: joannaleecy
title: HCHttpCallPerformAsync
description: Perform HTTP call using the HCCallHandle.
kindex: HCHttpCallPerformAsync
ms.author: migreen
ms.topic: reference
security: public
edited: 00/00/0000
applies-to: pc-gdk
---

# HCHttpCallPerformAsync  

Perform HTTP call using the HCCallHandle.  

## Syntax  
  
```cpp
HRESULT HCHttpCallPerformAsync(  
         HCCallHandle call,  
         XAsyncBlock* asyncBlock  
)  
```  
  
### Parameters  
  
*call* &nbsp;&nbsp;\_In\_  
Type: HCCallHandle  
  
The handle of the HTTP call  
  
*asyncBlock* &nbsp;&nbsp;\_Inout\_  
Type: XAsyncBlock*  
  
The XAsyncBlock that defines the async operation  
  
  
### Return value  
Type: HRESULT
  
Result code for this API operation. Possible values are S_OK, E_INVALIDARG, E_OUTOFMEMORY, or E_FAIL.
  
## Remarks  
  
First create a HTTP handle using HCHttpCallCreate(). Then call HCHttpCallRequestSet*() to prepare the HCCallHandle. Then call HCHttpCallPerformAsync() to perform HTTP call using the HCCallHandle. This call is asynchronous, so the work will be done on a background thread and will return via the callback. The perform call is asynchronous, so the work will be done on a background thread which calls XTaskQueueDispatch(..., XTaskQueuePort::Work). The results will return to the callback on the thread that calls XTaskQueueDispatch(..., XTaskQueuePort::Completion), then get the result of the HTTP call by calling HCHttpCallResponseGet*() to get the HTTP response of the HCCallHandle. When the HCCallHandle is no longer needed, call HCHttpCallCloseHandle() to free the memory associated with the HCCallHandle. HCHttpCallPerformAsync can only be called once. Create new HCCallHandle to repeat the call.
  
## Requirements  
  
**Header:** httpClient.h
  
**Library:** libHttpClient.141.GSDK.C.lib
  
## See also  
[httpClient](../httpclient_members.md)  
  
  