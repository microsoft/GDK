---
author: joannaleecy
title: purchase.mp.microsoft.com/v7.0/purchases/grant
description: Describes how to grant a free app or add-on products to a particular user from your service.
kindex: purchase.mp.microsoft.com/v7.0/purchases/grant
ms.author: cagood
ms.topic: conceptual
edited: '09/08/2021'
security: public
---

# purchase.mp.microsoft.com/v8.0/purchases/grant

Use the Microsoft Store purchase API to grant a free app or add-on (also known as an *in-app product* or *IAP*) to a particular user.

Currently, you can only grant free products.
If your service attempts to grant a product that isn't free, an error is returned.

## Prerequisites> [!NOTE]
> Currently, the purchase API doesn't support XSTS token authentication.

To use this API, you need the following:

* An Azure Active Directory (Azure AD) access token that has the audience URI value `https://onestore.microsoft.com`
* A User Purchase ID key that represents the identity of the user for whom you want to grant a free product

For more information, see [Requesting a User Store ID for service-to-service authentication](../xstore-requesting-a-userstoreid.md).

## Request


### Request syntax

| Method | Request URI                                            |
|--------|--------------------------------------------------------|
| `POST`   | ```https://purchase.mp.microsoft.com/v7.0/purchases/grant``` |


### Request header

| Header         | Type   | Description                                                                                           |
|----------------|--------|-------------------------------------------------------------------------------------------------------|
| `Authorization` | `string` | Required. The Azure AD access token in the form `Bearer` &lt;*token*&gt;.                           |
| `Host`           | `string` | Must be set to the value `purchase.mp.microsoft.com`.                                            |
| `Content-Length` | `number` | The length of the request body.                                                                       |
| `Content-Type`   | `string` | Specifies the request and response type. Currently, the only supported value is `application/json`. |


### Request body

