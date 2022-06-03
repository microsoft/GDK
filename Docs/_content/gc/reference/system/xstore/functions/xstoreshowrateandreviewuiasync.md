---
author: M-Stahl
title: XStoreShowRateAndReviewUIAsync
description: Displays a system dialog to pop up to allow the user to provide a review or decline to do so.
kindex: XStoreShowRateAndReviewUIAsync
ms.author: shanede
ms.topic: reference
edited: 00/00/0000
quality: good
security: public
applies-to: pc-gdk
---

# XStoreShowRateAndReviewUIAsync  

Displays a system dialog to pop up to allow the user to provide a review for the current game or decline to do so.  

## Syntax  
  
```cpp
HRESULT XStoreShowRateAndReviewUIAsync(  
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
  
An [XAsyncBlock](../../xasync/structs/xasyncblock.md) defining the asynchronous work being done. The [XAsyncBlock](../../xasync/structs/xasyncblock.md) can be used to poll for the call's status and retrieve call results. See [XAsyncBlock](../../xasync/structs/xasyncblock.md) for more information.  
  
### Return value
Type: HRESULT
  
HRESULT success or error code.    
  
## Remarks  
  
To retrieve the execution result of this function call [XStoreShowRateAndReviewUIResult](xstoreshowrateandreviewuiresult.md) after calling this function.  
  
If the system detects a game is calling this excessively, it will hide the dialog and automatically return **CanceledByUser**.  
  
The following code snippet shows an example of displaying a review dialog.  
  
```cpp
void CALLBACK ShowRateAndReviewUICallback(XAsyncBlock* asyncBlock)
{
    XStoreRateAndReviewResult result{};
    HRESULT hr = XStoreShowRateAndReviewUIResult(
        asyncBlock,
        &result);

    if (FAILED(hr))
    {
        printf("Failed to rate and review: 0x%x\r\n", hr);
        return;
    }

    printf("result.wasUpdated: %s\r\n", result.wasUpdated ? "true" : "false");
}

void ShowRateAndReviewUI(XStoreContextHandle storeContextHandle, XTaskQueueHandle taskQueueHandle)
{
    auto asyncBlock = std::make_unique<XAsyncBlock>();
    ZeroMemory(asyncBlock.get(), sizeof(*asyncBlock));
    asyncBlock->queue = taskQueueHandle;
    asyncBlock->context = taskQueueHandle;
    asyncBlock->callback = ShowRateAndReviewUICallback;

    HRESULT hr = XStoreShowRateAndReviewUIAsync(
        storeContextHandle,
        asyncBlock.get());

    if (FAILED(hr))
    {
        printf("Failed rate and review: 0x%x\r\n", hr);
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
[XStoreShowRateAndReviewUIResult](xstoreshowrateandreviewuiresult.md)  
  
  