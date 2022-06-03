---
author: joannaleecy
title: XblErrorCondition
description: Enumeration values that define the Xbox Live API error conditions.
kindex: XblErrorCondition
ms.author: migreen
ms.topic: reference
security: public
edited: 00/00/0000
quality: good
applies-to: pc-gdk
---

# XblErrorCondition  

Enumeration values that define the Xbox Live API error conditions.    

## Syntax  
  
```cpp
enum class XblErrorCondition  : uint32_t  
{  
    NoError = 0,  
    GenericError,  
    GenericOutOfRange,  
    Auth,  
    Network,  
    HttpGeneric,  
    Http304NotModified,  
    Http404NotFound,  
    Http412PreconditionFailed,  
    Http429TooManyRequests,  
    HttpServiceTimeout,  
    Rta  
}  
```  
  
## Constants  
  
| Constant | Description |
| --- | --- |
| NoError | No error. |  
| GenericError | A generic error condition. |  
| GenericOutOfRange | An error condition related to an object being out of range. |  
| Auth | An error condition related to attempting to authenticate. |  
| Network | An error condition related to network connectivity. |  
| HttpGeneric | An error condition related to an HTTP method call. |  
| Http304NotModified | The requested resource was not modified. |  
| Http404NotFound | The requested resource was not found. |  
| Http412PreconditionFailed | The precondition given in one or more of the request-header fields evaluated to false when it was tested on the server. |  
| Http429TooManyRequests | Client is sending too many requests |  
| HttpServiceTimeout | The service timed out while attempting to process the request. |  
| Rta | An error related to real time activity. |  
  
## Remarks  
  
A best practice is to test the returned HRESULT against these error conditions using [XblGetErrorCondition](../functions/xblgeterrorcondition.md).
  
## Requirements  
  
**Header:** errors_c.h
  
## See also  
[errors_c](../errors_c_members.md)  
  
  