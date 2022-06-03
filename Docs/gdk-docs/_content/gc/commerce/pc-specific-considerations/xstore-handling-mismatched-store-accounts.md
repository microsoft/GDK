---
title: Handling mismatched store account scenarios on PC
description: Describes the PC specific scenario and how to handle when users have different accounts signed into the game and store.
kindex: Handling mismatched store account scenarios on PC
author: joannaleecy
ms.author: cagood
ms.topic: conceptual
edited: 07/02/2021
security: public
---


# Handling mismatched store account scenarios on PC

The `XStoreContext` on PC titles in production will always be linked to the Microsoft Account (MSA) that is currently signed into the Microsoft Store app. 
All XStore API results and transactions will be scoped to this actively signed-in MSA. 
However, this account can be switched by the user signing out and in with another account in the Microsoft Store app at any time without notice to the running game. 
The Microsoft Store account may also be switched by the Xbox app if the user has set the preference to make sure their Xbox Live account is their purchasing account when playing games on PC. 
Similarly, the Xbox Live account may be switched to be different from the Microsoft Store account when a game presents the Xbox Live sign-in flow. 
The scenarios that result in the accounts being mismatched may be intentional. 
Not properly designing for and handling cases where accounts can be switched or mismatched between the account playing the game and the account currently signed-in to the Microsoft Store can lead to user frustration not receiving purchased in-game items and costly Customer Support engagements.

The following article describes how to plan for, handle, and mitigate scenarios related to having one user account signed into your game and another account signed into the store.

![alert](../../../../resources/gamecore/images/en-us/common/note.gif) **NOTE:** The scenarios outlined above are not an issue on the Xbox console. 
The `XStoreContext` will always be tied to the `XUser` account you created the context from. 
Therefore, the XStore APIs and transactions will always be tied to the `XUser` which should be the active user in your game.

