---
author: M-Stahl
title: XStoreQueryAddOnLicensesAsync
description: Enumerates the licenses the user was granted for durables without bits of the currently running game.
kindex: XStoreQueryAddOnLicensesAsync
ms.author: shanede
ms.topic: reference
edited: 07/12/2021
quality: good
security: public
applies-to: pc-gdk
---

# XStoreQueryAddOnLicensesAsync

Enumerates the licenses of any Durable addons that are attached to a digital game license.
This applies solely to Durable without package types and can only be used with a digital license, not disc licenses.
Running this with a disc license will result in empty results, even if there exist individual durables that are owned or licensable by the user.
For disc scenarios, use [XStoreAcquireLicenseForDurablesAsync](xstoreacquirelicensefordurablesasync.md) instead.

## Syntax  
  
```cpp
HRESULT XStoreQueryAddOnLicensesAsync(  
         const XStoreContextHandle storeContextHandle,  
         XAsyncBlock* async  
)  
```  
  
### Parameters  
  
*storeContextHandle* &nbsp;&nbsp;\_In\_  
Type: XStoreContextHandle  
  
The store context handle for the user returned by [XStoreCreateContext](xstorecreatecontext.md).
  
*async* &nbsp;&nbsp;\_Inout\_  
Type: [XAsyncBlock*](../../xasync/structs/xasyncblock.md)  
  
An [XAsyncBlock](../../xasync/structs/xasyncblock.md) defining the asynchronous work being done.
The [XAsyncBlock](../../xasync/structs/xasyncblock.md) can be used to poll for the call's status and retrieve call results. See [XAsyncBlock](../../xasync/structs/xasyncblock.md) for more information.  
  
### Return value
Type: HRESULT
  
HRESULT success or error code.
  
## Remarks  
  
To retrieve the add-on license as well as the execution result of this function call [XStoreQueryAddonLicensesResult](xstorequeryaddonlicensesresult.md) after calling this function.
To retrieve the number of licenses obtained by this function call [XStoreQueryAddonLicensesResultCount](xstorequeryaddonlicensesresultcount.md) after calling this function.
The result count function is important as it will allow you to determine the appropriate size of array to pass to the result function.
  
The following code snippet shows an example of retrieving Durable add-on licenses (without package) the user owns or can license:
  
```cpp
void CALLBACK QueryAddOnLicensesCallback(XAsyncBlock* asyncBlock)
{
    uint32_t count;
    HRESULT hr = XStoreQueryAddOnLicensesResultCount(
        asyncBlock,
        &count);

    if (FAILED(hr))
    {
        printf("Failed retrieve the add-on license count: 0x%x\r\n", hr);
        return;
    }

    printf("Number of add-on licenses: %d", count);

    XStoreAddonLicense* addOnLicenses = new XStoreAddonLicense[count];
    hr = XStoreQueryAddOnLicensesResult(asyncBlock, count, &addOnLicenses);

    if (FAILED(hr))
    {
        printf("Failed retrieve the add-on licenses: 0x%x\r\n", hr);
        delete[] addOnLicenses;
        return;
    }

    for (uint32_t index = 0; index < count; index++)
    {
        printf("expirationDate : %d\r\n", addOnLicenses[index].expirationDate);
        printf("inAppOfferToken: %s\r\n", addOnLicenses[index].inAppOfferToken);
        printf("isActive       : %s\r\n", addOnLicenses[index].isActive ? "true" : "false");
        printf("skuStoreId     : %s\r\n", addOnLicenses[index].skuStoreId);
    }

    delete[] addOnLicenses;
}

void QueryAddOnLicenses(XStoreContextHandle storeContextHandle, XTaskQueueHandle taskQueueHandle)
{
    auto asyncBlock = std::make_unique<XAsyncBlock>();
    ZeroMemory(asyncBlock.get(), sizeof(*asyncBlock));
    asyncBlock->queue = taskQueueHandle;
    asyncBlock->context = taskQueueHandle;
    asyncBlock->callback = QueryAddOnLicensesCallback;

    HRESULT hr = XStoreQueryAddOnLicensesAsync(
        storeContextHandle,
        asyncBlock.get());

    if (FAILED(hr))
    {
        printf("Failed to get add-on licenses: 0x%x\r\n", hr);
        return;
    }

    // Wait a while for the callbacks to run
    Sleep(5000);
}


```
  
## Requirements  
  
**Header:** XStore.h (included in XGameRuntime.h)
  
**Library:** xgameruntime.lib
  
**Supported platforms:** Windows, Xbox One family consoles and Xbox Series consoles  
  
## See also

[XStore](../xstore_members.md)  
[XStoreQueryAddonLicensesResult](xstorequeryaddonlicensesresult.md)  
[XStoreQueryAddonLicensesResultCount](xstorequeryaddonlicensesresultcount.md)