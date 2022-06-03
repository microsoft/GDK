---
author: M-Stahl
title: XAppBroadcastMonitorCallback
description: Sets the callback function for [XAppBroadcastRegisterIsAppBroadcastingChanged](xappbroadcastregisterisappbroadcastingchanged.md). The function set here will be called each time the broadcast status changes.
kindex: XAppBroadcastMonitorCallback
ms.author: ddobyns
ms.topic: reference
edited: 00/00/0000
quality: good
security: public
applies-to: pc-gdk
---

# XAppBroadcastMonitorCallback  

Developer defined callback function for [XAppBroadcastRegisterIsAppBroadcastingChanged](xappbroadcastregisterisappbroadcastingchanged.md). The function set here will be called each time the broadcast status changes.  

## Syntax  
  
```cpp
void XAppBroadcastMonitorCallback(  
         void* context  
)  
```  
  
### Parameters  
  
*context* &nbsp;&nbsp;\_In\_  
Type: void*  

Context for the calling object, used to pass relevant information into the callback function.
  
### Return value
Type: void
  
## Remarks  

Setting this callback function will allow you to check for the start or end of a broadcast. This allows developers to change behaviors like network activity in the event of an ongoing broadcast. Parameter for [XAppBroadcastRegisterIsAppBroadcastingChanged](xappbroadcastregisterisappbroadcastingchanged.md).

## Requirements  
  
**Header:** XAppCapture.h
  
**Library:** xgameruntime.lib
  
**Supported platforms:** Windows, Xbox One family consoles and Xbox Series consoles  
  
## See also  
[GameDVR Overview](../../../../system/overviews/gamedvr-broadcast.md)  
[XAppCapture Members](../xappcapture_members.md)  
[XAppBroadcastRegisterIsAppBroadcastingChanged](xappbroadcastregisterisappbroadcastingchanged.md)  
  