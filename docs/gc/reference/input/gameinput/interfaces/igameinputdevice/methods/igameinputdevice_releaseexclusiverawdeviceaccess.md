---
author: M-Stahl
title: ReleaseExclusiveRawDeviceAccess
description: IGameInputDevice ReleaseExclusiveRawDeviceAccess API reference
kindex: ReleaseExclusiveRawDeviceAccess
ms.author: angillie
ms.topic: reference
edited: 07/02/2019
quality: good
security: public
---

# IGameInputDevice::ReleaseExclusiveRawDeviceAccess  
> [!NOTE]
> This function is not yet implemented.

Release exclusive access to a raw device such that it resumes normal focus based operation.

## Syntax  
  
```cpp
void ReleaseExclusiveRawDeviceAccess(  
)  
```  
  
### Parameters  
  
  
## Remarks  
  
This function must be called once for each instance of [IGameInputDevice::AcquireExclusiveRawDeviceAccess](igameinputdevice_acquireexclusiverawdeviceaccess.md). The acquire and release methods follow a reference counting model, so the release method must be called once for each time the acquire method was called. If a process terminates while holding exclusive access, the exclusive access is automatically released.  
  
## Requirements  
  
**Header:** GameInput.h
  
**Library:** xgameruntime.lib
  
**Supported platforms:** Xbox One family consoles and Xbox Series consoles  
  
## See also  

[Input API Overview](../../../../../../input/overviews/input-overview.md)  
[IGameInputDevice](../igameinputdevice.md)  
  
  