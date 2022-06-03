---
author: M-Stahl
title: XStoreRegisterGameLicenseChanged
description: Registers a callback for the game license changed event.
kindex: XStoreRegisterGameLicenseChanged
ms.author: shanede
ms.topic: reference
edited: 8/13/2021
quality: good
security: public
applies-to: pc-gdk
---

# XStoreRegisterGameLicenseChanged  

Registers a callback for the title license changed event.
This only applies to changes to the running title's license, and not any durable (DLC) licenses.

## Syntax  
  
```cpp
HRESULT XStoreRegisterGameLicenseChanged(  
         XStoreContextHandle storeContextHandle,  
         XTaskQueueHandle queue,  
         void* context,  
         XStoreGameLicenseChangedCallback* callback,  
         XTaskQueueRegistrationToken* token  
)  
```  
  
### Parameters  
  
*storeContextHandle* &nbsp;&nbsp;\_In\_  
Type: XStoreContextHandle  
  
The store context handle for the user returned by [XStoreCreateContext](xstorecreatecontext.md).    
  
*queue* &nbsp;&nbsp;\_In\_  
Type: XTaskQueueHandle  
  
Async queue to handle asynchronous work.    
  
*context* &nbsp;&nbsp;\_In\_opt\_  
Type: void*  
  
Game defined context to be passed to the callback.  
  
*callback* &nbsp;&nbsp;\_In\_  
Type: XStoreGameLicenseChangedCallback*  
  
The callback to register.  
  
*token* &nbsp;&nbsp;\_Out\_  
Type: [XTaskQueueRegistrationToken*](../../xtaskqueue/structs/xtaskqueueregistrationtoken.md)  
  
On success contains a token used to identify the callback.  
  
### Return value
Type: HRESULT
  
HRESULT success or error code.    
  
## Remarks  
  
This function registers the callback function defined by [XStoreGameLicenseChangedCallback](xstoregamelicensechangedcallback.md).
The registered function will be called when the next game license change event occurs.
This event occurs when a purchase related to the current game takes place on this device or when the game's license is refreshed and the game moves from a trial license to a full license.
The registered function will not be called by the act of registration.
In order to avoid a memory leak you must call [XStoreUnregisterGameLicenseChanged](xstoreunregistergamelicensechanged.md) when you are finished with the callback function.

See [XStoreCreateContext](xstorecreatecontext.md) for a usage example.  
  
## Requirements  
  
**Header:** XStore.h (included in XGameRuntime.h)
  
**Library:** xgameruntime.lib
  
**Supported platforms:** Windows, Xbox One family consoles and Xbox Series consoles  
  
## See also  
[XStore](../xstore_members.md)  
[XStoreGameLicenseChangedCallback](xstoregamelicensechangedcallback.md)  
[XStoreUnregisterGameLicenseChanged](xstoreunregistergamelicensechanged.md)
