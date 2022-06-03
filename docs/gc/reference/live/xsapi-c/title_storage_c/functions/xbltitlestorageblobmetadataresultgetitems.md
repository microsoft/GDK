---
author: joannaleecy
title: XblTitleStorageBlobMetadataResultGetItems
description: Get a list of XblTitleStorageBlobMetadata objects.
kindex: XblTitleStorageBlobMetadataResultGetItems
ms.author: migreen
ms.topic: reference
security: public
edited: 00/00/0000
applies-to: pc-gdk
quality: good
---

# XblTitleStorageBlobMetadataResultGetItems  

Get a list of XblTitleStorageBlobMetadata objects.  

## Syntax  
  
```cpp
HRESULT XblTitleStorageBlobMetadataResultGetItems(  
         XblTitleStorageBlobMetadataResultHandle resultHandle,  
         const XblTitleStorageBlobMetadata** items,  
         size_t* itemsCount  
)  
```  
  
### Parameters  
  
*resultHandle* &nbsp;&nbsp;\_In\_  
Type: [XblTitleStorageBlobMetadataResultHandle](../handles/xbltitlestorageblobmetadataresulthandle.md)  
  
Title storage blob metadata result handle.  
  
*items* &nbsp;&nbsp;\_Out\_  
Type: [XblTitleStorageBlobMetadata**](../structs/xbltitlestorageblobmetadata.md)  
  
Passes back a pointer to an array of XblTitleStorageBlobMetadata objects. The memory for the returned pointer remains valid for the life of the XblTitleStorageBlobMetadataResultHandle object until it is closed.  
  
*itemsCount* &nbsp;&nbsp;\_Out\_  
Type: size_t*  
  
Passes back the number of objects in the items array.  
  
  
### Return value  
Type: HRESULT
  
HRESULT return code for this API operation.
  
## Remarks  
  
This memory of the list is freed when the XblTitleStorageBlobMetadataResultHandle is closed with [XblTitleStorageBlobMetadataResultCloseHandle](xbltitlestorageblobmetadataresultclosehandle.md).
  
## Requirements  
  
**Header:** title_storage_c.h
  
**Library:** Microsoft.Xbox.Services.141.GSDK.C.lib
  
## See also  
[title_storage_c](../title_storage_c_members.md)  
  
  