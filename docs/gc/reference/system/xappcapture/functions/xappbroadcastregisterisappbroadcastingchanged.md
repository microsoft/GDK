---
author: M-Stahl
title: XAppBroadcastRegisterIsAppBroadcastingChanged
description: Register an app broadcast status change event handler.
kindex: XAppBroadcastRegisterIsAppBroadcastingChanged
ms.author: ddobyns
ms.topic: reference
edited: 02/10/2020
quality: good
security: public
applies-to: pc-gdk
---

# XAppBroadcastRegisterIsAppBroadcastingChanged  

Register an app broadcast status change event handler.  

## Syntax  
  
```cpp
HRESULT XAppBroadcastRegisterIsAppBroadcastingChanged(  
         XTaskQueueHandle queue,  
         void* context,  
         XAppBroadcastMonitorCallback* appBroadcastMonitorCallback,  
         XTaskQueueRegistrationToken* token  
)  
```  
  
### Parameters  
  
*queue* &nbsp;&nbsp;\_In\_opt\_  
Type: XTaskQueueHandle  

  
Optional XTaskQueueHandle where a user can create their own callback to be executed from this queue.  


*context* &nbsp;&nbsp;\_In\_opt\_  
Type: void*  

  
Optional information to be passed to the callback function. 


*appBroadcastMonitorCallback* &nbsp;&nbsp;\_In\_  
Type: XAppBroadcastMonitorCallback*  

  
Callback on the status of whether you can broadcast or not changes. Games may use this to know whether or not it is safe to enable showing the broadcast UI.  


*token* &nbsp;&nbsp;\_Out\_  
Type: XTaskQueueRegistrationToken*  

  
Broadcast token.  


  
### Return value
Type: HRESULT
  
Function result.  
  
## Remarks  
  > [!NOTE]
> This function isn't safe to call on a time-sensitive thread. For more information, see [Time-sensitive threads](../../../../system/overviews/time-sensitive-threads.md).  
  
Each call to **AppBroadcastRegisterIsAppBroadcastingChanged** should be followed by a call to [XAppBroadcastUnregisterIsAppBroadcastingChanged](xappbroadcastunregisterisappbroadcastingchanged.md) when the event handler is no longer needed. Failing to call the unregister function will cause memory leaks to occur. This function will register a second function, the [XAppBroadcastMonitorCallback](xappbroadcastmonitorcallback.md), which will be called when the status of the app broadcast changed.
  
## Requirements  
  
**Header:** XAppCapture.h
  
**Library:** xgameruntime.lib
  
**Supported platforms:** Windows, Xbox One family consoles and Xbox Series consoles  
  
## See also  
[GameDVR Overview](../../../../system/overviews/gamedvr-broadcast.md)  
[XAppCapture Members](../xappcapture_members.md)  
[XAppBroadcastUnregisterIsAppBroadcastingChanged](xappbroadcastunregisterisappbroadcastingchanged.md)  
[XAppBroadcastMonitorCallback](xappbroadcastmonitorcallback.md)  