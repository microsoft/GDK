---
author: M-Stahl
title: XUserChangeEvent
description: Specifies the type of user change event.
kindex: XUserChangeEvent
ms.author: v-sahain
ms.topic: reference
edited: 00/00/0000
quality: good
security: public
applies-to: pc-gdk
---

# XUserChangeEvent  

Specifies the type of user change event.  

## Syntax  
  
```cpp
enum class XUserChangeEvent  : uint32_t  
{  
    SignedInAgain = 0,  
    SigningOut = 1,  
    SignedOut = 2,  
    Gamertag = 3,  
    GamerPicture = 4,  
    Privileges = 5,  
}  
```  
  
## Constants  
  
| Constant | Description |
| --- | --- |
| SignedInAgain | User is signed in again. This will only happen if the game holds onto the **XUserHandle** after the user has signed out and that same user then signs in once more. |  
| SigningOut | User is signing out. |  
| SignedOut | User is signed out. |  
| Gamertag | User's gametag has changed. |  
| GamerPicture | User's gamer picture has changed. |  
| Privileges | User's privileges have changed. |  
  
## Remarks  

To monitor changes in user state or user information, subscribe to XUserChangeEvent.
Call the [XUserRegisterForChangeEvent](../functions/xuserregisterforchangeevent.md) function to subscribe to XUserChangeEvent.
The [XUserRegisterForChangeEvent](../functions/xuserregisterforchangeevent.md) function accepts a pointer to an [XUserChangeEventCallback](../functions/xuserchangeeventcallback.md) callback argument. The function returns the pointer to the callback.
The [XUserChangeEventCallback](../functions/xuserchangeeventcallback.md) callback takes an XUserChangeEvent enumeration as an argument.

The following example demonstrates how to handle user change events.  
  
```cpp
HRESULT RegisterForChanges()
{
    RETURN_HR_IF(E_UNEXPECTED, _token.token != 0);
    RETURN_IF_FAILED(XUserRegisterForChangeEvent(
        _queue,
        this,
        UserChangeEventHandler,
        &_token));
    return S_OK;
}

void UnregisterForChanges()
{
    XUserUnregisterForChangeEvent(_token, false);
    _token.token = 0;
}

void UserChangeEventHandler(
    XUserLocalId userLocalId,
    XUserChangeEvent event)
{
    auto iter = std::find_if(
        _users.begin(),
        _users.end(),
        [&userLocalId](const User& candidate)
    {
        XUserLocalId candidateUserLocalId;
        XUserGetLocalId(candidate.Handle(), &candidateUserLocalId);
        return candidateUserLocalId == userLocalId;
    });

    // User not known
    if (iter == _users.end())
    {
        return;
    }

    auto handle = iter->Handle();

    // If a guest gets signed out, immediately close the handle
    bool isGuest;
    if (SUCCEEDED_LOG(XUserGetIsGuest(handle, &isGuest)) &&
        isGuest &&
        event == XUserChangeEvent::SignedOut)
    {
        _users.erase(iter);
    }

    if (event == XUserChangeEvent::SigningOut)
    {
        // Delay the user signing out just for fun
        XUserSignOutDeferralHandle deferral;
        if (SUCCEEDED_LOG(XUserGetSignOutDeferral(&deferral)))
        {
            // Hold the deferral for 5 seconds then close it
            std::thread completeDeferralThread(
                [deferral]()
            {
                std::this_thread::sleep_for(std::chrono::milliseconds(5000));
                XUserCloseSignOutDeferralHandle(deferral);
            });

            completeDeferralThread.detach();
        }
    }

    if (event == XUserChangeEvent::GamerPicture)
    {
        iter->LoadGamerPicAsync(_queue);
    }
}
```
  
  
## Requirements  
  
**Header:** XUser.h
  
**Supported platforms:** Windows, Xbox One family consoles and Xbox Series consoles  
  
## See also

[XUser](../xuser_members.md)
  
[XUserRegisterForChangeEvent](../functions/xuserregisterforchangeevent.md)

[XUserChangeEventCallback](../functions/xuserchangeeventcallback.md)