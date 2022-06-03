---
author: aablackm
title: XtfInput (API contents)
description: The XTF API that is used to simulate controller input on a development console.
ms.assetid: N:Windows.Xbox.xtfinput
kindex: XtfInput
ms.author: stevenpr
ms.topic: navigation
edited: 01/06/2020
security: public
---

# XtfInput


The Xbox Tools Framework (XTF) API that is used to simulate controller input on a development console.   

<a id="interfacesSection"></a>



  
## Interfaces  
  
| Interface | Description |  
| --- | --- |  
| [IXtfInputClient](classes/IXtfInputClient/ixtfinputclient-xtfinput-xbox-windows-t.md) | Represents an XTF input client. |  
  
## Functions  
  
| Function | Description |  
| --- | --- |  
| [XtfCreateInputClient](methods/xtfcreateinputclient-xtfinput-xbox-windows-m.md) | Initializes a new instance of the IXtfInputClient interface with the specified address. |  
  
## Structures  
  
| Structure | Description |  
| --- | --- |  
| [GAMEPAD_REPORT structure](structures/GAMEPAD_REPORT-xtfinput-xbox-windows-t.md) | A snapshot of the state of a controller. |  
| [GAMEPAD_REPORT_EX](structures/gamepad_report_ex.md) | A snapshot of the state of a controller with extended information. |  
| [GAMEPAD_VIBRATION](structures/gamepad_vibration.md) | TBD |  
  
## Enumerations  
  
| Enumeration | Description |  
| --- | --- |  
| [GAMEPAD_BUTTONS Enumeration](enumerations/GAMEPAD_BUTTONS-typedef---xtfinput-xbox-windows-t.md) | Controller button identifier flags. |  
| [GAMEPAD_MORE_BUTTONS](enumerations/gamepad_more_buttons.md) | Controller button identifier flags for buttons that are only present on Xbox Series controllers. |  
  


To create an object that implements IXtfInputClient, call [XtfCreateInputClient](methods/xtfcreateinputclient-xtfinput-xbox-windows-m.md).   