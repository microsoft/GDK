---
author: joannaleecy
title: XblTitleStorageBlobMetadataResultGetNextResult
description: Get the result for a completed XblTitleStorageBlobMetadataResultGetNextAsync operation.
kindex: XblTitleStorageBlobMetadataResultGetNextResult
ms.author: migreen
ms.topic: reference
security: public
edited: 00/00/0000
applies-to: pc-gdk
quality: good
---

# XblTitleStorageBlobMetadataResultGetNextResult  

Get the result for a completed XblTitleStorageBlobMetadataResultGetNextAsync operation.  

## Syntax  
  
```cpp
HRESULT XblTitleStorageBlobMetadataResultGetNextResult(  
         XAsyncBlock* async,  
         XblTitleStorageBlobMetadataResultHandle* result  
)  
```  
  
### Parameters  
  
*async* &nbsp;&nbsp;\_In\_  
Type: XAsyncBlock*  
  
The same AsyncBlock that passed to XblTitleStorageBlobMetadataResultGetNextAsync.  
  
*result* &nbsp;&nbsp;\_Out\_  
Type: [XblTitleStorageBlobMetadataResultHandle*](../handles/xbltitlestorageblobmetadataresulthandle.md)  
  
Passes back the next XblTitleStorageBlobMetadataResultHandle. Note that this is a separate handle than the one passed to the XblTitleStorageBlobMetadataResultGetNextAsync API. Each result handle must be closed separately.  
  
  
### Return value  
Type: HRESULT
  
HRESULT return code for this API operation.
  
## Requirements  
  
**Header:** title_storage_c.h
  
**Library:** Microsoft.Xbox.Services.141.GSDK.C.lib
  
## See also  
[title_storage_c](../title_storage_c_members.md)  
  
  