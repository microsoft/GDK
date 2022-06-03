---
author: joannaleecy
title: HCHttpCallRequestGetHeaderAtIndex
description: Gets the request headers at specific zero based index in the HTTP call.
kindex: HCHttpCallRequestGetHeaderAtIndex
ms.author: migreen
ms.topic: reference
security: public
edited: 00/00/0000
applies-to: pc-gdk
quality: good
---

# HCHttpCallRequestGetHeaderAtIndex  

Gets the request headers at specific zero based index in the HTTP call.  

## Syntax  
  
```cpp
HRESULT HCHttpCallRequestGetHeaderAtIndex(  
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
  
Specific zero based index of the request header.  
  
*headerName* &nbsp;&nbsp;\_Out\_  
Type: char**  
  
UTF-8 encoded request header name for the HTTP call.  
  
*headerValue* &nbsp;&nbsp;\_Out\_  
Type: char**  
  
UTF-8 encoded request header value for the HTTP call.  
  
  
### Return value  
Type: HRESULT
  
Result code for this API operation. Possible values are S_OK, E_INVALIDARG, or E_FAIL.
  
## Remarks  
  
Use HCHttpCallRequestGetNumHeaders() to know how many request headers there are in the HTTP call.
  
## Requirements  
  
**Header:** httpProvider.h
  
**Library:** libHttpClient.141.GSDK.C.lib
  
## See also  
[httpProvider](../httpprovider_members.md)  
  
  