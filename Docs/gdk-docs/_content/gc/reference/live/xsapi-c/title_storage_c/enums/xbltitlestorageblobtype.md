---
author: joannaleecy
title: XblTitleStorageBlobType
description: Defines values used to indicate title storage blob type.
kindex: XblTitleStorageBlobType
ms.author: migreen
ms.topic: reference
security: public
edited: 00/00/0000
quality: good
applies-to: pc-gdk
---

# XblTitleStorageBlobType  

Defines values used to indicate title storage blob type.    

## Syntax  
  
```cpp
enum class XblTitleStorageBlobType  : uint32_t  
{  
    Unknown,  
    Binary,  
    Json,  
    Config  
}  
```  
  
## Constants  
  
| Constant | Description |
| --- | --- |
| Unknown | Unknown blob type. |  
| Binary | Binary blob type. |  
| Json | JSON blob type. |  
| Config | Config blob type. |  
  
## Requirements  
  
**Header:** title_storage_c.h
  
## See also  
[title_storage_c](../title_storage_c_members.md)  
  
  