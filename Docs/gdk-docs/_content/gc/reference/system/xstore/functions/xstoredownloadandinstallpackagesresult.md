---
author: M-Stahl
title: XStoreDownloadAndInstallPackagesResult
description: Gets the results for a call to [XStoreDownloadAndInstallPackagesAsync](xstoredownloadandinstallpackagesasync.md).
kindex: XStoreDownloadAndInstallPackagesResult
ms.author: shanede
ms.topic: reference
edited: 00/00/0000
quality: good
security: public
applies-to: pc-gdk
---

# XStoreDownloadAndInstallPackagesResult  

Gets the results for a call to [XStoreDownloadAndInstallPackagesAsync](xstoredownloadandinstallpackagesasync.md).  

## Syntax  
  
```cpp
HRESULT XStoreDownloadAndInstallPackagesResult(  
         XAsyncBlock* async,  
         uint32_t count,  
         char packageIdentifiers[][XPACKAGE_IDENTIFIER_MAX_LENGTH]  
) noexcept;  
```  
  
### Parameters  
  
*async* &nbsp;&nbsp;\_Inout\_  
Type: [XAsyncBlock*](../../xasync/structs/xasyncblock.md)  
  
The XAsyncBlock that was passed to [XStoreDownloadAndInstallPackagesAsync](xstoredownloadandinstallpackagesasync.md). The [XAsyncBlock](../../xasync/structs/xasyncblock.md) can be used to poll for the call's status and retrieve call results. See [XAsyncBlock](../../xasync/structs/xasyncblock.md) for more information.     
  
*count* &nbsp;&nbsp;\_In\_  
Type: uint32_t  
  
The size in elements of the array passed into the **packageIdentifiers** parameter.    
  
*packageIdentifiers* &nbsp;&nbsp;\_Out\_writes\_z\_(count)  
Type: char\[\]\[XPACKAGE_IDENTIFIER_MAX_LENGTH\]  
  
On success contains a list of package identifiers for the packages that were downloaded. For more information about package identifiers, see [Manage and license downloadable content (DLC)](../../../../commerce/fundamentals/xstore-manage-and-license-optional-packages.md).  
  
  
  
### Return value
Type: HRESULT
  
S_OK on success; otherwise, returns an error code.  
  
## Remarks  
  
This result function allows you to retrieve the execution results of [XStoreDownloadAndInstallPackagesAsync](xstoredownloadandinstallpackagesasync.md), as well as the store packages that were called for if the execution was successful. As such, this function should be called after [XStoreDownloadAndInstallPackagesAsync](xstoredownloadandinstallpackagesasync.md) has been called, usually in the context of a callback function.  

See [XStoreDownloadAndInstallPackagesAsync](xstoredownloadandinstallpackagesasync.md) for a usage example.  
  
## Requirements  
  
**Header:** XStore.h (included in XGameRuntime.h)
  
**Library:** xgameruntime.lib
  
**Supported platforms:** Windows, Xbox One family consoles and Xbox Series consoles  
  
## See also  
[XStore](../xstore_members.md)  
[XStoreDownloadAndInstallPackagesAsync](xstoredownloadandinstallpackagesasync.md)  
[XStoreDownloadAndInstallPackagesResultCount](xstoredownloadandinstallpackagesresultcount.md)  