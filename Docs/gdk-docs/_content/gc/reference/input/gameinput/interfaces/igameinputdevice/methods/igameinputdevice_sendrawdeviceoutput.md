---
author: M-Stahl
title: SendRawDeviceOutput
description: Sends raw data to the device.
kindex: SendRawDeviceOutput
ms.author: angillie
ms.topic: reference
edited: 07/02/2019
security: public
---

# IGameInputDevice::SendRawDeviceOutput  
> [!NOTE]
> This function is not yet implemented.

Sends raw data to the device.  

## Syntax  
  
```cpp
HRESULT SendRawDeviceOutput(  
         IGameInputRawDeviceReport* report  
)  
```  
  
### Parameters  
  
*report* &nbsp;&nbsp;\_In\_  
Type: IGameInputRawDeviceReport*  

Report sent to the device.  


  
### Return value  

Type: HRESULT
  
Returns ``E_NOTIMPL``.  
  
## Remarks  

The ``SendRawDeviceOutput`` method sends data to the device. For Human Interface Device (HID) devices, this takes the form of an output report. For Xbox One devices, this takes the form of a GIP message. For intermediate and advanced use-cases of the GameInput API, see [Advanced GameInput topics](../../../../../../input/advanced/input-advanced-topics.md).

![alert](../../../../../../../../resources/gamecore/images/en-us/common/note.gif) **NOTE:** This method does not support Xbox 360 devices.
  
## Requirements  
  
**Header:** GameInput.h
  
**Library:** xgameruntime.lib
  
**Supported platforms:** Xbox One family consoles and Xbox Series consoles  
  
## See also  
 
[Overview of GameInput](../../../../../../input/overviews/input-overview.md)   
[IGameInputDevice](../igameinputdevice.md)  
  
  