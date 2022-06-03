---
author: M-Stahl
title: XUserRegisterForChangeEvent
description: Registers a callback for a user change event.
kindex: XUserRegisterForChangeEvent
ms.author: v-sahain
ms.topic: reference
edited: 02/10/2020
quality: good
security: public
applies-to: pc-gdk
---

# XUserRegisterForChangeEvent  

Registers a callback for a user change event.  

## Syntax  
  
```cpp
HRESULT XUserRegisterForChangeEvent(  
         XTaskQueueHandle queue,  
         void* context,  
         XUserChangeEventCallback* callback,  
         XTaskQueueRegistrationToken* token  
)  
```  
  
### Parameters  
  
*queue* &nbsp;&nbsp;\_In\_opt\_  
Type: XTaskQueueHandle  

A handle to the asynchronous queue to perform the operation on.  

*context* &nbsp;&nbsp;\_In\_opt\_  
Type: void*  

User defined context to pass to the callback.  

*callback* &nbsp;&nbsp;\_In\_  
Type: [XUserChangeEventCallback*](xuserchangeeventcallback.md)  

User defined callback to register.  

*token* &nbsp;&nbsp;\_Out\_  
Type: [XTaskQueueRegistrationToken*](../../xtaskqueue/structs/xtaskqueueregistrationtoken.md)  

Contains a token identifying the registered callback. Use the token to un-register the callback.  

### Return value

Type: HRESULT
  
HRESULT success or error code.  
For a list of error codes, see [Error Codes](../../../errorcodes.md).

## Remarks  
  > [!NOTE]
> This function isn't safe to call on a time-sensitive thread. For more information, see [Time-sensitive threads](../../../../system/overviews/time-sensitive-threads.md).  
  
The [XUserChangeEvent](../enums/xuserchangeevent.md) enumeration specifies a change event type.
[XUserChangeEventCallback](xuserchangeeventcallback.md) is a callback for a user change event.

To unregister a previously registered user change callback, call [XUserUnregisterForChangeEvent](xuserunregisterforchangeevent.md).

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

[XUserChangeEventCallback](xuserchangeeventcallback.md)

[XUserUnregisterForChangeEvent](xuserunregisterforchangeevent.md)