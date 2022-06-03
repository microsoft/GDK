---
author: M-Stahl
title: ExecuteRawDeviceIoControl
description: Sends an IOCTL to the underlying device or its driver.
kindex: ExecuteRawDeviceIoControl
ms.author: angillie
ms.topic: reference
edited: 01/06/2020
security: public
---

# ExecuteRawDeviceIoControl  
> [!NOTE]
> This function is not yet implemented.

Sends an IOCTL to the underlying device or its driver.  

<a id="syntaxSection"></a>

## Syntax  
  
```cpp
HRESULT ExecuteRawDeviceIoControl(  
         uint32_t controlCode,  
         size_t inputBufferSize,  
         void const * inputBuffer,  
         size_t outputBufferSize,  
         void * outputBuffer,
         size_t * outputSize  
)  
```  
  
<a id="parametersSection"></a>

### Parameters  
  
*controlCode* &nbsp;&nbsp;\_In\_  
Type: uint32_t  
  
Control code for the operation. This value identifies the specific operation to be performed and the type of device on which to perform it.  

*inputBufferSize* &nbsp;&nbsp;\_In\_  
Type: size_t  

Size of the buffer containing the data required to perform the operation.  

*inputBuffer* &nbsp;&nbsp;\_In\_reads\_bytes\_opt\_(inputBufferSize)  
Type: void\*  
  
User-supplied input buffer that contains the data required to perform the operation. The format of this data depends on the value of the *controlCode* parameter.  

*outputBufferSize* &nbsp;&nbsp;\_In\_  
Type: size_t  
  
Size of the output buffer to receive data returned by the operation.  

*outputBuffer* &nbsp;&nbsp;\_Out\_writes\_bytes\_all\_opt\_(outputBufferSize)  
Type: void\*
  
User-supplied output buffer that is to receive the data returned by the operation. The format of this data depends on the value of the *dwIoControlCode* parameter.  

*outputSize* &nbsp;&nbsp;\_Out\_opt\_ _Result\_zeroonfailure\_
Type: size_t\*

Size of the output in the output buffer.
  
<a id="retvalSection"></a>

### Return value  

Type: HRESULT
  
Returns `E_NOTIMPL`.  
  
<a id="remarksSection"></a>

## Remarks  

This method is intended for device-specific communication, so most well-known input/output controls (IOCTLs) implemented by OS drivers are blocked. This method supports all types of devices. 
  
To send raw data to a device, use [IGameInputDevice::SendRawDeviceOutput](igameinputdevice_sendrawdeviceoutput.md). 
  
<a id="requirementsSection"></a>

## Requirements  
  
**Header:** GameInput.h
  
**Library:** xgameruntime.lib
  
**Supported platforms:** Xbox One family consoles and Xbox Series consoles  
  
<a id="seealsoSection"></a>

## See also  

[Overview of GameInput](../../../../../../input/overviews/input-overview.md)  
[IGameInputDevice](../igameinputdevice.md)  
[GameInput](../../../gameinput_members.md)  
  