---
author: M-Stahl
title: XStoreShowProductPageUIAsync
description: Opens the Store app directly to the details page of the specified ProductId.
kindex: XStoreShowProductPageUIAsync
ms.author: shanede
ms.topic: reference
security: public
edited: 00/00/0000
applies-to: pc-gdk
quality: good
---

# XStoreShowProductPageUIAsync

This API will open up the Store app directly to the Product Details Page (PDP) of the provided ProductId. This allows titles who have not integrated with the purchase flow or an in-game store UI to still help drive users to products related to their title and the purchase flow found on the Product Details Page.

![pdp](../../../../../../resources/gamecore/secure/images/en-us/xstore/pdpexample-small.png)

## Syntax  
  
```cpp
HRESULT XStoreShowProductPageUIAsync(  
         const XStoreContextHandle storeContextHandle,  
         const char* storeId,  
         XAsyncBlock* async  
)  
```  
  
### Parameters  
  
*storeContextHandle* &nbsp;&nbsp;\_In\_  
Type: XStoreContextHandle  
  
The store context handle for the user returned by [XStoreCreateContext](xstorecreatecontext.md).
  
*storeId* &nbsp;&nbsp;\_In\_z\_  
Type: char*  
  
The ID of the product.
  
*async* &nbsp;&nbsp;\_Inout\_  
Type: XAsyncBlock*  
  
An [XAsyncBlock](../../xasync/structs/xasyncblock.md) defining the asynchronous work being done. The [XAsyncBlock](../../xasync/structs/xasyncblock.md) can be used to poll for the call's status and retrieve call results. See [XAsyncBlock](../../xasync/structs/xasyncblock.md) for more information.

### Return value

Type: HRESULT
  
HRESULT success or error code.  

## Requirements  
  
**Header:** XStore.h  
**Library:** xgameruntime.lib  
**Supported Platforms**: Windows, Xbox One family consoles and Xbox Series consoles  
  
## See also

[XStore](../xstore_members.md)  