---
author: M-Stahl
title: XStoreCanAcquireLicenseForStoreIdResult
description: Gets the results for a call to [XStoreCanAcquireLicenseForStoreIdAsync](xstorecanacquirelicenseforstoreidasync.md).
kindex: XStoreCanAcquireLicenseForStoreIdResult
ms.author: shanede
ms.topic: reference
edited: 07/12/2021
quality: good
security: public
applies-to: pc-gdk
---

# XStoreCanAcquireLicenseForStoreIdResult


Gets the results for a call to [XStoreCanAcquireLicenseForStoreIdAsync](xstorecanacquirelicenseforstoreidasync.md).  

## Syntax  
  
```cpp
HRESULT XStoreCanAcquireLicenseForStoreIdResult(  
         XAsyncBlock* async,  
         XStoreCanAcquireLicenseResult* storeCanAcquireLicense  
)  
```  
  
### Parameters  
  
*async* &nbsp;&nbsp;\_Inout\_  
Type: [XAsyncBlock*](../../xasync/structs/xasyncblock.md)  
  
The XAsyncBlock that was passed to [XStoreCanAcquireLicenseForStoreIdAsync](xstorecanacquirelicenseforstoreidasync.md).
The [XAsyncBlock](../../xasync/structs/xasyncblock.md) can be used to poll for the call's status and retrieve call results. See [XAsyncBlock](../../xasync/structs/xasyncblock.md) for more information.
  
*storeCanAcquireLicense* &nbsp;&nbsp;\_Out\_  
Type: [XStoreCanAcquireLicenseResult*](../structs/xstorecanacquirelicenseresult.md)  
  
On return indicates if the user would be able to license the requested product. This product can be a game, durable, or durable with package. It will also return a result if the product can be licensed by an inserted disc. The result will indicate what SKU the user would be able to license. **Note that no SKU will be returned in the case where content is able to be licensed via disc.** 
  
### Return value

Type: HRESULT
  
S_OK on success; otherwise, returns an error code.
  
The following error codes may be returned by **XStoreCanAcquireLicenseForStoreIdResult**:

| Error code| Meaning|
| --- | --- |
| 0x803f6108 `IAP_E_BAD_LICENSE` | The package for this product is not installed |
| 0x803f9006 `LM_E_ENTITLED_USER_SIGNED_OUT` | Owner of the product is not signed in. |

## Remarks  

This result function allows you to retrieve the execution results of [XStoreCanAcquireLicenseForStoreIdAsync](xstorecanacquirelicenseforstoreidasync.md), as well as the preview license that was called for if the execution was successful.
This function should be called after [XStoreCanAcquireLicenseForStoreIdAsync](xstorecanacquirelicenseforstoreidasync.md) has been called, usually in the context of a callback function.
See [XStoreCanAcquireLicenseForStoreIdAsync](xstorecanacquirelicenseforstoreidasync.md) for a usage example.
  
## Requirements  
  
**Header:** XStore.h (included in XGameRuntime.h)
  
**Library:** xgameruntime.lib
  
**Supported platforms:** Windows, Xbox One family consoles and Xbox Series consoles  
  
## See also

[XStore](../xstore_members.md)  
[XStoreCanAcquireLicenseForStoreIdAsync](xstorecanacquirelicenseforstoreidasync.md)  
  