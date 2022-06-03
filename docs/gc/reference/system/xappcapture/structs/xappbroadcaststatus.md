---
author: M-Stahl
title: XAppBroadcastStatus
description: Describes the state of broadcasting abilities for an app/game.
kindex: XAppBroadcastStatus
ms.author: ddobyns
ms.topic: reference
edited: 00/00/0000
quality: good
security: public
applies-to: pc-gdk
---

# XAppBroadcastStatus  

Describes the state of broadcasting abilities for a game.  

## Syntax  
  
```cpp
typedef struct XAppBroadcastStatus {  
    bool canStartBroadcast;  
    bool isAnyAppBroadcasting;  
    bool isCaptureResourceUnavailable;  
    bool isGameStreamInProgress;  
    bool isGpuConstrained;  
    bool isAppInactive;  
    bool isBlockedForApp;  
    bool isDisabledByUser;  
    bool isDisabledBySystem;  
} XAppBroadcastStatus  
```
  
### Members  
  
*canStartBroadcast*  
Type: bool  
  
True if a Broadcast can start. False if a broadcast cannot start,. If false, the members inside XAppBroadcastStatus reflect why the broadcast cannot start.  
  
*isAnyAppBroadcasting*  
Type: bool  
  
True if any app is currently broadcasting.  
  
*isCaptureResourceUnavailable*  
Type: bool  
  
True if the capture resources are NOT available.  
  
*isGameStreamInProgress*  
Type: bool  
  
True if a game is currently streaming.  
  
*isGpuConstrained*  
Type: bool  
  
True if GPU is constrained.  
  
*isAppInactive*  
Type: bool  
  
True if the App is Inactive.  
  
*isBlockedForApp*  
Type: bool  
  
True if the app is blocked from streaming.  
  
*isDisabledByUser*  
Type: bool  
  
True if broadcasting is disabled by the system.
  
*isDisabledBySystem*  
Type: bool  
  
True if the system has disabled streaming services.  
  
## Remarks
  
This struct describes whether or not the app is able to begin a broadcast as well as issues that may stop an app from beginning a broadcast. The first member *canStartBroadcast* describes the ability to create a broadcast, every other parameter describes the state of a potential blocking issue. If *canStartBroadcast* is false and the user cannot start the broadcast you should check each of the remaining members as it is likely that one or more will identify an issue keeping the user from broadcasting. It is important to check all of the members as there is a possibility that there is more than one blocking issue.
Output parameter for [XAppBroadcastGetStatus](../functions/xappbroadcastgetstatus.md).

This struct is not meant to determine whether an app is currently broadcasting, for that call [XAppBroadcastIsAppBroadcasting](../functions/xappbroadcastisappbroadcasting.md).

## Requirements  
  
**Header:** XAppCapture.h
  
**Supported platforms:** Windows, Xbox One family consoles and Xbox Series consoles  
  
## See also  
[GameDVR Overview](../../../../system/overviews/gamedvr-broadcast.md)  
[XAppCapture Members](../xappcapture_members.md)  
[XAppBroadcastGetStatus](../functions/xappbroadcastgetstatus.md)  
  