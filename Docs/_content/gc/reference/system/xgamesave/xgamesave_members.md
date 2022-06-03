---
author: M-Stahl
title: XGameSave (API contents)
description: Reference material for XGameSave APIs.
kindex: XGameSave
ms.author: scotmi
ms.topic: navigation
edited: 06/04/2019
security: public
applies-to: pc-gdk
---

# XGameSave  

The XGameSave API is designed to enable creating, loading, saving and managing game related states. The primary difference between this and previous implementations is that this will provide a flat API with access to an Asynchronous Programming Model that allows the caller to control the threading and memory management of how the API behaves.  
  
  
## Functions  
  
| Function | Description |  
| --- | --- |  
| [XGameSaveBlobInfoCallback](functions/xgamesaveblobinfocallback.md) | Callback function to retrieve the results of [XGameSaveEnumerateBlobInfo](functions/xgamesaveenumerateblobinfo.md). |  
| [XGameSaveCloseContainer](functions/xgamesaveclosecontainer.md) | Closes the XGameSaveContainer. |  
| [XGameSaveCloseProvider](functions/xgamesavecloseprovider.md) | Releases resources held by the XGameSaveProvider. |  
| [XGameSaveCloseUpdate](functions/xgamesavecloseupdate.md) | Closes a XGameSaveUpdate. |  
| [XGameSaveContainerInfoCallback](functions/xgamesavecontainerinfocallback.md) | The callback function for a call made to [XGameSaveGetContainerInfo](functions/xgamesavegetcontainerinfo.md). |  
| [XGameSaveCreateContainer](functions/xgamesavecreatecontainer.md) | Creates a XGameSaveContainer handle. |  
| [XGameSaveCreateUpdate](functions/xgamesavecreateupdate.md) | Creates an update which will later be submitted by calling [XGameSaveSubmitUpdate](functions/xgamesavesubmitupdate.md). |  
| [XGameSaveDeleteContainer](functions/xgamesavedeletecontainer.md) | Deletes a XGameSaveContainer from cloud storage. |  
| [XGameSaveDeleteContainerAsync](functions/xgamesavedeletecontainerasync.md) | Deletes a XGameSaveContainer asynchronously. |  
| [XGameSaveDeleteContainerResult](functions/xgamesavedeletecontainerresult.md) | Retrieves the result of a [XGameSaveDeleteContainerAsync](functions/xgamesavedeletecontainerasync.md) call, use this function to check the success of the call. |  
| [XGameSaveEnumerateBlobInfo](functions/xgamesaveenumerateblobinfo.md) | Retrieves the blob info for the contents of a XGameSaveContainer. |  
| [XGameSaveEnumerateBlobInfoByName](functions/xgamesaveenumerateblobinfobyname.md) | Retrieves the blob info for the contents of a XGameSaveContainer limited to the blobs which share a prefix with the blobNamePrefix parameter. |  
| [XGameSaveEnumerateContainerInfo](functions/xgamesaveenumeratecontainerinfo.md) | Retrieves the container info for a XGameSaveProvider. |  
| [XGameSaveEnumerateContainerInfoByName](functions/xgamesaveenumeratecontainerinfobyname.md) | Retrieves the container info for a XGameSaveProvider. |  
| [XGameSaveGetContainerInfo](functions/xgamesavegetcontainerinfo.md) | Retrieves info for the containers in a XGameSaveProvider. |  
| [XGameSaveGetRemainingQuota](functions/xgamesavegetremainingquota.md) | Returns the amount of data available to store using the XGameSave api. |  
| [XGameSaveGetRemainingQuotaAsync](functions/xgamesavegetremainingquotaasync.md) | Returns the amount of data available to store using the XGameSave api asynchronously. |  
| [XGameSaveGetRemainingQuotaResult](functions/xgamesavegetremainingquotaresult.md) | Retrieves the results of the [XGameSaveGetRemainingQuotaAsync](functions/xgamesavegetremainingquotaasync.md) function. |  
| [XGameSaveInitializeProvider](functions/xgamesaveinitializeprovider.md) | Provides and initializes a XGameSave Provider handle. |  
| [XGameSaveInitializeProviderAsync](functions/xgamesaveinitializeproviderasync.md) | Provides and initializes an XGameSave Provider handle asynchronously. |  
| [XGameSaveInitializeProviderResult](functions/xgamesaveinitializeproviderresult.md) | Contains the results of a [XGameSaveInitializeProviderAsync](functions/xgamesaveinitializeproviderasync.md) call. |  
| [XGameSaveReadBlobData](functions/xgamesavereadblobdata.md) | Reads the blob data for a container. |  
| [XGameSaveReadBlobDataAsync](functions/xgamesavereadblobdataasync.md) | Read XGameSaveBlob data from a XGameSaveContainer asynchronously. |  
| [XGameSaveReadBlobDataResult](functions/xgamesavereadblobdataresult.md) | Retrieves the results of a [XGameSaveReadBlobDataAsync](functions/xgamesavereadblobdataasync.md) call. |  
| [XGameSaveSubmitBlobDelete](functions/xgamesavesubmitblobdelete.md) | Adds a delete action to a game save XGameSaveUpdate. |  
| [XGameSaveSubmitBlobWrite](functions/xgamesavesubmitblobwrite.md) | Adds a write action to a XGameSaveUpdate. |  
| [XGameSaveSubmitUpdate](functions/xgamesavesubmitupdate.md) | Submit an update to the XGameSave service. Updates blobs within a container. |  
| [XGameSaveSubmitUpdateAsync](functions/xgamesavesubmitupdateasync.md) | Submit an update to the XGameSave service asynchronously. Updates blobs within a container. |  
| [XGameSaveSubmitUpdateResult](functions/xgamesavesubmitupdateresult.md) | Retrieves the result of the [XGameSaveSubmitUpdateAsync](functions/xgamesavesubmitupdateasync.md) call. |  
  
## Structures  
  
| Structure | Description |  
| --- | --- |  
| [XGameSaveBlob](structs/xgamesaveblob.md) | Unit of information for XGameSave storage. Resides within a XGameSaveContainer. |  
| [XGameSaveBlobInfo](structs/xgamesaveblobinfo.md) | Information about the XGameSaveBlob. |  
| [XGameSaveContainerInfo](structs/xgamesavecontainerinfo.md) | Information about a XGameSaveContainer. |  
  
  
## See also  
[System API reference](../gc-reference-system-toc.md)  