---
author: joannaleecy
title: XblServiceCallRoutedArgs
description: Contains information about a service call.
kindex: XblServiceCallRoutedArgs
ms.author: migreen
ms.topic: reference
security: public
edited: 00/00/0000
applies-to: pc-gdk
quality: good
---

# XblServiceCallRoutedArgs  

Contains information about a service call.  

## Syntax  
  
```cpp
typedef struct XblServiceCallRoutedArgs {  
    HCCallHandle call;  
    uint64_t responseCount;  
    const char* fullResponseFormatted;  
} XblServiceCallRoutedArgs  
```
  
### Members  
  
*call*  
Type: HCCallHandle  
  
Handle for the service call.
  
*responseCount*  
Type: uint64_t  
  
The number of responses in this session.
  
*fullResponseFormatted*  
Type: const char*  
  
Returns the full response log formatted message of all the properties in XblServiceCallRoutedArgs.
  
## Requirements  
  
**Header:** xbox_live_global_c.h
  
## See also  
[xbox_live_global_c](../xbox_live_global_c_members.md)  
  
  