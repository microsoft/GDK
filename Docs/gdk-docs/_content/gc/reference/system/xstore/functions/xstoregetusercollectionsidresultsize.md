---
author: M-Stahl
title: XStoreGetUserCollectionsIdResultSize
description: Gets the size of the ID returned by [XStoreGetUserCollectionsIdResult](xstoregetusercollectionsidresult.md).
kindex: XStoreGetUserCollectionsIdResultSize
ms.author: shanede
ms.topic: reference
edited: 00/00/0000
quality: good
security: public
applies-to: pc-gdk
---

# XStoreGetUserCollectionsIdResultSize  
  
Gets the size of the ID returned by [XStoreGetUserCollectionsIdResult](xstoregetusercollectionsidresult.md).  

## Syntax  
  
```cpp
HRESULT XStoreGetUserCollectionsIdResultSize(  
         XAsyncBlock* async,  
         size_t* size  
)  
```  
  
### Parameters  
  
*async* &nbsp;&nbsp;\_In\_  
Type: [XAsyncBlock*](../../xasync/structs/xasyncblock.md)  
  
The XAsyncBlock passed to [XStoreGetUserCollectionsIdAsync](xstoregetusercollectionsidresult.md) The [XAsyncBlock](../../xasync/structs/xasyncblock.md) can be used to poll for the call's status and retrieve call results. See [XAsyncBlock](../../xasync/structs/xasyncblock.md) for more information.  
  
*size* &nbsp;&nbsp;\_Out\_  
Type: size_t*  
  
On success contains the size of the ID returned by [XStoreGetUserCollectionsIdResult](xstoregetusercollectionsidresult.md).  
  
### Return value
Type: HRESULT
  
HRESULT success or error code.    
  
## Remarks  
  
This result function allows you to retrieve the size of the collections ID when [XStoreGetUserCollectionsIdResult](xstoregetusercollectionsidresult.md) was called. As such, this function should be called after [XStoreGetUserCollectionsIdResult](xstoregetusercollectionsidresult.md) has been called, usually in the context of a callback function. See [XStoreGetUserCollectionsIdAsync](xstoregetusercollectionsidasync.md) for a usage example.  
  
## Requirements  
  
**Header:** XStore.h (included in XGameRuntime.h)
  
**Library:** xgameruntime.lib
  
**Supported platforms:** Windows, Xbox One family consoles and Xbox Series consoles  
  
## See also  
[XStore](../xstore_members.md)  
[XStoreGetUserCollectionsIdAsync](xstoregetusercollectionsidasync.md)  
[XStoreGetUserCollectionsIdResult](xstoregetusercollectionsidresult.md)  
  