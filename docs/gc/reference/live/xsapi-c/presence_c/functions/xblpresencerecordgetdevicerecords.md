---
author: joannaleecy
title: XblPresenceRecordGetDeviceRecords
description: Get the device presence records associated with a returned presence record.
kindex: XblPresenceRecordGetDeviceRecords
ms.author: migreen
ms.topic: reference
security: public
edited: 00/00/0000
applies-to: pc-gdk
---

# XblPresenceRecordGetDeviceRecords  

Get the device presence records associated with a returned presence record.  

## Syntax  
  
```cpp
HRESULT XblPresenceRecordGetDeviceRecords(  
         XblPresenceRecordHandle handle,  
         const XblPresenceDeviceRecord** deviceRecords,  
         size_t* deviceRecordsCount  
)  
```  
  
### Parameters  
  
*handle* &nbsp;&nbsp;\_In\_  
Type: [XblPresenceRecordHandle](../handles/xblpresencerecordhandle.md)  
  
Handle for the presence record returned from a GetPresence API.  
  
*deviceRecords* &nbsp;&nbsp;\_Out\_  
Type: [XblPresenceDeviceRecord**](../structs/xblpresencedevicerecord.md)  
  
Passes back a pointer to an array of device presence records. The memory for the returned pointer array remains valid for the life of the XblPresenceRecordHandle object until it is closed.  
  
*deviceRecordsCount* &nbsp;&nbsp;\_Out\_  
Type: size_t*  
  
Passes back the size of the returned array.  
  
  
### Return value  
Type: HRESULT
  
HRESULT return code for this API operation.
  
## Requirements  
  
**Header:** presence_c.h
  
**Library:** Microsoft.Xbox.Services.141.GSDK.C.lib
  
## See also  
[presence_c](../presence_c_members.md)  
  
  