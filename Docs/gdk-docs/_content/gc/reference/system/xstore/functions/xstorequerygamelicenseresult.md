---
author: M-Stahl
title: XStoreQueryGameLicenseResult
description: Gets the results of a call to [XStoreQueryGameLicenseAsync](xstorequerygamelicenseasync.md).
kindex: XStoreQueryGameLicenseResult
ms.author: shanede
ms.topic: reference
edited: 00/00/0000
quality: good
security: public
applies-to: pc-gdk
---

# XStoreQueryGameLicenseResult  

Gets the results of a call to [XStoreQueryGameLicenseAsync](xstorequerygamelicenseasync.md).  

## Syntax  
  
```cpp
HRESULT XStoreQueryGameLicenseResult(  
         XAsyncBlock* async,  
         XStoreGameLicense* license  
)  
```  
  
### Parameters  
  
*async* &nbsp;&nbsp;\_Inout\_  
Type: [XAsyncBlock*](../../xasync/structs/xasyncblock.md)  
  
The XAsyncBlock passed to [XStoreQueryGameLicenseAsync](xstorequerygamelicenseasync.md). The [XAsyncBlock](../../xasync/structs/xasyncblock.md) can be used to poll for the call's status and retrieve call results. See [XAsyncBlock](../../xasync/structs/xasyncblock.md) for more information.  

*license* &nbsp;&nbsp;\_Out\_  
Type: [XStoreGameLicense*](../structs/xstoregamelicense.md)  
  
On success contains the game license.  
  
### Return value
Type: HRESULT
  
HRESULT success or error code.    
  
## Remarks  
  
This result function allows you to retrieve the execution results of [XStoreQueryGameLicenseAsync](xstorequerygamelicenseasync.md), as well as the license for game launch called for if the execution was successful. As such, this function should be called after [XStoreQueryGameLicenseAsync](xstorequerygamelicenseasync.md) has been called, usually in the context of a callback function.  
  
See [XStoreQueryGameLicenseAsync](xstorequerygamelicenseasync.md) for a usage example.  
  
## Requirements  
  
**Header:** XStore.h (included in XGameRuntime.h)
  
**Library:** xgameruntime.lib
  
**Supported platforms:** Windows, Xbox One family consoles and Xbox Series consoles  
  
## See also  
[XStore](../xstore_members.md)  
[XStoreQueryGameLicenseAsync](xstorequerygamelicenseasync.md)  
  