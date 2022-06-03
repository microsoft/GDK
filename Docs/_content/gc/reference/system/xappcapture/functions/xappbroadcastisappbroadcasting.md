---
author: M-Stahl
title: XAppBroadcastIsAppBroadcasting
description: Determines whether the app is currently broadcasting.
kindex: XAppBroadcastIsAppBroadcasting
ms.author: ddobyns
ms.topic: reference
edited: 02/10/2020
quality: good
security: public
applies-to: pc-gdk
---

# XAppBroadcastIsAppBroadcasting  

Determines whether the app is currently broadcasting.  

## Syntax  
  
```cpp
bool XAppBroadcastIsAppBroadcasting(  
)  
```  
  
### Parameters  
  
  
### Return value
Type: bool
  
Returns true if the app is broadcasting.  
  
## Remarks  
  > [!NOTE]
> This function isn't safe to call on a time-sensitive thread. For more information, see [Time-sensitive threads](../../../../system/overviews/time-sensitive-threads.md).  
  
Call this function to determine whether or not the current app is broadcasting. This could be called after showing the user the broadcast UI with [XAppBroadcastShowUI](xappbroadcastshowui.md). If you expect that the app should be broadcasting and is not you may want to check the broadcast status to see if there is a blocking issue. YOu can do this by calling [XAppBroadcastGetStatus](xappbroadcastgetstatus.md).

## Requirements  
  
**Header:** XAppCapture.h
  
**Library:** xgameruntime.lib
  
**Supported platforms:** Windows, Xbox One family consoles and Xbox Series consoles  
  
## See also  
[GameDVR Overview](../../../../system/overviews/gamedvr-broadcast.md)  
[XAppCapture Members](../xappcapture_members.md)  
[XAppBroadcastShowUI](xappbroadcastshowui.md)  
[XAppBroadcastGetStatus](xappbroadcastgetstatus.md)  