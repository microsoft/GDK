---
author: M-Stahl
title: XUserAddByIdWithUiAsync
description: Asynchronously adds a user to a game session based on a XUID from a game invite. This function should only be used in response to a game invite.
kindex: XUserAddByIdWithUiAsync
ms.author: jgup
ms.topic: reference
edited: 00/00/0000
quality: good
security: public
applies-to: pc-gdk
---

# XUserAddByIdWithUiAsync  

Asynchronously adds a user to a game session based on a XUID from a game invite. This function should only be used in response 
to a game invite.  

## Syntax  
  
```cpp
HRESULT XUserAddByIdWithUiAsync(  
         uint64_t userId,  
         XAsyncBlock* async  
)  
```  
  
### Parameters  
  
*userId* &nbsp;&nbsp;\_In\_  
Type: uint64_t  

XUID of the user to add. This XUID should be obtained by parsing the inviteUri received in the game's 
callback that was registered with [XGameInviteRegisterForEvent](../../xgameinvite/functions/xgameinviteregisterforevent.md).

*async* &nbsp;&nbsp;\_Inout\_  
Type: [XAsyncBlock*](../../xasync/structs/xasyncblock.md)  

An [XAsyncBlock](../../xasync/structs/xasyncblock.md) for polling for the call's status and retrieving call results.

### Return value
Type: HRESULT
  
HRESULT success or error code.
For a list of error codes, see [Error Codes](../../../errorcodes.md).

## Remarks

**XUserAddByIdWithUiAsync** starts an asynchronous operation to add a user to the game. Use 
[XUserAddByIdWithUiResult](xuseraddbyidwithuiresult.md) to retrieve the results of the operation. 

When dealing with game invites, there is always the possibility on console that the XUID of the person 
specified in the game invite isn't the person who is already signed into the game. The **XUserAddByIdWithUiAsync** 
allows the game to add that user using the XUID that is parsed from the invite URI. 

This function will attempt to add the user without showing UI. The only reason UI may show is 
because the user needs to resolve an issue with their token. On console, showing UI should be uncommon.

If the user is not signed into the device, **XUserAddByIdWithUiResult** will return E_GAMEUSER_USER_NOT_FOUND.

You must close each XUserHandle handle you retrieve from an XUsers API only once by calling 
[XUserCloseHandle](xuserclosehandle.md).

In order to get game invites, developers must subscribe to the [XGameInviteCallback](../../xgameinvite/functions/xgameinviteeventcallback.md)
by calling [XGameInviteRegisterForEvent](../../xgameinvite/functions/xgameinviteregisterforevent.md). When this callback is invoked, games should parse the inviteUri they get back and determine the XUID of the user who is getting that invite. At that point, the game may want to get 
an XUserHandle for the person getting the invite. The following code demonstrates how this works.

```cpp
// Assumptions:
// 1. The game has previously registered for this callback using XGameInviteRegisterForEvent
// 2. The game has function: uint64_t GetXuidFromInviteUri(const char* inviteUri)
// 3. There is already a global task queue, g_GlobalQueue
 
void MyGameInviteEventCallback(void* context, const char* inviteUri)
{
   XAsyncBlock* asyncBlock = new XAsyncBlock();
   asyncBlock->queue = g_GlobalQueue;
   asyncBlock->callback = [](XAsyncBlock* ab)
   {
      XUserHandle userHandle;
      if(SUCCEEDED(XUserAddByIdWithUiResult(ab, &userHandle)))
      {
         // Copy this XUserHandle to some location that the game will use later or
         // Do whatever actions you want with this user

         XUserCloseHandle(userHandle);
      }
      else
      {
         // Since you didn’t successfully add the user, setup your game state so that 
         // you are in a good place, likely a start menu
      }
      delete ab;
   }

   
   if(FAILED(XUserAddByIdWithUiAysnc(GetXuidFromInviteUri(inviteUri), asyncBlock)))
   {
      delete asyncBlock;
   }
}
```
  
## Requirements  
  
**Header:** XUser.h
  
**Library:** xgameruntime.lib  
  
**Supported platforms:** Windows, Xbox One family consoles and Xbox Series consoles  
  
## See also  
[XUser](../xuser_members.md)  
[XUserCloseHandle](xuserclosehandle.md)  
  