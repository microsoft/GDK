---
author: joannaleecy
title: XblEventsSetMaxFileSize
description: Set the maximum file size for pending events files.
kindex: XblEventsSetMaxFileSize
ms.author: migreen
ms.topic: reference
security: public
edited: 00/00/0000
applies-to: pc-gdk
quality: good
---

# XblEventsSetMaxFileSize  

Set the maximum file size for pending events files.  

## Syntax  
  
```cpp
HRESULT XblEventsSetMaxFileSize(  
         uint64_t maxFileSizeInByes  
)  
```  
  
### Parameters  
  
*maxFileSizeInByes* &nbsp;&nbsp;  
Type: uint64_t  
  
The maximum size (in bytes) for pending events files.  
  
  
### Return value  
Type: HRESULT
  
HRESULT return code for this API operation.
  
## Remarks  
  
The files will be read into memory all at once. Note that this is a global setting and will apply to all Xbox Live contexts. The default value is 128KB.
  
## Requirements  
  
**Header:** events_c.h
  
**Library:** Microsoft.Xbox.Services.141.GSDK.C.lib
  
## See also  
[events_c](../events_c_members.md)  
  
  