---
author: joannaleecy
title: HCMockAddMock
description: Configures libHttpClient to return mock response instead of making a network call when HCHttpCallPerformAsync() is called.
kindex: HCMockAddMock
ms.author: migreen
ms.topic: reference
security: public
edited: 00/00/0000
applies-to: pc-gdk
---

# HCMockAddMock  

Configures libHttpClient to return mock response instead of making a network call when HCHttpCallPerformAsync() is called.  

## Syntax  
  
```cpp
HRESULT HCMockAddMock(  
         HCMockCallHandle call,  
         const char* method,  
         const char* url,  
         const uint8_t* requestBodyBytes,  
         uint32_t requestBodySize  
)  
```  
  
### Parameters  
  
*call* &nbsp;&nbsp;\_In\_  
Type: HCMockCallHandle  
  
This HC_MOCK_CALL_HANDLE that represents the mock that has been configured accordingly using HCMockResponseSet*()  
  
*method* &nbsp;&nbsp;\_In\_opt\_z\_  
Type: char*  
  
If you want the mock to only apply to a specific URL, pass in a UTF-8 encoded method and URL.  
  
*url* &nbsp;&nbsp;\_In\_opt\_z\_  
Type: char*  
  
If you want the mock to only apply to a specific URL, pass in a UTF-8 encoded method and URL.  
  
*requestBodyBytes* &nbsp;&nbsp;\_In\_reads\_bytes\_opt\_(requestBodySize)  
Type: uint8_t*  
  
If you want the mock to only apply to a specific URL & request string, pass in a method, URL and a string body.  
  
*requestBodySize* &nbsp;&nbsp;\_In\_  
Type: uint32_t  
  
The size of requestBodyBytes in bytes.  
  
  
### Return value  
Type: HRESULT
  
Result code for this API operation. Possible values are S_OK, E_INVALIDARG, E_OUTOFMEMORY, or E_FAIL.
  
## Remarks  
  
To define a mock response, create a new HC_MOCK_CALL_HANDLE with HCMockCallCreate() that represents the mock. Then use HCMockResponseSet*() to set the mock response. By default, the mock response will be returned for all HTTP calls. If you want the mock to only apply to a specific URL, pass in a URL. If you want the mock to only apply to a specific URL & request body, pass in a URL and a body. Once the HC_MOCK_CALL_HANDLE is configured as desired, add the mock to the system by calling HCMockAddMock(). You can set multiple active mock responses by calling HCMockAddMock() multiple times with a set of mock responses. If the HTTP call matches against a set mock responses, they will be executed in order for each subsequent call to HCHttpCallPerformAsync(). When the last matching mock response is hit, the last matching mock response will be repeated on each subsequent call to HCHttpCallPerformAsync().
  
## Requirements  
  
**Header:** mock.h
  
**Library:** libHttpClient.141.GSDK.C.lib
  
## See also  
[mock](../mock_members.md)  
  
  