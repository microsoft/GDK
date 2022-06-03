---
author: joannaleecy
title: Implementing Trials for your game
description: Describes trial options and how to configure usage-limited free trials in Partner Center.
kindex: Implementing Trials for your game
ms.author: cagood,timch
ms.topic: conceptual
edited: '09/08/2021'
security: public
---


# Implementing Trials for your game

![alert](../../../../resources/gamecore/images/en-us/common/note.gif) **NOTE:** Some trials are free but are limited to users who own specific subscriptions.
This topic applies to those trials as well.

You can configure several different types of free trials for your game:

* *Time-limited free trials* - These trials expire after a certain amount of *calendar* time has passed (for example, seven days after the user downloads the trial, regardless of how long they use it).
* *Usage-limited free trials* - Allows configuration to let the user run the game for a certain amount of *game runtime*, then requires that the user purchase the game to continue using it.  
* *Curated trials* - These trial have no expiry or game runtime limits, but the game can limit what is playable. 
This is similar to a demo, but the whole game is still required to be downloaded.

## Configuring a usage-limited trial in Partner Center

![alert](../../../../resources/gamecore/images/en-us/common/note.gif) **NOTE:** You can access this feature only if you have the proper permissions and if your game uses [restrictive licensing](../pc-specific-considerations/xstore-open-and-restrictive-licensing.md).
For details, contact your Microsoft account manager.  

You can configure usage-limited free trials in Partner Center without altering the game's code.
However, you have to add code in the following scenarios:

* You want to restrict access to users who acquired the trial
* You want to save the game state between play sessions; the save carries over if the game is purchased with the same Microsoft account as the one that was used to acquire the trial

1. From the **Submission overview** page, go to the **Pricing and availability** page.

2. Under **Free trial**, open the drop-down menu, and then select **Usage-limited**.

3. In the second drop-down menu that appears, select the maximum time that users can use your app.

4. Select **Save**.

After you publish your game to Microsoft Store, you'll see the trial information on the game's product page.

## Restrict access to users who have acquired the trial

In some cases, you might want to let only trial owners run the game.
This will be important especially for a usage-limited trial as you don't want someone else to run down the trial time for your account.
You can implement this functionality by checking the [XStoreGameLicense](../../reference/system/xstore/structs/xstoregamelicense.md)`.isTrialOwnedByThisUser` property.
If it's `false`, block the current player from proceeding or at least informing them they should obtain their own trial.

The user that owns the active trial license is displayed on a message when the trial game is launched:

![Usage limited trial TCUI: "<Gamertag>, you have less than x hours left"](../../../../resources/gamecore/secure/images/en-us/xstore/usagelimitedtrial.png)

The following code example shows how to do check `isTrialOwnedByThisUser`.

```cpp
void CALLBACK GameLicenseTrialCheck(XAsyncBlock* asyncBlock)
{
    XStoreGameLicense result{};

    HRESULT hr = XStoreQueryGameLicenseResult(
        asyncBlock,
        &result);

    // Is this a trial?
    if (result.isActive && result.isTrial)
    {
        // Is this trial owned by this user?  
        if (!result.isTrialOwnedByThisUser)
        {
            // The user can't use another user's trial time. Show an error message.
        }
    }
}

void Sample::QueryGameLicense(XStoreContextHandle storeContextHandle, XTaskQueueHandle taskQueueHandle)
{
    auto async = new XAsyncBlock{};
    async->context = this;
    asyncBlock->queue = m_asyncQueue;
    asyncBlock->callback = GameLicenseTrialCheck;

    HRESULT hr = XStoreQueryGameLicenseAsync(
        storeContextHandle,
        async);
}

```

## Save the game state for the original trial user

Xbox Live-enabled games that have single player campaigns or other game modes tracking progress between sessions will use connected storage to save the game state.
With a limited trial, however, a PC user can create multiple Microsoft accounts and keep playing beyond the time limit while saving progress (by using the same Xbox Live account).
For more information on this PC scenario see [Handling mismatched store account scenarios on PC](../pc-specific-considerations/xstore-handling-mismatched-store-accounts.md).

