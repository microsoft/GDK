---
author: joannaleecy
title: XblTitleStorageBlobMetadataResultGetNextAsync
description: Retrieves the next page of XblTitleStorageBlobMetadata objects.
kindex: XblTitleStorageBlobMetadataResultGetNextAsync
ms.author: migreen
ms.topic: reference
security: public
edited: 00/00/0000
applies-to: pc-gdk
quality: good
---

# XblTitleStorageBlobMetadataResultGetNextAsync  

Retrieves the next page of XblTitleStorageBlobMetadata objects.  

## Syntax  
  
```cpp
HRESULT XblTitleStorageBlobMetadataResultGetNextAsync(  
         XblTitleStorageBlobMetadataResultHandle resultHandle,  
         uint32_t maxItems,  
         XAsyncBlock* async  
)  
```  
  
### Parameters  
  
*resultHandle* &nbsp;&nbsp;\_In\_  
Type: [XblTitleStorageBlobMetadataResultHandle](../handles/xbltitlestorageblobmetadataresulthandle.md)  
  
Title storage blob metadata result handle.  
  
*maxItems* &nbsp;&nbsp;\_In\_  
Type: uint32_t  
  
The maximum number of items the result can contain. Pass 0 to attempt to retrieve all items.  
  
*async* &nbsp;&nbsp;\_In\_  
Type: XAsyncBlock*  
  
Caller allocated AsyncBlock.  
  
  
### Return value  
Type: HRESULT
  
HRESULT return code for this API operation.
  
## Remarks  
  
To get the result, call [XblTitleStorageBlobMetadataResultGetNextResult](xbltitlestorageblobmetadataresultgetnextresult.md) inside the AsyncBlock callback or after the AsyncBlock is complete.
  
## Requirements  
  
**Header:** title_storage_c.h
  
**Library:** Microsoft.Xbox.Services.141.GSDK.C.lib
  
## See also  
[title_storage_c](../title_storage_c_members.md)  
  
  