---
author: joannaleecy
title: XblPresenceRecordGetXuid
description: Get the Xuid for the user a presence record is associated with.
kindex: XblPresenceRecordGetXuid
ms.author: migreen
ms.topic: reference
security: public
edited: 00/00/0000
applies-to: pc-gdk
---

# XblPresenceRecordGetXuid  

Get the Xuid for the user a presence record is associated with.  

## Syntax  
  
```cpp
HRESULT XblPresenceRecordGetXuid(  
         XblPresenceRecordHandle handle,  
         uint64_t* xuid  
)  
```  
  
### Parameters  
  
*handle* &nbsp;&nbsp;\_In\_  
Type: [XblPresenceRecordHandle](../handles/xblpresencerecordhandle.md)  
  
Handle for the presence record returned from a GetPresence API.  
  
*xuid* &nbsp;&nbsp;\_Out\_  
Type: uint64_t*  
  
Passes back the Xuid the record is associated with.  
  
  
### Return value  
Type: HRESULT
  
HRESULT return code for this API operation.
  
## Requirements  
  
**Header:** presence_c.h
  
**Library:** Microsoft.Xbox.Services.141.GSDK.C.lib
  
## See also  
[presence_c](../presence_c_members.md)  
  
  