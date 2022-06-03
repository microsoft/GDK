---
author: M-Stahl
title: AcquireExclusiveRawDeviceAccess
description: IGameInputDevice AcquireExclusiveRawDeviceAccess API reference
kindex: AcquireExclusiveRawDeviceAccess
ms.author: angillie
ms.topic: reference
edited: 07/02/2019
quality: good
security: public
---

# IGameInputDevice::AcquireExclusiveRawDeviceAccess  
> [!NOTE]
> This function is not yet implemented.

Give the title process exclusive access to the device even when the process loses focus.  

## Syntax  
  
```cpp
bool AcquireExclusiveRawDeviceAccess(  
         uint64_t timeoutInMicroseconds  
)  
```  
  
### Parameters  
  
*timeoutInMicroseconds* &nbsp;&nbsp;\_In\_  
Type: uint64_t  

  
Time to wait for access to the device before timing out the access request.  


  
### Return value  
Type: bool
  
This function is not yet implemented.


 
Once implemented, function will return a false result if the exclusive access is not granted within the specified *timeoutInMicroseconds* time interval.
  
## Remarks  
  
Acquiring exclusive raw device access only enables raw device I/O to and from the device; regular input is still sent to the process that is currently in focus (there is no way to subvert this behavior). When a process has exclusive raw access to a device, regular output methods (e.g. haptic/force feedback) can still be called by any process, but no output is sent to the device until exclusive access is released – even from the process in focus, and even if the process in focus is the process with exclusive raw device access. This is done to ensure that no unexpected messages are sent to the device in the middle of a low-level I/O transaction.  
When the process is finished performing its exclusive device I/O, it must call ReleaseExclusiveRawDeviceAccess to resume normal (focus-based) output communication with the device. The acquire and release methods follow a reference counting model, so the release method must be called once for each time the acquire method was called. If a process terminates while holding exclusive access, the exclusive access is automatically released.  
Only one process can have exclusive access at a time. Attempts by other processes to call the AcquireExclusiveRawDeviceAccess method result in a failure HRESULT being returned, if exclusive access cannot be acquired within the specified timeout interval.  

This function must be followed by a call to [IGameInputDevice::ReleaseExclusiveRawDeviceAccess](igameinputdevice_releaseexclusiverawdeviceaccess.md). The acquire and release methods follow a reference counting model, so the release method must be called once for each time the acquire method was called. If a process terminates while holding exclusive access, the exclusive access is automatically released.
  
## Requirements  
  
**Header:** GameInput.h
  
**Library:** xgameruntime.lib
  
**Supported platforms:** Xbox One family consoles and Xbox Series consoles  
  
## See also  

[Input API Overview](../../../../../../input/overviews/input-overview.md)  
[IGameInputDevice](../igameinputdevice.md)  
  
  