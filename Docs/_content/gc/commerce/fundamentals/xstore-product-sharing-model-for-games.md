---
author: joannaleecy
title: Product sharing model for games
description: >-
  Outlines how digital content&mdash;specifically, game-related content and add-ons&mdash;is shared between users on the Xbox One device family and on Windows 10 PCs. This topic is for game developers and describes the end-user's expectations about who has access to purchased content on a device that's shared by multiple
  users.
kindex:
- windows 10
- Xbox One
- Product sharing model for games
ms.author: cagood
ms.topic: conceptual
edited: '09/08/2021'
security: public
---


# Product sharing model for games

Users of Windows 10 and the Xbox family of devices enjoy the ability to share their digital purchases with others in their household.
However, sharing these digital items differs between the platforms for Xbox and Windows 10.
This has caused some confusion with game developers about when and where a user has access to digital content after a purchase.

This topic outlines how sharing differs between the two platforms.
Use this information to plan for working with the Xbox sharing policies when you design your monetization model and content.

The terms in the following table are important in this topic.  

| Term                              | Definition                    |
| --- | --- |
| Entitlement                       | A user's rights to a product. Obtained by direct purchase or by sharing on a device. |
| Satisfying entitlement            | An entitlement granted by a product that's being included in a bundle, subscription, or season pass. The user doesn't own the product directly but rather through ownership of the parent product. The parent product includes the satisfying entitlement. |
| License                           | A digital key that's used to indicate an entitlement to content, such as games, apps, and durables. Licenses are granted if a user has the required entitlement. Entitlements can be indicated by online or offline licenses.|
| Home console                      | An Xbox console that's designated to share the offline licenses of the purchasing account (also known as *Home Xbox*). |
| Offline PC                        | A Windows device that's designated to allow limited offline play and isn't subject to concurrency restrictions. |
| Durable                           | A piece of content that is intended as an add-on but limited to a single purchase. A durable may include a content package, but is not required. <br/><br/> Examples: Map pack and game expansion. |
| Consumable                        | A product that the user can purchase and exchange for a limited-use item, currency, or an effect within the game. Consumables have a quantity that reflects the number of that specific product available to the user. <br/><br/> The same user can purchase consumables multiple times to increase their quantity of the consumable product. The user’s quantity of the consumable is retrieved through the [XStore](../../reference/system/xstore/xstore_members.md) and [Microsoft Store service](../service-to-service/xstore-managing-consumables-and-refunds.md) APIs. When the user uses a quantity of the consumable product in-game, the title reports this quantity to the Microsoft Store. The amount consumed is then deducted from the user’s inventory. <br/><br/> Examples: In-game currency, limited-time stats boost, and special weapon ammunition. |

## Users and accounts

A user is a specific, physical person who interacts with a device. On Xbox, a user is associated with an Xbox Live account, which is the same account used for Xbox Live sign-in and Microsoft Store purchases.
Multiple users can sign in to an Xbox console, and each can have a separate Xbox Live account (unless playing as a guest).

On Windows, a user can sign in with different Microsoft accounts across multiple touch points.

- A Windows sign-in session
- The Xbox app (including Xbox Live enabled games)
- Microsoft Store
- Web browsers

Therefore, multiple users on a Windows 10 device can be represented by separate sign-ins.
The Xbox app and Microsoft Store currently enforce a limit of a single user focus within their individual scopes. However, they don't require or enforce that it's the *same* user between them concurrently.
Although it's not required, a game can implement a check to help ensure that the user account signed in to Xbox Live and that the account signed in to Microsoft Store are the same.
This most closely simulates the sign-in requirements and behavior on an Xbox device.
For more information see [Handling mismatched store account scenarios on PC](../pc-specific-considerations/xstore-handling-mismatched-store-accounts.md).

On all Windows 10 devices, the licensing and sharing behavior is tied to the Microsoft account that's currently signed in to Microsoft Store, not an account that's signed in to Xbox Live within a game.
In this topic, we use the term *account* instead of *user* to avoid potential confusion.

## Sharing model and policy for the Xbox device family

The following sharing policies and behaviors have been established for the Xbox One and Xbox Series family of consoles and are expected by customers.
These policies apply to all games and game add-ons excluding consumables.

### Xbox Home console sharing

