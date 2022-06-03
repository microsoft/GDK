---
author: M-Stahl
title: XGameUiMessageDialogButton
description: Enumerates buttons in a customizable message dialog box.
kindex: XGameUiMessageDialogButton
ms.author: aarocar
ms.topic: reference
edited: 01/11/2021
security: public
applies-to: pc-gdk
---

# XGameUiMessageDialogButton  

Enumerates buttons in a customizable message dialog box.  

<a id="syntaxSection"></a>

## Syntax  

```cpp
enum class XGameUiMessageDialogButton : uint32_t  
{  
    First = 0,  
    Second = 1,  
    Third = 2  
}  
```  

<a id="constantsSection"></a>

## Constants  

| Constant | Description |  
| --- | --- |  
| First | The first button. |  
| Second | The second button. |  
| Third | The third button. |  

<a id="remarksSection"></a>

## Remarks  

Two input parameters of the `XGameUiShowMessageDialogAsync` function use this enumeration. For more information, see the Remarks section of [XGameUiShowMessageDialogAsync](../functions/xgameuishowmessagedialogasync.md).  

An output parameter of the [XGameUiShowMessageDialogResult](../functions/xgameuishowmessagedialogresult.md) function also uses this enumeration.  

<a id="requirementsSection"></a>

## Requirements  

**Header:** XGameUI.h

**Supported platforms:** Windows, Xbox One family consoles and Xbox Series consoles  

<a id="seealsoSection"></a>

## See also  

[XGameUI](../xgameui_members.md)  
  