---
author: M-Stahl
title: FindDeviceFromPlatformHandle
description: Retrieves a connected IGameInputDevice interface based on a matching platform handle.
kindex: FindDeviceFromPlatformHandle
ms.author: angillie
ms.topic: reference
edited: 07/02/2019
security: public
---

# IGameInput::FindDeviceFromPlatformHandle  
> [!NOTE]
> This function is not yet implemented.

Retrieves a connected `IGameInputDevice` interface based on a matching platform handle.  

## Syntax  
  
```cpp
HRESULT FindDeviceFromPlatformHandle(  
         HANDLE value,  
         IGameInputDevice** device  
)  
```  
  
### Parameters  
  
*value* &nbsp;&nbsp;\_In\_  
Type: HANDLE  

Platform handle to match.  

*device* &nbsp;&nbsp;\_COM\_Outptr\_  
Type: IGameInputDevice**  

Returned [IGameInputDevice](../../igameinputdevice/igameinputdevice.md) interface. 

### Return value  
Type: HRESULT
  
Returns `E_NOTIMPL`.  
  
## Remarks  
  
After it is obtained, the `IGameInputDevice` instance is used as a filter in polling or event-based APIs (to retrieve input), or used directly to access device-specific information and features. If the specified handle cannot be matched with any known GameInput device objects, this method returns a `NULL` pointer. The method queries the local state within the calling process and returns quickly, so it is safe to call from time-sensitive contexts. 
  
## Requirements  
  
**Header:** GameInput.h
  
**Library:** xgameruntime.lib
  
**Supported platforms:** Xbox One family consoles and Xbox Series consoles  
  
## See also  

[Advanced GameInput topics](../../../../../../input/overviews/input-overview.md)  
[Overview of GameInput](../../../../../../input/overviews/input-overview.md)  
[IGameInput](../igameinput.md)  
  