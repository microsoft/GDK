---
author: joannaleecy
title: XblSocialManagerDoWork
description: Called whenever the title wants to update the social graph and get list of change events.
kindex: XblSocialManagerDoWork
ms.author: migreen
ms.topic: reference
security: public
edited: 00/00/0000
applies-to: pc-gdk
quality: good
---

# XblSocialManagerDoWork  

Called whenever the title wants to update the social graph and get list of change events.  

## Syntax  
  
```cpp
HRESULT XblSocialManagerDoWork(  
         const XblSocialManagerEvent** socialEvents,  
         size_t* socialEventsCount  
)  
```  
  
### Parameters  
  
*socialEvents* &nbsp;&nbsp;\_Outptr\_result\_maybenull\_  
Type: [XblSocialManagerEvent**](../structs/xblsocialmanagerevent.md)  
  
Passes back a pointer to the array of social events that have occurred since the last call to XblSocialManagerDoWork. This array is only valid until the next call to XblSocialManagerDoWork. The internal array will automatically be cleaned up when XblCleanup is called.  
  
*socialEventsCount* &nbsp;&nbsp;\_Out\_  
Type: size_t*  
  
Passes back the number of events in the social events array.  
  
  
### Return value  
Type: HRESULT
  
HRESULT return code for this API operation.
  
## Remarks  
  
Must be called every frame for data to be up to date. The array of social events that is sent back is only valid until the next call to [XblSocialManagerDoWork](xblsocialmanagerdowork.md). Make sure to check if there were social events sent back. If the social events array is null, no results. If the social events count is 0, no results. If there were social events sent back then handle each [XblSocialManagerEvent](../structs/xblsocialmanagerevent.md) by their respective [XblSocialManagerEventType](../enums/xblsocialmanagereventtype.md).
  
## Requirements  
  
**Header:** social_manager_c.h
  
**Library:** Microsoft.Xbox.Services.141.GSDK.C.lib
  
## See also  
[social_manager_c](../social_manager_c_members.md)  
  
  