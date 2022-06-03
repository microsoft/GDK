---
author: joannaleecy
title: XblPresenceBroadcastRecord
description: The broadcast information of what the user is broadcasting.
kindex: XblPresenceBroadcastRecord
ms.author: migreen
ms.topic: reference
security: public
edited: 00/00/0000
quality: good
applies-to: pc-gdk
---

# XblPresenceBroadcastRecord  

The broadcast information of what the user is broadcasting.  

## Syntax  
  
```cpp
typedef struct XblPresenceBroadcastRecord {  
    const char* broadcastId;  
    char session[XBL_GUID_LENGTH];  
    XblPresenceBroadcastProvider provider;  
    uint32_t viewerCount;  
    time_t startTime;  
} XblPresenceBroadcastRecord  
```
  
### Members  
  
*broadcastId*  
Type: const char*  
  
Id for this broadcast as defined by the broadcasting service.
  
*session*  
Type: char[XBL_GUID_LENGTH]  
  
The GUID uniquely identifying the broadcasting session.
  
*provider*  
Type: [XblPresenceBroadcastProvider](../enums/xblpresencebroadcastprovider.md)  
  
The streaming provider.
  
*viewerCount*  
Type: uint32_t  
  
Approximate number of current viewers.
  
*startTime*  
Type: time_t  
  
Time the broadcast was started.
  
## Member of
  
[XblPresenceTitleRecord](xblpresencetitlerecord.md)
  
## Requirements  
  
**Header:** presence_c.h
  
## See also  
[presence_c](../presence_c_members.md)  
  
  