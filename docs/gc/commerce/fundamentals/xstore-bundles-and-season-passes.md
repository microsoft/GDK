---
title: Bundles and Season Passes
description: Describes the usage and implementation of Bundles and Season Passes within the Microsoft Store.
kindex: Bundles and Season Passes
author: joannaleecy
ms.author: cagood
ms.topic: conceptual
edited: '09/08/2021'
security: public
---


# Bundles and Season Passes

Offering bundles or season passes for your game can provide good value for the user and help offer increased revenue potential. 
Typically the value to the customer comes in the form of a discounted price on the total of the content included or by providing exclusive content or access to content (such as Betas) for purchasing the bundle or season pass. 
Developers benefit by having users engaged and invested into the game long-term. 
This is especially effective for pre-order bundles.  But there must be value and good incentives for the end-user when configuring using these product types.

Although both product types 'bundle' content together for a single price, there are differences between these product types and how they are used within the Microsoft Store:

* Game bundle - Can include Game product types, DLC, etc. across the publisher.
* Add-on bundle - Includes add-on products under a single title that have already been released.  
* Season Pass - An Add-on bundle that includes products of the parent title that may not have been released yet and will be added later.  

## How bundles reflect ownership and entitlements to the included contents

When a user purchases bundle type product, the user is granted a license for each included Game and Durable. 
This reflects in the Store UI by showing the users 'you own this item' and offering to install the item. 
This license is as if they had purchase the included item directly and will behave as such as per the [Product sharing model for games](xstore-product-sharing-model-for-games.md). 
So other users on a shared console or PC would have access to the contents as well. 
When using the [XStore](../service-to-service/microsoft-store-apis/xstore-nav.md) APIs for your in-game store, the included items will also show as owned by users on a shared device. 
If your design calls for specific Season Pass benefits that apply to the pass holder and should not be shared, you will need to [query the user's entitlements from your services](../service-to-service/xstore-query-user-entitlements.md).

Consumable products included in a bundle product however are only granted once at time of purchase to the purchasing account and not shared.

While the client will show the bundle and its contents as owned by all shared users, the behavior is different when [managing products from your services](../service-to-service/service-to-service-nav.md). 
The service-to-service calls are scoped to just what the user owns directly and not shared entitlements. 
The bundle or Season Pass product will show up in these results as owned, but the included products will be reported as satisfying entitlements. 
If your query request does not specify to include satisfying entitlements, the included products will not be shown in the results. 
For more information see [Understanding satisfying entitlements in the response](../service-to-service/xstore-query-user-entitlements.md#satisfying-entitlements).

<a id="gamebundles"></a>

## Using a Game Bundle with your game

Game Bundles have the ability to include all product types and content across a publisher's catalog. 
Some common examples are:

* Pre-order bundle - Includes game not yet released and exclusive pre-order content / incentives.
* Starter Edition - Includes game product but with limited features or characters as a starter or free-to-play entry point for users to a game.
* Standard Edition - Used with free-to-play games or Starter Edition bundles. 
Includes the Starter Edition content and unlocks the full features or characters of game. 
This is the equivalent of the full base game purchase.
* Deluxe Edition - Includes the game product, season pass, DLC, and other exclusive content or incentives.
* Franchise bundle - Includes all games (and content if available) from a specific franchise under a publisher.

### Including a Season Pass in your game's bundle

If you are configuring a game bundle that will include a Season Pass or another bundle product, you must include that bundle **and** the contents of that bundle or Season Pass individually in the bundle you are configuring. 
This is to ensure that the user sees all the content included in the bundle and gets proper licenses for the individual contents. 
This also marks the included bundle or Season Pass as 'owned' in the store UI to prevent users from re-purchasing the bundle that they already have an entitlement to. 
This also ensures that when the user purchases the bundle all of the included items will get installed on the user's device.

If you add a new item to your Season Pass, you will also need to add this item to all existing bundles that included that Season Pass. 
Such as Deluxe Editions or Pre-order bundles.  

### Pre-order Bundles

If offering pre-order versions of your game bundles, you will need to include the post-release bundle in the pre-order bundle to ensure that the post-release version of the game bundle shows as 'owned' in the Store UI. 
Just like adding a Season Pass above, a pre-order bundle should include all of the individual items of any included bundles.  

An incentive or bonus product(s) for pre-ordering the game should also be included in these bundles. 
Examples of incentives are access to a Beta test, cosmetic items, or limited time access to items.  

### Configuring a Game Bundle in Partner Center

Because a bundle product's scope is across your publisher, you create it from the publisher's Overview dashboard.  

1. From the **Overview** page of the publisher, select **Create a new...*** to open the drop-down menu.

2. Select **Create a new bundle**.

3. Enter the string name the product and select **Create this product in a sandbox**.

4. Click **Create**.

5. Enable the check box for **Make this product a season pass**.

6. Select **Create**.

7. From the **Bundle setup** page, enable Retail and Sandbox check boxes for each platform the product should be available on.

8. Select **Manage included products**

9. Select all the products to be included in the bundle (this includes items inside of a Season Pass or other bundle that this new bundle will include).

10. Click **Continue**.

11. If an item should not be shown as 'included in' the bundle until a later date, change the **Visible** in bundle setting as appropriate.
> [!NOTE]
> Making a product visible at a future date in the bundle will only hide that product from the bundle Store Listing page until the specified date. 
Consumers that own the bundle will immediately own the included hidden member and can potentially use the content. 
Disable store presence for the add-on if you don't want your products to be accessible before their release date.

12. If this bundle includes a game product select the game from the **Edition of** drop-down. 
This enables Store UI when a customer chooses to buy the game that shows the bundle options for buying the game.  

13. Select **Save draft**.

14. Configure the rest of the store properties, ratings, listings, pricing, and then publish to your Sandbox.
> [!NOTE]
> If your bundle includes a Season Pass that then has additional content added, you will need to update this bundle as well to ensure users get access to the new content.

<a id="seasonpass"></a>

## Using a Season Pass within your game

A Season Pass is unique from a bundle product because it only scopes to the content within a single game. 
A Season Pass is intended as an offering of content and experiences to a user during a set time period after the game is launched. 
Season Passes are also intended to contain content that may not yet be released, or even configured on Partner Center yet. 
When planning your Season Pass offerings and content you should contact your Microsoft Developer Partner Manager who can provide guidance and review your plans. 
Examples of using a Season Pass:

* First 12 months of planned DLC content bundled together at a discounted price
* Season Pass owners get exclusive first access to new characters, maps, or bonus rewards in-game
* Season Pass owners get an allotment of monthly in-game currency (this is controlled through your own services, not configurable in Partner Center)
* Season Pass owners get access to new rewards and progressions within the defined season's time frame.

### Season Pass best practices

When offering a Season Pass it should include at least one product at release. 
This can be a bonus or incentive item for users who have purchased the season pass. 
This can be an exclusive cosmetic item, or other bonus but it should be a unique product in the store so that it has its own product details page. 
This ensures that the details page for the Season Pass has the 'Included in this bundle' section and is easier for users to verify they have the Season Pass when managing their content. 
The Season Pass product does not show up in the Console's My Games and Apps UI for example, but this included product would. 
Therefore it is also recommended to reference the Season Pass in the bonus product's name. 
Ex: "Title's Season Pass Exclusive Content".

As a Season Pass represents a user buying-in to the upcoming content and features of a title, some of these products may not yet be announced publicly. 
It is a good practice to provide proper description text of the marketplace item referencing upcoming content such as 'Includes the first three story expansion DLCs'. 
When the new product is added and the Season Pass punished, current Season Pass owners should automatically get a license to be able to download and play the new content.

When a new item is added to the Season Pass, the owner gets a license for the product automatically. 
This also reflects on the new product's store page as 'owned' and it will also show up in the My Games and Apps UI for download. 
However, if the new product includes a download package, that package will not be automatically downloaded. 
Your title can use the [XStoreDownload APIs](../service-to-service/microsoft-store-apis/xstore-nav.md) to help the user download the item from within the game if you detect it is not installed, or they can download from the Store or My Games and Apps themselves.  

### Configuring a Season Pass in Partner Center

A Season Pass is configured in Partner Center as an Add-on Bundle under the parent game.  

1. From the **Submission overview** page of the parent game, go to the **Add-ons** page.

2. Click **Create a new...** to open the drop-down menu, and then select **Add-on bundle**.

![Screenshot of Season Pass Creation](../../../../resources/gamecore/secure/images/en-us/xstore/seasonpasscreation.png)

3. **Product ID** is a custom string that will be how the product is shown to you in the PartnerCenterUI. 
We recommend a recognizable string name as seen in the screen shot above.

4. Enter the string name the product will be shown as in the store in the **Name** field.

5. Enable the check box for **Make this product a season pass**.

6. Select **Create**.

7. From the Season Pass's Overview page select **Season pass setup**

8. Enable Retail and Sandbox check boxes for each platform the product should be available on.

9. Select **Manage included add-ons**

10. Select the products to be included in the Season Pass at release and select Continue.

11. Select **Save draft**.

12. Configure the rest of the store properties, ratings, listings, pricing, and then publish to your Sandbox.

As future content included in the Season Pass is released, add those items to the **Included add-ons** list and republish both the Season Pass and the new product (if already in the store).  

## See also

[Commerce Overview](../commerce-nav.md)

[XStore API reference](../../reference/system/xstore/xstore_members.md)