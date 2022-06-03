---
author: joannaleecy
title: Manage products from your services (contents)
description: Overview for configuring service-to-service calls to the Microsoft Store APIs and key scenarios enabled through these calls.
kindex: Manage products from your services
ms.author: cagood
ms.topic: conceptual
edited: '09/08/2021'
security: public
---


# Manage products from your services

Although a title can implement and manage an in-game commerce experience from the client app, there are scenarios and benefits to calling the *Microsoft Store APIs* directly from the game's web services.
For example, the direct service-to-service communication is more trustworthy and reliable than traffic controlled through the user's network and client.
These APIs consist of REST https endpoints that are designed to be used by developers with add-on catalogs that are supported by cross-platform services.
These APIs include the following services and features:

**Microsoft Store Collections Service:**
* Verify direct ownership of a product outside of game-sharing.
* View products the user owns across the entire publisher catalog, not just the running title.
* Reliable and redundant safeguards around consumable product fulfillment.
* View a user's Xbox Game Pass subscription status (requires authorization from Microsoft)..

**Microsoft Store Purchase Service:**
* Grant free products to a user's account directly.

**Microsoft Clawback Service:**
* Detect refunds issued to a user for consumable products after they have been fulfilled.

**Microsoft Recurrence Service:**
* View, manage, or cancel a user's subscription (useful for Customer Support teams and in-game for users).

The following articles explain how to use these features and integrate them into your own services.

## In this section  
  
[Authenticating your service with the Microsoft Store APIs](xstore-authenticating-your-service.md)  
Describes how to get and use either delegated authentication XSTS tokens or User Store IDs to authenticate with Microsoft Store Services.  
  
[Query user entitlements from your services](xstore-query-user-entitlements.md)  
Describes how to query for digital content the user is entitled to from your own services.  
  
[Detecting Xbox Game Pass subscription access from your service](xstore-detecting-game-pass.md)  
Describes how to detect a user's Xbox Game Pass subscription status.  
  
[Managing consumable products and refunds from your service](xstore-managing-consumables-and-refunds.md)  
Describes how to build a robust system that manages consumables on your game service including detecting and managing user refunds of consumed items.  
  
[Requesting a User Store ID for service-to-service authentication](xstore-requesting-a-userstoreid.md)  
Describes the required configuration and steps to get a User Store ID for service-to-service authentication with the Microsoft Store service APIs.  
  
[Renewing a User Store ID key](xstore-renew-a-user-store-id-key.md)  
Describes how to renew a User Store ID key.  
  


## See also

[Commerce Overview](../commerce-nav.md)

[XStore API reference](../../reference/system/xstore/xstore_members.md)