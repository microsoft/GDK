---
author: joannaleecy
title: XblUserStatisticsGetMultipleUserStatisticsForMultipleServiceConfigurationsResult
description: Get the result for an XblUserStatisticsGetMultipleUserStatisticsAsync call.
kindex: XblUserStatisticsGetMultipleUserStatisticsForMultipleServiceConfigurationsResult
ms.author: migreen
ms.topic: reference
security: public
edited: 00/00/0000
applies-to: pc-gdk
quality: good
---

# XblUserStatisticsGetMultipleUserStatisticsForMultipleServiceConfigurationsResult  

Get the result for an XblUserStatisticsGetMultipleUserStatisticsAsync call.  

## Syntax  
  
```cpp
HRESULT XblUserStatisticsGetMultipleUserStatisticsForMultipleServiceConfigurationsResult(  
         XAsyncBlock* async,  
         size_t bufferSize,  
         void* buffer,  
         XblUserStatisticsResult** ptrToBufferResults,  
         size_t* resultsCount,  
         size_t* bufferUsed  
)  
```  
  
### Parameters  
  
*async* &nbsp;&nbsp;\_In\_  
Type: XAsyncBlock*  
  
The AsyncBlock for this operation.  
  
*bufferSize* &nbsp;&nbsp;\_In\_  
Type: size_t  
  
The size of the provided buffer. Use [XblUserStatisticsGetMultipleUserStatisticsForMultipleServiceConfigurationsResultSize](xbluserstatisticsgetmultipleuserstatisticsformultipleserviceconfigurationsresultsize.md) to get the size required.  
  
*buffer* &nbsp;&nbsp;\_Out\_writes\_bytes\_to\_(bufferSize,*bufferUsed)  
Type: void*  
  
A caller allocated byte buffer that passes back the multiple user statistics.  
  
*ptrToBufferResults* &nbsp;&nbsp;\_Outptr\_  
Type: [XblUserStatisticsResult**](../structs/xbluserstatisticsresult.md)  
  
Passes back a strongly typed array of XblUserStatisticsResult that points into buffer. Do not free this as its lifecycle is tied to buffer.  
  
*resultsCount* &nbsp;&nbsp;\_Out\_  
Type: size_t*  
  
Passes back the number of results.  
  
*bufferUsed* &nbsp;&nbsp;\_Out\_opt\_  
Type: size_t*  
  
Passes back the number of bytes written to the buffer.  
  
  
### Return value  
Type: HRESULT
  
HRESULT return code for this API operation.
  
## Requirements  
  
**Header:** user_statistics_c.h
  
**Library:** Microsoft.Xbox.Services.141.GSDK.C.lib
  
## See also  
[user_statistics_c](../user_statistics_c_members.md)  
  
  