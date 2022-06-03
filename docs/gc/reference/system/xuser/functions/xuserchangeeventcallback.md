---
author: M-Stahl
title: XUserChangeEventCallback
description: A callback that an application defines for a user change event.
kindex: XUserChangeEventCallback
ms.author: v-sahain
ms.topic: reference
edited: 00/00/0000
quality: good
security: public
applies-to: pc-gdk
---

# XUserChangeEventCallback  

A callback that an application defines for a user change event.  

## Syntax  
  
```cpp
void XUserChangeEventCallback(  
         void* context,  
         XUserLocalId userLocalId,  
         XUserChangeEvent event  
)  
```  
  
### Parameters  
  
*context* &nbsp;&nbsp;\_In\_opt\_  
Type: void*  

A context that the application defines and sends to [XUserRegisterForChangeEvent](xuserregisterforchangeevent.md).

*userLocalId* &nbsp;&nbsp;\_In\_  
Type: [XUserLocalId](../structs/xuserlocalid.md)  

A unique identifier for a user that exists for the game session.  

*event* &nbsp;&nbsp;\_In\_  
Type: [XUserChangeEvent](../enums/xuserchangeevent.md)  

An enumeration specifying the type of user change event.  

## Remarks

To obtain a sign out deferral, call [XUserChangeEventCallback](xuserchangeeventcallback.md). Make sure to set [*XUserChangeEvent*](../enums/xuserchangeevent.md) to [XUserChangeEvent::SigningOut](../enums/xuserchangeevent.md).

This callback will only be called for users that were added to the title with a call to [XUserAddAsync](xuseraddasync.md).

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
  
  
Type: void
  
## Requirements  
  
**Header:** XUser.h
  
**Library:** xgameruntime.lib
  
**Supported platforms:** Windows, Xbox One family consoles and Xbox Series consoles  
  
## See also

[XUser](../xuser_members.md)
  