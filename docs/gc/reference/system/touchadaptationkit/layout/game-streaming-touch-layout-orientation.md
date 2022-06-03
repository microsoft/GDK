---
title: Orientation
description: The orientation of the touch layout.
author: arikcohen
kindex: Touch Adaptation Kit layout, orientation
edited: 00/00/0000
ms.author: arikc
ms.prod: gaming
ms.date: 12/20/2020
ms.topic: reference
security: public
---

# Orientation (Experimental)

The orientation that the touch layout will be displayed.

> [!WARNING]
> Orientation is currently available for use in experimental form and may change behavior based on early adopter feedback.

## Constants

| Constant            | Description                                                                                                                                                                |
| :------------------ | :------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| **landscape**       | Render in landscape mode with the top-left of the layout equating to the top-left of the video stream.                                                                     |
| **portrait**        | Render in portrait mode with the top-left of the layout equating to the bottom-left of the video stream (as if the video stream was rotated 90 degrees counter clockwise). |
| **landscape-left**  | Render in landscape mode with the device top being on the left side.                                                                                                       |
| **landscape-right** | Render in landscape mode with the device top being on the right side.                                                                                                      |
| **portrait-up**     | Render in portrait mode with the device top being on the top side.                                                                                                         |

## Remarks

> [!WARNING]
> The streaming client will always display the video stream in `landscape` orientation in relation to the Xbox video output.

Utilizing an orientation that implies a specific way that the device is being held by the player is likely to have unexpected results for some players. It is recommended to utilize only `landscape` or `portrait` orientations.

## See Also

[Touch Adaptation Kit Reference](../../../../system/overviews/game-streaming/game-streaming-touch-touch-adaptation-kit-overview.md)  
[Layout](game-streaming-touch-layout.md)
