---
author: joannaleecy
title: title_storage_c (contents)
description: Title Storage C API
kindex: title_storage_c
ms.author: migreen
ms.topic: navigation
security: public
edited: 00/00/0000
applies-to: pc-gdk
---

# title_storage_c  



  
## Enumerations  
  
| Enumeration | Description |  
| --- | --- |  
| [XblTitleStorageBlobType](enums/xbltitlestorageblobtype.md) | Defines values used to indicate title storage blob type. |  
| [XblTitleStorageETagMatchCondition](enums/xbltitlestorageetagmatchcondition.md) | Defines values used to indicate the ETag match condition used when downloading, uploading or deleting title storage data. |  
| [XblTitleStorageType](enums/xbltitlestoragetype.md) | Defines values used to indicate title storage type. |  
  
## Functions  
  
| Function | Description |  
| --- | --- |  
| [XblTitleStorageBlobMetadataResultCloseHandle](functions/xbltitlestorageblobmetadataresultclosehandle.md) | Closes the XblTitleStorageBlobMetadataResultHandle. |  
| [XblTitleStorageBlobMetadataResultDuplicateHandle](functions/xbltitlestorageblobmetadataresultduplicatehandle.md) | Duplicates a XblTitleStorageBlobMetadataResultHandle. |  
| [XblTitleStorageBlobMetadataResultGetItems](functions/xbltitlestorageblobmetadataresultgetitems.md) | Get a list of XblTitleStorageBlobMetadata objects. |  
| [XblTitleStorageBlobMetadataResultGetNextAsync](functions/xbltitlestorageblobmetadataresultgetnextasync.md) | Retrieves the next page of XblTitleStorageBlobMetadata objects. |  
| [XblTitleStorageBlobMetadataResultGetNextResult](functions/xbltitlestorageblobmetadataresultgetnextresult.md) | Get the result for a completed XblTitleStorageBlobMetadataResultGetNextAsync operation. |  
| [XblTitleStorageBlobMetadataResultHasNext](functions/xbltitlestorageblobmetadataresulthasnext.md) | Checks if there are more pages of XblTitleStorageBlobMetadata to retrieve from the service. |  
| [XblTitleStorageDeleteBlobAsync](functions/xbltitlestoragedeleteblobasync.md) | Deletes a blob from title storage. |  
| [XblTitleStorageDownloadBlobAsync](functions/xbltitlestoragedownloadblobasync.md) | Downloads blob data from title storage. |  
| [XblTitleStorageDownloadBlobResult](functions/xbltitlestoragedownloadblobresult.md) | Get the result for a completed XblTitleStorageDownloadBlobAsync operation. |  
| [XblTitleStorageGetBlobMetadataAsync](functions/xbltitlestoragegetblobmetadataasync.md) | Gets a list of blob metadata objects under a given path for the specified service configuration, storage type and storage ID. |  
| [XblTitleStorageGetBlobMetadataResult](functions/xbltitlestoragegetblobmetadataresult.md) | Get the result for a completed XblTitleStorageGetBlobMetadataAsync operation. |  
| [XblTitleStorageGetQuotaAsync](functions/xbltitlestoragegetquotaasync.md) | Gets title storage quota information for the specified service configuration and storage type. |  
| [XblTitleStorageGetQuotaResult](functions/xbltitlestoragegetquotaresult.md) | Get the result for a completed XblTitleStorageGetQuotaAsync operation. |  
| [XblTitleStorageUploadBlobAsync](functions/xbltitlestorageuploadblobasync.md) | Uploads blob data to title storage. |  
| [XblTitleStorageUploadBlobResult](functions/xbltitlestorageuploadblobresult.md) | Get the result for a completed XblTitleStorageUploadBlobAsync operation. |  
  
## Handles  
  
| Handle | Description |  
| --- | --- |  
| [XblTitleStorageBlobMetadataResultHandle](handles/xbltitlestorageblobmetadataresulthandle.md) | A handle that represents metadata about blob data returned from the cloud. |  
  
## Structures  
  
| Structure | Description |  
| --- | --- |  
| [XblTitleStorageBlobMetadata](structs/xbltitlestorageblobmetadata.md) | Metadata about a blob. |  
