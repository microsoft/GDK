---
author: M-Stahl
title: XUserUnregisterForChangeEvent
description: Unregisters a previously registered user change callback.
kindex: XUserUnregisterForChangeEvent
ms.author: v-sahain
ms.topic: reference
edited: 07/02/2019
quality: good
security: public
applies-to: pc-gdk
---

# XUserUnregisterForChangeEvent  

Unregisters a previously registered user change callback.  

## Syntax  
  
```cpp
bool XUserUnregisterForChangeEvent(  
         XTaskQueueRegistrationToken token,  
         bool wait  
)  
```  
  
### Parameters  
  
*token* &nbsp;&nbsp;\_In\_  
Type: [XTaskQueueRegistrationToken](../../xtaskqueue/structs/xtaskqueueregistrationtoken.md)  

A token that [XUserRegisterForChangeEvent](xuserregisterforchangeevent.md) returns, identifying the callback to un-register.  

*wait* &nbsp;&nbsp;\_In\_  
Type: bool  

Indicates whether to block until any pending callbacks are complete.

### Return value

Type: bool
  
Returns false if wait is false and the un-register is pending. Returns true otherwise.  

## Remarks
  > [!NOTE]
> This function isn't safe to call on a time-sensitive thread. For more information, see [Time-sensitive threads](../../../../system/overviews/time-sensitive-threads.md).  
  
Un-registering a notification:

Un-registration removes the callback for the token from the set of registered callbacks.

* If callbacks are not executing for the callback token, the call returns true.
* If callbacks are executing and wait is true, the call blocks until the executing callback completes.
* If callbacks are executing and wait is false, the call does not block but returns false. Once the callback for the token is complete, the token automatically un-registers.

This mechanism allows for the following coding patterns:

1. You can block on unregistration to ensure your callbacks never invoke after an un-registration call.
2. You can choose not to block. If you need to ensure your callbacks complete before deleting data, you can periodically call unregister with false for wait. When it finally returns true, all your callbacks are done and you can delete state.
3. If an unregister call does not invoke the callback, you can just pass false for wait and ignore the return value.  
  
To register a user change callback, call [XUserRegisterForChangeEvent](xuserregisterforchangeevent.md).
The [XUserChangeEvent](../enums/xuserchangeevent.md) enumeration specifies a change event type.
[XUserChangeEventCallback](xuserchangeeventcallback.md) is a callback for a user change event.

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
  
[XUserRegisterForChangeEvent](xuserregisterforchangeevent.md)

[XUserChangeEvent](../enums/xuserchangeevent.md)

[XUserChangeEventCallback](xuserchangeeventcallback.md)