---
author: M-Stahl
title: XStoreDownloadAndInstallPackageUpdatesResult
description: Gets the results for a call to [XStoreDownloadAndInstallPackageUpdatesAsync](xstoredownloadandinstallpackageupdatesasync.md).
kindex: XStoreDownloadAndInstallPackageUpdatesResult
ms.author: shanede
ms.topic: reference
edited: 00/00/0000
quality: good
security: public
applies-to: pc-gdk
---

# XStoreDownloadAndInstallPackageUpdatesResult  

Gets the results for a call to [XStoreDownloadAndInstallPackageUpdatesAsync](xstoredownloadandinstallpackageupdatesasync.md).
This is intended to only be used on PC.

## Syntax  
  
```cpp
HRESULT XStoreDownloadAndInstallPackageUpdatesResult(  
         XAsyncBlock* async  
)  
```  
  
### Parameters  
  
*async* &nbsp;&nbsp;\_Inout\_  
Type: [XAsyncBlock*](../../xasync/structs/xasyncblock.md)  
  
The XAsyncBlock that was passed to [XStoreDownloadAndInstallPackageUpdatesAsync](xstoredownloadandinstallpackageupdatesasync.md). The [XAsyncBlock](../../xasync/structs/xasyncblock.md) can be used to poll for the call's status and retrieve call results. See [XAsyncBlock](../../xasync/structs/xasyncblock.md) for more information.     
  
### Return value
Type: HRESULT
  
S_OK on success; otherwise, returns an error code.    
  
## Remarks  
  
This result function allows you to retrieve the execution results of [XStoreDownloadAndInstallPackageUpdatesAsync](xstoredownloadandinstallpackageupdatesasync.md). As such, this function should be called after [XStoreDownloadAndInstallPackageUpdatesAsync](xstoredownloadandinstallpackageupdatesasync.md) has been called, usually in the context of a callback function.  

See [XStoreQueryGameAndDlcPackageUpdatesAsync](xstorequerygameanddlcpackageupdatesasync.md) for a usage example.  
  
## Requirements  
  
**Header:** XStore.h (included in XGameRuntime.h)
  
**Library:** xgameruntime.lib
  
**Supported platforms:** Windows, Xbox One family consoles and Xbox Series consoles  
  
## See also  
[XStore](../xstore_members.md)  
[XStoreDownloadAndInstallPackageUpdatesAsync](xstoredownloadandinstallpackageupdatesasync.md)  
  