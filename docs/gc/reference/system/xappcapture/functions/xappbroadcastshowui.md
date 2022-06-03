---
author: M-Stahl
title: XAppBroadcastShowUI
description: Show broadcast UI to app user so that they may start broadcasting activity.
kindex: XAppBroadcastShowUI
ms.author: ddobyns
ms.topic: reference
edited: 02/10/2020
quality: good
security: public
applies-to: pc-gdk
---

# XAppBroadcastShowUI  

Show broadcast UI to app user so that they may start broadcasting activity.  

## Syntax  
  
```cpp
HRESULT XAppBroadcastShowUI(  
         XUserHandle requestingUser  
)  
```  
  
### Parameters  
  
*requestingUser* &nbsp;&nbsp;\_In\_  
Type: XUserHandle  

  
The user that the broadcast UI will appear for.  
  
### Return value
Type: HRESULT
  
Function result.  
  
## Remarks  
  > [!NOTE]
> This function isn't safe to call on a time-sensitive thread. For more information, see [Time-sensitive threads](../../../../system/overviews/time-sensitive-threads.md).  
  
This function does not start a broadcast on its own, it merely shows the User the UI that they would need to navigate in order to begin a broadcast.  
You can verify that a broadcast was started by the occurrence of a broadcast status change event or by checking the broadcast status with [XAppBroadcastIsAppBroadcasting](xappbroadcastisappbroadcasting.md). Before calling this function you should also call [XAppBroadcastGetStatus](xappbroadcastgetstatus.md) to check whether or not a user is capable of starting a broadcast.
  
## Requirements  
  
**Header:** XAppCapture.h
  
**Library:** xgameruntime.lib
  
**Supported platforms:** Windows, Xbox One family consoles and Xbox Series consoles  
  
## See also  
[GameDVR Overview](../../../../system/overviews/gamedvr-broadcast.md)  
[XAppCapture Members](../xappcapture_members.md)  
[XAppBroadcastIsAppBroadcasting](xappbroadcastisappbroadcasting.md)  
[XAppBroadcastGetStatus](xappbroadcastgetstatus.md)  