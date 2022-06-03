---
author: M-Stahl
title: XUserAddOptions
description: Specifies the options for adding a user.
kindex: XUserAddOptions
ms.author: v-sahain
ms.topic: reference
edited: 00/00/0000
quality: good
security: public
applies-to: pc-gdk
---

# XUserAddOptions  

Specifies the options for adding a user.  

## Syntax  
  
```cpp
enum class XUserAddOptions  : uint32_t  
{  
    None = 0x00,  
    AddDefaultUserSilently = 0x01,  
    AllowGuests = 0x02,  
    AddDefaultUserAllowingUI = 0x04,
}  
```  
  
## Constants  
  
| Constant | Description |
| --- | --- |
| None | No options. |  
| AddDefaultUserSilently | Gets the user who launched the game without popping up any UI. |  
| AllowGuests | Guests will be included in the user picker UI. |  
| AddDefaultUserAllowingUI | Attempt to get the initial user who launched the game silently. If the system can get that user without popping any UI, it will attempt to do so. If that user needs to give consent or fix up account issues, UI will show up to resolve the issue.  |  
  
## Remarks

There are some edge cases that developers should know about if they repeatedly 
call [XUserAddAsync](../functions/xuseraddasync.md) with *options* set to XUserAddOptions::AddDefaultUserSilently:
- If you call this repeatedly, and we know the default user who launched the game, it will return that same user.
- If the previously known default user has signed out, and there is only one user signed into the device, it will 
  mark that user as the new "default" user and return that.
- If the previously known default user has signed out, and there are multiple users signed into the device, it 
  will return E_GAMEUSER_NO_DEFAULT_USER.
- In developer launches, the user that will be the default user is the auto sign in user, which can be specified by setting that user as the auto sign in user in DevHome or by using [xbconfig (NDA topic)](../../../../tools-console/xbox-tools-and-apis/commandlinetools/xbconfig.md) DefaultUser.

If a default user is not available*, [XUserAddResult](../functions/xuseraddresult.md) returns 
E_GAMEUSER_NO_DEFAULT_USER. You must call [XUserAddAsync](../functions/xuseraddasync.md) with *options* not set to 
XUserAddOptions::AddDefaultUserSilently.

There are also some edge cases that developers should know about if they repeatedly call 
[XUserAddAsync](../functions/xuseraddasync.md) with *options* set to XUserAddOptions::AddDefaultUserAllowingUI. These are very 
similar (but not identical) to the silent UI case:
- If you call this repeatedly, and we know the default user who launched the game, it will return that same user.
- If the previously known default user has signed out, and there is only one user signed into the device, it will 
  mark that user as the new "default" user and return that.
- If the user has signed out who initially launched the game, and the number of users is either 0 or more than 1, 
  the system will show UI to get the user and then set that user as the default.

In [XUserAddAsync](../functions/xuseraddasync.md), you cannot use XUserAddOptions::AllowGuests with 
XUserAddOptions::AddDefaultUserSilently. A guest cannot be the default user.

You can use XUserAddOptions::AllowGuests, even if the current platform does not support guests.

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
  
**Supported platforms:** Windows, Xbox One family consoles and Xbox Series consoles  
  
## See also

[XUser](../xuser_members.md)
  
[XUserAddAsync](../functions/xuseraddasync.md)

[[XUserAddResult](../functions/xuseraddresult.md)