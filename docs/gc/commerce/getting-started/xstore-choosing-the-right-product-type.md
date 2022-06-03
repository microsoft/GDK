---
title: Choosing the right product type
description: Describes the different product types in the Microsoft Store and scenarios that fit best for each one.
kindex: Choosing the right product type
author: joannaleecy
ms.author: cagood.timchen
ms.topic: conceptual
edited: '09/08/2021'
security: public
---


# Choosing the right product type

It is important to choose the right product type for monetization features you are offering.
All of these start with configuration in Partner Center, where the following types are supported:

||Summary|Examples|
|-|-|-|
|[Bundles](#bundles)|A single product that includes multiple products for a single price|Season Passes, Game Compilations, Pre-orders, etc.|
|[Consumables](#consumables)|Micro-transaction based products that can be re-purchased|Premium In-game currency|
|[Durables](#durables)|Add-on products that are intended to be purchased once|Expansion packs, pre-order incentive content, etc.|
|[Subscription](#subscriptions)|A recurring transaction product that can be auto-renewed or canceled|MMO subscription|

This section will go over each and the scenarios where these are used.

<a id="bundles"></a>

## Bundles

There are three different bundle product types within the Microsoft Store that have different functionality and uses:

||Can add to|Can be empty|Can include game|
|-|-|-|-|
|[Game Bundle](#game-bundle)|yes|no|yes|
|[Add-on Bundle](#add-on)|yes|no|no|
|[Season Pass](#seasonpass)|yes|yes|no|

![note](../../../../resources/gamecore/images/en-us/common/note.gif)**Note** After a bundle is published to RETAIL included products cannot be removed from the bundle.

For additional information see [Bundles and Season Passes](../fundamentals/xstore-bundles-and-season-passes.md).

<a id="game-bundle"></a>

### Game Bundle

Contains a base game bundled with one or more add-ons or other games as different editions or to offer multiple games as a compilation.
Products can be added to a bundle after publish, but not removed.
Game bundles are also used to define compilation discs, which will typically include one or more games and their associated DLC.

This product type is not an add-on, but instead it is created by selecting 'Create a new bundle' from the publisher's products Overview page in Partner Center.

For more information see [Using a Game Bundle with your game](../fundamentals/xstore-bundles-and-season-passes.md#gamebundles)

<a id="add-on"></a>

### Add-on bundle

Includes multiple released add-on products associated with a single title.
This is a good option for providing the best content of your title at a discounted price for new users, for example, after a free-play weekend.

<a id="seasonpass"></a>

### Season Pass

A special case of an add-on bundle that will contain products that have not yet been released and will be added to the bundle later.
Upon release, at least one product is required to be included in the Season Pass however.
Note, it is not necessary to brand a Season Pass product with "Season Pass" in the name.
More than one Season Pass can be offered per-game as well.
For more examples and information see [Using a Season Pass within your game](../fundamentals/xstore-bundles-and-season-passes.md#seasonpass).

<a id="consumables"></a>

## Consumables

Consumable products are intended to provide temporary or limited use items in-game that the user can then re-purchase and use.
Most commonly an in-game premium currency is implemented through consumable products.
These are also considered single-user purchases and are not shared through game licensing or sharing policies.
There are two consumable product types in the Microsoft Store:

||Summary|Examples|
|-|-|-|
|[Microsoft Store-managed](#store-managed)| Can be purchased multiple times before being fulfilled, balance can be tracked through Microsoft Store or your own custom service. | Most in-game currencies and consumable products are configured as this type. |
|[Developer-managed](#dev-managed)| Can only be purchased again after the previous purchase has been reported as fulfilled to the Microsoft Store. | Consumable that is only intended to be purchased once such as an introductory in-game currency pack. | 

The recommended type to use with modern games is Microsoft Store-managed consumables.
For additional information see [Consumable-based ecosystems](../fundamentals/xstore-consumable-based-ecosystems.md).

<a id="store-managed"></a>

### Microsoft Store-managed

This type of consumable is associated with a **quantity** granted to the user on purchase that is added to their remaining **balance** of that consumable to use in-game that is tracked with the Store APIs.
When the game reports an amount as fulfilled or consumed in-game the service deducts that amount from the user's remaining balance.
The quantity granted on purchase is configured in the product setup. Microsoft Store-managed consumables can be purchased repeatedly without the product being reported as fulfilled or consumed.

The consumable balance can be queried and consumed using the `XStore` APIs or calls to the Microsoft Collections service.

For best practices and recommendations see [Managing consumables](../fundamentals/xstore-consumable-based-ecosystems.md#managing).

This product type is also referenced as a "managed consumable" in some documentation.

<a id="dev-managed"></a>

### Developer-managed

The other type of consumable, **Developer-managed** is a product type that can only be purchased a single time before it is fulfilled (i.e. consumed) by the client, which then makes it purchasable again.
This fulfillment operation is what the game would use to assign a reward which is entirely tracked by the game.

One scenario where this might be useful is to offer a single-purchase consumable that represents a one-time reward that cannot be replenished.
Simply do not fulfill the consumable and it cannot be purchased after the initial purchase.
Note that this contrasts with a durable as durables need to adhere to sharing behavior where consumables are specifically per-user.

Also known as "unmanaged consumable".

<a id="durables"></a>

## Durables

Durables are intended for single-purchase items such as expansions, map packs, or other forms of downloadable content.
Durables follow the sharing behavior as described in the [Product sharing model for games](../fundamentals/xstore-product-sharing-model-for-games.md), namely they are shared for all other accounts on a gaming device if the purchasing user is present in some way.
There are two types of durable products:

- [Durables with a package](#dwibs)
- [Durables without a package](#dwobs) (also known as Durable add-ons)

<a id="dwibs"></a>

### Durables with a package

This is commonly used for offering **additional** content that is not part of the base game experience, such as narrative chapters, expansion modes, vehicles, environments, and character assets.
After purchase, download and installation of the package will be required to properly license and mount the content.

In Partner Center this is known as a **Durable with package** type.
Just like with the base game, a package for each gaming device supported will need to be created and submitted for each durable with package product.

The game must support being able to purchase the durable products and react to the installation of the new content without needing to restart the game.
Specific APIs need to be called first to acquire a license for the package and then mount it for use.

If additional content is being split up as durable packages (i.e. DLC) as a mechanism to partition the game into parts that can be optionally installed for space-saving purposes, consider using the [Features aspect of Intelligent Delivery](../../packaging/intelligentdelivery-features-recipes.md) instead.

Also known as "optional packages".

<a id="dwobs"></a>

### Durables without a package

Additional purchasable content can sometimes need to be part of the base game package to support online scenarios or the design of the game.
A **Durable** type add-on can be more suitable here as no package creation and management will be necessary for both the developer and consumer.

Similar to durables with package, this type still provides a license that can be validated at runtime according to the [Product sharing model for games](../fundamentals/xstore-product-sharing-model-for-games.md).
You must verify the license through the `XStore` APIs of these products to ensure access should be granted, especially when used with disc based games.

Durables can also be offered with time-limited duration, after which the user will no longer own it and will need to repurchase it.

<a id="subscriptions"></a>

## Subscriptions

A subscription is a product that involves a recurring purchase to remain active.
They can be configured with multiple tiers, e.g. monthly, yearly, etc.

The subscriptions that can be configured in Partner Center are **Add-on subscriptions** that usually scoped for use by a single game.
These have some limitations that may make it difficult to be used by a consumer accustomed to other gaming subscriptions.
It is not recommended to use this product type.

A **Store-managed subscription** is a separate subscription type has a richer gaming-oriented set of capabilities intended for publisher scope.
This must be configured by the Store team on your behalf.
Please contact your Microsoft Representative to discuss further to see if this product type is right for your needs.

## See also

[Commerce Overview](../commerce-nav.md)

[XStore API reference](../../reference/system/xstore/xstore_members.md)

[Product sharing model for games](../fundamentals/xstore-product-sharing-model-for-games.md)

[Consumable-based ecosystems](../fundamentals/xstore-consumable-based-ecosystems.md)

[Bundles and Season Passes](../fundamentals/xstore-bundles-and-season-passes.md)

[Manage and license downloadable content (DLC)](../fundamentals/xstore-manage-and-license-optional-packages.md)

[How to use a durable without a package](../fundamentals/xstore-dwobs.md)