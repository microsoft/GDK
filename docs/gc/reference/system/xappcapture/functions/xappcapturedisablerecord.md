---
author: M-Stahl
title: XAppCaptureDisableRecord
description: Disables video recording for the player.
kindex: XAppCaptureDisableRecord
ms.author: dhkamra
ms.topic: reference
edited: 02/10/2020
security: public
applies-to: pc-gdk
---

# XAppCaptureDisableRecord  

Disables video recording for the player.

<a id="syntaxSection"></a>

## Syntax  
  
```cpp
HRESULT XAppCaptureDisableRecord(
)  
```  

<a id="parametersSection"></a>

### Parameters  

This function takes no parameters.

<a id="retvalSection"></a>

### Return value

Type: HRESULT

Returns `S_OK` when successful.

<a id="remarksSection"></a>

## Remarks  
  
When you disable recording, the player can no longer record videos, take screen shots, or broadcast the game by selecting **Home** > **Take Screenshot Recording**.

To enable recording, call [XAppCaptureEnableRecord](xappcaptureenablerecord.md).

Recording functionality is enabled by default.

**NOTE** : This api call will be ignored while XBOM Remote view is active. Once XBOM remote view is turned off the api will take effect and recording functions will be disabled.
> [!NOTE]
> This function isn't safe to call on a time-sensitive thread. For more information, see [Time-sensitive threads](../../../../system/overviews/time-sensitive-threads.md).

<a id="requirementsSection"></a>

## Requirements  
  
**Header:** XAppCapture.h
  
**Library:** xgameruntime.lib
  
**Supported platforms:** Windows, Xbox One family consoles and Xbox Series consoles  

<a id="seealsoSection"></a>

## See also  

[XAppCaptureEnableRecord](xappcaptureenablerecord.md)  