---
title: GDK Commerce Systems Overview
description: Describes the general services and features of Commerce within the GDK
kindex: Commerce Systems Overview
author: Cameron Goodwin
ms.author: cagood
ms.topic: conceptual
edited: 11/08/2021
security: public
---


# GDK Commerce Systems

The commerce related features and services available within the GDK enable multiple monetization models and the ability for deep integration of back-end services to those commerce options.
 This document provides an overview of these systems and options that are covered more in-depth within the Commerce section of the GDK documentation.

## Client Side Features

The GDK allows games to implement multiple types of in-game add-ons and product types such as consumables, durables (downloadable content), subscriptions, bundles, and trials.
 The XStore API set provides the needed functionality to query, advertise, and manage these products from the client side.
 For an example of a fully functional in-game store see the [GDK In-Game Store sample](https://github.com/microsoft/Xbox-GDK-Samples/tree/main/Samples/Live/InGameStore).

The following articles under the Fundamentals section cover these APIs and scenarios:
- [Basic store operations](../fundamentals/xstore-basic-store-operations.md) - Query what is available to sell and what the user owns

- [How to use a durable without a package](../fundamentals/xstore-dwobs.md) - Using a durable that doesn't have a separate download package.

- [Manage and license downloadable content (DLC)](../fundamentals/xstore-manage-and-license-optional-packages.md) - Using traditional durables with download packages.

- [Consumable-based ecosystems](../fundamentals/xstore-consumable-based-ecosystems.md) - Setting up and configuring a consumable-based monetization model within your game.

- [Implementing Trials for your game](../fundamentals/xstore-usage-limited-free-trials.md) - Implementing a trial built into your game.

- [Bundles and Season Passes](../fundamentals/xstore-bundles-and-season-passes.md) - Using bundles and Season Passes to provide value and engagement to customers with your products.

- [Product sharing model for games](../fundamentals/xstore-product-sharing-model-for-games.md) - The licensing model for GDK games on both Xbox Console and Windows PC and how sharing between users is applied.


## Server Side Features

The Microsoft Store Services that support the client side APIs and allow service-to-service calls are split into the following services:

- [Collections](../service-to-service/xstore-query-user-entitlements.md) - Provides information on which products the user owns or is entitled to use and fulfills consumable products.
 Also can be used to detect Game Pass subscription status for authorized partners. 

- [Clawback](../service-to-service/xstore-managing-consumables-and-refunds.md) - Allows partner services to detect and manage refunds issued to users for already fulfilled consumables.

- [Purchase](../service-to-service/microsoft-store-apis/xstore-v8-grant.md) - Allows partner services to add free items to the user's account.

- Recurrence - Provides detailed information on a user's subscriptions and allows partner services to manage those subscriptions on behalf of the user.

### Authenticating with the Microsoft Store Services

For detailed information on how to authenticate your service with the Microsoft Store Services see [Requesting a User Store ID for service-to-service authentication](../service-to-service/xstore-requesting-a-userstoreid.md).  
> [!NOTE]
> If you are familiar with XSTS token authentication, the Collections service does support XSTS tokens.
 However other Microsoft Store Services do not.
 Because of the valuable features offered in the other services, we now recommend that partners transition their server-to-server authentication flows to the AAD and UserStoreId flow.

To help streamline the authentication flow and calling the Microsoft Store Services, review the Microsoft.StoreServices project and sample on GitHub.
 The Microsoft.StoreServices library will help manage the authentication keys and provides wrapper APIs to call into the Microsoft Store Services for managing products.
 The sample project highlights how a service can use the Microsoft.StoreServices library, example logic for managing consumable products, reconciling refunded purchases, renew expired credentials, and more.
 A step-by-step configuration guide is included with the sample to setup the sample service on your PC or through Azure.

- [Microsoft.StoreServices library (GitHub)](https://github.com/microsoft/Microsoft-Store-Services) 
- [Microsoft.StoreServices Sample (GitHub)](https://github.com/microsoft/Microsoft-Store-Services-Sample) 

## Key information for developers who used the XDK

If you are familiar with the commerce systems from the XDK, the following will help guide you to what the equivalent GDK services are called

 - **Inventory Service** - The functionality of the XDK's Inventory service (query ownership, fulfill consumables, etc.) is now handled by the Collections Service.
  This includes all server-to-server scenarios for validating ownership and consumable quantities.
  Although XSTS tokens used for Inventory will work for calling Collections, we recommend that partners move to the Azure Active Directory and User Store Id token auth flow to use the expanded functionality of the Microsoft Store Services.  
 Ex: [https://collections.mp.microsoft.com/v8.0/collections/b2bLicensePreview](../service-to-service/microsoft-store-apis/xstore-v8-query-for-products.md)

 - **Inventory Client APIs** - All client side functionality related to querying ownership of items are now handled through the XStore APIs.  
 Ex: [XStoreQueryEntitledProductsAsync](../../reference/system/xstore/functions/xstorequeryentitledproductsasync.md) will return the items that the current user is entitled to use at that moment.

 - **Catalog Browse APIs** - All client side functionality related to querying available products to purchase in-game are now handled through the XStore APIs.
  There is no server-to-server option for querying available products to sell within your title.  
  Ex: [XStoreQueryAssociatedProductsAsync](../../reference/system/xstore/functions/xstorequeryassociatedproductsasync.md) will return products that are able to be sold as part of an in-game store. 

 - **Trials and Licenses** - All client side functionality related to trial licenses are now part of the XStore APIs.
 Ex: [XStoreQueryGameLicenseAsync](../../reference/system/xstore/functions/xstorequerygamelicenseasync.md) will return the current game's license info including any trial license info. 
 For ability to validate a client side license on your own service see [Using License Tokens to validate licensing on your services](../pc-specific-considerations/xstore-license-tokens.md).  
  

## See also

[Getting Started](getting-started-nav.md)

[Fundamentals](../fundamentals/fundamentals-nav.md)

[Manage products from your service](../service-to-service/service-to-service-nav.md)

[PC Specific Considerations](../pc-specific-considerations/pc-specific-considerations-nav.md)

[XStore API reference](../../reference/system/xstore/xstore_members.md)

