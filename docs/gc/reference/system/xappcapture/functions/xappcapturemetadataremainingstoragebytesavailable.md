---
author: M-Stahl
title: XAppCaptureMetadataRemainingStorageBytesAvailable
description: Returns the remaining storage available for app capture metadata. Measured in bytes.
kindex: XAppCaptureMetadataRemainingStorageBytesAvailable
ms.author: ddobyns
ms.topic: reference
edited: 02/10/2020
quality: good
security: public
applies-to: pc-gdk
---

# XAppCaptureMetadataRemainingStorageBytesAvailable  

Returns the remaining storage available for app capture metadata. Measured in bytes.  

## Syntax  
  
```cpp
HRESULT XAppCaptureMetadataRemainingStorageBytesAvailable(  
         uint64_t* value  
)  
```  
  
### Parameters  
  
*value* &nbsp;&nbsp;\_Out\_  
Type: uint64_t*  
  
The number of bytes still available to store app capture metadata  
  
### Return value
Type: HRESULT
  
Function result.  
  
## Remarks  
  > [!NOTE]
> This function isn't safe to call on a time-sensitive thread. For more information, see [Time-sensitive threads](../../../../system/overviews/time-sensitive-threads.md).  
  
The Capture Platform will impose a limit on the total Metadata that the application can add. The developer can query the amount of storage remaining with this function and use this to determine if he is being over zealous in his use of the metadata. The platform will continue to accept new states and events even after the storage is full, but will perform cleanup operations to ensure the storage constraints are maintained. It is recommended that you monitor the storage available to avoid triggering the [XAppCaptureMetaDataPurgedCallback](xappcapturemetadatapurgedcallback.md).
 
## Requirements  
  
**Header:** XAppCapture.h
  
**Library:** xgameruntime.lib
  
**Supported platforms:** Windows, Xbox One family consoles and Xbox Series consoles  
  
## See also  
[GameDVR Overview](../../../../system/overviews/gamedvr-broadcast.md)  
[XAppCapture Members](../xappcapture_members.md)  
[XAppCaptureMetaDataPurgedCallback](xappcapturemetadatapurgedcallback.md)  
  