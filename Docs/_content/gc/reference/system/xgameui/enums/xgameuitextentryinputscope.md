---
author: M-Stahl
title: XGameUiTextEntryInputScope
description: Enumerates types of information expected in text entry.
kindex: XGameUiTextEntryInputScope
ms.author: aarocar
ms.topic: reference
edited: 01/11/2021
security: public
applies-to: pc-gdk
---

# XGameUiTextEntryInputScope  

Enumerates types of information expected in text entry.  

<a id="syntaxSection"></a>

## Syntax  

```cpp
enum class XGameUiTextEntryInputScope : uint32_t  
{  
    Default = 0,  
    Url = 1,  
    EmailSmtpAddress = 5,  
    Number = 29,  
    Password = 31,  
    TelephoneNumber = 32,  
    Alphanumeric = 40,  
    Search = 50,
    ChatWithoutEmoji = 68
}  
```  

<a id="constantsSection"></a>

## Constants  

| Constant | Description |  
| --- | --- |  
| Default | No input scope. This will be a fully localized keyboard with no special buttons. This keyboard will show emojis. |  
| Url | A uniform resource identifier (URI). This can include naming formats such as URL, file, or File Transfer Protocol (FTP). This will a fully localized keyboard that includes language-specific ".COM" buttons.|  
| EmailSmtpAddress | An email address in Simple Mail Transport Protocol (SMTP) form (*accountname*@*host*). This will be a fully localized keyboard with the "@" button featured prominently.|  
| Number | Numerical digits (0 through 9).|  
| Password | A password, including alphanumeric characters and other symbols, such as punctuation and mathematical symbols. This will be a fully localized keyboard where the textbox hides characters as the user types.|  
| TelephoneNumber | A telephone number. |  
| Alphanumeric | Alphanumeric characters. This will show a Latin keyboard with emojis.|  
| Search | A search string. This will show a fully localized keyboard with the "enter" button labeled "Search". |  
| ChatWithoutEmoji  | This will show a fully localized keyboard without emojis.  |

<a id="remarksSection"></a>

## Remarks  

The [XGameUiShowTextEntryAsync](../functions/xgameuishowtextentryasync.md) function uses this enumeration.  

To get the results of a call to `XGameUiShowTextEntryAsync`, call [XGameUiShowTextEntryResultSize](../functions/xgameuishowtextentryresultsize.md). Then call [XGameUiShowTextEntryResult](../functions/xgameuishowtextentryresult.md).  

<a id="requirementsSection"></a>

## Requirements  

**Header:** XGameUI.h  

**Supported platforms:** Windows, Xbox One family consoles and Xbox Series consoles  

<a id="seealsoSection"></a>

## See also  

[XGameUI](../xgameui_members.md)  
  