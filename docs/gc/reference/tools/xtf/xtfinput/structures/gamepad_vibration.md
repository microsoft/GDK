---
author: aablackm
title: GAMEPAD_VIBRATION
description: TBD
kindex: GAMEPAD_VIBRATION
ms.author: TBD
ms.topic: reference
edited: 00/00/0000
security: public
---

# GAMEPAD_VIBRATION  

TBD  

## Syntax  

```cpp
struct GAMEPAD_VIBRATION {
  ULONG64 ControllerId;
  BYTE LeftImpulsePercent;
  BYTE RightImpulsePercent;
  BYTE LeftRumblePercent;
  BYTE RightRumblePercent;
}
```

## Members  

`ControllerId`  
Type: ULONG64  

TBD  

`LeftImpulsePercent`  
Type: BYTE  

TBD  

`RightImpulsePercent`  
Type: BYTE  

TBD  

`LeftRumblePercent`  
Type: BYTE  

TBD  

`RightRumblePercent`  
Type: BYTE  

TBD  

## Requirements  

**Header:** xtfinput.h  
**Library:** xtfinput.lib  
**Supported platforms:** Windows (for Xbox console tools)  

## See also  

[XtfInput](../xtfinput-xbox-microsoft-n.md)  

