---
author: joannaleecy
title: XblLocalStorageWriteMode
description: Write mode for a local storage write operation.
kindex: XblLocalStorageWriteMode
ms.author: migreen
ms.topic: reference
security: public
edited: 00/00/0000
quality: good
applies-to: pc-gdk
---

# XblLocalStorageWriteMode  

Write mode for a local storage write operation.    

## Syntax  
  
```cpp
enum class XblLocalStorageWriteMode  : uint32_t  
{  
    Append,  
    Truncate  
}  
```  
  
## Constants  
  
| Constant | Description |
| --- | --- |
| Append | Appends new data to the end of any existing data. |  
| Truncate | Overwrite any existing data. |  
  
## Requirements  
  
**Header:** platform_c.h
  
## See also  
[platform_c](../platform_c_members.md)  
  
  