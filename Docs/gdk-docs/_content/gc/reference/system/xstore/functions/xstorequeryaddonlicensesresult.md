---
author: M-Stahl
title: XStoreQueryAddOnLicensesResult
description: Retrieves the result of a call to XStoreQueryAddOnLicensesAsync.
kindex: XStoreQueryAddOnLicensesResult
ms.author: shanede
ms.topic: reference
edited: 07/21/2021
quality: good
security: public
applies-to: pc-gdk
---

# XStoreQueryAddOnLicensesResult

Retrieves the result of a call to [XStoreQueryAddOnLicensesAsync](xstorequeryaddonlicensesresult.md).  

## Syntax  
  
```cpp
HRESULT XStoreQueryAddOnLicensesResult(  
         XAsyncBlock* async,  
         uint32_t count,  
         XStoreAddonLicense* addOnLicenses  
)  
```  
  
### Parameters  
  
*async* &nbsp;&nbsp;\_Inout\_  
Type: [XAsyncBlock*](../../xasync/structs/xasyncblock.md)  
  
The XAsyncBlock passed to [XStoreQueryAddOnLicensesAsync](xstorequeryaddonlicensesresult.md).
The [XAsyncBlock](../../xasync/structs/xasyncblock.md) can be used to poll for the call's status and retrieve call results. See [XAsyncBlock](../../xasync/structs/xasyncblock.md) for more information.
  
*count* &nbsp;&nbsp;\_In\_  
Type: uint32_t  
  
The number of elements in the array passed into **addOnLicenses**.  
  
*addOnLicenses* &nbsp;&nbsp;\_Out\_writes\_(count)  
Type: [XStoreAddonLicense*](../structs/xstoreaddonlicense.md)  
  
On success this array will contain Durable add-on licenses.  
  
### Return value

Type: HRESULT
  
HRESULT success or error code.
  
## Remarks  
  
This result function allows you to retrieve the execution results of [XStoreQueryAddOnLicensesAsync](xstorequeryaddonlicensesresult.md), as well as the add-on license that was called for if the execution was successful. As such, this function should be called after [XStoreQueryAddOnLicensesAsync](xstorequeryaddonlicensesresult.md) has been called, usually in the context of a callback function.  
  
See [XStoreQueryAddonLicensesAsync](xstorequeryaddonlicensesasync.md) for a usage example.  
  
## Requirements  
  
**Header:** XStore.h (included in XGameRuntime.h)
  
**Library:** xgameruntime.lib
  
**Supported platforms:** Windows, Xbox One family consoles and Xbox Series consoles  
  
## See also
[XStore](../xstore_members.md)  
[XStoreQueryAddonLicensesAsync](xstorequeryaddonlicensesasync.md)  
[XStoreQueryAddonLicensesResultCount](xstorequeryaddonlicensesresultcount.md)  
  