Home console (**Settings** >
**Personalization** > **My home Xbox**), the purchaser of digital content on Xbox can share access with anyone else who signs in to the console.
While other accounts use the content, the purchasing account doesn't need to be signed in.
This applies to games, durable add-ons, and content enabled as part of a subscription (Ex: Xbox Game Pass).

Specifically, for durable add-ons (that is, downloadable content (DLC)) obtained through Microsoft Store, a game must not determine access to the content based on the direct entitlement of the signed-in account. Instead, the game must rely on the [XstoreAcquireLicense APIs](../../reference/system/xstore/xstore_members.md) to enforce access to durables as the licensing APIs will report proper sharing access.

Ownership of consumable add-ons is entirely per account and is not shared.

### Xbox digital content on any console

On a console that *isn't* the purchaser's Home console, when the purchaser is signed in and connected to Xbox Live, the purchaser and all other users of that Xbox (with Xbox Live accounts or as guests) have full access to the purchaser's library of digital games and durable content.

If the purchaser isn't signed in and someone who isn't an owner attempts to launch the title, the system shows the following message.

> **Do you own this game or app?**<br>
> If you have a game disc, insert it now. If you purchased this online,
> make sure you are signed in to Xbox Live. If you do not have the
> rights to play it, you can purchase it at the Microsoft Store
> (0x803f8001).

A link to the Microsoft Store page of the title is provided to the user to purchase their own entitlement.

If a user is playing a title they don't own and the owner account signs out, the game is terminated by the system and the "Do you own this game or app?" message appears.

### Xbox Live Gold sharing

The multiplayer and social benefits of Xbox Live Gold are shared with any other Xbox Live accounts that are signed in to the Home console without requiring the Xbox Live Gold subscriber to be signed in. 
On other consoles, these benefits are shared with any Xbox Live accounts, provided that the subscriber is signed in and connected to Xbox Live.

## Consumables sharing policy

Consumables are not shared between users and are tied to only the purchasing account.
Some monetization models and incentives for premium bundles may be implemented by using consumables because those items are intended to be granted to only the purchaser and not shared with others.
Examples include double XP weekends; exclusive cosmetic items; or one-time, in-game resource allotments. 
Some free-to-play game models also focus on per-user monetization for upgrades and items because there's no up-front cost to play the game for any user.

The main method that we recommend to implement single-purchase, per-user products is by offering in-game products purchased with virtual currency (consumables). 
See [Consumable-based ecosystems](xstore-consumable-based-ecosystems.md).

## Windows 10 sharing policy

Games on Windows, regardless of whether they're configured for Xbox Play Anywhere, are governed by specific licensing behavior for Windows apps. 
These terms affect both the installation and the ability to license&mdash;that is, concurrent execution&mdash;of the content. 
There are two main behavior profiles for paid content: *Windows 10 default* and *restrictive licensing*.

Following are the different licensing behaviors for sharing on Windows 10.

 *Default:*

All accounts on up to 10 devices can launch the title concurrently.

 *Restrictive licensing:*

- Offline PC: All accounts on this device can launch the title.

- Non-offline PC: The purchasing account must be signed in to the Microsoft Store app to launch the title, and only one instance of the title can be active at one time on all non-offline PCs.

### Windows 10 default

#### Installation

By default, paid apps can be installed on up to ten Windows 10 devices.
Installation requires the purchasing account to be signed in to Microsoft Store.
Note that this limitation is on the account, not the title.
When the purchaser signs in to a new device and downloads content onto it, the device is added to the account's download device pool.
If the account attempts to download the content onto another device when 10 are already in use, a message informs them that they need to remove a device from the pool before proceeding.

Following is the notification in the title's product details page that indicates that the title will follow this behavior.

> **Installation**<br>
> Get this app while signed in to your Microsoft account and install it on up to ten Windows 10 devices.

The Xbox console is included in the device pool. This pool can be viewed
and managed on accounts.microsoft.com as shown in the following screenshot.

![Screenshot of the Manage your download devices for apps and games page](../../../../resources/gamecore/secure/images/en-us/xstore/product-sharing-model-for-games-img1.png)

#### Licensability (concurrency)

