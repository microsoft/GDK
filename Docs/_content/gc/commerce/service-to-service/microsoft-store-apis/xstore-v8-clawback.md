---
title: purchase.mp.microsoft.com/v8.0/b2b/orders/query
description: Describes how to query for refunded or revoked items that a user had previously consumed.  Known as the Clawback service.
author: joannaleecy
kindex: purchase.mp.microsoft.com/v8.0/b2b/orders/query
ms.author: cagood
ms.topic: conceptual
edited: 11/15/2021
security: public
---

# purchase.mp.microsoft.com/v8.0/b2b/orders/query

This endpoint is more commonly know as the Clawback service.
It provides a game service the ability to query the status of consumable purchases made by the user over the past 90 days.
Using this API game services are able to detect when the user has been issued a refund for a consumable product that was already fulfilled.
The game service can then take the appropriate action to revoke or remove the refunded quantity form the user's balance tracked on the game service.

For an explanation of how to use this API in logic to manage consumable refunds on your service, see [Using the Clawback service to detect refunded products](../xstore-managing-consumables-and-refunds.md#clawback).

## Prerequisites

To use this API, you need the following:

* An Azure Active Directory (Azure AD) access token that has the audience URI value `https://onestore.microsoft.com`
* A User Purchase ID key that represents the identity of the user for whom you want to grant a free product

For more information, see [Requesting a User Store ID for service-to-service authentication](../xstore-requesting-a-userstoreid.md).

## Request

### Request syntax

| Method | Request URI                                                 |
|--------|-------------------------------------------------------------|
| `POST`   | ```https://purchase.mp.microsoft.com/v8.0/b2b/orders/query``` |

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
| `lineItemStateFilter` | `list<string>` | Specifies which item states to return in the query results. For a list of valid values, see [Line item states](#line-item-states).     | No       |
| `sbx`      | `string`          | Optional value for authenticating with UserStoreIds that specifies the Sandbox the results should be scoped to.  Default without this value is the RETAIL sandbox.  X-Token auth does not need this value as the Sandbox is specified within the X-Token.              | No |

<a id="line-item-states"></a>

### Line item states

| Value     | Description                                                                        |
|-----------|------------------------------------------------------------------------------------|
| `Purchased`    | Consumable purchases that are in an active (good) state.  This state includes unfulfilled and fulfilled consumables. |
| `Revoked`    | Consumable purchases that were fulfilled by the game service, but were later refunded by the user.  These generally indicate action is needed on the game service to revoke or remove the related quantity from the user's balance |
| `Refunded`    | Consumable purchases that were refunded but were not yet fulfilled by the game service.  These do not need to have action taken by the game service as they were not reported as fulfilled before the refund was issued. |

### Request example

```html
POST https://purchase.mp.microsoft.com/v8.0/b2b/orders/query HTTP/1.1
Host: purchase.mp.microsoft.com
Authorization: Bearer [AAD bearer token]
User-Agent: MicrosoftStoreServiceSample_1.21.9.0
Content-Type: application/json; charset=utf-8
Content-Length: 2032

{
  "b2bKey":"[UserPurchaseID]",
  "lineItemStateFilter": [
    "Purchased",
    "Revoked",
    "Refunded"],
  "sbx": "XDKS.1"
}
```

## Response

### Response body

| Parameter         | Type                     | Description          | Required |
|-------------------|--------------------------|----------------------|----------|
| `continuationToken` | `string`                   | If there are multiple sets of products, this token is returned when the page limit is reached. You can specify this continuation token in subsequent calls to retrieve remaining products. | No       |
| `items`             | `list<ClawbackItemContractV8>` | An array of products for the specified user. For more information, see the following table.        | Yes       |


The `ClawbackItemContractV8` object contains the following parameters.

| Parameter     | Type   | Description                                                                        | Required |
|---------------|--------|------------------------------------------------------------------------------------|----------|
| `orderId`      | `GUID`             | Identifies the purchasing order the consumable was a part of when purchased by the user | Yes       |
| `orderLineItems` | `list<OrderLineItemsContractV8>`             | An array of additional information related to the consumable within the purchasing OrderId from the user.  For more information, see the following table.             | Yes       |

The `OrderLineItemsContractV8` object contains the following parameters.

| Parameter     | Type   | Description                                                                        | Required |
|---------------|--------|------------------------------------------------------------------------------------|----------|
| `lineItemId`       | `GUID`   | Identifies the lineItem within the purchase order for the consumable (orders can have multiple lineItemIds for shopping cart scenarios) | Yes      |
| `lineItemState` | `string` | The state of this specific consuamble purchase.  See [Line item states](#line-item-states).            | Yes      |
| `productId`            | `string`             | Also refereed to as the Store ID for the product within the Microsoft Store catalog. An example Store ID for a product is 9NBLGGH42CFD.          | Yes      |
| `quantity`             | `number`             | The quantity of the item when purchased in the order. | Yes |
| `skuId`                | `string`             | The specific SKU identifier if there are multiple offerings of the product in the Microsoft Store catalog. An example Store ID for a SKU is 0010.      | Yes      | 


### Response Example

```json
HTTP/1.1 200 OK
Content-Length: 1042
Content-Type: application/json
MS-CorrelationId: b5157f23-7f26-4e0b-8f06-07733bd09355
MS-RequestId: 2b0933bc-19f7-4f96-bb47-2602491fed1f
MS-CV: OAIoYIzDJkO2Knqp.7
MS-ServerId: 1
Date: Tue, 30 Jun 2020 18:29:22 GMT
 
{
    "items": [
        {
            "orderId": "3c1ad7bc-b0c2-442c-aad4-46d8d0e0184e",
            "orderLineItems": [
                {
                    "lineItemId": "febdd51b-97aa-45fc-bf46-0120eacbf8aa",
                    "lineItemState": "Purchased",
                    "productId": "9MT5TGW893HV",
                    "quantity": 1,
                    "skuId": "0010"
                }
            ]
        },
        {
            "orderId": "75bf81ec-7c31-46f9-9828-6ac61464e553",
            "orderLineItems": [
                {
                    "lineItemId": "ad7adfc5-be76-4548-aede-155084490044",
                    "lineItemState": "Purchased",
                    "productId": "9MT5TGW893HV",
                    "quantity": 1,
                    "skuId": "0010"
                }
            ]
        },
        {
            "orderId": "b9d6d1fd-3e68-423b-85fa-feea1ee125b3",
            "orderLineItems": [
                {
                    "lineItemId": "eb565041-6e1f-4210-97a3-54a2ab80f49e",
                    "lineItemState": "Revoked",
                    "productId": "9MT5TGW893HV",
                    "quantity": 1,
                    "skuId": "0010"
                }
            ]
        },
        {
            "orderId": "cda65a53-30b0-4e19-8ec1-c08219174e45",
            "orderLineItems": [
                {
                    "lineItemId": "a30b4285-c456-4486-8048-a9f5b5231b76",
                    "lineItemState": "Revoked",
                    "productId": "9MT5TGW893HV",
                    "quantity": 1,
                    "skuId": "0010"
                }
            ]
        },
        {
            "orderId": "f1da6d12-8b0d-4dc1-8aca-c52fcece582a",
            "orderLineItems": [
                {
                    "lineItemId": "7da73274-b4bc-4a4f-bb93-e49618f7a7d7",
                    "lineItemState": "Purchased",
                    "productId": "9MT5TGW893HV",
                    "quantity": 1,
                    "skuId": "0010"
                }
            ]
        }
    ]
}

```

### Explanation of example response

From the above example (where we asked for all states) we see that the user's account purchased the consumable 9MT5TGW893HV 5 times.
Two of those purchases however have a line item state of `Revoked`, which means that they were refunded *after* they were consumed by our example game service.
Therefore, those two items will require us to take action on our service side to remove the equivalent value of these purchases from the user's balance tracked on the game service.

## Related topics

[Managing consumable products and refunds from your service](../xstore-managing-consumables-and-refunds.md)

[Manage products from your services](../service-to-service-nav.md)

[Authenticating your service with the Microsoft Store APIs](../xstore-authenticating-your-service.md)

[Using PublisherQuery (Collections v9) to query a user's products and entitlements](xstore-v9-query-for-products.md) 

