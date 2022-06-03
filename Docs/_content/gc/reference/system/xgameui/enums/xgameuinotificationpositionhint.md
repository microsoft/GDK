---
author: M-Stahl
title: XGameUiNotificationPositionHint
description: Describes the preferred position for toast notifications to be shown on the current title.
kindex: XGameUiNotificationPositionHint
ms.author: aarocar
ms.topic: reference
edited: 00/00/0000
quality: good
security: public
applies-to: pc-gdk
---

# XGameUiNotificationPositionHint  

Describes the preferred position for toast notifications to be shown on the current title.

## Syntax  

```cpp
enum class XGameUiNotificationPositionHint  : uint32_t  
{  
    BottomCenter = 0,  
    BottomLeft = 1,  
    BottomRight = 2,  
    TopCenter = 3,  
    TopLeft = 4,  
    TopRight = 5  
}  
```  

## Constants  

| Constant | Description |
| --- | --- |
| BottomCenter | Indicates that toast notifications are preferred in the bottom center. |  
| BottomLeft | Indicates that toast notifications are preferred in the bottom left. |  
| BottomRight | Indicates that toast notifications are preferred in the bottom right. |  
| TopCenter | Indicates that toast notifications are preferred in the top center. |  
| TopLeft | Indicates that toast notifications are preferred in the top left. |  
| TopRight | Indicates that toast notifications are preferred in the top right. |  
  
## Remarks  
  
The notification position is a hint to the operating system on where to display toast notifications. In some cases, the system may choose to ignore the setting if the current UI cannot support displaying notifications in that location.

Parameter for [XGameUiSetNotificationPositionHint](../functions/xgameuisetnotificationpositionhint.md).
  
## Requirements  
  
**Header:** XGameUI.h
  
**Supported platforms:** Windows, Xbox One family consoles and Xbox Series consoles  
  
## See also  
[XGameUI](../xgameui_members.md)  
[XGameUiSetNotificationPositionHint](../functions/xgameuisetnotificationpositionhint.md)  
  