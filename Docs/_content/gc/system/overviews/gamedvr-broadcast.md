---
author: M-Stahl
title: Game DVR and broadcasting
description: Describes how the Microsoft Game Development Kit (GDK) set of APIs allow broadcast notifications that show broadcasting UI, adding metadata to screenshots, video clips, broadcast, and capturing diagnostic screenshots and video.
kindex:
- Game DVR and broadcasting
- gamedvr
- broadcasting
ms.author: chiowun
ms.topic: conceptual
edited: '08/03/2020'
security: public
---

# Game DVR and broadcasting

The Microsoft Game Development Kit (GDK) includes a set of APIs for broadcast notifications that show
broadcasting UI, adding metadata to screenshots, video clips,
broadcast, and capturing diagnostic screenshots and video. Broadcast
notifications provide insights into the broadcasting pipeline. Broadcasting UI puts the user in control of starting and stopping a
broadcast. Adding metadata makes it easier to search recordings, such as adding the name of a map, a level in the game, or anything about that specific moment that was captured. When combined, these APIs give you better
control and insight over your screenshots, video clips, and broadcast.

## Broadcasting notifications and UI

`XAppBroadcastGetStatus` shows status updates on the state of broadcasting. Use this method to determine if a broadcast can start. Many factors go into determining if a broadcast can start, such as ensuring that the capture resource is available, if the game allows broadcasting, or the user and/or system hasn't disabled broadcasting. If all members
of the `XAppBroadcastStatus` struct (besides `canStartBroadcast`) return
`false`, `canStartBroadcast` returns `true`. If a broadcast can start, call `XAppBroadcastShowUI` to show the broadcast UI for the
current user. Subsequently, the user must manually initiate the broadcast. `XAppBroadcastIsAppBroadcasting` is used to determine if the
current app is broadcasting. `XAppBroadcastUnregisterIsAppBroadcasting` is
used to unregister from change events from broadcast status.

## Adding metadata to a screenshot, video clip, and broadcast

Several APIs are used to add and manage metadata that's attached to a
screenshot, video clip, or broadcast. Adding metadata is optional. However, it
makes it easier for a user to find the recording that they want. Metadata can
take many forms such as strings, integers, doubles. The system allocates storage space for metadata items. If the allocated space runs low, `AppCaptureMetatPriority` is used to determine the relative
priorities of the stored metadata items and the order in which metadata is purged to free up space.

## Voice chat 
Voice chat should be considered user generated content which can contain personally identifiable information or other potentially sensitive data. Because of this a user's rendered voice in game chat should never be included in any recorded clips or game captures. This can be done by assigning the proper audio category to the render stream containing the user's voice, that of `AudioCategory_GameChat`. This tags the stream accordingly so that the system knows to ignore this audio stream when capturing for Game DVR clips.

## Diagnostic screenshots and video clips

With these Microsoft Game Development Kit (GDK) APIs, you can capture screenshots and video clips
for diagnostic purposes. Note that these diagnostic APIs are available only on Development Kits. Calling these APIs on a retail console results in an immediate failure. The captured screenshots and video clips go to the
local game partition and not to the usual user storage. If the game is
running in high dynamic range (HDR), the caller can specify whether to capture a standard dynamic range (SDR)
screenshot, an HDR screenshot, or both of them. After a
screenshot is recorded, the resulting struct contains path
information about the location of the screenshot files. For the video
clips, depending on the user's Game DVR setting, an H264 (Advanced Video Coding (AVC))-encoded
video or an H265 (High Efficiency Video Coding (HEVC))-encoded video can be returned. The resulting struct
also includes information such as start time, duration, and width and height.

## Normal screenshots

New to the Microsoft Game Development Kit (GDK) is the ability to capture the normal screenshots. The resulting screenshots are stored in the normal user storage for
screenshots. Also, a system notification says that a screenshot
was captured. Because the screenshots are stored in a separate partition that's
not directly accessible from the game partition, you must use the provided
open/read/close stream APIs to access the recorded screenshots. Note
that if the game is running in HDR, the paths for both the SDR version and
the HDR version of the screenshots are returned.

## See also

[XAppCapture](../../reference/system/xappcapture/xappcapture_members.md)