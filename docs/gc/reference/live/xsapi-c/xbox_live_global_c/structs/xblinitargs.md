---
author: joannaleecy
title: XblInitArgs
description: Defines values representing the Xbox Live initialization arguments.
kindex: XblInitArgs
ms.author: migreen
ms.topic: reference
edited: 00/00/0000
security: public
applies-to: pc-gdk
quality: good
---

# XblInitArgs  

Defines values representing the Xbox Live initialization arguments.  

## Syntax  
  
```cpp
typedef struct XblInitArgs {  
    XTaskQueueHandle queue;  
    const char* scid;
} XblInitArgs  
```
  
### Members  
  
*queue*  
Type: XTaskQueueHandle  
  
Queue used for XSAPI internal asynchronous work (telemetry, rta, etc.). This field if optional - if not provided, a threadpool based queue will be used.
  
*scid*  
Type: const char*  
  
The service configuration Id for the app.
  
## Requirements  
  
**Header:** xbox_live_global_c.h
  
## See also  
[xbox_live_global_c](../xbox_live_global_c_members.md)  

  
  