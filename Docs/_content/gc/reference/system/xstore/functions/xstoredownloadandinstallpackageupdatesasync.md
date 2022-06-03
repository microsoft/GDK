---
author: M-Stahl
title: XStoreDownloadAndInstallPackageUpdatesAsync
description: Downloads and installs updates for the specified store packages.
kindex: XStoreDownloadAndInstallPackageUpdatesAsync
ms.author: shanede
ms.topic: reference
edited: 07/02/2019
quality: good
security: public
applies-to: pc-gdk
---

# XStoreDownloadAndInstallPackageUpdatesAsync  

Downloads and installs updates for the specified store packages.
This is intended to only be used on PC.

## Syntax  
  
```cpp
HRESULT XStoreDownloadAndInstallPackageUpdatesAsync(  
         const XStoreContextHandle storeContextHandle,  
         const char** packageIdentifiers,  
         size_t packageIdentifiersCount,  
         XAsyncBlock* async  
)  
```  
  
### Parameters  
  
*storeContextHandle* &nbsp;&nbsp;\_In\_  
Type: XStoreContextHandle  

  
The store context handle for the user returned by [XStoreCreateContext](xstorecreatecontext.md).  


*packageIdentifiers* &nbsp;&nbsp;\_In\_z\_count\_(packageIdentifiersCount)  
Type: char**  
  
List of package identifier strings.
A package identifier uniquely identifies a package from the Microsoft store. For more information about package identifiers, see [Manage and license downloadable content (DLC)](../../../../commerce/fundamentals/xstore-manage-and-license-optional-packages.md).  

*packageIdentifiersCount* &nbsp;&nbsp;\_In\_  
Type: size_t  
  
The number of Identifiers in **packageIdentifiers**.  

*async* &nbsp;&nbsp;\_Inout\_  
Type: [XAsyncBlock*](../../xasync/structs/xasyncblock.md)  
  
An [XAsyncBlock](../../xasync/structs/xasyncblock.md) defining the asynchronous work being done. The [XAsyncBlock](../../xasync/structs/xasyncblock.md) can be used to poll for the call's status and retrieve call results. See [XAsyncBlock](../../xasync/structs/xasyncblock.md) for more information.  
  
### Return value
Type: HRESULT
  
HRESULT success or error code.    
  
## Remarks  

This function downloads and installs updates to for a specified store package. If you would like to download the updates without installing them call [XStoreDownloadPackageUpdatesAsync](xstoredownloadpackageupdatesasync.md). Downloading without installing is useful when the game is running so that you do not disturb gameplay. To retrieve the results of the download and install update, call [XStoreDownloadAndInstallPackageUpdatesResult](xstoredownloadandinstallpackageupdatesresult.md) after calling this function. See [XStoreQueryGameAndDlcPackageUpdatesAsync](xstorequerygameanddlcpackageupdatesasync.md) for a usage example.  
  
## Requirements  
  
**Header:** XStore.h (included in XGameRuntime.h)
  
**Library:** xgameruntime.lib
  
**Supported platforms:** Windows, Xbox One family consoles and Xbox Series consoles  
  
## See also  
[XStore](../xstore_members.md)  
[XStoreDownloadAndInstallPackageUpdatesResult](xstoredownloadandinstallpackageupdatesresult.md)  
[XStoreDownloadPackageUpdatesAsync](xstoredownloadpackageupdatesasync.md)  
  