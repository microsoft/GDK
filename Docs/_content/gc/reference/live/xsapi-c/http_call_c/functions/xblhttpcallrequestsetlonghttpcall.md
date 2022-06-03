---
author: joannaleecy
title: XblHttpCallRequestSetLongHttpCall
description: Sets a flag which defines the HTTP call as long or not.
kindex: XblHttpCallRequestSetLongHttpCall
ms.author: migreen
ms.topic: reference
security: public
edited: 00/00/0000
applies-to: pc-gdk
---

# XblHttpCallRequestSetLongHttpCall  

Sets a flag which defines the HTTP call as long or not.  

## Syntax  
  
```cpp
HRESULT XblHttpCallRequestSetLongHttpCall(  
         XblHttpCallHandle call,  
         bool longHttpCall  
)  
```  
  
### Parameters  
  
*call* &nbsp;&nbsp;\_In\_  
Type: [XblHttpCallHandle](../handles/xblhttpcallhandle.md)  
  
The handle of the HTTP call. Pass nullptr to set the default for future calls.  
  
*longHttpCall* &nbsp;&nbsp;\_In\_  
Type: bool  
  
The boolean to set the HTTP call to long or not.  
  
  
### Return value  
Type: HRESULT
  
Result code for this API operation. Possible values are S_OK, or E_FAIL.
  
## Remarks  
  
Defaults to false. This must be called prior to calling [XblHttpCallPerformAsync](xblhttpcallperformasync.md).
  
## Requirements  
  
**Header:** http_call_c.h
  
**Library:** Microsoft.Xbox.Services.141.GSDK.C.lib
  
## See also  
[http_call_c](../http_call_c_members.md)  
  
  