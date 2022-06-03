---
author: M-Stahl
title: XStoreDownloadAndInstallPackagesResultCount
description: Gets the number of items in the result that will be returned by [XStoreDownloadAndInstallPackagesResult](xstoredownloadandinstallpackagesresult.md).
kindex: XStoreDownloadAndInstallPackagesResultCount
ms.author: shanede
ms.topic: reference
edited: 00/00/0000
quality: good
security: public
applies-to: pc-gdk
---

# XStoreDownloadAndInstallPackagesResultCount  

Gets the number of items in the result that will be returned by [XStoreDownloadAndInstallPackagesResult](xstoredownloadandinstallpackagesresult.md).  

## Syntax  
  
```cpp
HRESULT XStoreDownloadAndInstallPackagesResultCount(  
         XAsyncBlock* async,  
         uint32_t* count  
)  
```  
  
### Parameters  
  
*async* &nbsp;&nbsp;\_In\_  
Type: [XAsyncBlock*](../../xasync/structs/xasyncblock.md)  
  
The XAsyncBlock that was passed to [XStoreDownloadAndInstallPackagesAsync](xstoredownloadandinstallpackagesasync.md). The [XAsyncBlock](../../xasync/structs/xasyncblock.md) can be used to poll for the call's status and retrieve call results. See [XAsyncBlock](../../xasync/structs/xasyncblock.md) for more information.   

*count* &nbsp;&nbsp;\_Out\_  
Type: uint32_t*  
  
On success, contains the count of items in the result that will be returned by [XStoreDownloadAndInstallPackagesResult](xstoredownloadandinstallpackagesresult.md).    
  
### Return value
Type: HRESULT
  
S_OK on success; otherwise, returns an error code.    
  
## Remarks  
  
This result function allows you to retrieve the number of install packages downloaded when [XStoreDownloadAndInstallPackagesAsync](xstoredownloadandinstallpackagesasync.md) was called. As such, this function should be called after [XStoreDownloadAndInstallPackagesAsync](xstoredownloadandinstallpackagesasync.md) has been called, usually in the context of a callback function. See [XStoreDownloadAndInstallPackagesAsync](xstoredownloadandinstallpackagesasync.md) for a usage example.  
  
## Requirements  
  
**Header:** XStore.h (included in XGameRuntime.h)
  
**Library:** xgameruntime.lib
  
**Supported platforms:** Windows, Xbox One family consoles and Xbox Series consoles  
  
## See also  
[XStore](../xstore_members.md)  
[XStoreDownloadAndInstallPackagesAsync](xstoredownloadandinstallpackagesasync.md)  
[XStoreDownloadAndInstallPackagesResult](xstoredownloadandinstallpackagesresult.md)  
  