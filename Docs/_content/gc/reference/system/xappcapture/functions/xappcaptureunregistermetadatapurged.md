---
author: M-Stahl
title: XAppCaptureUnRegisterMetadataPurged
description: Remove an event handler for meta data purge events.
kindex: XAppCaptureUnRegisterMetadataPurged
ms.author: ddobyns
ms.topic: reference
edited: 02/10/2020
quality: good
security: public
applies-to: pc-gdk
---

# XAppCaptureUnRegisterMetadataPurged  

Remove an event handler for meta data purge events.  

## Syntax  
  
```cpp
bool XAppCaptureUnRegisterMetadataPurged(  
         XTaskQueueRegistrationToken token,  
         bool wait  
)  
```  
  
### Parameters  
  
*token* &nbsp;&nbsp;\_In\_  
Type: XTaskQueueRegistrationToken  

  
Event handler token created by [XAppCaptureRegisterMetadataPurged](xappcaptureregistermetadatapurged.md).  

*wait* &nbsp;&nbsp;\_In\_  
Type: bool  
  
Tells the unregister function to wait in the case that the callback function is running some blocking function.

  
### Return value
Type: bool
  
## Remarks  
  > [!NOTE]
> This function isn't safe to call on a time-sensitive thread. For more information, see [Time-sensitive threads](../../../../system/overviews/time-sensitive-threads.md).  
  
Each instance of [XAppCaptureRegisterMetadataPurged](xappcaptureregistermetadatapurged.md) needs to be followed by an instance of AppCaptureUnRegisterMetadataPurged when the event handler is no longer needed. Failure to remove the handle will result in a memory leak. It is recommended that you call this function after the app has finished capture activity or before the app is shut down.
  
## Requirements  
  
**Header:** XAppCapture.h
  
**Library:** xgameruntime.lib
  
**Supported platforms:** Windows, Xbox One family consoles and Xbox Series consoles  
  
## See also  
[GameDVR Overview](../../../../system/overviews/gamedvr-broadcast.md)  
[XAppCapture Members](../xappcapture_members.md)  
[XAppCaptureRegisterMetadataPurged](xappcaptureregistermetadatapurged.md)