---
author: M-Stahl
title: XStoreQueryLicenseTokenResultSize
description: Gets the size of the result that will be returned by [XstoreQueryLicenseTokenResult](xstorequerylicensetokenresult.md).
kindex: XStoreQueryLicenseTokenResultSize
ms.author: shanede
ms.topic: reference
edited: 00/00/0000
quality: good
security: public
applies-to: pc-gdk
---

# XStoreQueryLicenseTokenResultSize  

Gets the size of the result that will be returned by [XstoreQueryLicenseTokenResult](xstorequerylicensetokenresult.md).  

## Syntax  
  
```cpp
HRESULT XStoreQueryLicenseTokenResultSize(  
         XAsyncBlock* async,  
         size_t* size  
)  
```  
  
### Parameters  
  
*async* &nbsp;&nbsp;\_In\_  
Type: [XAsyncBlock*](../../xasync/structs/xasyncblock.md)  
  
The XAsyncBlock block passed to [XStoreQueryLicenseTokenAsync](xstorequerylicensetokenasync.md). The [XAsyncBlock](../../xasync/structs/xasyncblock.md) can be used to poll for the call's status and retrieve call results. See [XAsyncBlock](../../xasync/structs/xasyncblock.md) for more information.  
  
*size* &nbsp;&nbsp;\_Out\_  
Type: size_t*  
  
On success contains the size of the result that will be returned by [XStoreQueryLicenseTokenResult](xstorequerylicensetokenresult.md).  
  
### Return value
Type: HRESULT
  
HRESULT success or error code.    
  
## Remarks  
  
This result function allows you to retrieve the size of the JSON web Token when [XStoreQueryLicenseTokenAsync](xstorequerylicensetokenasync.md) was called. As such, this function should be called after [XStoreQueryLicenseTokenAsync](xstorequerylicensetokenasync.md) has been called, usually in the context of a callback function. See [XStoreQueryLicenseTokenAsync](xstorequerylicensetokenasync.md) for a usage example.  
  
## Requirements  
  
**Header:** XStore.h (included in XGameRuntime.h)
  
**Library:** xgameruntime.lib
  
**Supported platforms:** Windows, Xbox One family consoles and Xbox Series consoles  
  
## See also  
[XStore](../xstore_members.md)  
[XStoreQueryLicenseTokenAsync](xstorequerylicensetokenasync.md)  
[XStoreQueryLicenseTokenResult](xstorequerylicensetokenresult.md)  