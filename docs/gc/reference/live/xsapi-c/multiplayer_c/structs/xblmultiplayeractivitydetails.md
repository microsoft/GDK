---
author: joannaleecy
title: XblMultiplayerActivityDetails
description: Represents a users current multiplayer activity, along with some details about the corresponding session.
kindex: XblMultiplayerActivityDetails
ms.author: migreen
ms.topic: reference
security: public
edited: 00/00/0000
quality: good
applies-to: pc-gdk
---

# XblMultiplayerActivityDetails  

Represents a users current multiplayer activity, along with some details about the corresponding session.  

## Syntax  
  
```cpp
typedef struct XblMultiplayerActivityDetails {  
    XblMultiplayerSessionReference SessionReference;  
    char HandleId[XBL_GUID_LENGTH];  
    uint32_t TitleId;  
    XblMultiplayerSessionVisibility Visibility;  
    XblMultiplayerSessionRestriction JoinRestriction;  
    bool Closed;  
    uint64_t OwnerXuid;  
    uint32_t MaxMembersCount;  
    uint32_t MembersCount;  
    const char* CustomSessionPropertiesJson;  
} XblMultiplayerActivityDetails  
```
  
### Members  
  
*SessionReference*  
Type: [XblMultiplayerSessionReference](xblmultiplayersessionreference.md)  
  
Session reference containing identifying information for the session.
  
*HandleId*  
Type: char[XBL_GUID_LENGTH]  
  
HandleId corresponding to this activity.
  
*TitleId*  
Type: uint32_t  
  
TitleId that should be launched in order to join this activity.
  
*Visibility*  
Type: [XblMultiplayerSessionVisibility](../enums/xblmultiplayersessionvisibility.md)  
  
The visibility state of the session. Whether other users can see, or join, etc.
  
*JoinRestriction*  
Type: [XblMultiplayerSessionRestriction](../enums/xblmultiplayersessionrestriction.md)  
  
The join restriction of the session, which applies if visibility is "open".
  
*Closed*  
Type: bool  
  
Indicates whether the session is temporarily closed for joining.
  
*OwnerXuid*  
Type: uint64_t  
  
Xbox User ID of the member whose activity this is.
  
*MaxMembersCount*  
Type: uint32_t  
  
Number of total slots.
  
*MembersCount*  
Type: uint32_t  
  
Number of slots occupied.
  
*CustomSessionPropertiesJson*  
Type: const char*  
  
String containing custom session properties JSON blob.
  
## Requirements  
  
**Header:** multiplayer_c.h
  
## See also  
[multiplayer_c](../multiplayer_c_members.md)  
  
  