---
author: M-Stahl
title: XDisplayAcquireTimeoutDeferral
description: Acquires a screen timeout deferral.
kindex: XDisplayAcquireTimeoutDeferral
ms.author: v-denken
ms.topic: reference
edited: 05/10/2019
quality: good
security: public
applies-to: pc-gdk
---

# XDisplayAcquireTimeoutDeferral  

Acquires a screen timeout deferral.  

## Syntax  
  
```cpp
HRESULT XDisplayAcquireTimeoutDeferral(  
         XDisplayTimeoutDeferralHandle* handle  
)  
```  
  
### Parameters  
  
*handle* &nbsp;&nbsp;\_Out\_  
Type: XDisplayTimeoutDeferralHandle*  
  
A pointer to the handle for the screen timeout deferral.  
  
### Return value
  
Type: [HRESULT](/openspecs/windows_protocols/ms-erref/0642cb2f-2075-4469-918c-4441e69c548a)  
  
Returns **S_OK** if successful; otherwise, returns an error code. For a list of error codes, see [Error Codes](../../../errorcodes.md).  
  
## Remarks
  > [!NOTE]
> This function isn't safe to call on a time-sensitive thread. For more information, see [Time-sensitive threads](../../../../system/overviews/time-sensitive-threads.md).  
  
A screen timeout deferral ensures the screen will not dim, lock, or power down during user inaction. After a certain amount of idle time, a screen timeout occurs. In response to a screen timeout, devices may dim the display, activate the lock screen, or power down the display. The amount of idle time required before screen timeout occurs depends on the device's user settings. If your game is performing an activity that doesn't require user interaction, such as loading game resources or displaying a long cutscene, screen timeouts can be inconvenient. You can prevent screen timeouts by acquiring a screen timeout deferral.  
  
To acquire a screen timeout deferral, first call **XDisplayAcquireTimeoutDeferral** to acquire a handle for the screen timeout deferral, then call [XDisplayCloseTimeoutDeferralHandle](xdisplayclosetimeoutdeferralhandle.md) to close the handle after it's no longer needed. Screen timeout deferrals are ignored if the game loses focus, and they are released if the game exits.
  > [!NOTE]
> If you use this function to acquire a screen timeout deferral handle, you must close that handle by calling **XDisplayCloseTimeoutDeferralHandle**. Multiple screen timeout deferral handles can be acquired, and screen timeout is enabled for the game only after all screen timeout deferral handles are closed.
  > [!NOTE]
> Screen dimming will not take place while a title is actively getting debugged.
  
The following example plays a long introductory cutscene after calling **XDisplayAcquireTimeoutDeferral** to acquire a new screen timeout deferral handle. If the new handle is successfully acquired, the long introductory cutscene can play without the screen timing out due to user inaction. After the cutscene finishes playing, the example calls **XDisplayCloseTimeoutDeferralHandle** to close the handle. After all screen timeout deferral handles are closed, screen timeout can occur due to user inaction again.  
  
```cpp
void Game::PlayIntroCutscene()
{
    XDisplayTimeoutDeferralHandle handle;

    // Try to acquire a new timeout deferral handle.
    if (SUCCEEDED(XDisplayAcquireTimeoutDeferral(&handle)))
    {
        // The newly-opened timeout deferral handle prevents the display
        // from dimming over the game if the user goes idle.
        // 
        // At this point, the long intro cutscene can play without dimmming.
    }

    // Once the cutscene has completed playing, 
    // close the the timeout deferral handle.
    XDisplayCloseTimeoutDeferralHandle(handle);

    // If there are no open timeout deferral handles, the display can
    // once again dim over the game if the user goes idle.
}
```

  
## Requirements  
  
**Header:** XDisplay.h
  
**Library:** xgameruntime.lib
  
**Supported platforms:** Windows, Xbox One family consoles and Xbox Series consoles  
  
## See also  
[XDisplayCloseTimeoutDeferralHandle](xdisplayclosetimeoutdeferralhandle.md)  
[XDisplay](../xdisplay_members.md)  