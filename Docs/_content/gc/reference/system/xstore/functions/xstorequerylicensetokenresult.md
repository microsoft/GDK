---
author: M-Stahl
title: XStoreQueryLicenseTokenResult
description: Retrieves the results of a call to [XStoreQueryLicenseTokenAsync](xstorequerylicensetokenasync.md).
kindex: XStoreQueryLicenseTokenResult
ms.author: shanede
ms.topic: reference
edited: 00/00/0000
quality: good
security: public
applies-to: pc-gdk
---

# XStoreQueryLicenseTokenResult  

Retrieves the results of a call to [XStoreQueryLicenseTokenAsync](xstorequerylicensetokenasync.md).  See [License Tokens Overview](../../../../commerce/pc-specific-considerations/xstore-license-tokens.md) for more information.

## Syntax  
  
```cpp
HRESULT XStoreQueryLicenseTokenResult(  
         XAsyncBlock* async,  
         size_t size,  
         char* result  
)  
```  
  
### Parameters  
  
*async* &nbsp;&nbsp;\_Inout\_  
Type: [XAsyncBlock*](../../xasync/structs/xasyncblock.md)  
  
The XAsyncBlock passed to [XStoreQueryLicenseTokenAsync](xstorequerylicensetokenasync.md). The [XAsyncBlock](../../xasync/structs/xasyncblock.md) can be used to poll for the call's status and retrieve call results. See [XAsyncBlock](../../xasync/structs/xasyncblock.md) for more information.   
  
*size* &nbsp;&nbsp;\_In\_  
Type: size_t  
  
The size of the array passed into **result**.  
  
*result* &nbsp;&nbsp;\_Out\_writes\_z\_(size)  
Type: char*  
  
On success contains the retrieved license token.  
  
### Return value
Type: HRESULT
  
HRESULT success or error code.    
  
## Remarks  
  
This result function allows you to retrieve the execution results of [XStoreQueryLicenseTokenAsync](xstorequerylicensetokenasync.md), as well as the JSON web token called for if the execution was successful. As such, this function should be called after [XStoreQueryLicenseTokenAsync](xstorequerylicensetokenasync.md) has been called, usually in the context of a callback function.  
  
See [XStoreQueryLicenseTokenAsync](xstorequerylicensetokenasync.md) for a usage example.  
  
## Requirements  
  
**Header:** XStore.h (included in XGameRuntime.h)
  
**Library:** xgameruntime.lib
  
**Supported platforms:** Windows, Xbox One family consoles and Xbox Series consoles  
  
## See also  

[XStore](../xstore_members.md)  

[License Tokens Overview](../../../../commerce/pc-specific-considerations/xstore-license-tokens.md)

[XStoreQueryLicenseTokenAsync](xstorequerylicensetokenasync.md)  

[XStoreQueryLicenseTokenResultSize](xstorequerylicensetokenresultsize.md)  

  
  