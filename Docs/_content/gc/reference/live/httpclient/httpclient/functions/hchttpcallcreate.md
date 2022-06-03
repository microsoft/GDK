---
author: joannaleecy
title: HCHttpCallCreate
description: Creates an HTTP call handle.
kindex: HCHttpCallCreate
ms.author: migreen
ms.topic: reference
security: public
edited: 00/00/0000
applies-to: pc-gdk
---

# HCHttpCallCreate  

Creates an HTTP call handle.  

## Syntax  
  
```cpp
HRESULT HCHttpCallCreate(  
         HCCallHandle* call  
)  
```  
  
### Parameters  
  
*call* &nbsp;&nbsp;\_Out\_  
Type: HCCallHandle*  
  
The handle of the HTTP call.  
  
  
### Return value  
Type: HRESULT
  
Result code for this API operation. Possible values are S_OK, E_INVALIDARG, or E_FAIL.
  
## Remarks  
  
First create a HTTP handle using HCHttpCallCreate(). Then call HCHttpCallRequestSet*() to prepare the HCCallHandle. Then call HCHttpCallPerformAsync() to perform HTTP call using the HCCallHandle. This call is asynchronous, so the work will be done on a background thread and will return via the callback. The perform call is asynchronous, so the work will be done on a background thread which calls XTaskQueueDispatch(..., XTaskQueuePort::Work). The results will return to the callback on the thread that calls XTaskQueueDispatch(..., XTaskQueuePort::Completion), then get the result of the HTTP call by calling HCHttpCallResponseGet*() to get the HTTP response of the HCCallHandle. When the HCCallHandle is no longer needed, call HCHttpCallCloseHandle() to free the memory associated with the HCCallHandle.
  
## Requirements  
  
**Header:** httpClient.h
  
**Library:** libHttpClient.141.GSDK.C.lib
  
## See also  
[httpClient](../httpclient_members.md)  
  
  