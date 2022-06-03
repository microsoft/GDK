---
author: joannaleecy
title: XblClientOperationResult
description: Enum defining the results of a client operation.
kindex: XblClientOperationResult
ms.author: migreen
ms.topic: reference
security: public
edited: 00/00/0000
quality: good
applies-to: pc-gdk
---

# XblClientOperationResult  

Enum defining the results of a client operation.    

## Syntax  
  
```cpp
enum class XblClientOperationResult  : uint32_t  
{  
    Success,  
    Failure  
}  
```  
  
## Constants  
  
| Constant | Description |
| --- | --- |
| Success | Client completed the requested operation sucessfully. |  
| Failure | Client was not able to complete the requested operation for any reason. |  
  
## Requirements  
  
**Header:** platform_c.h
  
## See also  
[platform_c](../platform_c_members.md)  
  
  