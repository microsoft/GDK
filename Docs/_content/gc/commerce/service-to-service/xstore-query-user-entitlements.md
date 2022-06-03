---
author: joannaleecy
title: Query user entitlements from your services
description: Describes how to query for digital content the user is entitled to from your own services.
kindex: Query user entitlements from your services
ms.author: cagood
ms.topic: conceptual
edited: '09/08/2021'
security: public
---


# Query user entitlements from your services
Querying to know which entitlements and content a user has will be the backbone of your service run commerce features.
The Collections Query APIs provide this functionality to publishers with more robust options and scope than the client side XStore APIs.
When a publisher calls the Query APIs the scope of items returned is based on the Publisher configuration and not just the products related to the title on the client.
For example, when doing a service call directly to Query, a publisher can ask for information on products the user owns from any of the Publisher's titles.
This enables centralized publisher services to be created to assist individual game services in querying for specific content.

In this section you will find the following topics that will help with understanding and integrating with the Query APIs:

* Which Query API you should use based on your needs
* Product configuration to enable visibility to your services
* What duplicate items in the query results mean
> [!NOTE]
> If using XSTS tokens to authenticate your service, additional product configuration is required for your items to show up in the results.
Common symptom of not doing this configuration is that the calls succeed to Query, but there are no results returned for owned items.
See [Additional configuration required to view and manage products with delegated auth XSTS tokens](xstore-authenticating-your-service.md#Additional-Configuration-For-XSTS).

<a id="v8-vs-v9"></a>
## Selecting the right Collections Query API for your needs

There are currently two versions of the Microsoft Store Collections Query API, B2bLicensePreview (v8) and PublisherQuery (v9).
In general partners should be integrating with PublisherQuery to query for a user's balance due to the service's streamlined request parameters and ability to see a user's Xbox Game Pass subscription status (if your publisher is authorized for that information).
However, there are scenarios where your service may need to use B2bLicensePreview such as migrating an existing service from the legacy Xbox Inventory service.
Check the table below to best determine which query version your service should be targeting.

| Query API Feature                                       | [B2bLicensePreview (v8)](microsoft-store-apis/xstore-v8-query-for-products.md) | [PublisherQuery (v9)](microsoft-store-apis/xstore-v9-query-for-products.md) |
|---------------------------------------------------------|-----|-----|
| View a user's Xbox Game Pass subscription status        | No  | Yes |
| XSTS authentication                                     | Yes | Yes |
| Azure Active Directory / User Store Id authentication   | Yes | Yes |
| Partner Center StoreIds                                 | Yes | Yes |
| LegacyProductIds (Product Id from Xbox Inventory / XDP) | Yes | No  |
| Ability to turn off satisfying entitlement results      | Yes | No  |
> [!NOTE]
> Although there is no v9 URI equivalent for the consume functionality, you can use PublisherQuery and the v8 consume URI together without issue.

<a id="satisfying-entitlements"></a>
### Understanding satisfying entitlements in the response
A user can have access to a product by having purchased it directly, redeeming a 5x5 token, owning a bundle, or having a current subscription that allows access to the product.
The query APIs can return both direct (purchase, redeem token) and indirect (via subscription, bundle, etc.) owned products.

If a product is entitled through another product (satisfying entitlement) then the item will contain the ProductId(s) of the product granting the satisfying entitlement within the *satisfiedByProductIds* structure.

Example:
A user purchased the Deluxe Edition bundle of a game.
When calling the Query APIs the game product and any included products in the bundle will be returned in the user's items result.
Each of these items will have the ProductID of the Deluxe Edition bundle in their satisfiedByProductIds list.

<a id="duplicateItems"></a>

### Understanding duplicate items in the response
There are some scenarios that will result in your service seeing multiple items with the same ProductId and SKU for a user.
This is by design when a user has access to a product via multiple entitlements.
In these cases, there will be differences in each item's data which may include acquisistionType (direct vs. subscription), acquiredDate, modifiedDate, and the productIds in SatisfiedByProductIds.
To prevent duplicate items in your query results, you can specify the *excludeDuplicates* flag in the request body.
This will filter the duplicates into a single item based on the most direct ownership entitlement in the following order:
* Direct purchase / redeem code 
* Satisfied by a bundle purchased directly
* Satisfied by a subscription 
* Satisfied by a promotional purchase (Ex: Games With Gold)

In the case of multiple item results from the same source (Active and Expired subscription entitlements), the Query APIs will only return one collection item based on the priority of Status listed below.
This consolidation will always be done regardless if excludeDuplicastes is enabled:
* Active
* Invalid (If multiple invalid entitlements, the most recently invalidated item would be returned)
* Revoked

**Example**

  A user purchases Game A and its DLC 1.
  The user then decides to purchase the Season Pass for Game A which already includes DLC 1.
  When the Query API is called, there will be 2 items for DLC 1 representing the direct purchase and the entitlement from the Season Pass.  
  
  If excludeDuplicates is enabled in the request body, then only the direct purchase version of DLC 1 will be returned as direct purchase takes priority over a satisfied entitlement.

## See also

[Commerce Overview](../commerce-nav.md)

[Manage products from your services](service-to-service-nav.md)

[XStore API reference](../../reference/system/xstore/xstore_members.md)