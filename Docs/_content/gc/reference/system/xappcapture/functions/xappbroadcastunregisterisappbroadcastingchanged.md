---
author: M-Stahl
title: XAppBroadcastUnregisterIsAppBroadcastingChanged
description: Remove an app broadcast status change event handler.
kindex: XAppBroadcastUnregisterIsAppBroadcastingChanged
ms.author: ddobyns
ms.topic: reference
edited: 02/10/2020
quality: good
security: public
applies-to: pc-gdk
---

# XAppBroadcastUnregisterIsAppBroadcastingChanged  

Remove an app broadcast status change event handler.

## Syntax  
  
```cpp
bool XAppBroadcastUnregisterIsAppBroadcastingChanged(  
         XTaskQueueRegistrationToken token,  
         bool wait  
)  
```  
  
### Parameters  
  
*token* &nbsp;&nbsp;\_In\_  
Type: XTaskQueueRegistrationToken  

Event handler token created by [XAppBroadcastRegisterIsAppBroadcastingChanged](xappbroadcastregisterisappbroadcastingchanged.md). Used to unregister the callback.


*wait* &nbsp;&nbsp;\_In\_  
Type: bool  

  
Tells the unregister function to wait in the case that the callback function is running some blocking function. This guarantees that once this function returns there will be no more callbacks; hence safe to shut down.  


  
### Return value
Type: bool
  
## Remarks  
  > [!NOTE]
> This function isn't safe to call on a time-sensitive thread. For more information, see [Time-sensitive threads](../../../../system/overviews/time-sensitive-threads.md).  
  
Each call to [XAppBroadcastRegisterIsAppBroadcastingChanged](xappbroadcastregisterisappbroadcastingchanged.md) should be followed by a call to **AppBroadcastUnregisterIsAppBroadcastingChanged** when the event handler is no longer needed. Failing to call this function will cause memory leaks to occur. This function will unregister the [XAppBroadcastMonitorCallback](xappbroadcastmonitorcallback.md) set by [XAppBroadcastRegisterIsAppBroadcastingChanged](xappbroadcastregisterisappbroadcastingchanged.md).  
  
## Requirements  
  
**Header:** XAppCapture.h
  
**Library:** xgameruntime.lib
  
**Supported platforms:** Windows, Xbox One family consoles and Xbox Series consoles  
  
## See also  
[GameDVR Overview](../../../../system/overviews/gamedvr-broadcast.md)  
[XAppCapture Members](../xappcapture_members.md)  
[XAppBroadcastRegisterIsAppBroadcastingChanged](xappbroadcastregisterisappbroadcastingchanged.md)  
[XAppBroadcastMonitorCallback](xappbroadcastmonitorcallback.md)  
  