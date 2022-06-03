---
author: joannaleecy
title: Basic DRM and license checks
kindex: Basic DRM and license checks on PC
description: Outlines considerations and preventative measures PC titles should take to avoid piracy and ensure the game is running with a valid license.
ms.author: cagood,timch
ms.topic: conceptual
edited: '09/08/2021'
security: public
---


# Basic DRM and license checks

The Microsoft Store licensing system performs a license check when a game distributed through Microsoft Store launches.
The OS won't launch the game unless the user has a valid license for the product including direct ownership, a [shared license](../fundamentals/xstore-product-sharing-model-for-games.md), or a disk license (Xbox console only).
However, on PCs, after a user has a valid license, they can easily decrypt the content, run it outside the context of Microsoft Store, share it with others, and thereby bypass the Microsoft Store licensing system.
Therefore, we recommend that you add a basic license check to any PC game that wants to protect against this behavior.

## Levels of digital rights management (DRM) protection

The Microsoft Store licensing system on PC protects against only the most basic of attacks.
We recommend that you don't rely on it exclusively for content that requires protection.
The following are several steps that can add layers of protection against more advanced attacks.

1. Game-initiated license check at game start
2. Anti-tamper protection for the game's license check
3. Service-side license verification using a [License Token](xstore-license-tokens.md)

### Basic license check

At a minimum, we recommend that you add a basic license check for any game that wants DRM protection.
The following code example shows a basic implementation to perform this check, even if you use no other Gaming Runtime&ndash;related API calls.
You can simply add the code to your startup path, and add specific UI that shows for a failed license check.

```cpp
void CALLBACK LicenseCheck(XAsyncBlock *async)
{
    XStoreGameLicense license;
    HRESULT hr = XStoreQueryGameLicenseResult(async, &license);
    if (SUCCEEDED(hr))
    {
        if (!license.isActive)
        {
            // Failed to retrieve a license
            // Consider the title to be unlicensed
        }
        else
        {
            if (license.isTrial)
            {
                // Validated that the user has a trial license
                // Check additional attributes to ensure active trial
                // See "Implementing Trials for your game"
            }
            }
            else
            {
                // Validated that the user has a real license
                // Consider the title to be licensed and continue
            }
        }
    }
    else
    {
        // Failed to retrieve a license
        // Consider the title to be unlicensed
    }

    delete async;
}

void CheckLicense()
{
    auto async = new XAsyncBlock{};
    async->context = this;
    async->queue = m_asyncQueue;
    async->callback = LicenseCheck;

    HRESULT hr = XStoreQueryGameLicenseAsync(
        storeContext,
        async);

    if (FAILED(hr))
    {
        // StoreContext may be invalid
        // If loose deployed or side-loaded package, check that the game configured to be licensed
        // See "Enabling XStore development and testing"

        delete async;
    }
}
```

### Third-party anti-tamper protection

Although the basic license check above provides some protection, it's very common for attackers to bypass this type of protection by modifying the game's executables to bypass this check.
Thus, the next step in securing your game is to use a third-party anti-tamper product to prevent these lines of attack.
There are options available for GDK PC games.
Work with your third-party vendor to get detailed instructions about how to incorporate this protection into your game.

### Service-side license verification

Anti-tamper protections do a good job at protecting titles at launch, but eventually, many of them will be bypassed.
To go a step beyond, online-enabled games can perform a service-side license verification check and thereby block many client-side attacks.
For more information on this see [License Tokens Overview](xstore-license-tokens.md).

The basic outline is as follows.

1. The game service requests a License Token from the game client and includes a game-service&ndash;generated GUID representing that unique request.
2. The client then calls into a client API [XStoreQueryLicenseTokenAsync](../../reference/system/xstore/functions/xstorequerylicensetokenasync.md).
3. This calls into the licensing service and determines whether the game should return a license to that user.
4. If the API is able to obtain a valid license, a signed License Token is returned that contains the service-provided session identifier.
5. The client then passes the License Token back to the game service.
6. The game service validates the signature ensuring that the license came from the Microsoft Store and was not modified
7. The game service then checks that the session GUID matches the one passed to the client in step 1.
8. Game service can then trust that the licensing information in the token is valid

This technique works online only and requires the game to have its own service.
It provides the highest level of protection that's currently available.

## References

[Commerce related information specific for PC enabled titles](pc-specific-considerations-nav.md)

[Product sharing model for games](../fundamentals/xstore-product-sharing-model-for-games.md)

[License Tokens Overview](xstore-license-tokens.md)

[Commerce Overview](../commerce-nav.md)

[XStore API reference](../../reference/system/xstore/xstore_members.md)