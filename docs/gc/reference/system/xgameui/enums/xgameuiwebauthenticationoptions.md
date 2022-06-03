---
author: M-Stahl
title: XGameUiWebAuthenticationOptions
description: Enumerates options for presenting the web authentication flow.
kindex: XGameUiWebAuthenticationOptions
ms.author: jgup
ms.topic: reference
edited: 01/11/2021
security: public
applies-to: pc-gdk
---

# XGameUiWebAuthenticationOptions  

Enumerates options for presenting the web authentication flow.  

<a id="syntaxSection"></a>

## Syntax  

```cpp
enum class XGameUiWebAuthenticationOptions : uint32_t
{
    None = 0x00,
    PreferFullscreen = 0x01
};
```  

<a id="constantsSection"></a>

## Constants  

| Constant | Description |  
| --- | --- |  
| None | Show the authentication flow in a normal dialog box. |  
| PreferFullscreen | Show the authentication flow by using the full screen. |  

<a id="remarksSection"></a>

## Remarks  

The [XGameUiShowWebAuthenticationWithOptionsAsync](../functions/xgameuishowwebauthenticationwithoptionsasync.md) function uses this enumeration.  
> [!NOTE]
> On the PC, full screen is not supported, so `PreferFullscreen` is ignored when calling `XGameUiShowWebAuthenticationWithOptionsAsync`.  

To get the results of a call to `XGameUiShowWebAuthenticationWithOptionsAsync`, call [XGameUiShowWebAuthenticationResultSize](../functions/xgameuishowwebauthenticationresultsize.md). Then call [XGameUiShowWebAuthenticationResult](../functions/xgameuishowwebauthenticationresult.md).  

<a id="requirementsSection"></a>

## Requirements  

**Header:** XGameUI.h  

**Supported platforms:** Windows, Xbox One family consoles and Xbox Series consoles  

<a id="seealsoSection"></a>

## See also  

[XGameUI](../xgameui_members.md)  
  