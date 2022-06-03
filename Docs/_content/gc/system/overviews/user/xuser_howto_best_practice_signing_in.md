---
author: M-Stahl
title: 'How to: best practice to sign in a user'
description: Demonstrates the best practice to sign in and establish an initial user.
kindex: Signing in user, best practice
ms.author: jgup
ms.topic: conceptual
edited: 04/14/2020
security: public
---

# How to: best practice to sign in a user

## Example demonstrating how to silently get the default user

A game needs to establish an initial user. This example shows how to accomplish this as early
as possible. You would typically want to follow this pattern if your game menus wanted to 
"greet" the user with something clearly identifying them, and you didn't want to immediately 
show the UI.

```c++
HRESULT Identity_TrySignInDefaultUserSilently(_In_ XTaskQueueHandle asyncQueue)
{
    XAsyncBlock* asyncBlock = new XAsyncBlock();
    asyncBlock->queue = asyncQueue;
    asyncBlock->callback = Identity_TrySignInDefaultUserSilently_Callback;

    // Request to silently sign in the default user.
    HRESULT hr = XUserAddAsync(XUserAddOptions::AddDefaultUserSilently, asyncBlock);

    if (FAILED(hr))
    {
        delete asyncBlock;
    }

    return hr;
}

void CALLBACK Identity_TrySignInDefaultUserSilently_Callback(_In_ XAsyncBlock* asyncBlock)
{
    // NOTE: XUserAddResult will add a Ref to the passed-in XUserHandle.
    XUserHandle newUser = nullptr;
    HRESULT hr = XUserAddResult(asyncBlock, &newUser);

    if (SUCCEEDED(hr))
    {
        // TO DO: create Xbox Live context and do something with that user.
        // ...
    }
    else 
    {
        // You are here because there's no default user or because of an error.
        // Display some UI, such as "Press A or Enter to continue," and try the sign-in with the UI flow.
    }

    delete asyncBlock;
}
```
## Example demonstrating how to get an initial user
As with the previous example, the game needs to establish an initial user. In this case, 
the game is willing to have UI show at the point when it requests a user. UI only 
shows if the system can't determine the default user.

```c++
HRESULT Identity_TrySignInDefaultUser(_In_ XTaskQueueHandle asyncQueue)
{
    XAsyncBlock* asyncBlock = new XAsyncBlock();
    asyncBlock->queue = asyncQueue;
    asyncBlock->callback = Identity_TrySignInDefaultUser_Callback;

    // Request to silently sign in the default user.
    HRESULT hr = XUserAddAsync(XUserAddOptions::AddDefaultUserAllowingUI, asyncBlock);

    if (FAILED(hr))
    {
        delete asyncBlock;
    }

    return hr;
}

void CALLBACK Identity_TrySignInDefaultUser_Callback(_In_ XAsyncBlock* asyncBlock)
{
    // NOTE: XUserAddResult will add a Ref to the passed-in XUserHandle.
    XUserHandle newUser = nullptr;
    HRESULT hr = XUserAddResult(asyncBlock, &newUser);

    if (SUCCEEDED(hr))
    {
        // TO DO: create Xbox Live context and do something with that user.
        // ...
    }
    else
    {
        // You are probably here because someone canceled out of the UI flow to 
        // sign in or an expected error occurred.
        // Display some UI, such as "Press A or Enter to continue," and try the sign-in 
        // again with the UI flow.
    }

    delete asyncBlock;
}

```

## See also

[User identity and XUser](player-identity-xuser.md)