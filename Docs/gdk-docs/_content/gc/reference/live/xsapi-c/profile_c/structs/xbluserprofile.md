---
author: joannaleecy
title: XblUserProfile
description: Represents a user's Xbox Live profile.
kindex: XblUserProfile
ms.author: migreen
ms.topic: reference
security: public
edited: 00/00/0000
quality: good
applies-to: pc-gdk
---

# XblUserProfile  

Represents a user's Xbox Live profile.  

## Syntax  
  
```cpp
typedef struct XblUserProfile {  
    uint64_t xboxUserId;  
    char appDisplayName[XBL_DISPLAY_NAME_CHAR_SIZE];  
    char appDisplayPictureResizeUri[XBL_DISPLAY_PIC_URL_RAW_CHAR_SIZE];  
    char gameDisplayName[XBL_DISPLAY_NAME_CHAR_SIZE];  
    char gameDisplayPictureResizeUri[XBL_DISPLAY_PIC_URL_RAW_CHAR_SIZE];  
    char gamerscore[XBL_GAMERSCORE_CHAR_SIZE];  
    char gamertag[XBL_GAMERTAG_CHAR_SIZE];  
    char modernGamertag[XBL_MODERN_GAMERTAG_CHAR_SIZE];  
    char modernGamertagSuffix[XBL_MODERN_GAMERTAG_SUFFIX_CHAR_SIZE];  
    char uniqueModernGamertag[XBL_UNIQUE_MODERN_GAMERTAG_CHAR_SIZE];  
} XblUserProfile  
```
  
### Members  
  
*xboxUserId*  
Type: uint64_t  
  
The user's Xbox user ID.
  
*appDisplayName*  
Type: char[XBL_DISPLAY_NAME_CHAR_SIZE]  
  
The UTF-8 encoded user's display name to be used in application UI. This value is privacy gated and could be a user's real name or their Gamertag.
  
*appDisplayPictureResizeUri*  
Type: char[XBL_DISPLAY_PIC_URL_RAW_CHAR_SIZE]  
  
UTF-8 encoded Uri for the user's display picture to be used in application UI. The Uri is a resizable Uri. It can be used to specify one of the following sizes and formats by appending '&amp;format={format}&amp;w={width}&amp;h={height}:<br /> Format: png<br /> Width Height<br /> 64 64<br /> 208 208<br /> 424 424<br />
  
*gameDisplayName*  
Type: char[XBL_DISPLAY_NAME_CHAR_SIZE]  
  
The UTF-8 encoded user's display name to be used in game UI. This value is privacy gated and could be a user's real name or their Gamertag.
  
*gameDisplayPictureResizeUri*  
Type: char[XBL_DISPLAY_PIC_URL_RAW_CHAR_SIZE]  
  
UTF-8 encoded Uri for the user's display picture to be used in games. The Uri is a resizable Uri. It can be used to specify one of the following sizes and formats by appending '&amp;format={format}&amp;w={width}&amp;h={height}:<br /> Format: png<br /> Width Height<br /> 64 64<br /> 208 208<br /> 424 424<br />
  
*gamerscore*  
Type: char[XBL_GAMERSCORE_CHAR_SIZE]  
  
The UTF-8 encoded user's Gamerscore.
  
*gamertag*  
Type: char[XBL_GAMERTAG_CHAR_SIZE]  
  
The UTF-8 encoded user's Gamertag.
  
*modernGamertag*  
Type: char[XBL_MODERN_GAMERTAG_CHAR_SIZE]  
  
The UTF-8 encoded modern gamertag for the user. Not guaranteed to be unique.
  
*modernGamertagSuffix*  
Type: char[XBL_MODERN_GAMERTAG_SUFFIX_CHAR_SIZE]  
  
The UTF-8 encoded suffix appended to modern gamertag to ensure uniqueness. May be empty in some cases.
  
*uniqueModernGamertag*  
Type: char[XBL_UNIQUE_MODERN_GAMERTAG_CHAR_SIZE]  
  
The UTF-8 encoded unique modern gamertag and suffix. Format will be "modernGamertag#suffix". Guaranteed to be no more than 16 rendered characters.
  
## Argument of
  
[XblProfileGetUserProfileResult](../functions/xblprofilegetuserprofileresult.md)  
[XblProfileGetUserProfilesResult](../functions/xblprofilegetuserprofilesresult.md)  
[XblProfileGetUserProfilesForSocialGroupResult](../functions/xblprofilegetuserprofilesforsocialgroupresult.md)
  
## Requirements  
  
**Header:** profile_c.h
  
## See also  
[profile_c](../profile_c_members.md)  
  
  