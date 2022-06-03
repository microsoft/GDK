---
author: M-Stahl
title: EnableOemDeviceSupport
description: Specifies a plug-and-play device that the caller wants like the GameInput API to expose in its input stream.
kindex: EnableOemDeviceSupport
ms.author: angillie
ms.topic: reference
edited: 07/02/2019
security: public
---

# IGameInput::EnableOemDeviceSupport  
> [!NOTE]
> This function is not yet implemented.

Specifies a plug-and-play device that the caller wants like the GameInput API to expose in its input stream.  

## Syntax  
  
```cpp
HRESULT EnableOemDeviceSupport(  
         uint16_t vendorId,  
         uint16_t productId,  
         uint8_t interfaceNumber,  
         uint8_t collectionNumber  
)  
```  
  
### Parameters  
  
*vendorId* &nbsp;&nbsp;\_In\_  
Type: uint16_t  

  
Vendor ID (VID) used to identify the OEM device.  


*productId* &nbsp;&nbsp;\_In\_  
Type: uint16_t  

  
Product ID (PID) used to identify the OEM device. 


*interfaceNumber* &nbsp;&nbsp;\_In\_  
Type: uint8_t  

  
USB interface number (if applicable).  


*collectionNumber* &nbsp;&nbsp;\_In\_  
Type: uint8_t  

  
HID collection number (as assigned by ``HIDCLASS.sys``, if applicable).  

  
### Return value  
Type: HRESULT
  
Returns ``E_NOTIMPL``.  
  
## Remarks  
  
Enabling a device with this method allows raw access to the device, such as input/output controls (IOCTLs). The OEM consumes the raw input reports from such devices and exposes the underlying data via its own API surface.  

Devices are identified by a combination of their VID/PID, USB interface number (if applicable), and HID collection number (as assigned by ``HIDCLASS.sys``) if applicable. This is a stable identification method that is tied to how the OEM device’s firmware presents itself to the system that they control.

Devices exposed via the ``EnableOemDeviceSupport`` method are visible only to the applications that requested them. Support for an OEM device remains enabled for a given process until all references to the ``IGameInput`` interface (and any other outstanding GameInput interfaces) are released by that process.

An application can enable support for up to 1024 different OEM devices. Exceeding this limit causes a failure ``HRESULT`` to be returned. This method returns quickly and is safe to call from time-sensitive contexts.  
  
## Requirements  
  
**Header:** GameInput.h
  
**Library:** xgameruntime.lib
  
**Supported platforms:** Xbox One family consoles and Xbox Series consoles  
  
## See also  

[Advanced GameInput topics](../../../../../../input/advanced/input-advanced-topics.md)  
[Overview of GameInput](../../../../../../input/overviews/input-overview.md)  
[IGameInput](../igameinput.md)  
  
  