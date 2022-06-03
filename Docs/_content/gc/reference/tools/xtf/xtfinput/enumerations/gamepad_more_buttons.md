---
author: aablackm
title: GAMEPAD_MORE_BUTTONS
description: Controller button identifier flags for buttons that are only present on Xbox Series controllers.
kindex: GAMEPAD_MORE_BUTTONS
ms.author: stevenpr
ms.topic: reference
security: public
edited: 00/00/0000
quality: good
---

# GAMEPAD_MORE_BUTTONS  

Controller button identifier flags for buttons that are only present on Xbox Series controllers.    

## Syntax  
  
```cpp
typedef enum GAMEPAD_MORE_BUTTONS    
{  
    SHARE = 0x1  
} GAMEPAD_MORE_BUTTONS  
```  
  
## Constants  
  
| Constant | Description |
| --- | --- |
| SHARE | The share button.   |  
  
## Remarks  

*GAMEPAD_MORE_BUTTONS* is used as a mask with [GAMEPAD_REPORT_EX.MoreButtons](../structures/gamepad_report_ex.md) to set the state of buttons that are only present on Xbox Series controllers.
  
## Requirements  
  
**Header:** XtfInput.h  
**Supported platforms:** Windows (for Xbox console tools)  
  
## See also  
[XtfInput](../xtfinput-xbox-microsoft-n.md)  