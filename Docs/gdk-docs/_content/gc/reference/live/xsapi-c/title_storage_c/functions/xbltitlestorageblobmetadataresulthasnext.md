---
author: joannaleecy
title: XblTitleStorageBlobMetadataResultHasNext
description: Checks if there are more pages of XblTitleStorageBlobMetadata to retrieve from the service.
kindex: XblTitleStorageBlobMetadataResultHasNext
ms.author: migreen
ms.topic: reference
security: public
edited: 00/00/0000
applies-to: pc-gdk
quality: good
---

# XblTitleStorageBlobMetadataResultHasNext  

Checks if there are more pages of XblTitleStorageBlobMetadata to retrieve from the service.  

## Syntax  
  
```cpp
HRESULT XblTitleStorageBlobMetadataResultHasNext(  
         XblTitleStorageBlobMetadataResultHandle resultHandle,  
         bool* hasNext  
)  
```  
  
### Parameters  
  
*resultHandle* &nbsp;&nbsp;\_In\_  
Type: [XblTitleStorageBlobMetadataResultHandle](../handles/xbltitlestorageblobmetadataresulthandle.md)  
  
Title storage blob metadata result handle.  
  
*hasNext* &nbsp;&nbsp;\_Out\_  
Type: bool*  
  
Passes back true if there are more results to retrieve, false otherwise.  
  
  
### Return value  
Type: HRESULT
  
HRESULT return code for this API operation.
  
## Remarks  
  
To retrieve the next page of items, call [XblTitleStorageBlobMetadataResultGetNextAsync](xbltitlestorageblobmetadataresultgetnextasync.md).
  
## Requirements  
  
**Header:** title_storage_c.h
  
**Library:** Microsoft.Xbox.Services.141.GSDK.C.lib
  
## See also  
[title_storage_c](../title_storage_c_members.md)  
  
  