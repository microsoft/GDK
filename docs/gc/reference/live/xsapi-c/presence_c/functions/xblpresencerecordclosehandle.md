---
author: joannaleecy
title: XblPresenceRecordCloseHandle
description: Closes a XblPresenceRecordHandle.
kindex: XblPresenceRecordCloseHandle
ms.author: migreen
ms.topic: reference
security: public
edited: 00/00/0000
applies-to: pc-gdk
---

# XblPresenceRecordCloseHandle  

Closes a XblPresenceRecordHandle.  

## Syntax  
  
```cpp
void XblPresenceRecordCloseHandle(  
         XblPresenceRecordHandle handle  
)  
```  
  
### Parameters  
  
*handle* &nbsp;&nbsp;\_In\_  
Type: [XblPresenceRecordHandle](../handles/xblpresencerecordhandle.md)  
  
The presence record handle.  
  
  
### Return value  
Type: void
  

  
## Remarks  
  
When all outstanding handles have been closed, XblPresenceRecordCloseHandle will free the memory associated with the presence record handle.
  
## Requirements  
  
**Header:** presence_c.h
  
**Library:** Microsoft.Xbox.Services.141.GSDK.C.lib
  
## See also  
[presence_c](../presence_c_members.md)  
  
  