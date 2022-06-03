---
author: M-Stahl
title: FindDeviceFromObject
description: Retrieves a connected IGameInputDevice based on a matching object.
kindex: FindDeviceFromObject
ms.author: angillie
ms.topic: reference
edited: 07/02/2019
security: public
---

# IGameInput::FindDeviceFromObject  
> [!NOTE]
> This function is not yet implemented.

Retrieves a connected `IGameInputDevice` interface based on a matching object.

## Syntax  
  
```cpp
HRESULT FindDeviceFromObject(  
         IUnknown* value,  
         IGameInputDevice** device  
)  
```  
  
### Parameters  
  
*value* &nbsp;&nbsp;\_In\_  
Type: IUnknown*  
  
Object to match with the [IGameInputDevice](../../igameinputdevice/igameinputdevice.md) instance.  

*device* &nbsp;&nbsp;\_COM\_Outptr\_  
Type: IGameInputDevice**  

Returned [IGameInputDevice](../../igameinputdevice/igameinputdevice.md) interface.  
  
### Return value  
Type: HRESULT

Returns `E_NOTIMPL`.  
  
## Remarks  
  
After it is obtained, the `IGameInputDevice` instance is used as a filter in polling or event-based APIs (to retrieve input), or used directly to access device-specific information and features.  

This method retrieves a connected `IGameInputDevice` interface based on a matching object. `IGameInputDevice` is used as a filter in the polling or event-based APIs (to retrieve input), or used directly to access device-specific information and features. If the specified object cannot be matched with any known GameInput device objects, this method returns a `NULL` pointer. The method queries the local state within the calling process and returns quickly, so it is safe to call from time-sensitive contexts. 
  
## Requirements  
  
**Header:** GameInput.h
  
**Library:** xgameruntime.lib
  
**Supported platforms:** Xbox One family consoles and Xbox Series consoles  
  
## See also  

[Advanced GameInput topics](../../../../../../input/overviews/input-overview.md)  
[Overview of GameInput](../../../../../../input/overviews/input-overview.md)  
[IGameInput](../igameinput.md)  