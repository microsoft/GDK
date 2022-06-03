---
title: Managing consumable products and refunds from your service
description: Describes how to build a robust system that manages consumables on your game service including detecting and managing user refunds of consumed items.
kindex: Managing consumable products and refunds from your service
author: joannaleecy
ms.author: cagood
ms.topic: conceptual
edited: '09/08/2021'
security: public
---


# Managing consumable products and refunds from your service

If your title uses a consumable-based ecosystem, it is a best practice to develop a back-end service to validate and manage the consumable transactions within your title.
This allows secured communication and management of the consumable products between your trusted service and the Xbox Store Service APIs directly.
Relying on the client to manage these transactions poses a risk as an attack vector to cheat your ecosystem.
For example on the client the user could manipulate traffic or drop packets to cause transmission issues with your consume calls.
In prior cases this has caused theft or manipulation of consumable products not directly managed and controlled from a game service.

This article will outline how to build a robust and secure service to manages your consumable ecosystem.
Additionally this article outlines how to detect and manage user refunds of consumable products to prevent consumable fraud and theft.

To manage consumable products and handle refunds you will be calling the following Microsoft Store APIs from your service.
See the documentation pages for specifics on calling and parsing the results.

| Microsoft Store API | Function |
|-------------------|--------------|
| [collections.mp.microsoft.com/v8.0/collections/consume](microsoft-store-apis/xstore-v8-consume.md) | Consume or fulfill a consumable product the user owns |
| [purchase.mp.microsoft.com/v8.0/b2b/orders/query](microsoft-store-apis/xstore-v8-clawback.md)      | Detect refunded consumable products that were already fulfilled.  Also called the Clawback service. |

## Utelizing the Microsoft.StoreServices .NET library and sample 

To help demonstrate the principles and flows outlined in this article review the Microsoft.StoreServices Sample.
The sample uses the Microsoft.StoreServices library to manage authentication and make the calls to the Microsoft Store Services.
The sample service itself has example logic for managing consumable products, tracking pending consume requests, reconciling refunded purchases, renew expired User Store Ids, and more.
The sample provides a configuration guide that includes the steps in this article on how to configure and setup your Azure Active Directory for this authentication method.  

