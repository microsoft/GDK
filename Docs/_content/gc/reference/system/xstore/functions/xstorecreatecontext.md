---
author: M-Stahl
title: XStoreCreateContext
description: Creates a store context for the specified user.
kindex: XStoreCreateContext
ms.author: shanede
ms.topic: reference
edited: 02/10/2020
quality: good
security: public
applies-to: pc-gdk
---

# XStoreCreateContext  

Creates a store context for the specified user.  

## Syntax  
  
```cpp
HRESULT XStoreCreateContext(  
         const XUserHandle user,  
         XStoreContextHandle* storeContextHandle  
)  
```  
  
### Parameters  
  
*user* &nbsp;&nbsp;\_In\_opt\_  
Type: XUserHandle  
  
The user to create the store context for.  
This parameter is optional for PC games only: simply pass a nullptr value. On PC the user signed into the Microsoft Store is used automatically and this parameter is ignored.
A valid XUser is required for console games. 
  
*storeContextHandle* &nbsp;&nbsp;\_Out\_  
Type: XStoreContextHandle*  
  
On success contains the created store cotext.  
  
### Return value
Type: HRESULT
  
HRESULT success or error code.    
  
## Remarks  
 **NOTE:** On consoles, the XStoreContextHandle created by this function is invalidated after a Suspend or Quick Resume event. To safely handle these conditions we recommend closing a XStoreContextHandle and recreating it whenever the game resumes from a suspended state. 
 > [!NOTE]
> This function isn't safe to call on a time-sensitive thread. For more information, see [Time-sensitive threads](../../../../system/overviews/time-sensitive-threads.md).  
  
When you are finished with the **XStoreContextHandle** created by this function, you must close it with [XStoreCloseContextHandle](xstoreclosecontexthandle.md). Failure to close the handle will cause a memory leak. The store context is used to identify the user to retrieve information for in a number of the **XStore** API calls. The following code snippet shows an example of creating a store context.

```cpp
void CALLBACK GameLicenseChangedCallback(void* context)
{
    UNREFERENCED_PARAMETER(context);
    printf("**** License Changed ****\r\n");
}

void CreateStoreContextHandle(XUserHandle userHandle, XTaskQueueHandle taskQueueHandle)
{
    // As a rule, it would be a good idea to create one of these
    // and keep it alive through the lifetime of the game
    XStoreContextHandle storeContextHandle;

    HRESULT hr = XStoreCreateContext(userHandle, &storeContextHandle);
    if (FAILED(hr))
    {
        printf("Failed creating store context: 0x%x\r\n", hr);
        return;
    }

    XTaskQueueRegistrationToken gameLicenseChangedToken = { 0 };
    hr = XStoreRegisterGameLicenseChanged(
        storeContextHandle,
        taskQueueHandle,
        storeContextHandle,
        GameLicenseChangedCallback,
        &gameLicenseChangedToken);

    if (FAILED(hr))
    {
        printf("Failed register for game license changed callback: 0x%x\r\n", hr);
        XStoreCloseContextHandle(storeContextHandle);
        return;
    }

    //Unregistering the license changed event and closing the XStoreContextHandle would usually go in the cleanup/shutdown sections of your game code. 
    XStoreUnregisterGameLicenseChanged(
        storeContextHandle,
        gameLicenseChangedToken,
        true);

    XStoreCloseContextHandle(storeContextHandle);
}

```
  
## Requirements  
  
**Header:** XStore.h (included in XGameRuntime.h)
  
**Library:** xgameruntime.lib
  
**Supported platforms:** Windows, Xbox One family consoles and Xbox Series consoles  
  
## See also  
[XStore](../xstore_members.md)  
[XStoreCloseContextHandle](xstoreclosecontexthandle.md)  
[XStoreRegisterGameLicenseChanged](xstoreregistergamelicensechanged.md)  