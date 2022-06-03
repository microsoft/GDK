---
author: joannaleecy
title: XblSocialManagerPresenceTitleRecord
description: Social manager version of the presence title record. Gives information about different titles presence information.
kindex: XblSocialManagerPresenceTitleRecord
ms.author: migreen
ms.topic: reference
security: public
edited: 00/00/0000
quality: good
applies-to: pc-gdk
---

# XblSocialManagerPresenceTitleRecord  

Social manager version of the presence title record. Gives information about different titles presence information.  

## Syntax  
  
```cpp
typedef struct XblSocialManagerPresenceTitleRecord {  
    uint32_t titleId;  
    bool isTitleActive;  
    char presenceText[XBL_RICH_PRESENCE_CHAR_SIZE];  
    bool isBroadcasting;  
    XblPresenceDeviceType deviceType;  
    bool isPrimary;  
} XblSocialManagerPresenceTitleRecord  
```
  
### Members  
  
*titleId*  
Type: uint32_t  
  
The title ID.
  
*isTitleActive*  
Type: bool  
  
The active state for the title.
  
*presenceText*  
Type: char[XBL_RICH_PRESENCE_CHAR_SIZE]  
  
The UTF-8 encoded formatted and localized presence string.
  
*isBroadcasting*  
Type: bool  
  
The active state for the title.
  
*deviceType*  
Type: [XblPresenceDeviceType](../../presence_c/enums/xblpresencedevicetype.md)  
  
Device type.
  
*isPrimary*  
Type: bool  
  
Whether or not this is the primary presence record.
  
## Member of
  
[XblSocialManagerPresenceRecord](xblsocialmanagerpresencerecord.md)
  
## Requirements  
  
**Header:** social_manager_c.h
  
## See also  
[social_manager_c](../social_manager_c_members.md)  
  
  