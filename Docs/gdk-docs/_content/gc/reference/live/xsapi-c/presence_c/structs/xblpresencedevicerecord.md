---
author: joannaleecy
title: XblPresenceDeviceRecord
description: Defines values representing the xbl presence device record.
kindex: XblPresenceDeviceRecord
ms.author: migreen
ms.topic: reference
security: public
edited: 00/00/0000
quality: good
applies-to: pc-gdk
---

# XblPresenceDeviceRecord  

Defines values representing the xbl presence device record.  

## Syntax  
  
```cpp
typedef struct XblPresenceDeviceRecord {  
    XblPresenceDeviceType deviceType;  
    const struct XblPresenceTitleRecord* titleRecords;  
    size_t titleRecordsCount;  
} XblPresenceDeviceRecord  
```
  
### Members  
  
*deviceType*  
Type: [XblPresenceDeviceType](../enums/xblpresencedevicetype.md)  
  
The device type associated with this record.
  
*titleRecords*  
Type: const XblPresenceTitleRecord*  
  
The records containing title presence data.
  
*titleRecordsCount*  
Type: size_t  
  
The number of title records in the titleRecords array.
  
## Argument of
  
[XblPresenceRecordGetDeviceRecords](../functions/xblpresencerecordgetdevicerecords.md)
  
## Requirements  
  
**Header:** presence_c.h
  
## See also  
[presence_c](../presence_c_members.md)  
  
  