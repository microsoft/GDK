---
author: jgup
title: XLaunchRestartOnCrash
description: Automatically restarts the game when the currently running instance of the game abnormally terminates due to a crash.
kindex: XLaunchRestartOnCrash
ms.author: jgup
ms.topic: reference
edited: '08/01/2019'
quality: good
security: public
---

# XLaunchRestartOnCrash  

Automatically restarts the game when the currently running instance of the game abnormally terminates due to a crash. 
  
## Syntax  
  
```cpp
HRESULT XLaunchRestartOnCrash(  
         const char* args,  
         uint32_t reserved  
)  
```  
  
### Parameters  
  
*args* &nbsp;&nbsp;\_In\_opt\_z\_  
Type: char*  
  
Any applicable, game-specific arguments with which to relaunch the game. 
  
*reserved* &nbsp;&nbsp;\_In\_  
Type: uint32_t  
  
Reserved. Must be set to 0.  
  
### Return value
Type: HRESULT
  
HRESULT success or error code. 
  
## Remarks  

Like [XLaunchNewGame](xlaunchnewgame.md), **XLaunchRestartOnCrash** guarantees that only one game executable 
is running at a time. The internal state which determines if a new executable is to be launched when a crash 
is detected is tied to the lifetime of the current game instance. Relaunched game instances must also call 
**XLaunchRestartOnCrash** again if the relaunch behavior is still desired.
> [!NOTE]
> If a title calls **XLaunchRestartOnCrash** and then later 
[XLaunchNewGame](xlaunchnewgame.md) and subsequently crashes prior to starting up the new game, the calling 
game will get restarted as opposed to the new launch specified via [XLaunchNewGame](xlaunchnewgame.md).
> [!NOTE]
>  This API is not meant to be used in retail scenarios and will return E_NOTIMPL 
if it is invoked on a console which is not a devkit.
  
## Requirements  
  
**Header:** XGame.h
  
**Library:** xgameruntime.lib
  
**Supported platforms:** Xbox One family consoles and Xbox Series consoles  
  
## See also  
[XGame](../xgame_members.md)    