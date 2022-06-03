---
author: joannaleecy
title: XblEventsSetStorageAllotment
description: Set the maximum amount of disk space that Xsapi can use to store the events pending retry and upload before it starts deleting the oldest files.
kindex: XblEventsSetStorageAllotment
ms.author: migreen
ms.topic: reference
security: public
edited: 00/00/0000
applies-to: pc-gdk
quality: good
---

# XblEventsSetStorageAllotment  

Set the maximum amount of disk space that Xsapi can use to store the events pending retry and upload before it starts deleting the oldest files.  

## Syntax  
  
```cpp
HRESULT XblEventsSetStorageAllotment(  
         uint64_t storageAllotmentInBytes  
)  
```  
  
### Parameters  
  
*storageAllotmentInBytes* &nbsp;&nbsp;  
Type: uint64_t  
  
Maximum storage space (in bytes) that will be used to store pending events.  
  
  
### Return value  
Type: HRESULT
  
HRESULT return code for this API operation.
  
## Remarks  
  
When the maximum storage space is exceeded, the oldest file will be silently deleted. Note that this is a global setting and will apply to all Xbox Live contexts. The default value is approximately 20MB.
  
## Requirements  
  
**Header:** events_c.h
  
**Library:** Microsoft.Xbox.Services.141.GSDK.C.lib
  
## See also  
[events_c](../events_c_members.md)  
  
  