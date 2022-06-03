---
author: M-Stahl
title: XAppCaptureRegisterMetadataPurged
description: Register an event handler for meta data purge events.
kindex: XAppCaptureRegisterMetadataPurged
ms.author: ddobyns
ms.topic: reference
edited: 02/10/2020
quality: good
security: public
applies-to: pc-gdk
---

# AppCaptureRegisterMetadataPurged  

Register an event handler for meta data purge events.  

## Syntax  
  
```cpp
HRESULT XAppCaptureRegisterMetadataPurged(  
         XTaskQueueHandle queue,  
         void* context,  
         XAppCaptureMetadataPurgedCallback* callback,  
         XTaskQueueRegistrationToken* token  
)  
```  
  
### Parameters  
  
*queue* &nbsp;&nbsp;\_In\_opt\_  
Type: XTaskQueueHandle  

  
Async queue to handle asynchronous work. If not assigned a default async queue will be created. 


*context* &nbsp;&nbsp;\_In\_  
Type: void*  

  
Information to be passed to the callback function. Usually the calling object.  


*callback* &nbsp;&nbsp;\_In\_  
Type: XAppCaptureMetadataPurgedCallback*  

  
Callback function to be called after the asynchronous work is finished.  


*token* &nbsp;&nbsp;\_Out\_  
Type: XTaskQueueRegistrationToken*  

  
Token identifying the event handler.  


  
### Return value
Type: HRESULT
  
Function result.  
  
## Remarks  
  > [!NOTE]
> This function isn't safe to call on a time-sensitive thread. For more information, see [Time-sensitive threads](../../../../system/overviews/time-sensitive-threads.md).  
  
Because historical app capture is supported, the system accumulates metadata written with **AppCaptureMetadataWriter** even when not actively capturing or broadcasting. When, for example, a capture of the previous 30 seconds is written to a video file on disk, the metadata associated with the recorded time window is included in the file. The system imposes a limit on the storage space that is allocated per app for storing accumulated metadata. You can get the currently available storage space by checking the RemainingStorageBytesAvailable property.  
When the all of the allotted space has been filled, the system will begin purging metadata using the [XAppCaptureMetadataPriority](../enums/xappcapturemetadatapriority.md) value, specified when the metadata items were written, and the age of each item in order to delete the oldest, least important data first. When this occurs, the **MetadataPurged** event is raised. In response to this event, you may choose to reduce the amount of metadata your app is writing, but this is not required.
  
## Requirements  
  
**Header:** XAppCapture.h
  
**Library:** xgameruntime.lib
  
**Supported platforms:** Windows, Xbox One family consoles and Xbox Series consoles  
  
## See also  
[GameDVR Overview](../../../../system/overviews/gamedvr-broadcast.md)  
[XAppCapture Members](../xappcapture_members.md)  
[XAppCaptureUnRegisterMetadataPurged](xappcaptureunregistermetadatapurged.md)  
  