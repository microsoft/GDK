---
author: M-Stahl
title: XStoreGetUserPurchaseIdAsync
description: Retrieves a customer purchase ID.
kindex: XStoreGetUserPurchaseIdAsync
ms.author: shanede
ms.topic: reference
edited: 07/02/2019
quality: good
security: public
applies-to: pc-gdk
---

# XStoreGetUserPurchaseIdAsync  

Gets a customer purchase ID.  This ID retrieves a Microsoft Store ID key that can be used to grant entitlements for free products on behalf of the current user.  This API is used in the flow outlined in [Manage products from your services](../../../../commerce/service-to-service/service-to-service-nav.md)  


## Syntax  
  
```cpp
HRESULT XStoreGetUserPurchaseIdAsync(  
         const XStoreContextHandle storeContextHandle,  
         const char* serviceTicket,  
         const char* publisherUserId,  
         XAsyncBlock* async  
)  
```  
  
### Parameters  
  
*storeContextHandle* &nbsp;&nbsp;\_In\_  
Type: XStoreContextHandle  
  
The store context handle for the user returned by [XStoreCreateContext](xstorecreatecontext.md).    
  
*serviceTicket* &nbsp;&nbsp;\_In\_z\_  
Type: char*  
  
The service ticket associated with the purchase.  
  
*publisherUserId* &nbsp;&nbsp;\_In\_z\_  
Type: char*  
  
A string containing the publisher user ID.  
  
*async* &nbsp;&nbsp;\_Inout\_  
Type: [XAsyncBlock*](../../xasync/structs/xasyncblock.md)  
  
An [XAsyncBlock](../../xasync/structs/xasyncblock.md) defining the asynchronous work being done. The [XAsyncBlock](../../xasync/structs/xasyncblock.md) can be used to poll for the call's status and retrieve call results. See [XAsyncBlock](../../xasync/structs/xasyncblock.md) for more information.  
  
### Return value
Type: HRESULT
  
HRESULT success or error code.    
  
## Remarks  

To retrieve the customer's purchase ID as well as the execution result of this function call [XStoreGetUserPurchaseIdResult](xstoregetuserpurchaseidresult.md) after calling this function. To retrieve the size of the customer's purchase ID call [XStoreGetUSerPurchaseIdResultSize](xstoregetuserpurchaseidresultsize.md) after calling this function. Knowing the result size will help you read the result more efficiently.

The following code snippet shows an example of retrieving a customer purchase ID.  
  
```cpp
void CALLBACK GetUserPurchaseIdCallback(XAsyncBlock* asyncBlock)
{
    size_t size;
    HRESULT hr = XStoreGetUserPurchaseIdResultSize(
        asyncBlock,
        &size);

    if (FAILED(hr))
    {
        printf("Failed retrieve the user purchase ID size: 0x%x\r\n", hr);
        return;
    }

    char* result = new char[size];
    hr = XStoreGetUserPurchaseIdResult(
        asyncBlock,
        size,
        result);

    if (FAILED(hr))
    {
        printf("Failed retrieve the user purchase ID result: 0x%x\r\n", hr);
        delete[] result;
        return;
    }

    printf("result: %s\r\n", result);

    delete[] result;
}

void GetUserPurchaseId(XStoreContextHandle storeContextHandle, XTaskQueueHandle taskQueueHandle, const char* serviceTicket, const char* publisherUserId)
{
    auto asyncBlock = std::make_unique<XAsyncBlock>();
    ZeroMemory(asyncBlock.get(), sizeof(*asyncBlock));
    asyncBlock->queue = taskQueueHandle;
    asyncBlock->context = taskQueueHandle;
    asyncBlock->callback = GetUserPurchaseIdCallback;

    HRESULT hr = XStoreGetUserPurchaseIdAsync(
        storeContextHandle,
        serviceTicket,
        publisherUserId,
        asyncBlock.get());

    if (FAILED(hr))
    {
        printf("Failed to get user purchase ID: 0x%x\r\n", hr);
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
[XStoreGetUserPurchaseIdResult](xstoregetuserpurchaseidresult.md)  
[XStoreGetUSerPurchaseIdResultSize](xstoregetuserpurchaseidresultsize.md)  
[Manage products from your services](../../../../commerce/service-to-service/service-to-service-nav.md)
  