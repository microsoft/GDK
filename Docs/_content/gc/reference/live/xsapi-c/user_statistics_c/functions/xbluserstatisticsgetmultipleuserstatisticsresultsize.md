---
author: joannaleecy
title: XblUserStatisticsGetMultipleUserStatisticsResultSize
description: Get the result size for an XblUserStatisticsGetMultipleUserStatisticsAsync call.
kindex: XblUserStatisticsGetMultipleUserStatisticsResultSize
ms.author: migreen
ms.topic: reference
security: public
edited: 00/00/0000
applies-to: pc-gdk
quality: good
---

# XblUserStatisticsGetMultipleUserStatisticsResultSize  

Get the result size for an XblUserStatisticsGetMultipleUserStatisticsAsync call.  

## Syntax  
  
```cpp
HRESULT XblUserStatisticsGetMultipleUserStatisticsResultSize(  
         XAsyncBlock* async,  
         size_t* resultSizeInBytes  
)  
```  
  
### Parameters  
  
*async* &nbsp;&nbsp;\_In\_  
Type: XAsyncBlock*  
  
The AsyncBlock for this operation.  
  
*resultSizeInBytes* &nbsp;&nbsp;\_Out\_  
Type: size_t*  
  
Passes back the size in bytes required to store the user statistics result.  
  
  
### Return value  
Type: HRESULT
  
HRESULT return code for this API operation.
  
## Requirements  
  
**Header:** user_statistics_c.h
  
**Library:** Microsoft.Xbox.Services.141.GSDK.C.lib
  
## See also  
[user_statistics_c](../user_statistics_c_members.md)  
  
  