---
title: purchase.mp.microsoft.com/v8.0/b2b/recurrences/query
description: Describes how to query for a user's subscription products.
author: joannaleecy
kindex: purchase.mp.microsoft.com/v8.0/b2b/recurrences/query
ms.author: cagood
ms.topic: conceptual
edited: 11/15/2021
security: public
---

# purchase.mp.microsoft.com/v8.0/b2b/recurrences/query

This endpoint is used to query for the status of the subscription product types that the user owns through the Microsoft Store. 
It provides more information than the Collections service for these subscriptions including the product's grace period when an auto-renew charge has failed.

## Prerequisites

To use this API, you need the following:

* An Azure Active Directory (Azure AD) access token that has the audience URI value `https://onestore.microsoft.com`
* A User Purchase ID key that represents the identity of the user for whom you want to grant a free product

For more information, see [Requesting a User Store ID for service-to-service authentication](../xstore-requesting-a-userstoreid.md).

## Request

### Request syntax

| Method | Request URI                                                 |
|--------|-------------------------------------------------------------|
| `POST`   | ```purchase.mp.microsoft.com/v8.0/b2b/recurrences/query```  |

### Request header

| Header         | Type   | Description                                                                                           |
|----------------|--------|-------------------------------------------------------------------------------------------------------|
| `Authorization` | `string` | Required. The Azure AD access token in the form `Bearer` &lt;*token*&gt;.                           |
| `Host`           | `string` | Must be set to the value `purchase.mp.microsoft.com`.                                            |
| `Content-Length` | `number` | The length of the request body.                                                                       |
| `Content-Type`   | `string` | Specifies the request and response type. Currently, the only supported value is `application/json`. |

### Request body

