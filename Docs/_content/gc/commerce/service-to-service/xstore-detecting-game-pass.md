---
title: Detecting Xbox Game Pass subscription access from your service
description: Describes how to detect a user's Xbox Game Pass subscription status.
kindex: Detecting Xbox Game Pass subscription access from your service
author: joannaleecy
ms.author: cagood
ms.topic: conceptual
edited: '09/08/2021'
security: public
---


# Detecting Xbox Game Pass subscription access from your service

If your title is participating in Xbox Game Pass or PC Game Pass, you may want to grant Game Pass subscribers specific in-game benefits as part of your title's participation.
The [collections.mp.microsoft.com/v9.0/collections/publisherQuery API](microsoft-store-apis/xstore-v9-query-for-products.md) provides the ability to check if the user is a subscriber of the Xbox Game Pass service and their subscription tier.
Before your service can obtain the user's Xbox Game Pass status, your publisher must apply for and obtain authorization for this info based on the tier(s) of Xbox Game Pass you need access to.
Requesting permission for Xbox Game Pass subscription information is done through your Developer Partner Manager or Microsoft contact who will begin the approval process.

### Response data behavior for authorized and non-authorized publishers

If your publisher is not authorized to view Xbox Game Pass subscription status, products entitled through Game Pass will appear as directly owned digital entitlements.
The aquisistionType will be 'Single' and the Game Pass ProductId will not appear in the satisfiedByProductIds list.  

For authorized publishers, only active Game Pass subscriptions will ever be returned.
If the user's Game Pass subscription is canceled or ends, the query result will no longer contain the Game Pass information.
Additionally, the StartDate and EndDate values are modified to always be the min and max values respectively.
These values cannot be used to know when a user's subscription started or when it will end.  

### Requesting Game Pass subscription status

To request the user's Xbox Game Pass subscription status, add the corresponding ProductIds of the subscription tier(s) you are authorized to view into the query request's productSkuIds list (see table below).  

| Subscription Tier | ProductID    |
|-------------------|--------------|
| Xbox Game Pass            | CFQ7TTC0K6L8 |
| PC Game Pass     | CFQ7TTC0KGQ8 |
| Xbox Game Pass Ultimate   | CFQ7TTC0KHS0 |

If the user has a subscription in the tier you requested, the query response will include an item with the ProductId of the corresponding Game Pass subscription tier.
This is the recommended way to accurately check if the user is a Game Pass subscriber as filtering out duplicate entitlements may hide any items showing Game Pass entitlements behind directly purchased items (See example in the following section). 

Xbox Game Pass Ultimate subscribers are entitled to all three subscription tiers and will return the corresponding tier level that your publisher is authorized to view.

Example:
Our publisher is authorized for PC Game Pass tier information only.
A user with an Xbox Game Pass Ultimate subscription would show would return just the PC Game Pass result item in our case based on our tier access.
If our publisher also had authorization to view Xbox Game Pass Ultimate information, then the item returned in the query response would have the Xbox Game Pass Ultimate ProductId.

### Detecting products entitled through an Xbox Game Pass subscription with satisfiedByProductIds

Once your publisher is authorized to view Game Pass subscription information, products from your publisher that are entitled to the user through Xbox Game pass can be identified by the satisfiedByProductIds and acquisitionType fields.
An item entitled through an Xbox Game Pass subscription tier will have the aquisistionType of 'Recurring' and the corresponding Xbox Game Pass ProductId that you have authorization for will be in the satisfiedByProductIds list.  

However, if you are using the excludeDuplicates filter option, the Game Pass related entitlement will be filtered out if the user owns the title directly.
Therefore always asking for the Xbox Game Pass ProductId(s) in your request's ProductSkuIds array is the recommended way to check for an Xbox Game Pass subscriber.  

**Duplicate Item Example with Xbox Game Pass**

  A publisher is on-boarded to view Game Pass info in their query parameters.
  The user has an active Xbox Game Pass subscription giving them access to Game A.
  After a few weeks of playing the game, the user decides to purchase Game A with the Xbox Game Pass discount so that they own Game A forever.
  This will result in two items being returned for Game A's ProductId in the publisherQuery results, possibly with the same SKU.
  One item will show as being entitled through the Game Pass ProductId (SatisfiedByProductIds contains the Game Pass ProductId) and the AcquisitionType will be 'Recurring'.
  The other item will have an acquisistionType of 'Single' representing the direct purchase with an empty satisfiedByProductIds list (unless the purchase made was a game bundle).
  
  If excludeDuplicates is enabled in the request body, then only the direct purchase version of the item will be returned as direct purchase or a game bundle take priority over a subscription entitlement.

  See [Understanding duplicate items in the Publisher Query response](xstore-query-user-entitlements.md#duplicateItems) for more info.  


### Example request for Xbox Game Pass subscription status:

```json
POST https://collections.mp.microsoft.com/v9.0/collections/PublisherQuery HTTP/1.1
Authorization: XBL3.0 x=2218837447227500391;eyJlbmMiOiJ...
Signature: AAAAAQHVT...
User-Agent: {identifier string of your service}
Content-Type: application/json;
Host: collections.mp.microsoft.com

{
  "maxPageSize": 100,
  "excludeDuplicates": true,
  "productSkuIds": [
    {"productId": "CFQ7TTC0K6L8", "skuId": ""}
  ],
  "validityType": "All"
}
```

### Example response for Xbox Game Pass:

```json
HTTP/1.1 200 OK
Content-Length: 602
Content-Type: application/json
MS-CorrelationId: 84bbecd8-5329-423d-a95b-1473615b9c11
MS-RequestId: 897406cd-e778-4372-9a33-fc795708b0a9
MS-CV: MxjWNFF1TECYdCBq.27
MS-ServerId: 16
Date: Fri, 17 Jul 2020 23:04:34 GMT

{
    "items": [
        {
            "acquiredDate": "2019-06-13T23:51:23.9154122+00:00",
            "acquisitionType": "Recurring",
            "endDate": "9999-12-31T23:59:59.9999999+00:00",
            "id": "4727703915a94e2393b686d255a7631b",
            "modifiedDate": "2019-06-13T23:51:23.9180907+00:00",
            "productId": "CFQ7TTC0K6L8",
            "productKind": "Pass",
            "quantity": 1,
            "recurrenceData": "mdr:0:50da85e4d3834999be88c7e493ec7e18:3c1322cf-48d8-4188-9091-7e6ed3832ff6",
            "satisfiedByProductIds": [],
            "skuId": "",
            "startDate": "0001-01-01T00:00:00+00:00",
            "status": "Active",
            "tags": [],
            "transactionId": "3c1322cf-48d8-4188-9091-7e6ed3832ff6",
            "trialData": {
                "isInTrialPeriod": false,
                "isTrial": false
            }
        }
    ]
}
```

## See also

[Commerce Overview](../commerce-nav.md)

[XStore API reference](../../reference/system/xstore/xstore_members.md)