---
author: M-Stahl
title: XUserAddResult
description: Retrieves a handle to a user that XUserAddAsync creates.
kindex: XUserAddResult
ms.author: v-sahain
ms.topic: reference
edited: 07/02/2019
quality: good
security: public
applies-to: pc-gdk
---

# XUserAddResult  

Retrieves a handle to a user that [XUserAddAsync](xuseraddasync.md) creates.  

## Syntax  
  
```cpp
HRESULT XUserAddResult(  
         XAsyncBlock* async,  
         XUserHandle* newUser  
)  
```  
  
### Parameters  
  
*async* &nbsp;&nbsp;\_Inout\_  
Type: [XAsyncBlock*](../../xasync/structs/xasyncblock.md)  

The async block sent to [XUserAddAsync](xuseraddasync.md).  

*newUser* &nbsp;&nbsp;\_Out\_  
Type: XUserHandle*  

Contains a handle to the new user.  

### Return value

Type: HRESULT
  
HRESULT success or error code.  

| Return Code           | Description             |
|-----------------------|-------------------------|
| S_OK                  | The operation succeeded. |
| E_GAMEUSER_NO_DEFAULT_USER | A default user is not available. [XUserAddAsync](xuseraddasync.md) needs to be called without [XUserAddOptions::AddDefaultUserSilently](../enums/xuseraddoptions.md). |
| E_GAMEUSER_RESOLVE_USER_ISSUE_REQUIRED | The user must use a UI to resolve the issue. Call [XUserResolveIssueWithUiAsync](xuserresolveissuewithuiasync.md) to display the UI to the user. |
| E_ABORT | The user canceled the operation. |
  
## Remarks

**XUserAddAsync** starts an asynchronous operation to add a user to the game. Use 
[XUserAddResult](xuseraddresult.md) to retrieve the results of the operation.  
  
**XUserAddAsync** always shows an account picker UI unless you pass 
[XUserAddOptions::AddDefaultUserSilently](../enums/xuseraddoptions.md) 
to the *options* parameter.
  
If you use [XUserAddOptions::AddDefaultUserSilently](../enums/xuseraddoptions.md), **XUserAddAsync** does not show 
a UI. The user that **XUserAddOptions::AddDefaultUserSilently** returns continues to return until the user 
signs out. If a default user is not available, [XUserAddResult](xuseraddresult.md) returns 
**E_GAMEUSER_NO_DEFAULT_USER**. This indicates that you must call  **XUserAddAsync** without 
**XUserAddOptions::AddDefaultUserSilently** to select a user.

If a user is banned from Xbox Live, the game will not be able to get an XUserHandle for that user. 
If **XUserAddOptions::AddDefaultUserSilently** is used and the game was launched by a banned user, 
**XUserAddResult** will retrun E_GAMEUSER_NO_DEFAULT_USER. Otherwise, if UI is shown, either a non-banned 
user will need to sign-in, or the user will need to canncel out of the UI and **XUserAddResult** will 
return E_ABORT.

You cannot use [XUserAddOptions::AllowGuests](../enums/xuseraddoptions.md) with **XUserAddOptions::AddDefaultUserSilently**. A guest 
cannot be the default user. You can use **XUserAddOptions::AllowGuests** safely regardless of whether the current platform 
supports guests.

You must close each **XUserHandle** handle that you retrieve from an **XUsers** API once by calling 
[XUserCloseHandle](xuserclosehandle.md).  


  
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
  
[XUserAddAsync](xuseraddasync.md)

[XUserAddOptions](../enums/xuseraddoptions.md)

[XUserCloseHandle](xuserclosehandle.md)