---
author: M-Stahl
title: SetRawDeviceFeature
description: Sends a feature report to a HID device.
kindex: SetRawDeviceFeature
ms.author: angillie
ms.topic: reference
edited: 01/06/2020
security: public
---

# IGameInputDevice::SetRawDeviceFeature  
> [!NOTE]
> This function is not yet implemented.

Sends a feature report to a HID device.  

## Syntax  
  
```cpp
HRESULT SetRawDeviceFeature(  
         IGameInputRawDeviceReport* report  
)  
```  
  
### Parameters  
  
*report* &nbsp;&nbsp;\_In\_  
Type: IGameInputRawDeviceReport*  

Device-defined ID for the feature report.


  
### Return value  

Type: HRESULT
  
Returns ``E_NOTIMPL``.  
  
## Remarks  

The ``IGameInputDevice::SetRawDeviceFeature``and  [IGameInputDevice::GetRawDeviceFeature](igameinputdevice_getrawdevicefeature.md) methods are used to query and send feature reports with Human Interface Device (HID) devices. There are no restrictions on which features are supported. This is determined by the device or the driver. 

![alert](../../../../../../../../resources/gamecore/images/en-us/common/note.gif) **NOTE:** These methods do not support Xbox One or Xbox 360 devices.

  
## Requirements  
  
**Header:** GameInput.h
  
**Library:** xgameruntime.lib
  
**Supported platforms:** Xbox One family consoles and Xbox Series consoles  
  
## See also  

[Advanced GameInput topics](../../../../../../input/advanced/input-advanced-topics.md)    
[Overview of GameInput](../../../../../../input/overviews/input-overview.md)  
[IGameInputDevice](../igameinputdevice.md)  
  
  