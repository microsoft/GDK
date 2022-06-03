---
author: joannaleecy
title: XblPresenceTitleRecord
description: Defines values representing the xbl presence title record.
kindex: XblPresenceTitleRecord
ms.author: migreen
ms.topic: reference
security: public
edited: 00/00/0000
quality: good
applies-to: pc-gdk
---

# XblPresenceTitleRecord  

Defines values representing the xbl presence title record.  

## Syntax  
  
```cpp
typedef struct XblPresenceTitleRecord {  
    uint32_t titleId;  
    const char* titleName;  
    time_t lastModified;  
    bool titleActive;  
    const char* richPresenceString;  
    XblPresenceTitleViewState viewState;  
    struct XblPresenceBroadcastRecord* broadcastRecord;  
} XblPresenceTitleRecord  
```
  
### Members  
  
*titleId*  
Type: uint32_t  
  
The title ID.
  
*titleName*  
Type: const char*  
  
The title name.
  
*lastModified*  
Type: time_t  
  
Time when the record was last updated.
  
*titleActive*  
Type: bool  
  
The active state for the title.
  
*richPresenceString*  
Type: const char*  
  
The formatted and localized presence string.
  
*viewState*  
Type: [XblPresenceTitleViewState](../enums/xblpresencetitleviewstate.md)  
  
The title view state.
  
*broadcastRecord*  
Type: XblPresenceBroadcastRecord*  
  
The broadcast information of what the user is broadcasting.
  
## Member of
  
[XblPresenceDeviceRecord](xblpresencedevicerecord.md)
  
## Requirements  
  
**Header:** presence_c.h
  
## See also  
[presence_c](../presence_c_members.md)  
  
  