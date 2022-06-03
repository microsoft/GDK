---
author: joannaleecy
title: XblSocialManagerPresenceRecord
description: Social manager presence record. Shows information on users current presence status and stores title records.
kindex: XblSocialManagerPresenceRecord
ms.author: migreen
ms.topic: reference
security: public
edited: 00/00/0000
quality: good
applies-to: pc-gdk
---

# XblSocialManagerPresenceRecord  

Social manager presence record. Shows information on users current presence status and stores title records.  

## Syntax  
  
```cpp
typedef struct XblSocialManagerPresenceRecord {  
    XblPresenceUserState userState;  
    XblSocialManagerPresenceTitleRecord presenceTitleRecords[XBL_NUM_PRESENCE_RECORDS];  
    uint32_t presenceTitleRecordCount;  
} XblSocialManagerPresenceRecord  
```
  
### Members  
  
*userState*  
Type: [XblPresenceUserState](../../presence_c/enums/xblpresenceuserstate.md)  
  
The user's presence state.
  
*presenceTitleRecords*  
Type: [XblSocialManagerPresenceTitleRecord](xblsocialmanagerpresencetitlerecord.md)[XBL_NUM_PRESENCE_RECORDS]  
  
Collection of presence title record objects returned by a request.
  
*presenceTitleRecordCount*  
Type: uint32_t  
  
Number of valid presence records in presenceTitleRecords array.
  
## Member of
  
[XblSocialManagerUser](xblsocialmanageruser.md)
  
## Argument of
  
[XblSocialManagerPresenceRecordIsUserPlayingTitle](../functions/xblsocialmanagerpresencerecordisuserplayingtitle.md)
  
## Requirements  
  
**Header:** social_manager_c.h
  
## See also  
[social_manager_c](../social_manager_c_members.md)  
  
  