| Parameter     | Type   | Description                                                                        | Required |
|---------------|--------|------------------------------------------------------------------------------------|----------|
| `b2bKey`         | `string` | The User Purchase Id that represents the identity of the user for whom you are requesting.  See [User Store ID key](../xstore-requesting-a-userstoreid.md#step-4).    | Yes      |
| `sbx`      | `string`          | Optional value for authenticating with UserStoreIds that specifies the Sandbox the results should be scoped to.  Default without this value is the RETAIL sandbox.  X-Token auth does not need this value as the Sandbox is specified within the X-Token.              | No |

### Request example

```html
POST https://purchase.mp.microsoft.com/v8.0/b2b/recurrences/query HTTP/1.1
Host: purchase.mp.microsoft.com
Authorization: Bearer [AAD bearer token]
User-Agent: MicrosoftStoreServiceSample_1.21.9.0
Content-Type: application/json; charset=utf-8
Content-Length: 2032

{
  "b2bKey":"[UserPurchaseID]",
  "sbx": "XDKS.1"
}
```

## Response

### Response body

| Parameter         | Type                     | Description          | Required |
|-------------------|--------------------------|----------------------|----------|
| `continuationToken` | `string`                   | If there are multiple sets of products, this token is returned when the page limit is reached. You can specify this continuation token in subsequent calls to retrieve remaining products. | No       |
| `items`             | `list<RecurrenceItem>` | An array of products for the specified user. For more information, see the following table.        | Yes       |


The `RecurrenceItem` object contains the following parameters.

| Parameter     | Type   | Description                                                                        | Required |
|---------------|--------|------------------------------------------------------------------------------------|----------|
| `autoRenew`      | `bool`             | Indicates if the user is enrolled to have their subscription auto-renew at the end of the next billing cycle. | Yes       |
| `beneficiary` | `string` |  The Publisher Id of the beneficiary within the User Purchase Id.   | Yes |
| `expirationTime` | `DateTime` | The UTC date and time that the subscription will or has expired    | Yes |
| `expirationTimeWithGrace` | `DateTime` |   The UTC date and time that the user's Grace period will end if auto-renew fails at the ExpirationTime.  During Grace, users should still have access and be considered valid subscribers, but notified they need to fix their auto-renew payment.  | Yes |
| `id` | `string` |  An ID that identifies this collection item from other items that the user owns. This ID is unique per product.  | Yes |
| `isTrial` | `bool` |  Indicates if the product is in a trial period, such as a subscription.   | Yes |
| `lastModified` | `DateTime` |  The UTC date that this item was last modified.   | Yes |
| `market` | `string` |  The country the product was purchased in following the two-character ISO 3166 country/region code. EX: US.   | Yes |
| `productId` | `string` |  Also refereed to as the Store ID for the product within the Microsoft Store catalog. An example Store ID for a product is 9NBLGGH42CFD.   | Yes |
| `recurrenceState` | `string` |  Current state of the recurrence.  See Recurrence Sates.   | Yes |
| `skuId` | `string` |  The specific SKU identifier if there are multiple offerings of the product in the Microsoft Store catalog. An example Store ID for a SKU is 0010.   | Yes |
| `startTime` | `DateTime` |  The UTC date that the subscription became or will become valid.  | Yes |
| `cancellationDate` | `DateTime` |  The UTC date that the subscription was canceled.   | No |

### Recurrence Sates

| Value     | Description                                                                        |
|-----------|------------------------------------------------------------------------------------|
| `Active`     | Currently subscribed and should have access to subscription benefits. |
| `Canceled`   | Subscription was canceled, benefits should not be active. |
| `Revoked`    | Subscription was refunded, benefits should not be active.   |

### Response Example

```json
HTTP/1.1 200 OK
date: Tue, 17 Aug 2021 21:22:28 GMT
content-type: application/json; charset=utf-8
content-length: 2382
ms-cv: azfth4s000mwNmYF.0
x-content-type-options: nosniff
x-envoy-upstream-service-time: 2099

{
    "items": [
        {
            "autoRenew": true,
            "beneficiary": "pub:NoUserIdProvided",
            "expirationTime": "2021-08-25T23:59:59.00+00:00",
            "expirationTimeWithGrace": "2021-09-08T23:59:59.00+00:00",
            "id": "mdr:0:1ecc1424ed8f457ab6107f08033e6b50:907f0a31-035c-41a2-b70b-5a62925a4f92",
            "isTrial": false,
            "lastModified": "2021-07-26T22:59:55.99+00:00",
            "market": "US",
            "productId": "CFQ7TTC0HC8Z",
            "skuId": "0002",
            "startTime": "2021-07-26T00:00:00.00+00:00",
            "recurrenceState": "Active"
        },
        {
            "autoRenew": true,
            "beneficiary": "pub:NoUserIdProvided",
            "expirationTime": "2021-07-26T21:08:30.52+00:00",
            "expirationTimeWithGrace": "2021-07-26T21:08:30.52+00:00",
            "id": "mdr:0:50c7396d0e5f4e7f9deeede3ba25f1a4:87c4cfae-ed1d-400f-a6b0-19fdb3c327f5",
            "isTrial": false,
            "lastModified": "2021-07-26T21:08:34.61+00:00",
            "market": "US",
            "productId": "CFQ7TTC0HC8Z",
            "skuId": "0002",
            "startTime": "2021-07-15T00:00:00.00+00:00",
            "recurrenceState": "Canceled",
            "cancellationDate": "2021-07-26T21:08:31.52+00:00"
        },
        {
            "autoRenew": false,
            "beneficiary": "pub:NoUserIdProvided",
            "expirationTime": "2021-07-26T22:35:29.54+00:00",
            "expirationTimeWithGrace": "2021-07-26T22:35:29.54+00:00",
            "id": "mdr:0:528115d9771f4e49b79550790fd4a263:f30a646e-54cf-4fe8-8c95-7add9fc2ebde",
            "isTrial": false,
            "lastModified": "2021-07-26T22:35:33.96+00:00",
            "market": "US",
            "productId": "CFQ7TTC0HC8Z",
            "skuId": "0002",
            "startTime": "2021-07-26T00:00:00.00+00:00",
            "recurrenceState": "Canceled",
            "cancellationDate": "2021-07-26T22:35:30.54+00:00"
        },
    ]
}

```

### Explanation of example response

From the above example, this user has two previously canceled subscription periods and a currently active one that started on July 26, 2021. 
The end-date of the subscription period is Aug 27, 2021.
Because the user is enrolled in auto-renew the Microsoft Store will attempt to renew the subscription with a payment processed on Aug 27, 2021.
If the user's account is unable to complete the subscription renewal on Aug 27, the status of the subscription will still be 'active' as the account will go into the grace period.
This is because they have now received 2 weeks of grace period for free that they are now in a deficit to pay for.
At the end of the grace period (Sept 08, 2021) if the store was unable to complete the renewal purchase, the status will change to 'canceled' to reflect that the account is now in the dunning state.
In this state the user is not able to re-purchase the subscription on their own and must fix their payment instrument to get an active subscription once again.  
When they resolve their account's payment instrument, 2 weeks will be removed from their next subscription period to cover the grace period that they used previously.

## Related topics

[Managing consumable products and refunds from your service](../xstore-managing-consumables-and-refunds.md)

[Manage products from your services](../service-to-service-nav.md)

[Authenticating your service with the Microsoft Store APIs](../xstore-authenticating-your-service.md)

[Using PublisherQuery (Collections v9) to query a user's products and entitlements](xstore-v9-query-for-products.md) 