![alert](../../../../resources/gamecore/images/en-us/common/note.gif) **NOTE:** When testing in a Developer Sandbox, this is not in effect and the Store credentials are always tied to the account signed into the Xbox app.  Therefore this scenario can only be tested and seen in the production / RETAIL environment.  See [Testing mismatched account scenarios](#testmismatch) for more info.

## General guidance

Games that are not Xbox Live-enabled (i.e. use an Xbox Live account to represent the playing user) should plan for and understand that the purchasing account (MSA signed into the Microsoft Store) can change at any time. 
Therefore, when consumable products are purchased in-game the game should immediately start the commerce flow to query for the purchased consumables and fulfill (consume) the item. 
The game or a title service will then update and track the balance of the consumable for that user.
This is similar to mobile game commerce where the primary device account is the one that pays but the game account, whatever that is, gets the in-game credit for the purchase. 

For more guidance See [Managing consumable products and refunds from your service](../service-to-service/xstore-managing-consumables-and-refunds.md).  

Games that support Xbox Live should decide if they will support mismatched accounts (MSA) between the Xbox Live services and the Microsoft Store or force the user to sync the accounts to enable in-game purchase and use of content. 
Telemetry reported from Windows indicates that 10-15% of Xbox Live users have a different MSA signed into the Microsoft Store app than the Xbox Live service in a Windows session. 
Therefore, it is recommended to support the mismatched account scenario for this user group. 
However, if the game's design, systems, and commerce are built around the assumption that the Xbox Live account is also the purchasing account, there are steps to check that the MSA accounts are in sync between Xbox Live and the Microsoft Store. 
An example of a game that may want to ensure the accounts are synchronized is a game supporting both the Xbox Console and Windows PC versions using the same game services. 
Similarly, a game that was originally released on the Xbox and ported to the PC may be designed around the playing account and commerce identity being the same. 
The specific implications and issues around handling the mismatched accounts within your Xbox Live-enabled game are outlined in the sections below. 


### Example scenario

Your Microsoft Account (MSA) is signed into the Windows PC and also the Microsoft Store app. 
You purchase an Xbox Live-enabled game through the Microsoft Store (or download through PC Game Pass) and install the game. 
When launching the game, you select your Xbox Live account that is the same credentials (MSA) as the account signed into the Microsoft Store. 
When you purchase an in-game consumable your account is charged and credited the expected consumable quantity in the Microsoft Store services. 
The game or game's back-end services query your entitlements, see the consumable, fulfill the consumable, and grants the product or value to your in-game account.

Later your child wants to also play the game and signs-in to Xbox Live in the game with their own Microsoft Account. 
The Microsoft Store app still has your Microsoft Account signed in. 
The child starts a purchase in-game for the same consumable you purchased above. 
Again, your Microsoft Account is charged and credited in the Microsoft store. 
The game or back-end services query for new entitlements based on the `XStoreContext` and sees the consumable in your account's store results. 
The game or back-end service fulfills the consumable and grants the product to the active player, who in this instance is now your child's account.

The end result is that the your account is charged, but the game gives the in-game product or value to your child's account instead of your account.


## Server-to-Server issues with X-Tokens

Titles that use Xbox Live have access to using X-Tokens to make calls on-behalf-of the user playing the game from their back-end services. Particularly, querying products the user owns and [following best practices for implementing a consumable commerce system](../service-to-service/xstore-managing-consumables-and-refunds.md) within your game. 
However, Delegated Auth X-Tokens are tied to the Xbox Live user account that is playing the game. 
Therefore, using X-Tokens for server-to-server calls to the Microsoft Store APIs will not be able to handle the mismatched account scenario outlined above. 
The query results will only return what the Xbox Live account's MSA purchases when signed into the Microsoft Store.

## Server-to-Server auth with User Store IDs

To handle the mismatched account scenarios, service-to-service calls to the Microsoft Store APIs must use the [User Store ID](../service-to-service/xstore-authenticating-your-service.md#user-store-id) for authentication. 
A User Store ID is a secure token obtained from the client so that it represents the identity of the account signed into the Microsoft Store at that moment. 
It is then used in the authentication flow to the Microsoft Store APIs on behalf of the user represented in the User Store Id.

For more information see [Authenticating through a User Store Id for PC titles](../service-to-service/xstore-authenticating-your-service.md#user-store-id)

## Recommendations when requiring synchronized accounts for in-game commerce

Although it is recommended that Xbox Live-enabled titles support the mismatched account scenarios, it is not required. 
The running title can do a validation check to know if the Xbox Live account playing the game matches the same MSA signed into the Microsoft Store, allowing the title to block in-game transactions and purchases when they are not the same. 
This also allows the game services to only act on and consume items through the service-to-service calls that the Xbox Live account directly owns. 
To get more information on how to check when the accounts are mismatched, contact your Developer Partner Manager or Microsoft Contact.

If you choose to require the user to synchronize their accounts signed into Xbox Live and the Microsoft Store, your title must provide UI and guidance for the user to understand when their accounts are not the same and how to resolve the issue. 

The following are recommendations on how to accomplish this:

- Notify the user early in the game's UI that the account signed into the Microsoft Store is different from the Xbox Live account playing the game.
- Explain that add-ons or content purchased for the game will not work unless the account signed into the Microsoft Store is the same as their Xbox Live account.
- Note that the in-game store will not allow purchases unless the accounts are the same.
- Provide guidance to go to the Microsoft Store app and sign-in with the same account used for Xbox Live. 
- Provide guidance to go to the Xbox app and set the preference to sign their Xbox Live account into the Microsoft Store for them.


## Issues detecting and handling refunds when the game and store accounts are not the same

When the game account and store account do not match, this makes handling refund reports difficult if your service is not properly tracking which accounts get credit for specifically consumed items. 
A single game account may have items credited to their account purchased from different Microsoft Store accounts. 
Similarly, a single Microsoft Store account may have made purchases credited to multiple different game accounts. 

If your game on Windows PC allows mismatched store account scenarios, you must cache a UserPurchaseId tied to the same user of the UserCollectionsId used to preform the consume request.
You then call the clawback service for each consume transaction using that UserPurchaseId instead of one call to Clawback per-user in your system.

For more information see [Using the Clawback service to detect refunded products](../service-to-service/xstore-managing-consumables-and-refunds.md#pc-multi-account-clawback)

<a id="testmismatch"></a>

## Testing mismatched account scenarios
As noted previously, the mismatched account scenarios will not be effective and testable in development sandboxes. 
This is because the identity and results of the store APIs will be tied to the account signed into the Xbox app on PC in development sandboxes. 
Therefore you can only test or verify mismatched account scenarios in the production / RETAIL environment. 
To do this, you should setup a private flight group in Partner Center with your test accounts for the RETAIL environment. 
You then can publish your title or test title to RETAIL where only the accounts in that flight group can view it. 
That will allow you to test the scenarios of multiple accounts signed in between the Xbox app and Microsoft Store app.

## See also

[Commerce Overview](../commerce-nav.md)

[Manage products from your services](../service-to-service/service-to-service-nav.md)

[XStore API reference](../../reference/system/xstore/xstore_members.md)