---
author: M-Stahl
title: XGameUI (API contents)
description: Reference material for XGameUI APIs.
kindex: XGameUI
ms.author: scotmi
ms.topic: navigation
edited: 00/00/0000
security: public
applies-to: pc-gdk
---

# XGameUI  
  
The XboxGameUI APIs allow titles to bring up pre-defined user interface displays on the Xbox One Console. These pre-defined UI include user pickers, profile cards, and game invites among other interfaces.  
  
  
## Functions  
  
| Function | Description |  
| --- | --- |  
| [XGameUiSetNotificationPositionHint](functions/xgameuisetnotificationpositionhint.md) | Sets the preferred position for toast notifications to be shown on the current title. |  
| [XGameUiShowAchievementsAsync](functions/xgameuishowachievementsasync.md) | Displays UI presenting the requesting player's achievements for the specified title. |  
| [XGameUiShowAchievementsResult](functions/xgameuishowachievementsresult.md) | Gets the result of a call to [XGameUiShowAchievementsAsync](functions/xgameuishowachievementsasync.md). |  
| [XGameUiShowErrorDialogAsync](functions/xgameuishowerrordialogasync.md) | Displays UI for an error dialog with a service defined error string for the specified error code. |  
| [XGameUiShowErrorDialogResult](functions/xgameuishowerrordialogresult.md) | Gets the result of a call to [XGameUiShowErrorDialogAsync](functions/xgameuishowerrordialogasync.md). |  
| [XGameUiShowMessageDialogAsync](functions/xgameuishowmessagedialogasync.md) | Displays UI for a customizable message dialog. |  
| [XGameUiShowMessageDialogResult](functions/xgameuishowmessagedialogresult.md) | Gets the result of a call to [XGameUiShowMessageDialogAsync](functions/xgameuishowmessagedialogasync.md). |  
| [XGameUiShowMultiplayerActivityGameInviteAsync](functions/xgameuishowmultiplayeractivitygameinviteasync.md) | TBD |  
| [XGameUiShowMultiplayerActivityGameInviteResult](functions/xgameuishowmultiplayeractivitygameinviteresult.md) | TBD |  
| [XGameUiShowPlayerPickerAsync](functions/xgameuishowplayerpickerasync.md) | Displays a picker UI that allows a person playing the game to select players from a presented list of people. |  
| [XGameUiShowPlayerPickerResult](functions/xgameuishowplayerpickerresult.md) | Gets the results from a [XGameUiShowPlayerPickerAsync](functions/xgameuishowplayerpickerasync.md) call. |  
| [XGameUiShowPlayerPickerResultCount](functions/xgameuishowplayerpickerresultcount.md) | Gets the count of results from a [XGameUiShowPlayerPickerAsync](functions/xgameuishowplayerpickerasync.md) call. |  
| [XGameUiShowPlayerProfileCardAsync](functions/xgameuishowplayerprofilecardasync.md) | Displays UI for the profile card of the specified player. |  
| [XGameUiShowPlayerProfileCardResult](functions/xgameuishowplayerprofilecardresult.md) | Gets the result of a call to [XGameUiShowPlayerProfileCardAsync](functions/xgameuishowplayerprofilecardasync.md). |  
| [XGameUiShowSendGameInviteAsync](functions/xgameuishowsendgameinviteasync.md) | Shows a picker UI populated from the selected player's friend list and suggested friend list. |  
| [XGameUiShowSendGameInviteResult](functions/xgameuishowsendgameinviteresult.md) | Gets the result of a call to [XGameUIShowSendGameInviteAsync](functions/xgameuishowsendgameinviteasync.md). |  
| [XGameUiShowTextEntryAsync](functions/xgameuishowtextentryasync.md) | Displays a text entry UI for a user to enter information. |  
| [XGameUiShowTextEntryResult](functions/xgameuishowtextentryresult.md) | Gets the results from a [XGameUiShowTextEntryAsync](functions/xgameuishowtextentryasync.md) call. |  
| [XGameUiShowTextEntryResultSize](functions/xgameuishowtextentryresultsize.md) | Gets the size of the return buffer from a [XGameUiShowTextEntryAsync](functions/xgameuishowtextentryasync.md) call. |  
| [XGameUiShowWebAuthenticationAsync](functions/xgameuishowwebauthenticationasync.md) | Displays a web UI that allows the user to delegate access to external web sites and services without directly providing their credentials to the running title. |  
| [XGameUiShowWebAuthenticationResult](functions/xgameuishowwebauthenticationresult.md) | Gets the results from a [XGameUiShowWebAuthenticationAsync](functions/xgameuishowwebauthenticationasync.md) call. |  
| [XGameUiShowWebAuthenticationResultSize](functions/xgameuishowwebauthenticationresultsize.md) | Retrieves the size of the buffer needed to contain the results of an authentication request. |  
| [XGameUiShowWebAuthenticationWithOptionsAsync](functions/xgameuishowwebauthenticationwithoptionsasync.md) | Displays a web UI, with the option of showing it fulll screen, that allows the user to delegate access to external web sites and services without directly providing their credentials to the running title. |  
  
## Structures  
  
| Structure | Description |  
| --- | --- |  
| [XGameUiWebAuthenticationResultData](structs/xgameuiwebauthenticationresultdata.md) | Contains the response from a web authentication request. |  
  
## Enumerations  
  
| Enumeration | Description |  
| --- | --- |  
| [XGameUiMessageDialogButton](enums/xgameuimessagedialogbutton.md) | Enumerates buttons in a customizable message dialog box. |  
| [XGameUiNotificationPositionHint](enums/xgameuinotificationpositionhint.md) | Describes the preferred position for toast notifications to be shown on the current title. |  
| [XGameUiTextEntryInputScope](enums/xgameuitextentryinputscope.md) | Enumerates types of information expected in text entry. |  
| [XGameUiWebAuthenticationOptions](enums/xgameuiwebauthenticationoptions.md) | Enumerates options for presenting the web authentication flow. |  
  
  
## See also  
[System API reference](../gc-reference-system-toc.md)  