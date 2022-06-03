---
author: joannaleecy
title: XblPresenceRichPresenceIds
description: Ids needed to set Rich Presence.
kindex: XblPresenceRichPresenceIds
ms.author: migreen
ms.topic: reference
security: public
edited: 00/00/0000
quality: good
applies-to: pc-gdk
---

# XblPresenceRichPresenceIds  

Ids needed to set Rich Presence.  

## Syntax  
  
```cpp
typedef struct XblPresenceRichPresenceIds {  
    char scid[XBL_SCID_LENGTH];  
    const char* presenceId;  
    const char** presenceTokenIds;  
    size_t presenceTokenIdsCount;  
} XblPresenceRichPresenceIds  
```
  
### Members  
  
*scid*  
Type: char[XBL_SCID_LENGTH]  
  
ID of the service configuration containing the presence strings.
  
*presenceId*  
Type: const char*  
  
The ID of a presence string that is defined in the service configuration. For example, PresenceId = "1" could equal "Playing {0} on {1}" in the service configuration. The service configuration might map token 0 to Maps and token 1 to MapId.
  
*presenceTokenIds*  
Type: const char**  
  
The IDs of the strings to replace the format string tokens found in the presence string. These strings are also defined in the service configuration. The ID values in the collection map to the strings associated with the token arguments found in the PresenceId. For example let's say this vector view contained the values "4" and "1" and PresenceId = "1" equals "Playing {0} on {1}" in the service configuration. The service configuration might map Token 0 = Maps, where MapId = "4" equals "Hometown". The service configuration might map Token 1 = Difficulty, where DifficultyId = "1" equals "Casual".
  
*presenceTokenIdsCount*  
Type: size_t  
  
The number of Ids in the presenceTokenIds array.
  
## Argument of
  
[XblPresenceSetPresenceAsync](../functions/xblpresencesetpresenceasync.md)
  
## Requirements  
  
**Header:** presence_c.h
  
## See also  
[presence_c](../presence_c_members.md)  
  
  