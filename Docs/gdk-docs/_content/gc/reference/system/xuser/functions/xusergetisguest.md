---
author: M-Stahl
title: XUserGetIsGuest
description: Returns a boolean indicating if a user is a guest.
kindex: XUserGetIsGuest
ms.author: v-sahain
ms.topic: reference
edited: 00/00/0000
quality: good
security: public
applies-to: pc-gdk
---

# XUserGetIsGuest  

Returns a boolean indicating if a user is a guest.  

## Syntax  
  
```cpp
HRESULT XUserGetIsGuest(  
         XUserHandle user,  
         bool* isGuest  
)  
```  
  
### Parameters  
  
*user* &nbsp;&nbsp;\_In\_  
Type: XUserHandle  

A handle to the user to check the status of.  

*isGuest* &nbsp;&nbsp;\_Out\_  
Type: bool*  

Contains true if the user is a guest, false otherwise.  

### Return value

Type: HRESULT success or error code.  
For a list of error codes, see [Error Codes](../../../errorcodes.md).
  
## Remarks

To specify the type of user change event, call [XUserChangeEvent](../enums/xuserchangeevent.md).

To register a callback for the user change event, call [XUserRegisterForChangeEvent](xuserregisterforchangeevent.md).

To un-register a registered user change callback, call [XUserUnregisterForChangeEvent](xuserunregisterforchangeevent.md).

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
  
[XUserChangeEvent](../enums/xuserchangeevent.md)

[XUserRegisterForChangeEvent](xuserregisterforchangeevent.md)

[XUserUnregisterForChangeEvent](xuserunregisterforchangeevent.md)