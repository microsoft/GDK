---
author: M-Stahl
title: XStoreQueryGameAndDlcPackageUpdatesResultCount
description: Gets the number of updates retrieved by [XStoreQueryGameAndDlcPackageUpdatesAsync](xstorequerygameanddlcpackageupdatesasync.md).
kindex: XStoreQueryGameAndDlcPackageUpdatesResultCount
ms.author: shanede
ms.topic: reference
edited: 07/22/2021
quality: good
security: public
applies-to: pc-gdk
---

# XStoreQueryGameAndDlcPackageUpdatesResultCount  
  
Gets the number of updates retrieved by [XStoreQueryGameAndDlcPackageUpdatesAsync](xstorequerygameanddlcpackageupdatesasync.md).
This is intended to only be used on PC.

## Syntax  
  
```cpp
HRESULT XStoreQueryGameAndDlcPackageUpdatesResultCount(  
         XAsyncBlock* async,  
         uint32_t* count  
)  
```  
  
### Parameters  
  
*async* &nbsp;&nbsp;\_In\_  
Type: [XAsyncBlock*](../../xasync/structs/xasyncblock.md)  
  
The XAsyncBlock passed to [XStoreQueryGameAndDlcPackageUpdatesAsync](xstorequerygameanddlcpackageupdatesasync.md). The [XAsyncBlock](../../xasync/structs/xasyncblock.md) can be used to poll for the call's status and retrieve call results. See [XAsyncBlock](../../xasync/structs/xasyncblock.md) for more information.  
  
*count* &nbsp;&nbsp;\_Out\_  
Type: uint32_t*  
  
On success contains the number of updates retrieved.  
  
### Return value
Type: HRESULT
  
HRESULT success or error code.    
  
## Remarks  
  
This result function allows you to retrieve the number of add-on licenses acquired when [XStoreQueryGameAndDlcPackageUpdatesAsync](xstorequerygameanddlcpackageupdatesasync.md) was called. As such, this function should be called after [XStoreQueryGameAndDlcPackageUpdatesAsync](xstorequerygameanddlcpackageupdatesasync.md) has been called, usually in the context of a callback function.  
  
See [XStoreQueryGameAndDlcPackageUpdatesAsync](xstorequerygameanddlcpackageupdatesasync.md) for a usage example.  
  
  
## Requirements  
  
**Header:** XStore.h (included in XGameRuntime.h)
  
**Library:** xgameruntime.lib
  
**Supported platforms:** Windows, Xbox One family consoles and Xbox Series consoles  
  
## See also  
[XStore](../xstore_members.md)  
[XStoreQueryGameAndDlcPackageUpdatesAsync](xstorequerygameanddlcpackageupdatesasync.md)  
[XStoreQueryGameAndDlcPackageUpdatesResult](xstorequerygameanddlcpackageupdatesresult.md)  