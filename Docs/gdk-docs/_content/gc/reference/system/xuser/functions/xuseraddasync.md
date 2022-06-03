---
author: M-Stahl
title: XUserAddAsync
description: Asynchronously adds a user to a game session.
kindex: XUserAddAsync
ms.author: v-sahain
ms.topic: reference
edited: 07/02/2019
quality: good
security: public
applies-to: pc-gdk
---

# XUserAddAsync  

Asynchronously adds a user to a game session.  

## Syntax  
  
```cpp
HRESULT XUserAddAsync(  
         XUserAddOptions options,  
         XAsyncBlock* async  
)  
```  
  
### Parameters  
  
*options* &nbsp;&nbsp;\_In\_  
Type: [XUserAddOptions](../enums/xuseraddoptions.md)  

Options for adding a user to a game session.  

*async* &nbsp;&nbsp;\_Inout\_  
Type: [XAsyncBlock*](../../xasync/structs/xasyncblock.md)  

An [XAsyncBlock](../../xasync/structs/xasyncblock.md) for polling for the call's status and retrieving call results.

### Return value
Type: HRESULT
  
HRESULT success or error code.
For a list of error codes, see [Error Codes](../../../errorcodes.md).

## Remarks

**XUserAddAsync** starts an asynchronous operation to add a user to the game. Use 
[XUserAddResult](xuseraddresult.md) to retrieve the results of the operation. 
  
**XUserAddAsync** always shows an Account Picker UI unless either
[XUserAddOptions::AddDefaultUserSilently](../enums/xuseraddoptions.md) or 
[XUserAddOptions::AddDefaultUserAllowingUI](../enums/xuseraddoptions.md) is passed to the *options* parameter.
  
If you use **XUserAddOptions::AddDefaultUserSilently**, **XUserAddAsync** does not show a UI. 

There are some edge cases that developers should know about if they repeatedly 
call **XUserAddAsync** with *options* set to **XUserAddOptions::AddDefaultUserSilently**:
- If you call this repeatedly, and we know the default user who launched the game, it will return that same user.
- If the previously known default user has signed out, and there is only one user signed into the device, it will mark that user as the new "default" user and return that.
- If the previously known default user has signed out, and there are multiple users signed into the device, it will return E_GAMEUSER_NO_DEFAULT_USER.

If a default user is not available, [XUserAddResult](xuseraddresult.md) returns 
E_GAMEUSER_NO_DEFAULT_USER. You must call **XUserAddAsync** with *options* not set to 
**XUserAddOptions::AddDefaultUserSilently**.

There are also some edge cases that developers should know about if they repeatedly call 
**XUserAddAsync** with *options* set to **XUserAddOptions::AddDefaultUserAllowingUI**. These are very 
similar (but not identical) to the silent UI case:
- If you call this repeatedly, and we know the default user who launched the game, it will return that same user.
- If the previously known default user has signed out, and there is only one user signed into the device, it will mark that user as the new "default" user and return that.
- If the user has signed out who initially launched the game, and the number of users is either 0 or more than 1, the system will show UI to get the user and then set that user as the default.

You cannot use [XUserAddOptions::AllowGuests](../enums/xuseraddoptions.md) with 
**XUserAddOptions::AddDefaultUserSilently**. A guest cannot be the default user. You can safely 
use **XUserAddOptions::AllowGuests** regardless of whether the current platform supports guests.

You must close each **XUserHandle** handle you retrieve from an **XUsers** API only once by calling 
[XUserCloseHandle](xuserclosehandle.md).  
  
Input device pairing is performed upon successful completion of **XUserAddAsync**. If the sign-in happened automatically without UI due to the **XUserAddOptions::AddDefaultUserSilently** or **XUserAddOptions::AddDefaultUserAllowingUI** options, then the input devices assigned to the user in the system are propogated to the title. If the UI was shown for the sign-in, the input device that selected the user is assigned to that user.

Device association can be tracked via the [XUserRegisterForDeviceAssociationChanged](xuserregisterfordeviceassociationchanged.md) method.

The following example demonstrates how to asynchronously add a user to a game session.
  
```cpp
HRESULT AddUserComplete(XAsyncBlock* ab)
{
    unique_user_handle user;
    RETURN_IF_FAILED(XUserAddResult(ab, &user));

    XUserLocalId userLocalId;
    XUserGetLocalId(user.get(), &userLocalId);

    auto iter = std::find_if(
        _users.begin(),
        _users.end(),
        [&userLocalId](const User& candidate)
    {
        XUserLocalId candidateUserLocalId;
        XUserGetLocalId(candidate.Handle(), &candidateUserLocalId);
        return candidateUserLocalId == userLocalId;
    });

    // User already known
    if (iter != _users.end())
    {
        appLog.AddLog("User already in list\n");
        return S_OK;
    }

    try
    {
        _users.emplace_back(user.get());
        _users.back().LoadGamerPicAsync(_queue);
    }
    CATCH_RETURN();

    return S_OK;
}

HRESULT AddUser(bool allowGuests, bool silent)
{
    auto asyncBlock = std::make_unique<XAsyncBlock>();
    ZeroMemory(asyncBlock.get(), sizeof(*asyncBlock));
    asyncBlock->queue = _queue;
    asyncBlock->context = this;
    asyncBlock->callback = [](XAsyncBlock* ab)
    {
        auto asyncBlock = std::unique_ptr<XAsyncBlock>(ab);
        LOG_IF_FAILED(static_cast<UserWindow*>(ab->context)->AddUserComplete(ab));
    };

    XUserAddOptions options = XUserAddOptions::None;

    if (allowGuests)
    {
        WI_SET_FLAG(options, XUserAddOptions::AllowGuests);
    }

    if (silent)
    {
        WI_SET_FLAG(options, XUserAddOptions::AddDefaultUserSilently);
    }

    if (SUCCEEDED_LOG(XUserAddAsync(
        options,
        asyncBlock.get())))
    {
        // The call succeeded, so release the std::unique_ptr ownership of XAsyncBlock* since the callback will take over ownership.
        // If the call fails, the std::unique_ptr will keep ownership and delete the XAsyncBlock*
        asyncBlock.release();
    }

    return S_OK;
}
```

  
## Requirements  
  
**Header:** XUser.h
  
**Library:** xgameruntime.lib  
  
**Supported platforms:** Windows, Xbox One family consoles and Xbox Series consoles  
  
## See also  
[XUser](../xuser_members.md)
  
[XUserAddOptions](../enums/xuseraddoptions.md)

[XUserCloseHandle](xuserclosehandle.md)
  