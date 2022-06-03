---
author: M-Stahl
title: XStoreQueryLicenseTokenAsync
description: Provides an opaque token to the calling game that can be passed to the game's service to make B2B calls.
kindex: XStoreQueryLicenseTokenAsync
ms.author: shanede
ms.topic: reference
edited: 07/02/2019
quality: good
security: public
applies-to: pc-gdk
---

# XStoreQueryLicenseTokenAsync  

Provides an opaque JSON Web Token to the calling game that can be passed to the game’s service for validation of entitlement and to make B2B calls. See [License Tokens Overview](../../../../commerce/pc-specific-considerations/xstore-license-tokens.md) for more information.

## Syntax  
  
```cpp
HRESULT XStoreQueryLicenseTokenAsync(  
         const XStoreContextHandle storeContextHandle,  
         const char** productIds,  
         size_t productIdsCount,  
         const char* customDeveloperString,  
         XAsyncBlock* async  
)  
```  
  
### Parameters  
  
*storeContextHandle* &nbsp;&nbsp;\_In\_  
Type: XStoreContextHandle  
  
The store context handle for the user returned by [XStoreCreateContext](xstorecreatecontext.md).    
  
*productIds* &nbsp;&nbsp;\_In\_z\_count\_(productIdsCount)  
Type: char**  
  
An array of product IDs to retrieve tokens for.  
  
*productIdsCount* &nbsp;&nbsp;\_In\_  
Type: size_t  
  
The number of IDs in the array passed into **productIds**.  
  
*customDeveloperString* &nbsp;&nbsp;\_In\_z\_  
Type: char*  
  
A value that is round tripped into the token. This is generally chosen by the service. You can insert something like a userId or email to track the user's token in the license token. A license token is used like a receipt of ownership.  

This cannot be null or the empty string. 
  
*async* &nbsp;&nbsp;\_Inout\_  
Type: [XAsyncBlock*](../../xasync/structs/xasyncblock.md)  
  
An [XAsyncBlock](../../xasync/structs/xasyncblock.md) defining the asynchronous work being done. The [XAsyncBlock](../../xasync/structs/xasyncblock.md) can be used to poll for the call's status and retrieve call results. See [XAsyncBlock](../../xasync/structs/xasyncblock.md) for more information.  
  
### Return value
Type: HRESULT
  
HRESULT success or error code.    
  
## Remarks  
  
To retrieve the JSON web token as well as the execution result of this function call [XStoreQueryLicenseTokenResult](xstorequerylicensetokenresult.md) after calling this function. To retrieve the size of the JSON web token call [XStoreQueryLicenseTokenResultSize](xstorequerylicensetokenresultsize.md) after calling this function. Know the size of the token will allow you to retrieve it more efficiently.
  
The license token is a Base64 encoded JSON Web Token. The token's payload is a Base64 encoded string that converts to JSON values that can be used on the server for validation.


The following code snippet shows an example of retrieving a license token.  
  
```cpp
void CALLBACK QueryLicenseTokenCallback(XAsyncBlock* asyncBlock)
{
    size_t size;
    HRESULT hr = XStoreQueryLicenseTokenResultSize(
        asyncBlock,
        &size);

    if (FAILED(hr))
    {
        printf("Failed retrieve the license token size: 0x%x\r\n", hr);
        return;
    }

    char* result = new char[size];
    hr = XStoreQueryLicenseTokenResult(
        asyncBlock,
        size,
        result);

    if (FAILED(hr))
    {
        printf("Failed retrieve the license token result: 0x%x\r\n", hr);
        delete[] result;
        return;
    }

    printf("result: %s\r\n", result);

    delete[] result;
}

void QueryLicenseToken(XStoreContextHandle storeContextHandle, XTaskQueueHandle taskQueueHandle, const char** productIds, size_t productIdsCount, const char* customDeveloperString)
{
    auto asyncBlock = std::make_unique<XAsyncBlock>();
    ZeroMemory(asyncBlock.get(), sizeof(*asyncBlock));
    asyncBlock->queue = taskQueueHandle;
    asyncBlock->context = taskQueueHandle;
    asyncBlock->callback = QueryLicenseTokenCallback;

    HRESULT hr = XStoreQueryLicenseTokenAsync(
        storeContextHandle,
        productIds,
        productIdsCount,
        customDeveloperString,
        asyncBlock.get());

    if (FAILED(hr))
    {
        printf("Failed to get license token: 0x%x\r\n", hr);
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

[License Tokens Overview](../../../../commerce/pc-specific-considerations/xstore-license-tokens.md)

[XStoreQueryLicenseTokenResult](xstorequerylicensetokenresult.md)  

[XStoreQueryLicenseTokenResultSize](xstorequerylicensetokenresultsize.md)  

  