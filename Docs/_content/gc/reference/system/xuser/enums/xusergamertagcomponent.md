---
author: M-Stahl
title: XUserGamertagComponent
description: Specifies the type (or component) of gamertag to fetch.
kindex: XUserGamertagComponent
ms.author: jgup
ms.topic: reference
edited: 00/00/0000
quality: good
security: public
applies-to: pc-gdk
---

# XUserGamertagComponent  

Specifies the type (or component) of gamertag to fetch.  

## Syntax  
  
```cpp
enum class XUserGamertagComponent  : uint32_t  
{  
    Classic = 0,  
    Modern = 1,  
    ModernSuffix = 2,  
    UniqueModern = 3,  
}  
```  
  
## Constants  
  
| Constant | Description |
| --- | --- |
| Classic | The classic gamertag.  |  
| Modern | Modern gamertag without a suffix.  |  
| ModernSuffix | Modern gamertag suffix if present (otherwise empty). |  
| UniqueModern | Modern gamertag with the suffix so as to guarantee uniqueness.  |  
  
## Remarks  

The length limit and buffer size for each gamertag component are as follows.

* **Classic gamertag** (`XUserGamertagComponent::Classic`)

    * Maximum length of 15 characters, plus a null terminator. Classic gamertags have always been limited to 15 characters.

    * Maximum size of buffer is 16 bytes, including the space for the null terminator; (15 US-ASCII characters) + (1-byte null terminator) = 16 bytes.

* **Modern gamertag** (`XUserGamertagComponent::Modern`)

    * Maximum length of 12 characters, with each character limited to having at most 1 diacritic, plus a null terminator.

    * If no modern gamertag is set by the user, this is identical to `XUserGamertagComponent::Classic`.

    * Maximum size of buffer is 97 bytes, including space for the null terminator; (12 characters + 12 diacritics) * (4 bytes/character) + (1-byte null terminator) = 97 bytes.

* **Suffix** (`XUserGamertagComponent::ModernSuffix`)

    * Maximum length of 14 characters (with no diacritics), plus a null terminator.

    * Classic gamertags have no suffix (just the null terminator).

    * Maximum size of buffer is 15 bytes, including space for the null terminator; (14 numeric ASCII characters) + (1-byte null terminator) = 15 bytes.

    * For modern gamertags that are 11 characters or fewer, 4-digit suffixes are normally assigned.
      If that 4-digit space fills up, the number of characters increases, up to the maximum number of characters possible to still fit within the 16-character total length limit for the unique modern gamertag.

* **Unique modern gamertag** (`XUserGamertagComponent::UniqueModern`)

    * Contains either the modern gamertag + '#' + modern suffix, or the classic gamertag with no '#' and no suffix.

    * Maximum length of 16 characters, plus a null terminator.

    * Maximum size of buffer is 101 bytes, including space for the null terminator; (12 characters + 12 diacritics) * (4 bytes/char) + '#' (1 byte) + (3 numeric US-ASCII chars) + null terminator (1 byte) = 101 bytes.

    * The 16-character limit for a unique modern gamertag means that a modern gamertag which has 12 characters is limited to a 3-digit suffix, which totals 16 rendered characters because of the '#' character.

    * As the number of characters in the modern gamertag decreases, the number of suffix characters can increase, but the total maximum byte count for the unique modern gamertag will never exceed this.

  
## Requirements  
  
**Header:** XUser.h
  
**Supported platforms:** Windows, Xbox One family consoles and Xbox Series consoles  
  
## See also

[XUser](../xuser_members.md)
  
[XUserGetGamertag](../functions/xusergetgamertag.md)

[Modern gamertags](../../../../live/features/identity/user-profile/gamertags/live-modern-gamertags-toc.md)