| Parameter      | Type   | Description        | Required |
|----------------|--------|---------------------|----------|
| `availabilityId` | `string` | The availability ID of the product to be granted from the Microsoft Store catalog.         | Yes      |
| `b2bKey`         | `string` | The [User Store ID key](../xstore-requesting-a-userstoreid.md#step-4) that represents the identity of the user for whom you want to grant a product.    | Yes      |
| `devOfferId`     | `string` | A developer-specified offer ID that appears in the Collection item after purchase.        |
| `language`       | `string` | The language of the user.  | Yes      |
| `market`         | `string` | The market of the user.       | Yes      |
| `orderId`        | `guid`   | A GUID generated for the order. This value be unique for the user, but it isn't required to be unique across all orders.    | Yes      |
| `productId`      | `string` | The [Store ID](/windows/uwp/monetize/in-app-purchases-and-trials#store-ids) for the [product](/windows/uwp/monetize/in-app-purchases-and-trials#products-skus-and-availabilities) in the Microsoft Store catalog. An example Store ID for a product is 9NBLGGH42CFD. | Yes      |
| `quantity`       | `int`    | The quantity to purchase. Currently, the only supported value is 1. If not specified, the default is 1.   | No       |
| `skuId`          | `string` | The [Store ID](/windows/uwp/monetize/in-app-purchases-and-trials#store-ids) for the product's [SKU](/windows/uwp/monetize/in-app-purchases-and-trials#products-skus-and-availabilities) in the Microsoft Store catalog. An example Store ID for a SKU is 0010.     | Yes      |
| `sbx`      | `string`          | Optional value for authenticating with UserStoreIds that specifies the Sandbox the results should be scoped to.  Default without this value is the RETAIL sandbox.  X-Token auth does not need this value as the Sandbox is specified within the X-Token.              | No |


### Request example

```syntax
POST https://purchase.mp.microsoft.com/v7.0/purchases/grant HTTP/1.1
Authorization: Bearer eyJ0eXAiOiJK...
Content-Length: 1863
Content-Type: application/json

{
    "b2bKey" : "eyJ0eXAiOiJK...",
    "availabilityId" : "9RT7C09D5J3W",
    "productId" : "9NBLGGH5WVP6",
    "skuId" : "0010",
    "language" : "en-us",
    "market" : "us",
    "orderId" : "3eea1529-611e-4aee-915c-345494e4ee76",
    "sbx" : "XDKS.1"
}
```

## Response


### Response body

| Parameter                 | Type                        | Description             | Required |
|---------------------------|-----------------------------|-----------------------|----------|
| `clientContext`             | `ClientContextV8`             | The client contextual information for this order. This is assigned to the *clientID* value from the Azure AD token.    | Yes      |
| `createdtime`               | `datetimeoffset`              | The time that the order was created.         | Yes      |
| `currencyCode`              | `string`                      | The currency code for `totalAmount` and `totalTaxAmount`. N/A for free items.     | Yes      |
| `friendlyName`              | `string`                      | The friendly name for the order. N/A for orders made by using the Microsoft Store purchase API. | Yes      |
| `isPIRequired`              | `boolean`                     | Indicates whether a payment instrument (PI) is required as part of the purchase order.  | Yes      |
| `language`                  | `string`                      | The language ID for the order (for example, "en").       | Yes      |
| `market`                    | `string`                      | The market ID for the order (for example, "US").  | Yes      |
| `orderId`                   | `string`                      | An ID that identifies the order for a particular user.                | Yes      |
| `orderLineItems`            | `list<OrderLineItemV8>` | The list of line items for the order. Typically, there's one line item per order.       | Yes      |
| `orderState`                | `string`                      | The state of the order. The valid states are `Editing`, `CheckingOut`, `Pending`, `Purchased`, `Refunded`, `ChargedBack`, and `Canceled`. | Yes      |
| `orderValidityEndTime`     | `string`                      | The last time the order pricing is valid before it's submitted. N/A for free apps.      | Yes      |
| `orderValidityStartTime`    | `string`                      | The first time the order pricing is valid before it's submitted. N/A for free apps.          | Yes      |
| `purchaser`                 | `IdentityV6`                  | An object that describes the identity of the purchaser.       | Yes      |
| `totalAmount`               | `decimal`                     | The total purchase amount of all items in the order including tax.       | Yes      |
| `totalAmountBeforeTax`      | `decimal`                     | The total purchase amount of all items in the order before tax.      | Yes      |
| `totalChargedToCsvTopOffPI` | `decimal`                     | If using a separate payment instrument and stored value (comma-separated value (CSV)), the amount charged to CSV.            | Yes      |
| `totalTaxAmount`            | `decimal`                     | The total amount of tax for all line items.    | Yes      |


The `ClientContext` object contains the following parameters.

| Parameter | Type   | Description                           | Required |
|-----------|--------|---------------------------------------|----------|
| `client`    | `string` | The client ID that created the order. | No       |


The `OrderLineItemV8` object contains the following parameters.

| Parameter               | Type           | Description                                                                                                  | Required |
|-------------------------|----------------|--------------------------------------------------------------------------------------------------------------|----------|
| `agent`                   | `IdentityV8`     | The agent that last edited the line item. For more information about this object, see the following table.       | No       |
| `availabilityId`          | `string`         | The availability ID of the product to be purchased from the Microsoft Store catalog.                         | Yes      |
| `beneficiary`             | `IdentityV8`     | The identity of the beneficiary of the order.                                                                | No       |
| `billingState`            | `string`        | The billing state of the order. This is set to `Charged` when completed.                                   | No       |
| `campaignId`              | `string`         | The campaign ID for this order.                                                                              | No       |
| `currencyCode`            | `string`         | The currency code that's used for price details.                                                                    | Yes      |
| `description`             | `string`         | A localized description of the line item.                                                                    | Yes      |
| `devofferId`              | `string`         | The offer ID for the particular order, if present.                                                           | No       |
| `fulfillmentDate`         | `datetimeoffset` | The date that the fulfillment occurred.                                                                           | No       |
| `fulfillmentState`        | `string`         | The state of the fulfillment of this item. This is set to `Fulfilled` when completed.                      | No       |
| `isPIRequired`            | `boolean`        | Indicates whether a payment instrument is required for this line item.                                       | Yes      |
| `isTaxIncluded`           | `boolean`        | Indicated whether tax is included in the pricing details of the item.                                        | Yes      |
| `legacyBillingOrderId`    | `string`         | The legacy billing ID.                                                                                       | No       |
| `lineItemId`              | `string`         | The line item ID for the item in this order.                                                                 | Yes      |
| `listPrice`               | `decimal`        | The list price of the item in this order.                                                                    | Yes      |
| `productId`               | `string`         | The [Store ID](/windows/uwp/monetize/in-app-purchases-and-trials#store-ids) for the [product](/windows/uwp/monetize/in-app-purchases-and-trials#products-skus-and-availabilities) that represents the line item in the Microsoft Store catalog. An example Store ID for a product is 9NBLGGH42CFD.   | Yes      |
| `productType`             | `string`         | The type of the product. The supported values are `Durable`, `Application`, and `UnmanagedConsumable`. | Yes      |
| `quantity`                | `int`            | The quantity of the item ordered.                                                                            | Yes      |
| `retailPrice`             | `decimal`        | The retail price of the item ordered.                                                                        | Yes      |
| `revenueRecognitionState` | `string`         | The revenue recognition state.                                                                               | Yes      |
| `skuId`                   | `string`         | The [Store ID](/windows/uwp/monetize/in-app-purchases-and-trials#store-ids) for the [SKU](/windows/uwp/monetize/in-app-purchases-and-trials#products-skus-and-availabilities) of the line item in the Microsoft Store catalog. An example Store ID for a SKU is 0010.                                                                   | Yes      |
| `taxAmount`               | `decimal`        | The tax amount for the line item.                                                                            | Yes      |
| `taxType`                 | `string`         | The tax type for the applicable taxes.                                                                       | Yes      |
| `Title`                  | `string`         | The localized title of the line item.                                                                        | Yes      |
| `totalAmount`             | `decimal`        | The total purchase amount of the line item including tax.                                                    | Yes      |


The `IdentityV8` object contains the following parameters.

| Parameter     | Type   | Description                                                                        | Required |
|---------------|--------|------------------------------------------------------------------------------------|----------|
| `identityType`  | `string` | Contains the value `"pub"`.                                                      | Yes      |
| `identityValue` | `string` | The string value of the *publisherUserId* from the specified User Store ID key. | Yes      |


### Response example

```syntax
Content-Length: 1203
Content-Type: application/json
MS-CorrelationId: fb2e69bc-f26a-4aab-a823-7586c19f5762
MS-RequestId: c1bc832c-f742-47e4-a76c-cf061402f698
MS-CV: XjfuNWLQlEuxj6Mt.8
MS-ServerId: 030032362
Date: Tue, 13 Oct 2019 21:21:51 GMT

{
    "clientContext": {
        "client": "86b78998-d05a-487b-b380-6c738f6553ea"
    },
    "createdTime": "2015-10-13T21:21:51.1863494+00:00",
    "currencyCode": "USD",
    "isPIRequired": false,
    "language": "en-us",
    "market": "us",
    "orderId": "3eea1529-611e-4aee-915c-345494e4ee76",
    "orderLineItems": [{
        "availabilityId": "9RT7C09D5J3W",
        "beneficiary": {
            "identityType": "pub",
            "identityValue": "user1"
        },
        "billingState": "Charged",
        "currencyCode": "USD",
        "description": "Jewels, Jewels, Jewels - Consumable 2",
        "fulfillmentDate": "2015-10-13T21:21:51.639478+00:00",
        "fulfillmentState": "Fulfilled",
        "isPIRequired": false,
        "isTaxIncluded": true,
        "lineItemId": "2814d758-3ee3-46b3-9671-4fb3bdae9ffe",
        "listPrice": 0.0,
        "payments": [],
        "productId": "9NBLGGH5WVP6",
        "productType": "UnmanagedConsumable",
        "quantity": 1,
        "retailPrice": 0.0,
        "revenueRecognitionState": "None",
        "skuId": "0010",
        "taxAmount": 0.0,
        "taxType": "NoApplicableTaxes",
        "title": "Jewels, Jewels, Jewels - Consumable 2",
        "totalAmount": 0.0
    }],
    "orderState": "Purchased",
    "orderValidityEndTime": "2015-10-14T21:21:51.1863494+00:00",
    "orderValidityStartTime": "2015-10-13T21:21:51.1863494+00:00",
    "purchaser": {
        "identityType": "pub",
        "identityValue": "user1"
    },
    "testScenarios": "None",
    "totalAmount": 0.0,
    "totalTaxAmount": 0.0
}
```

## Error codes


| Code | Error        | Inner error code           | Description   |
|------|--------------|----------------------------|----------------|
| 401  | Unauthorized | AuthenticationTokenInvalid | The Azure AD access token is invalid. In some cases, the details of ServiceError contains more information, such as when the token is expired or the *appid* claim is missing. |
| 401  | Unauthorized | PartnerAadTicketRequired   | An Azure AD access token wasn't passed to the service in the authorization header.   |
| 401  | Unauthorized | InconsistentClientId       | The *clientId* claim in the User Store ID key in the request body and the *appid* claim in the Azure AD access token in the authorization header don't match.       |
| 400  | BadRequest   | InvalidParameter           | The details contain information regarding the request body and which fields have an invalid value.           |


## Related topics

[Manage products from your services](../service-to-service-nav.md)

[Requesting a User Store ID for service-to-service authentication](../xstore-requesting-a-userstoreid.md)

[Renew a Microsoft Store ID key](../xstore-renew-a-user-store-id-key.md)