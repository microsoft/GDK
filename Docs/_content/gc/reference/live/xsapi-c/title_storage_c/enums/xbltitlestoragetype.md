---
author: joannaleecy
title: XblTitleStorageType
description: Defines values used to indicate title storage type.
kindex: XblTitleStorageType
ms.author: migreen
ms.topic: reference
security: public
edited: 00/00/0000
quality: good
applies-to: pc-gdk
---

# XblTitleStorageType  

Defines values used to indicate title storage type.    

## Syntax  
  
```cpp
enum class XblTitleStorageType  : uint32_t  
{  
    TrustedPlatformStorage,  
    GlobalStorage,  
    Universal  
}  
```  
  
## Constants  
  
| Constant | Description |
| --- | --- |
| TrustedPlatformStorage | Per-user data storage such as game state or game settings that can be only be accessed by Xbox consoles. User restrictions can be configured to public or owner only in the service configuration. |  
| GlobalStorage | Global data storage. This storage type is only writable via title configuration sites or Xbox Live developer tools. Any platform may read from this storage type. Data could be rosters, maps, challenges, art resources, etc. |  
| Universal | Per-user data storage such as game state or game settings that can be accessed by Xbox consoles, Windows 10, and mobile devices. User restrictions can be configured to public or owner only in the service configuration. |  
  
## Requirements  
  
**Header:** title_storage_c.h
  
## See also  
[title_storage_c](../title_storage_c_members.md)  
  
  