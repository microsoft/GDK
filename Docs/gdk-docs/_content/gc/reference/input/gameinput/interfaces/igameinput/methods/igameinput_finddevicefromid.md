---
author: M-Stahl
title: GetDeviceFromId
description: GetDeviceFromId API reference
kindex: GetDeviceFromId
ms.author: angillie
ms.topic: reference
edited: 07/02/2019
quality: good
security: public
---

# IGameInput::GetDeviceFromId  

Retrieves a device based on its DeviceID.  

## Syntax  
  
```cpp
HRESULT GetDeviceFromId(  
         const APP_LOCAL_DEVICE_ID* value,  
         IGameInputDevice** device  
)  
```  
  
### Parameters  
  
*value* &nbsp;&nbsp;\_In\_  
Type: APP_LOCAL_DEVICE_ID*  

  
System generated ID for the device.  


*device* &nbsp;&nbsp;\_COM\_Outptr\_  
Type: IGameInputDevice**  

  
The returned device.  


### Return value  
Type: HRESULT
  
Function result.  
  
## Remarks  

Once obtained, the [IGameInputDevice](../../igameinputdevice/igameinputdevice.md) instance can be used as a filter in the polling APIs like [IGameInput::GetCurrentReading](igameinput_getcurrentreading.md), or event-based APIs like [IGameInput::RegisterReadingCallback](igameinput_registerreadingcallback.md) (to retrieve input), or used directly to access device-specific information and features. If the provided identifier cannot be matched with any known GameInput device objects, the GetDeviceFrom* methods return a NULL pointer. These methods interrogate local state within the calling process and return quickly, so they are safe to call from time sensitive contexts.  
  
## Requirements  
  
**Header:** GameInput.h
  
**Library:** xgameruntime.lib
  
**Supported platforms:** Xbox One family consoles and Xbox Series consoles  
  
## See also  

[Input API Overview](../../../../../../input/overviews/input-overview.md)  
[IGameInput](../igameinput.md)  
[IGameInputDevice](../../igameinputdevice/igameinputdevice.md)  
[IGameInput::GetCurrentReading](igameinput_getcurrentreading.md)  
[IGameInput::RegisterReadingCallback](igameinput_registerreadingcallback.md)