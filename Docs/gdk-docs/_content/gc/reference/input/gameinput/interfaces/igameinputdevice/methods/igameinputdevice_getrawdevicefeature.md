---
author: M-Stahl
title: GetRawDeviceFeature
description: Queries a feature report from a HID device.
kindex: GetRawDeviceFeature
ms.author: angillie
ms.topic: reference
edited: 07/02/2019
security: public
---

# IGameInputDevice::GetRawDeviceFeature  
> [!NOTE]
> This function is not yet implemented.

Queries a feature report from a HID device.  

## Syntax  
  
```cpp
HRESULT GetRawDeviceFeature(  
         uint32_t reportId,  
         IGameInputRawDeviceReport** report  
)  
```  
  
### Parameters  
  
*reportId* &nbsp;&nbsp;\_In\_  
Type: uint32_t  

Device defined ID for the feature report.  


*report* &nbsp;&nbsp;\_COM\_Outptr\_  
Type: IGameInputRawDeviceReport**  

The returned feature report.  


  
### Return value  
Type: HRESULT
  
Returns ``E_NOTIMPL``.  
  
## Remarks  

The ``IGameInputDevice::GetRawDeviceFeature`` and ``IGameInputDevice::SetRawDeviceFeature`` methods are used to query and send feature reports with Human Interface Device (HID) devices. There are no restrictions on which features are supported. This is determined by the device or the driver.

![alert](../../../../../../../../resources/gamecore/images/en-us/common/note.gif) **NOTE:** These methods do not support Xbox One or Xbox 360 devices.

  
## Requirements  
  
**Header:** GameInput.h
  
**Library:** xgameruntime.lib
  
**Supported platforms:** Xbox One family consoles and Xbox Series consoles  
  
## See also  

[Advanced GameInput topics](../../../../../../input/advanced/input-advanced-topics.md)  
[Overview of GameInput](../../../../../../input/overviews/input-overview.md)  
[IGameInputDevice::SetRawDeviceFeature](igameinputdevice_setrawdevicefeature.md)    
[IGameInputDevice](../igameinputdevice.md)  
  
  