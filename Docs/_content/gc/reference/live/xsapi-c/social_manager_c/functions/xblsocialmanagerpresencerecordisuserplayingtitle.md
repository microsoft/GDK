---
author: joannaleecy
title: XblSocialManagerPresenceRecordIsUserPlayingTitle
description: Query whether the user associated with the provided presence record is playing a given title id.
kindex: XblSocialManagerPresenceRecordIsUserPlayingTitle
ms.author: migreen
ms.topic: reference
security: public
edited: 00/00/0000
applies-to: pc-gdk
quality: good
---

# XblSocialManagerPresenceRecordIsUserPlayingTitle  

Query whether the user associated with the provided presence record is playing a given title id.  

## Syntax  
  
```cpp
bool XblSocialManagerPresenceRecordIsUserPlayingTitle(  
         const XblSocialManagerPresenceRecord* presenceRecord,  
         uint32_t titleId  
)  
```  
  
### Parameters  
  
*presenceRecord* &nbsp;&nbsp;\_In\_  
Type: [XblSocialManagerPresenceRecord*](../structs/xblsocialmanagerpresencerecord.md)  
  
A presence record returned from another social manager API.  
  
*titleId* &nbsp;&nbsp;\_In\_  
Type: uint32_t  
  
Title ID to query about.  
  
  
### Return value  
Type: bool
  
True if the user is playing the title and false otherwise.
  
## Requirements  
  
**Header:** social_manager_c.h
  
**Library:** Microsoft.Xbox.Services.141.GSDK.C.lib
  
## See also  
[social_manager_c](../social_manager_c_members.md)  
  
  