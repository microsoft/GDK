---
author: M-Stahl
title: XGameUiShowSendGameInviteAsync
description: Shows a picker UI populated from the selected player's friend list and suggested friend list.
kindex: XGameUiShowSendGameInviteAsync
ms.author: aarocar
ms.topic: reference
edited: 00/00/0000
quality: good
security: public
applies-to: pc-gdk
---

# XGameUiShowSendGameInviteAsync  

This method shows a picker UI populated from the selected player's friend list and suggested friend list to send out game invites. 

## Syntax  

```cpp
HRESULT XGameUiShowSendGameInviteAsync(  
         XAsyncBlock* async,  
         XUserHandle requestingUser,  
         const char* sessionConfigurationId,  
         const char* sessionTemplateName,  
         const char* sessionId,  
         const char* invitationText,  
         const char* customActivationContext  
)  
```  

### Parameters  
  
*async* &nbsp;&nbsp;\_In\_  
Type: [XAsyncBlock*](../../xasync/structs/xasyncblock.md)  

A pointer to the [XAsyncBlock](../../xasync/structs/xasyncblock.md) that is passed to [XAsyncRun](../../xasync/functions/xasyncrun.md).  

*requestingUser* &nbsp;&nbsp;\_In\_  
Type: XUserHandle  

A handle to the user that is sending the invites.

*sessionConfigurationId* &nbsp;&nbsp;\_In\_  
Type: char*  

Specifies a string that indicates the title's service configuration ID.

*sessionTemplateName* &nbsp;&nbsp;\_In\_  
Type: char*  

Specifies a string that indicates the name of the multiplayer session template.

*sessionId* &nbsp;&nbsp;\_In\_  
Type: char*  

Specifies a string that indicates the ID of the multiplayer session to invite people to.

*invitationText* &nbsp;&nbsp;\_In\_opt\_  
Type: char*  

Specifies a string that indicates the custom invitation string ID.  
This string ID is defined in the Xbox Live service configuration to identify the invitation text that is additional to the standard invitation text. The ID string must be prefixed with "///". Pass an empty string if you don’t want a custom string added to the invite.

*customActivationContext* &nbsp;&nbsp;\_In\_opt\_  
Type: char*  

The custom activation context that is available to the invitee in the activation URI for an invite. The custom activation context string must be URL-safe and binary content should be encoded with URL-safe base64 encoding. The maximum length is 160 characters.

### Return value

Type: HRESULT
  
HRESULT success or error code of the async call.
  
## Remarks  
  
Once the list is populated players can be selected. The player can send an invitation to play a game and/or party chat for a specified game session to individuals selected in the picker UI.

Calling for UI will cause your game to enter *constrained mode*. In constrained mode your title will receive fewer system resources while it is in the background of the UI that has been called for. To learn more about constrained mode and other operational modes for your title read [Xbox Game Life Cycle (NDA topic)](../../../../system/overviews/xbox-game-life-cycle.md).
  
## Requirements  
  
**Header:** XGameUI.h
  
**Library:** xgameruntime.lib  
  
**Supported platforms:** Windows, Xbox One family consoles and Xbox Series consoles  
  
## See also  
[XGameUI](../xgameui_members.md)  
[XGameUiShowSendGameInviteResult](xgameuishowsendgameinviteresult.md)  
[Xbox Game Life Cycle (NDA topic)](../../../../system/overviews/xbox-game-life-cycle.md)  