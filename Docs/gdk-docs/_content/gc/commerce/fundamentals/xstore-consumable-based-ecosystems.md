---
title: Consumable-based ecosystems
description: Describes configuring and implementing consumable products for your title.
kindex: Consumable-based ecosystems
author: joannaleecy
ms.author: cagood
ms.topic: conceptual
edited: '09/08/2021'
security: public
---


# Consumable-based ecosystems

Consumable products are useful for implementing an in-game economy for cosmetic items, power ups, or other limited use items within a game. 
The Microsoft Store supports two types of consumable products:

* Microsoft Store-managed consumables
* Developer-managed consumables

The main difference between these is the fact that Developer managed consumables must be reported as fulfilled to the Microsoft Store before the user is able to purchase the product again. 
Store managed consumables are able to be purchased and redeemed as many times as the user desires without the product being reported as fulfilled. 
The recommended and most commonly used type is Store managed consumables. 
For more information on specific scenarios and choosing between these two product types, see [Choosing the right product type](../getting-started/xstore-choosing-the-right-product-type.md).

The most common use of consumable products is to implement a premium in-game currency. 
The user purchases these products with real money in exchange for an allotment of the in-game currency. 
This currency is then exchanged in-game for temporary power-ups, cosmetic items, loot boxes, or other items related to a single user's account. 
Consumables are not appropriate for implementing access to expansions, map packs, or other items that would be expected to be shared within a Home Console or PC scenario see [Product sharing model for games](xstore-product-sharing-model-for-games.md).

<a id="best-practices"></a>

## Best practices for offering in-game currency

When offering an in-game currency model backed by consumable products, it is best to offer 3-6+ offer tiers that increase in value. 
Each tier should be configured as a separate consumable product. 
To be most effective these tiers and the added value of the higher tiers must be clear and understandable to the end-user. 
The base tier should be inexpensive and set the base $ / in-game currency value. 
The higher tiers should have a base value of in-game currency relative to their price and a bonus amount that increases in % the higher the tier. 
See the following table for an example consumable tier set:

| Price | Base Currency  | Bonus Currency  | Bonus % | Product Name   |
|------|--------------|------------------------|----|----------------|
| $0.99 | 100  | 0 | | 100 Coins |
| $4.99 | 500  | 100 | 20% | 500 (+100 bonus) Coins  |
| $9.99 | 1000  | 250 | 25% | 1000 (+250 bonus) Coins |
| $19.99 | 2000  | 600 | 30% | 2000 (+600 bonus) Coins |
| $39.99 | 4000  | 1400 | 35% | 4000 (+1400 bonus) Coins |
| $79.99 | 8000  | 2000 | 40% | 8000 (+2000 bonus) Coins |

It is also a good practice to include a small allotment of your in-game currency to Season Pass owners, Deluxe edition game bundles, and monthly subscriptions if your title supports those. 
Your title could also provide an allotment of consumable currency once or on a monthly basis to Xbox Game Pass subscribers if your title is participating in Xbox Game Pass. 
This helps users become familiar with the value and benefit of your consumable economy and the value associated with it.

## Sales and promotions of consumble in-game currency

If you plan to run a promotion or sale involving your in-game currency, the following methods have been proven to be effective at engaging with customers, providing them increased value, and increasing revenue during the promotion.

Providing a static % discount on the pricing of all tiers is possible, but offering your higher tiered content at a higher discount % has proven to generate a higher incremental revenue over the promotional time line than static discount pricing. 
For example, offering a 10% discount on the lowest tier, but increasing to 30% discount on the top tier provides great value to users who will purchase the higher tiered option in greater numbers. 
This also drives after promotion game usage as the users have a vested interest in the game by using the consumable currency that they purchased in high quantity.

Using discounted pricing on the consumable products also allows visibility of the promotion from the Store app and helps drive user engagement. 
To schedule a promotion and discount of your consumable products, contact your Microsoft representative for additional information.

Alternatively, you can also discount the in-game items that the user purchases with your consumable currency. 
This however, does not have visibility outside of the game and benefits users who already have unused consumable currency but may not drive as many users to purchase the consumables products in the store as the discounted pricing above would. 
The benefit is that this can be done through your own services and does not require coordination or scheduling with the Store or Microsoft representatives.

## Configuring a consumable product in Partner Center

When creating a new consumable for your title in Partner Center, consider the following:

* To allow users to see and browse to the product in the Store app and on Xbox.com, set the consumable to *Has its own store listing* under Consumable Setup. 
Otherwise the consumable will only be accessible from within your game's UI.
* For Microsoft Store-managed consumables, set the *Quantity* field in Properties to be the value added to the user's balance each time the product is purchased. 
If you are implementing your own service to track and manage consumables, we recommend leaving this value at 1 and translating each quantity value to the equivalent in-game currency amount for the productId (see [Managing the user balance on your service vs. the Microsoft Store](../service-to-service/xstore-managing-consumables-and-refunds.md)). 
Otherwise you should set the total in-game currency amount the user will get such as '600' for the $4.99 tier product in the example under [Best practices for offering in-game currency](#best-practices).
* List the base and bonus currency of the product in the product's title (Ex: 500 (+100 bonus) Coins)
* Store images should include a graphic of the currency that grows larger or denotes a larger amount for the higher tiers (Ex: a pile of coins that gets larger the higher the tier or increasing size of treasure chests with coins).  Alternatively (or additionally), store images could include text that indicates how many currency the product grants on purchase (Ex: "600 Coins", or "500 (+100 bonus)" )

<a id="managing"></a>

## Managing consumables

The recommended way to manage consumables is through your own custom game service or a middle-ware provider that supports the Microsoft Store Service APIs. 
This provides a more secure and flexible implementation of your consumable economy. 
For more information see [Managing consumable products and refunds from your service](../service-to-service/xstore-managing-consumables-and-refunds.md).

Alternatively you can report a consumable fulfilled or consume a specific quantity of the user's balance by using the [XStoreReportConsumableFulfillmentAsync](../../reference/system/xstore/functions/xstorereportconsumablefulfillmentasync.md) API.
If calling from the client we recommend you use the trackingId to help ensure the requests were properly handled on the Microsoft Store services before granting the benefit of the transaction to the user.
See [Using TrackingIds as a redundant system for consume validation](../service-to-service/xstore-managing-consumables-and-refunds.md).

## See also

[Commerce Overview](../commerce-nav.md)

[Managing consumable products and refunds from your service](../service-to-service/xstore-managing-consumables-and-refunds.md)

[XStore API reference](../../reference/system/xstore/xstore_members.md)