This can be prevented by saving the [XStoreGameLicense](../../reference/system/xstore/structs/xstoregamelicense.md)`.trialUniqueId` value when the game progress is saved.
Subsequently, when the user starts playing the trial again, you can check whether the `trialUniqueId` value matches the one from the first run.

This code assumes the game saves the `trialUniqueId` as part of the game save, and has a `GetSavedTrialUniqueId` function that returns this value.

```cpp
void CALLBACK GameLicenseTrialCheck(XAsyncBlock* asyncBlock)
{
    XStoreGameLicense result{};

    HRESULT hr = XStoreQueryGameLicenseResult(
        asyncBlock,
        &result);

    // Is this a trial?
    if (result.isActive && result.isTrial)
    {
        // Is this trial owned by this user?
        if (!result.isTrialOwnedByThisUser)
        {
            // The user can't use another user's trial time. Show an error message.
        }
        else
        {
            // Read the trialUniqueId that was saved with the game on the first run.
            char trialUniqueId = GetSavedTrialUniqueId();
            if (trialUniqueId != result.trialUniqueId)
            {
                // Because the IDs don't match, start the game from the beginning.
            }
        }
    }
}
```

## Testing trials in development

In order to test your game with a trial license, the game must first be configured with a trial license in Partner Center.
Then, as covered in the article [Enabling XStore development and testing](../getting-started/xstore-product-testing-setup.md), your development build must be configured properly to make it licensable.

### Xbox

For loose builds, apply the content ID and EKBID overrides in Microsoftgame.config.
Unlike with a full license, however, the actual EKBID from a trial build must be used here.

```xml
  <StoreId>9NTL0QDWZ4FS</StoreId>
  
  <DevelopmentOnly>
    <ContentIdOverride>2797FA46-A93B-494C-AD80-B67C9FCA939F</ContentIdOverride>
    <EKBIDOverride>37E80840-6BE0-46F8-8EDB-92F877056087</EKBIDOverride>
  </DevelopmentOnly>
```

The actual EKBID is obtained by downloading the game build from the Store with an account that has a trial license.

![Trial PDP with "Install Free Trial" button highlighted](../../../../resources/gamecore/secure/images/en-us/xstore/pdptrial.png)

After the launch chunk is reached look for the EKBID using `xbapp list /d` or `xbapp getekbid`.

```cmd
> xbapp list /d

  41336MicrosoftATG.InGameStoreXS_2020.7.27.0_neutral__dspnxghe87tn0
        Install
        Drive: Development
        Size: 0.28 GB
        ContentId: {2797FA46-A93B-494C-AD80-B67C9FCA939F}
        ProductId: {4C544E39-5130-3044-C057-5A3446536A00}
        EKBID: {37E80840-6BE0-46F8-8EDB-92F877056087}
        DisplayName: ATG In-Game Store Sample
        41336MicrosoftATG.InGameStoreXS_dspnxghe87tn0!Game

> xbapp getekbid 41336MicrosoftATG.InGameStoreXS_dspnxghe87tn0!Game

{37E80840-6BE0-46F8-8EDB-92F877056087}
The operation completed successfully.
```

For packaged builds, the content ID is passed in through `makepkg`, and the EKBID is set after the packaged build is installed using `xbapp setekbid`.

Once these are configured and you are using a [test account](../../live/test-release/test-accounts/live-setup-testaccounts.md) that has acquired the trial license from the store, `XStoreGameLicense` will exhibit accurate trial attributes.
Launching the build should display the trial notification as shown above.

### PC

This will be the same as how to enable builds with a full license&mdash;use the correct app identity in MicrosoftGame.config and ensure the proper content ID in the registry location, and the build will respect the license for the signed in account of the Microsoft Store app, trial or otherwise.

## See also

[Commerce Overview](../commerce-nav.md)

[Enabling XStore development and testing](../getting-started/xstore-product-testing-setup.md)

[XStore API reference](../../reference/system/xstore/xstore_members.md)