- [Microsoft.StoreServices (GitHub)](https://github.com/microsoft/Microsoft-Store-Services) 
- [Microsoft.StoreServices Sample (GitHub)](https://github.com/microsoft/Microsoft-Store-Services-Sample) 

<a id="consumables"></a>

## Managing Consumables

### Recommended outline of a consuamble management service

A robust consumable management system will consist of the following functionality:
* Receive requests from the client to use or purchase in-game items with consumable currency 
* Authenticate with the Microsoft Store Service APIs
* Validate the user's balance of a product in the Microsoft Store
* Validate if the user has sufficient consumable currency for the transaction (server managed or store managed)
* Consume or fulfill a portion of the user's balance
* Track and retry consume requests if needed to validate fulfillment
* Complete the client's transaction request
* Report back to the game client the results or items gained from the transaction
* Reconcile refunded consumable transactions

<a id="managing-user-balance"></a>

### Managing the user balance on your service vs. the Microsoft Store

A service can either track the user's in-game currency and item balance itself, or it can leave some of the management to the Microsoft Store.
With Store Managed consumables, either implementation option is possible.
However, Developer Managed consumable products must be managed by the game's service.
See [Choosing the Right Product Type](../getting-started/xstore-choosing-the-right-product-type.md) for more info on Developer vs Store Managed consumables.

The recommended and most commonly used method is to track and manage the user's available balance within the game's service.
This entails querying the Microsoft Store to see if the user has any non-zero balance of a game's consumable products, then consuming those quantities down to zero and adding the equivalent in-game currency to the user's balance that is tracked on the game service.
This allows partners to know the user's current balance and manage it without further calls to the Microsoft Store APIs once fulfilled.
In cross-platform scenarios this also is the best method so that consumables purchased on multiple store fronts can be combined together and used across the different platforms if allowed.
Another benefit is that if the user has issues or needs to contact your Customer Service, your services can add quantity directly to the user's balance on your server as needed rather than having to manage or grant codes to products in the Microsoft Store.
With this method the Store Managed consumable products are generally configured to grant a quantity of 1 per user purchase.
That quantity is then translated to how many in-game currency units that product relates to.
Example: When the user purchases a '500 coin' consumable product, the user's quantity of that product in the Microsoft Store API will increase by 1.
When consumed from the service, the quantity will go down to 0 and the user's account balance on your service would be credited with 500 in-game coins.  

Store Managed consumables can also be configured to grant any specified value to the user's quantity on purchase.
For example, you could set the '500 coin' option mentioned above to increase the user's quantity in the Microsoft Store APIs by 500 on each purchase.
This way, the store is managing the user's balance as they buy more consumable currency and your service would deduct quantity from their balance when the user purchases an in-game item from your consumable ecosystem.  

<a id="using-trackingids"> </a>

### Using TrackingIds as a redundant system for consume validation

When fulfilling or consuming a product from your service you include a TrackingId in the consume request.
This TrackingId can be used as a redundant fall back to verify that a transaction request successfully completed and was honored on the Microsoft Store Services.
For example, if your service sends a consume request, but does not get a response there is no way of knowing if the user's balance was changed from the request or not.
In this scenario your service would not know if it should grant the user the consumable items or not.
You can re-issue the request against the same user account with the same TrackingId, quantity to be removed, and productId to have the Microsoft Store Service respond on the result of that consume transaction.
A recommended example flow of fulfilling a consumable from your service is provided below.
This flow utilizes the TrackingId and keeps a list of pending consume transactions to be able to verify the result of a request if needed.  

Product 1 (500 in-game coins) is a consumable configured to grant a quantity of 1 with each purchase that will then be translated to 500 coins within our service.
1.  The user purchases Product 1 and now has a quantity of 1 for the product when calling the query service
2.  The game's service query's the user's consumable balance within the Microsoft Store query API and sees the user's balance is '1'
3.  Game service generates a TrackingID, creates a consume request to consume 1 product quantity, and adds the request information to a pending transaction list.
4.  Game Service sends the request to the Microsoft Store consume API
5.  Something happens and the Game Service never gets a response from the consume API.  This could be network packet loss, service outage, power loss, etc.

At this point, the game service has no idea if the quantity was actually consumed or not on Microsoft's side.
If they query the inventory again, the quantity could still say 1, but that doesn't mean the transaction didn't go through.
The consume may have succeeded resulting in quantity of 0, but the user may have purchased the consumable again during the outage raising their quantity back to 1.
To verify if the transaction did go through, we will need to use the pending transaction list we added the request to above.

6.  Game service determines when it should retry the consume request
7.  Game service re-creates the consume request using the same user, ProductId, TrackingId, and quantity
8.  Game service sends the request to the Microsoft Store consume API
9.  Game service receives a response that the consume was successful and the new user's balance is '0'
10. Game service adds 500 coins to the user's currency balance tracked on the server
11. Game service removes the consume request from the pending transaction list as the item has now been consumed, verified, and user granted the correct in-game currency on the service

### Behavior of the Microsoft Store Consume API when verifying previous transaction requests

If the consume API has not seen the incoming request before (TrackingID, User, Quantity, and ProductID) it will treat this as a new incoming request and complete it appropriately based on the user's current consumable balance in the system.

If the consume API sees that this is a retry of a previously consumed transaction (Same TrackingId, User, Quantity, and ProductId) it will not consume the item a 2nd time from the user's balance.
But the service will respond back in the format that indicates the requested consume was completed and the user's current remaining balance.
Therefore it is always safe to retry or replay the consume requests to validate they went through if a response was not received.
You must however ensure that the User, TrackingId, Quantity, and Product are the exact same to the previous call.
If using X-Token authentication to the consume API, you can update and get a new X-Token as long as the new X-Token is for the same Xbox Live user as the previous request.
This may be needed as X-Token are only valid for 4 hours before having to obtain a new one.

### Risk and fraud potential with refunded consumable items

The Microsoft Store allows users the ability to request refunds of digitally purchased content through their account's orders page (https://account.microsoft.com/billing/orders/). 
The automated system allows users the ability to receive a certain number of automatic refunds per year if certain criteria are met such as the purchase being made within a short time of the refund request. 
Otherwise only in certain instances will Microsoft's Customer Support team issue refunds of a digital item.

If a consumable product has not yet been fulfilled or its quantity consumed, the quantity from the refunded purchase is automatically removed from the user's balance shown in the Microsoft Store Query API results.
However, if the item was fulfilled or consumed, the Query API will not indicate that a refund was issued as a product's quantity will never go below 0.
So if the service had already consumed the quantity and a refund issued after, the balance would remain at 0.
In this instance, the user has the in-game currency credit from when the game service consumed the item *and* they received their money back.
In the past, partners have seen abuse and fraud related to consumables purchased, redeemed in-game, and then refunded.
This is why partners should use the Clawback service to detect the refund of consumable products.

<a id="clawback"></a>

## Using the Clawback service to detect refunded products 

The Clawback service allows partner services to detect when consumable products have been refunded on a user's account to prevent fraud as outlined above.
This service is provided as part of the Microsoft Store Purchase API set as [purchase.mp.microsoft.com/v8.0/b2b/orders/query](microsoft-store-apis/xstore-v8-clawback.md).
When calling this API, you can specify to see the status of the user's consumable transactions within the last 90 days.
  
This API is not intended to be polled continuously, but should be called once a day per user to query for the current status of their consumable purchases. 
Therefore your service should obtain a UserPurchaseId for the user and keep it refreshed to call the Clawback service even if the user has not been logged in for an extended period of time.
For more information on refreshing a UserPurchaseId see [Renewing a User Store ID key](xstore-renew-a-user-store-id-key.md)  

Because refunded items will continue to show in the results until 90 days after purchase, you will need to keep track of the refunded items you have already taken action on vs. new ones for reconciliation.
You can do this using the LineItemID found in the response of a refunded item.
As you query Clawback, you will get duplicate results for refunded items until they are older than 90 days since the order's purchase. 
Your service should keep track of which OrderIds and OrderLineItemIds have been reconciled so you can skip them in future query results. 

To properly manage and reconcile refunds reported by the Clawback service, your service needs to track each consume transaction fulfilled and use the `includeOrderIds` parameter on the consume request.
This will return IDs related to the purchase orders and quantity used from those to fulfill the consume request.
These IDs are returned by the Clawback service, allowing your service to identify exactly which consume transactions you fulfilled were refunded.  

### What to do when a refunded product is detected

When a refund for an already used or consumed item is detected, the development team or Publisher of the game are free to determine the proper course of action on the user's account.
Some possible actions are listed below, but are not limited to only these.
We do recommend notifying the user of the action taken, reason why, and logging this information in your services to avoid further Customer Support calls or disputes.

* Remove the equivalent currency from the user's remaining balance if possible
* Remove the last purchased items using currency for within the game (if unable to remove quantity from their remaining balance)
* Take no action against the user at this time, but track their account to see if they are constantly getting refunds or appear to be abusing the system with large consumable transactions being refunded.
Then if necessary ban or block their account.

<a id="pc-multi-account-clawback"></a>

### Special consideration for PC titles

As outlined in [Handling mismatched store account scenarios on PC](../pc-specific-considerations/xstore-handling-mismatched-store-accounts.md) it is possible on a Windows PC to have an Xbox Live account playing the game, but a separate Microsoft Account completing the purchases and transactions from the in-game store.
This means that a single Xbox Live user may have in-game credit from purchases made from multiple Microsoft Accounts and a single Microsoft Account may have purchased in-game items that were credited to multiple different Xbox Live accounts.

If your Windows PC title supports the mismatched store account scenarios, your service must cache and keep a UserPurchaseID generated at the same time as the UserCollectionsID used to make the consume request.
This ensures that the calls to Clawback with the cached UserPurchaseID will return results for the purchasing account the consume was fulfilled from.
This will allow your service to make a Clawback query for refunded items against each consume transaction your service completed within the last 90 days.  
After 90 days, refunds should not be issued and the Clawback service will no longer return those items.

Your service can then use the OrderIds and OrderLineItemIds to identify the recorded consume transaction(s) that the refunded order was used to fulfill and to which users.

![alert](../../../../resources/gamecore/images/en-us/common/note.gif) **NOTE:** If your Windows PC title requires a user to use the same account in the Microsoft Store App and the Xbox Live account, you do not need to cache a UserPurchaseId with each consume transaction as outlined above. Since the user's credentials should be linked, you can cache a single UserPurchaseID and do a single Clawback query per-user per day as console games.

## See also

[Commerce Overview](../commerce-nav.md)

[Consumable-based ecosystems](../fundamentals/xstore-consumable-based-ecosystems.md)

[Microsoft Store Service APIs](microsoft-store-apis/xstore-nav.md)

[Microsoft.StoreServices library (GitHub)](https://github.com/microsoft/Microsoft-Store-Services) 

[Microsoft.StoreServices Sample (GitHub)](https://github.com/microsoft/Microsoft-Store-Services-Sample) 