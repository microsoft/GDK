---
author: M-Stahl
title: FindDeviceFromPlatformString
description: Retrieves an IGameInputDevice interface based on a matching platform string.
kindex: FindDeviceFromPlatformString
ms.author: angillie
ms.topic: reference
edited: 07/02/2019
security: public
---

# IGameInput::FindDeviceFromPlatformString  
> [!NOTE]
> This function is not yet implemented.

Retrieves an `IGameInputDevice` interface based on a matching platform string.  

## Syntax  
  
```cpp
HRESULT FindDeviceFromPlatformString(  
         LPCWSTR value,  
         IGameInputDevice** device  
)  
```  
  
### Parameters  
  
*value* &nbsp;&nbsp;\_In\_  
Type: LPCWSTR  
  
Platform string to match.  

*device* &nbsp;&nbsp;\_COM\_Outptr\_  
Type: IGameInputDevice**  
  
Returned [IGameInputDevice](../../igameinputdevice/igameinputdevice.md) interface.  
  
### Return value  
Type: HRESULT
  
Returns `E_NOTIMPL`.  
  
## Remarks  
  
After it is obtained, the `IGameInputDevice` instance is used as a filter in the polling or event-based APIs (to retrieve input), or used directly to access device-specific information and features. If the specified platform string cannot be matched with any known GameInput device objects, this method returns a `NULL` pointer. The method queries the local state within the calling process and returns quickly, so it is safe to call from time-sensitive contexts. 
  
## Requirements  
  
**Header:** GameInput.h
  
**Library:** xgameruntime.lib
  
**Supported platforms:** Xbox One family consoles and Xbox Series consoles  
  
## See also  

[Advanced GameInput topics](../../../../../../input/advanced/input-advanced-topics.md)  
[IOverview of GameInput](../../../../../../input/overviews/input-overview.md)  
[IGameInput](../igameinput.md)  
  