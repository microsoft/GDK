---
author: M-Stahl
title: XUserCloseHandle
description: Closes a specific user handle.
kindex: XUserCloseHandle
ms.author: v-sahain
ms.topic: reference
edited: 02/10/2020
quality: good
security: public
applies-to: pc-gdk
---

# XUserCloseHandle  

Closes a specific user handle.  

## Syntax  
  
```cpp
void XUserCloseHandle(  
         XUserHandle user  
)  
```  
  
### Parameters  
  
*user* &nbsp;&nbsp;\_In\_  
Type: XUserHandle  

The user handle to close.  

### Return value

Type: void
  
## Remarks
  
You must call the XUserCloseHandle function just once for each **XUserHandle** you retrieve from an **XUser** API.
You can also close all handles that represent the user by calling the XUserCloseHandle function.

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

[XUserCloseSignOutDeferralHandle](xuserclosesignoutdeferralhandle.md)

[XUserCompare](xusercompare.md)  