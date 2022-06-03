---
author: M-Stahl
title: XStoreGameLicenseChangedCallback
description: A game defined callback for the game license changed event.
kindex: XStoreGameLicenseChangedCallback
ms.author: shanede
ms.topic: reference
edited: 00/00/0000
quality: good
security: public
applies-to: pc-gdk
---

# XStoreGameLicenseChangedCallback  

A game defined callback for the game license changed event.  

## Syntax  
  
```cpp
void XStoreGameLicenseChangedCallback(  
         void* context  
)  
```  
  
### Parameters  
  
*context* &nbsp;&nbsp;\_In\_  
Type: void*  
  
A game defined context to be passed to the callback.  
  
### Return value
Type: void
  
## Remarks  

A game license change event happens when a purchase related to the current game takes place on this device or when the game's license is refreshed and the game moves from a trial license to a full license. The **XStoreGameLicenseChangedCallback** will be called when such an event occurs. In order for this game defined function to be called, it must first be registered with the [XStoreRegisterGameLicenseChanged](xstoreregistergamelicensechanged.md) function. The function must match the return type and parameters of **XStoreGameLicenseChangedCallback**. In order to avoid a memory leak you must call [XStoreUnregisterGameLicenseChanged](xstoreunregistergamelicensechanged.md) when you are finished with the callback function.

## Requirements  
  
**Header:** XStore.h (included in XGameRuntime.h)
  
**Library:** xgameruntime.lib
  
**Supported platforms:** Windows, Xbox One family consoles and Xbox Series consoles  
  
## See also  
[XStore](../xstore_members.md)  
[XStoreRegisterGameLicenseChanged](xstoreregistergamelicensechanged.md)  
[XStoreUnregisterGameLicenseChanged](xstoreunregistergamelicensechanged.md)  