After the title is installed on the device, it can be launched without restriction.
This means that, at any moment, the title can run on up to 10 devices at a time.
It doesn't matter whether the purchasing user is signed in to Microsoft Store, the Xbox app, or anywhere in Windows.
Therefore it's possible for 10 unique Xbox users to play under the single purchaser's license.
But single-point of presence (SPOP) is enforced so that each Xbox Live account can only be running one game instance at a time.
A single Xbox Live account cannot be signed into the game concurrently across 2 devices.

<a id="restrictive-licensing"></a>

### Restrictive licensing

#### Installation

In contrast to the Windows 10 default, publishers can request that a title be assigned the *restrictive licensing* policy, which adds concurrency checks to limit how many devices can run the app at the same time.
This is the policy that we recommend for all non-free games.
When restrictive licensing is enabled, the following message appears on the product detail page.

> **Installation**<br>
> Install on your home Xbox console and a Windows 10 PC and have access when you're connected to your Microsoft account.

The Xbox installation and sharing behavior remains unchanged as previously described in this topic.
On Windows, restrictive licensing means that the 10-device limit is lifted; that is, the title can be installed on an unlimited number of devices.

#### Licensability (concurrency)

Restrictive licensing imposes restrictions on the behavior of the title.
Specifically, it limits the ability for multiple installations of the app to run concurrently based on a single entitlement.
Using this model, only two Windows PC instances of the title can run at any one time.
The two instances would be the offline PC's license and the roaming license of the purchaser.

Starting with the Windows 10 Creators Update, an option was added to the Microsoft Store app to designate a specific Windows 10 device to be the offline PC.
The following screenshot shows offline permissions to manage devices.

![Screenshot of offline permissions to manage your devices. "Make this PC the one I use to run some games or apps that have limited licenses, even when I'm offline."](../../../../resources/gamecore/secure/images/en-us/xstore/product-sharing-model-for-games-img2.png)

When this option is enabled for a device, the title can be launched when there's no active Internet connection to check the app's license status.
However, the license must have been acquired and downloaded previously while the PC was online.
This license must be renewed periodically, which requires an Internet connection; it's not intended to enable permanent offline play.
Users can change their offline PC device up to *three times* in a 365-day period.

All other devices that aren't designated with offline permissions must acquire a roaming license when the title is launched, which requires the purchasing account to be signed in to the Microsoft Store app.
Acquiring a new roaming license revokes any active roaming license in use on any of the other devices that have the title installed.
When the license is revoked on a running instance of the app, the user is presented with a system dialog box when the app terminates as shown in the following screenshot.

![Screenshot of "This game has ended here because you started it up on another device."](../../../../resources/gamecore/secure/images/en-us/xstore/product-sharing-model-for-games-img3.png)

![alert](../../../../resources/gamecore/images/en-us/common/note.gif) **NOTE:** The offline PC isn't subject to this concurrency enforcement.

### DLC and add-ons sharing

Durable add-on types also have device-based sharing behavior and are governed by the same policy as the parent app.
Durables both with and without packages can be licensed, provided that the parent app is appropriately licensed.
The title must perform [XStore API](../../reference/system/xstore/xstore_members.md) license acquisition and verification, especially to access the contents of durables with packages.

### Single-user products

We recommend that games use game Microsoft Store-managed consumables for single-user products.

## Summary

You should now have a better understanding of how sharing works for game products on Xbox and Windows 10.
This information can help you to decide which product types and licensing models&mdash; for example, restricted licensing&mdash; that you want to employ with your game on Xbox or on Windows 10.
If you have questions or feel that the sharing model outlined here doesn't fit your game's monetization design, contact your Microsoft Account Representative.

## References

[Windows 10: Usage rules for Digital Goods ("Rules")](https://support.microsoft.com/help/10563/windows-10-usage-rules-digital-goods)

[Designate an Xbox One console as your home Xbox](https://support.xbox.com/games/game-setup/my-home-xbox)

[Playing your games on other Xbox One consoles](https://support.xbox.com/games/game-setup/playing-across-multiple-consoles)

[Sharing your Xbox Live Gold subscription](https://support.xbox.com/xbox-one/xbox-live/xbox-live-gold-sharing-features)

## See also

[Commerce Overview](../commerce-nav.md)

[XStore API reference](../../reference/system/xstore/xstore_members.md)