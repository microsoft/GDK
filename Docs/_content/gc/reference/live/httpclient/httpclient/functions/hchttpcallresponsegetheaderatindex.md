---
author: joannaleecy
title: HCHttpCallResponseGetHeaderAtIndex
description: Gets the response headers at specific zero based index in the HTTP call.
kindex: HCHttpCallResponseGetHeaderAtIndex
ms.author: migreen
ms.topic: reference
security: public
edited: 00/00/0000
applies-to: pc-gdk
quality: good
---

# HCHttpCallResponseGetHeaderAtIndex  

Gets the response headers at specific zero based index in the HTTP call.  

## Syntax  
  
```cpp
HRESULT HCHttpCallResponseGetHeaderAtIndex(  
         HCCallHandle call,  
         uint32_t headerIndex,  
         const char** headerName,  
         const char** headerValue  
)  
```  
  
### Parameters  
  
*call* &nbsp;&nbsp;\_In\_  
Type: HCCallHandle  
  
The handle of the HTTP call.  
  
*headerIndex* &nbsp;&nbsp;\_In\_  
Type: uint32_t  
  
Specific zero based index of the response header.  
  
*headerName* &nbsp;&nbsp;\_Out\_  
Type: char**  
  
UTF-8 encoded response header name for the HTTP call. The memory for the returned string pointer remains valid for the life of the HCCallHandle object until HCHttpCallCloseHandle() is called on it.  
  
*headerValue* &nbsp;&nbsp;\_Out\_  
Type: char**  
  
UTF-8 encoded response header value for the HTTP call. The memory for the returned string pointer remains valid for the life of the HCCallHandle object until HCHttpCallCloseHandle() is called on it.  
  
  
### Return value  
Type: HRESULT
  
Result code for this API operation. Possible values are S_OK, E_INVALIDARG, or E_FAIL.
  
## Remarks  
  
Use HCHttpCallResponseGetNumHeaders() to know how many response headers there are in the HTTP call. This can only be called after calling HCHttpCallPerformAsync when the HTTP task is completed.
  
## Requirements  
  
**Header:** httpClient.h
  
**Library:** libHttpClient.141.GSDK.C.lib
  
## See also  
[httpClient](../httpclient_members.md)  
  
  