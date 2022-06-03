---
author: joannaleecy
title: XblPresenceQueryFilters
description: Struct passed to presence APIs to filter the presence records returned.
kindex: XblPresenceQueryFilters
ms.author: migreen
ms.topic: reference
security: public
edited: 00/00/0000
quality: good
applies-to: pc-gdk
---

# XblPresenceQueryFilters  

Struct passed to presence APIs to filter the presence records returned.  

## Syntax  
  
```cpp
typedef struct XblPresenceQueryFilters {  
    const XblPresenceDeviceType* deviceTypes;  
    size_t deviceTypesCount;  
    const uint32_t* titleIds;  
    size_t titleIdsCount;  
    XblPresenceDetailLevel detailLevel;  
    bool onlineOnly;  
    bool broadcastingOnly;  
} XblPresenceQueryFilters  
```
  
### Members  
  
*deviceTypes*  
Type: const [XblPresenceDeviceType*](../enums/xblpresencedevicetype.md)  
  
Array of device types. If this field is null, defaults to all possible deviceTypes.
  
*deviceTypesCount*  
Type: size_t  
  
Size of the deviceTypes array.
  
*titleIds*  
Type: const uint32_t*  
  
List of titleIds for filtering the result. If the input is an empty vector, defaults to all possible titles.
  
*titleIdsCount*  
Type: size_t  
  
Size of the titleIds array.
  
*detailLevel*  
Type: [XblPresenceDetailLevel](../enums/xblpresencedetaillevel.md)  
  
Detail level of the result. Defaults to XblPresenceDetailLevel::Title which get basic title level information. To get rich presence info, set to XblPresenceDetailLevel::All
  
*onlineOnly*  
Type: bool  
  
If true, API will filter out records for users that are offline.
  
*broadcastingOnly*  
Type: bool  
  
If true, API will filter out records for users that are not broadcasting.
  
## Remarks  
  
If the filters are not provided, defaults will be used:<br /> - Returns records for all possible titles on all devices.<br /> - Defaults to XblPresenceDetailLevel::Default which is equivalent to XblPresenceDetailLevel::Title (get basic title level information).<br /> - Does not filter out users who are offline or broadcasting.<br />
  
## Argument of
  
[XblPresenceGetPresenceForMultipleUsersAsync](../functions/xblpresencegetpresenceformultipleusersasync.md)  
[XblPresenceGetPresenceForSocialGroupAsync](../functions/xblpresencegetpresenceforsocialgroupasync.md)
  
## Requirements  
  
**Header:** presence_c.h
  
## See also  
[presence_c](../presence_c_members.md)  
  
  