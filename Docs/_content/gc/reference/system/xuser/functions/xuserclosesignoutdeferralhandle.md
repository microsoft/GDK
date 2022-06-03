---
author: M-Stahl
title: XUserCloseSignOutDeferralHandle
description: Closes a specific user sign out deferral handle.
kindex: XUserCloseSignOutDeferralHandle
ms.author: v-sahain
ms.topic: reference
edited: 02/10/2020
quality: good
security: public
applies-to: pc-gdk
---

# XUserCloseSignOutDeferralHandle  

Closes a specific user sign out deferral handle.  

## Syntax  
  
```cpp
void XUserCloseSignOutDeferralHandle(  
         XUserSignOutDeferralHandle deferral  
)  
```  
  
### Parameters  
  
*deferral* &nbsp;&nbsp;\_In\_  
Type: XUserSignOutDeferralHandle  

The user sign out deferral handle to close.  

### Return value

Type: void
  
## Remarks
  > [!NOTE]
> This function isn't safe to call on a time-sensitive thread. For more information, see [Time-sensitive threads](../../../../system/overviews/time-sensitive-threads.md).  
  
To get the user sign out deferral handle, call [XUserGetSignOutDeferral](xusergetsignoutdeferral.md).

To close the user the sign out deferral handle, call [XUserCloseSignOutDeferralHandle](xuserclosesignoutdeferralhandle.md).

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
  
**Library:** xgameruntime.lib  
  
**Supported platforms:** Windows, Xbox One family consoles and Xbox Series consoles  
  
## See also

[XUser](../xuser_members.md)

[XUserGetSignOutDeferral](xusergetsignoutdeferral.md)

[XUserCloseSignOutDeferralHandle](xuserclosesignoutdeferralhandle.md)
  