---
author: joannaleecy
title: XblPresenceRecordGetUserState
description: Get the global presence state for a presence record.
kindex: XblPresenceRecordGetUserState
ms.author: migreen
ms.topic: reference
security: public
edited: 00/00/0000
applies-to: pc-gdk
---

# XblPresenceRecordGetUserState  

Get the global presence state for a presence record.  

## Syntax  
  
```cpp
HRESULT XblPresenceRecordGetUserState(  
         XblPresenceRecordHandle handle,  
         XblPresenceUserState* userState  
)  
```  
  
### Parameters  
  
*handle* &nbsp;&nbsp;\_In\_  
Type: [XblPresenceRecordHandle](../handles/xblpresencerecordhandle.md)  
  
Handle for the presence record returned from a GetPresence API.  
  
*userState* &nbsp;&nbsp;\_Out\_  
Type: [XblPresenceUserState*](../enums/xblpresenceuserstate.md)  
  
A caller allocated struct that passes back the presence state of the record.  
  
  
### Return value  
Type: HRESULT
  
HRESULT return code for this API operation.
  
## Requirements  
  
**Header:** presence_c.h
  
**Library:** Microsoft.Xbox.Services.141.GSDK.C.lib
  
## See also  
[presence_c](../presence_c_members.md)  
  
  