---
author: M-Stahl
title: XStoreQueryAddOnLicensesResultCount
description: Gets the number of licenses retrieved by [XStoreQueryAddonLicensesAsync](xstorequeryaddonlicensesasync.md).
kindex: XStoreQueryAddOnLicensesResultCount
ms.author: shanede
ms.topic: reference
edited: 00/00/0000
quality: good
security: public
applies-to: pc-gdk
---

# XStoreQueryAddOnLicensesResultCount  

Gets the number of licenses retrieved by [XStoreQueryAddonLicensesAsync](xstorequeryaddonlicensesasync.md).  

## Syntax  
  
```cpp
HRESULT XStoreQueryAddOnLicensesResultCount(  
         XAsyncBlock* async,  
         uint32_t* count  
)  
```  
  
### Parameters  
  
*async* &nbsp;&nbsp;\_In\_  
Type: [XAsyncBlock*](../../xasync/structs/xasyncblock.md)  
  
The XAsyncBlock passed to [XStoreQueryAddonLicensesAsync](xstorequeryaddonlicensesasync.md). The [XAsyncBlock](../../xasync/structs/xasyncblock.md) can be used to poll for the call's status and retrieve call results. See [XAsyncBlock](../../xasync/structs/xasyncblock.md) for more information.   
  
*count* &nbsp;&nbsp;\_Out\_  
Type: uint32_t*  
  
On success contains the number of licenses retrieved.  
  
### Return value
Type: HRESULT
  
HRESULT success or error code.    
  
## Remarks  
  
This result function allows you to retrieve the number of add-on licenses acquired when [XStoreQueryAddonLicensesAsync](xstorequeryaddonlicensesasync.md) was called. As such, this function should be called after [XStoreQueryAddonLicensesAsync](xstorequeryaddonlicensesasync.md) has been called, usually in the context of a callback function.  
  
See [XStoreQueryAddonLicensesAsync](xstorequeryaddonlicensesasync.md) for a usage example.  

  
## Requirements  
  
**Header:** XStore.h (included in XGameRuntime.h)
  
**Library:** xgameruntime.lib
  
**Supported platforms:** Windows, Xbox One family consoles and Xbox Series consoles  
  
## See also  
[XStore](../xstore_members.md)  
[XStoreQueryAddonLicensesAsync](xstorequeryaddonlicensesasync.md)  
[XStoreQueryAddonLicensesResult](xstorequeryaddonlicensesresult.md)  
  