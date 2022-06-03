---
author: M-Stahl
title: XAppBroadcastGetStatus
description: Retrieves the current status for broadcasting for the device and current app.
kindex: XAppBroadcastGetStatus
ms.author: ddobyns
ms.topic: reference
edited: 02/10/2020
quality: good
security: public
applies-to: pc-gdk
---

# XAppBroadcastGetStatus  

Retrieves the current status for broadcasting for the device and current app.  

## Syntax  
  
```cpp
HRESULT XAppBroadcastGetStatus(  
         XUserHandle requestingUser,  
         XAppBroadcastStatus* appBroadcastStatus  
)  
```  
  
### Parameters  
  
*requestingUser* &nbsp;&nbsp;\_In\_  
Type: XUserHandle  

Handle for the user requesting a broadcast status.  

*appBroadcastStatus* &nbsp;&nbsp;\_Out\_  
Type: [XAppBroadcastStatus*](../structs/xappbroadcaststatus.md)  

The broadcast status of the *requestingUser*.  
  
### Return value
Type: HRESULT
  
Function result.  
  
## Remarks  
  > [!NOTE]
> This function isn't safe to call on a time-sensitive thread. For more information, see [Time-sensitive threads](../../../../system/overviews/time-sensitive-threads.md).  
  
Use this function to determine whether or not you can start broadcasting for your game. Retrieving the broadcast status may also reveal the reason you are unable to broadcast in the event you are not able to. It is recommended you call this function before calling the [XAppBroadcastShowUI](xappbroadcastshowui.md) method.
If you would like to see whether your game is currently broadcasting call [XAppBroadcastIsAppBroadcasting](xappbroadcastisappbroadcasting.md).
  
## Requirements  
  
**Header:** XAppCapture.h
  
**Library:** xgameruntime.lib
  
**Supported platforms:** Windows, Xbox One family consoles and Xbox Series consoles  
  
## See also  
[GameDVR Overview](../../../../system/overviews/gamedvr-broadcast.md)  
[XAppCapture Members](../xappcapture_members.md)  
[XAppBroadcastShowUI](xappbroadcastshowui.md)  
[XAppBroadcastIsAppBroadcasting](xappbroadcastisappbroadcasting.md)  