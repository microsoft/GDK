---
author: joannaleecy
title: collections.mp.microsoft.com/v8.0/collections/consume
description: Describes how to report Developer-Managed consumables as fulfilled or remove a specified quantity of a Store-Managed consumable from a user's balance.
kindex: collections.mp.microsoft.com/v8.0/collections/consume
ms.author: cagood
ms.topic: conceptual
edited: 00/00/0000
security: public
---

# collections.mp.microsoft.com/v8.0/collections/consume

The Consume API can be used for managing the following types of consumable products within Microsoft Store:

* **Store-Managed Consumable:** Report a quantity as consumed and remove it from the specified user's current quantity balance.
Users can repurchase Store-Managed Consumables repeatedly without your service having to report them as consumed or fulfilled.
For more information, see [Consuming a Store-Managed Consumable quantity](#consume-store-managed).

* **Developer-Managed Consumable:** Report a consumable product as fulfilled for a specified user.
Before a user can repurchase a Developer-Managed Consumable product, your app or service must report the consumable product as fulfilled for that user.
For more information, see [Reporting a Developer-Managed Consumable as fulfilled](#fulfil-developer-managed).

<a id="using-trackingid"></a>

## Using trackingId to validate fulfillment completion

`trackingId` is used as a redundancy check to validate a fulfillment request as succeeded if your service doesn't receive a confirmation.
If your service encounters a state where it didn't get a confirmation response, it can resubmit the request with the same request body (including the tracking ID) and get back a confirmation that the fulfillment succeeded before granting in-game items for that consumable. 

Each request to consume should have a unique tracking ID.
It will always be associated with the consume request it was generated for and can be resubmitted indefinitely for validation.
If the consume didn't get the request or it wasn't fulfilled, the service will complete the requested transaction as it normally would.
If the fulfillment was completed in the previous request, the consume will recognize this as a confirmation request because of the same values and `trackingId`.
In this case, the consume won't fulfill or deduct the amount a second time from the user's balance. Instead, the consume service sends a success response in the same format as if the consume had happened and relays back the current balance that's left.  

Therefore, it's best practice to keep the values and `trackingId` of each request cached on your server or in your logs until you've received a confirmation response that the request was fulfilled.
For an example, see the [Game Service Sample](https://aka.ms/gdkdl).  

When using the `includeOrderIds` parameter in your retry request, the following will happen based on the consumable type of the product

| Consumable type | First consume request behavior        | Retry consume request behavior           | 
|------|--------------|----------------------------|
| Store-managed | IDs of Orders used to fulfill the consume request returned | Same IDs of Orders used to fulfill the consume request returned |
| Developer-managed | Id of Order used to fulfill the consume request returned | No IDs returned as this data is not tracked after the consume for this product type   |

Therefore if you are using Developer-managed consumables, know that you will not be able to get the Order Id information of the fulfillment if the call is a retry check to verify it was consumed.

## Prerequisites

To use this API, you need to use one of the following authentication types.

* A delegated authorization XSTS token for the Relying Party `http://licensing.xboxlive.com/`
* A Microsoft Store ID key with an Azure Active Directory (Azure AD) access token that has the audience URI value `https://onestore.microsoft.com`

For more information, see [Authenticating your service with the Microsoft Store APIs](../xstore-authenticating-your-service.md).
> [!NOTE]
> If using Delegated authorization XSTS Tokens with this service, you must ensure that your product is configured properly and tied to your Business Partner in Partner Center.
If you see errors that mention you don't have access to the product attempting to be consumed, see [Additional configuration required to view and manage products with delegated auth XSTS tokens](../xstore-authenticating-your-service.md#Additional-Configuration-For-XSTS)

### User Store ID authentication error codes

| Code | Error        | Inner error code           | Description           |
|------|--------------|----------------------------|-----------------------|
| 401  | Unauthorized | AuthenticationTokenInvalid | The Azure AD access token is invalid. In some cases, the details of `ServiceError` contains more information, such as when the token is expired or the `appid` claim is missing. |
| 401  | Unauthorized | PartnerAadTicketRequired   | An Azure AD access token wasn't passed to the service in the authorization header.                                                                                                   |
| 401  | Unauthorized | InconsistentClientId       | The `clientId` claim in the Microsoft Store ID key in the request body and the `appid` claim in the Azure AD access token in the authorization header don't match.                     |

### Error codes by using XSTS token authentication

| Code | Error        | Inner error code           | Description           |
|------|--------------|----------------------------|-----------------------|
| 401  | Unauthorized | Expired Token              | The XSTS token has expired, and a new one will be required to complete the call. |
| 403  | Unauthorized | Invalid Token              | The token used isn't authorized to authenticate with this endpoint. The token might be for the wrong sandbox or Relying Party.|
| 429  | Throttled    | Too frequent calls         | The service has been called too many times for the user within the specified call limits.
For information about when your service can make another call for this user to the service, see the response. |

<a id="fulfil-developer-managed"></a>

## Request

### Request syntax

| Method | Request URI                                                   |
|--------|---------------------------------------------------------------|
| `POST`   | ```https://collections.mp.microsoft.com/v8.0/collections/consume``` |

### Request header

| Header         | Type   | Description                                                                                           |
|----------------|--------|-------------------------------------------------------------------------------------------------------|
| `Authorization`  | `string` | Required. Either the delegated authorization XSTS token or the Azure AD Access token based on the authentication type being used.|
| `Signature`      | `string` | Required when authenticating with XSTS tokens. Not required for User Store ID authentication.        |
| `User-Agent`     | `string` | Optional but we recommend it. Helps identify your service for logging and investigations.        |
| `Host`           | `string` | Must be set to the value `collections.mp.microsoft.com`.                                            |
| `Content-Length` | `number` | The length of the request body.                                                                       |
| `Content-Type`   | `string` | Specifies the request and response type. Currently, the only supported value is `application/json`. |

### Request body

| Parameter     | Type         | Description         | Required |
|---------------|--------------|---------------------|----------|
| `beneficiary`   | `UserIdentity` | The user for whom this item is being consumed. For more information, see [Authenticating through a User Store ID for PC titles](../xstore-authenticating-your-service.md#user-store-id). Not required for XSTS token authentication. | Only for User Store ID authentication  |
| `trackingId`    | `guid`         | A unique tracking ID provided by the developer for redundancy checks. The GUID should be unique for each request. For more information, see [Using trackingId to validate fulfillment completion](#using-trackingid). | Yes       |
| `productId`     | `string`       | The `productId` of the consumable that the request is for. Can be obtained from Partner Center or by [Querying a user's products and entitlements from a service](xstore-v9-query-for-products.md).   | Yes       |
| `quantity`      | `int`          | The quantity to consume from the user's quantity/balance of the consumable.              | Only for Store-Managed Consumables |
| `includeOrderIds`      | `bool`          | Include the OrderIds and LineItemIds of the orders used to fulfill this consume request.  These values can then be used with the [Clawback service] (xstore-managing-consumables-and-refunds#clawback.md) results to identify refunded consume transactions in your game service.              | No |
| `sbx`      | `string`          | Optional value for authenticating with UserStoreIds that specifies the Sandbox the results should be scoped to.  Default without this value is the RETAIL sandbox.  X-Token auth does not need this value as the Sandbox is specified within the X-Token.              | No |

<a id="consume-store-managed"></a>

### Consume request examples

The following examples use a User Store ID for authentication and requires the beneficiary object in the request JSON body.

#### Store-managed consume request
```syntax
POST https://collections.mp.microsoft.com/v8.0/collections/consume HTTP/1.1
Authorization: Bearer eyJ0eXAiOiJKV1...
Host: collections.mp.microsoft.com
Content-Type: application/json

{
    "beneficiary" : {
        "localTicketReference": "testReference",
        "identityValue": "eyJ0eXAiOiJ...",
        "identitytype": "b2b"
    },
    "productId": "9N0297GK108W",
    "trackingId": "1b3afaa8-8644-40e9-9073-266a3bb8804f",
    "removeQuantity": 1,
    "sandbox": "XDKS.1",
    "includeOrderIds": true
}
```

#### Developer-managed consume request

```syntax
POST https://collections.mp.microsoft.com/v8.0/collections/consume HTTP/1.1
Authorization: Bearer eyJ0eXAiOiJKV1...
Content-Type: application/json
Host: collections.md.mp.microsoft.com

{
    "beneficiary" : {
        "localTicketReference" : "testReference",
        "identityValue": "eyJ0eXAiOiJ...",
        "identitytype": "b2b"
    },
    "productId" : "9NBLGGH5WVP6",
    "trackingId" : "08a14c7c-1892-49fc-9135-190ca4f10490",
    "sbx" : "XDKS.1",
    "includeOrderIds": true
}
```

## Response

### Response body

| Parameter         | Type                     | Description          | Required |
|-------------------|--------------------------|----------------------|----------|
| `itemId`               | string             | An ID that identifies this collection item from other items the user owns. This ID is unique per product.   | Yes      |
| `productId`            | `string`             | Also refereed to as the Store ID for the product within the Microsoft Store catalog. An example Store ID for a product is 9NBLGGH42CFD.          | Yes      |
| `trackingId`    | `GUID`         | Unique tracking ID provided by the caller for this consume request.  | Yes       |
| `newQuantity`    | `int`         | Remaining quantity of the user's balance for this consumable product.  This will always be 0 for developer-managed consumables.  | Yes       |
| `ConsumeOrderTransactionContractV8`             | `List<ConsumeOrderTransactionContractV8>` | An array of ConsumeOrderTransactionContractV8 objects indicating the orders used to fulfill the consume request.  This is only returned if the includeOrderIds parameter is set to true in the request.   For more information, see the following table.        | No       |

The `ConsumeOrderTransactionContractV8` object contains the following parameters.

| Parameter     | Type   | Description                                                                        | Required |
|---------------|--------|------------------------------------------------------------------------------------|----------|
| `orderId`         | `GUID`          | Id of user's purchase order used to fulfill all or part of this consume request.                  | Yes      |
| `orderLineItemId`      | `GUID`             | Id of the line item the consumable was within the purchase order made by the user. This Id is more unique to a consumable purchase than OrderId as there can be multiple line item Ids per Order Id.             | Yes       |
| `quantityConsumed`         | `int`          | Amount of the consume request that was fulfilled by this specific OrderId / LineItemId  | Yes      |

### Consume response example
```syntax
HTTP/1.1 200 OK
Date: Sat, 04 Sep 2021 01:59:13 GMT
Content-Type: application/json; charset=utf-8
Server: Kestrel
Content-Length: 140
MS-CorrelationId: c7ed3826-c332-4394-af7e-32800e492695
MS-RequestId: 0702fbcf-01ec-4591-995e-13b92149df4d
MS-CV: rJGMXgDq8E2A1EmX.0
X-Content-Type-Options: nosniff
MS-ServerId: 6

{
    "newQuantity": 0,
    "itemId": "c95fef434d1241d6bdb09090b130b6f4",
    "trackingId": "1b3afaa8-8644-40e9-9073-266a3bb8804f",
    "productId": "9N0297GK108W",
    "orderTransactions": [
        {
            "$type": "consumeOrderTransactionV9",
            "orderId": "8060a406-85c8-4d01-a105-ff11725499c9",
            "orderLineItemId": "cb054aa0-7392-4cc6-af06-53b285e39259",
            "quantityConsumed": 1
        }
    ]
}
```

## Related topics

[Manage products from your services](../service-to-service-nav.md)

[Authenticating your service with the Microsoft Store APIs](../xstore-authenticating-your-service.md)

[Using PublisherQuery (Collections v9) to query a user's products and entitlements](xstore-v9-query-for-products.md) 

[Managing consumable products and refunds from your service](../xstore-managing-consumables-and-refunds.md)