---
author: joannaleecy
title: Renewing a User Store ID key
description: Describes how to renew a User Store ID key.
kindex: Renewing a User Store ID key
ms.author: cagood
ms.topic: conceptual
edited: 00/00/0000
security: public
---


# Renewing a User Store ID key

This topic describes how to renew a User Store ID key.

When you [generate a User Store ID key](xstore-requesting-a-userstoreid.md#step-4), it's is valid for 90 days.
After the key expires, your service can use the expired key to renegotiate a new key by using the following service call.

## Prerequisites

To renew a User Store ID key, you need the following:

* An Azure Active Directory (Azure AD) access token that has the audience URI value `https://onestore.microsoft.com`
* An expired Microsoft Store ID key that was [generated from client-side code in your app](xstore-requesting-a-userstoreid.md#step-4)

For more information, see [Requesting a User Store ID for service-to-service authentication](xstore-requesting-a-userstoreid.md).

## Request

### Request syntax

| Key type    | Method | Request URI                                              |
|-------------|--------|----------------------------------------------------------|
| `Collections` | `POST`   | `https://collections.mp.microsoft.com/v6.0/b2b/keys/renew` |
| `Purchase`    | `POST`   | `https://purchase.mp.microsoft.com/v6.0/b2b/keys/renew`    |


### Request header

| Header         | Type   | Description                                                                                           |
|----------------|--------|-------------------------------------------------------------------------------------------------------|
| `Host`           | `string` | Must be set to the value `collections.mp.microsoft.com` or `purchase.mp.microsoft.com`.           |
| `Content-Length` | `number` | The length of the request body.                                                                       |
| `Content-Type`   | `string` | Specifies the request and response type. Currently, the only supported value is `application/json`. |


### Request body

| Parameter     | Type   | Description                       | Required |
|---------------|--------|-----------------------------------|----------|
| `serviceTicket` | `string` | The Azure AD access token        | Yes      |
| `key`           | `string` | The expired Microsoft Store ID key | Yes       |


### Request example

```syntax
POST https://collections.mp.microsoft.com/v6.0/b2b/keys/renew HTTP/1.1
Content-Length: 2774
Content-Type: application/json
Host: collections.mp.microsoft.com

{
    "serviceTicket": "eyJ0eXAiOiJKV1QiLCJhb...",
    "Key": "eyJ0eXAiOiJKV1QiLCJhbG..."
}
```

## Response


### Response body

| Parameter | Type   | Description                                                                                                            |
|-----------|--------|------------------------------------------------------------------------------------------------------------------------|
| `key`       | `string` | The refreshed User Store ID key that can be used in future calls to the Microsoft Store collections API or purchase API |


### Response example

```syntax
HTTP/1.1 200 OK
Content-Length: 1646
Content-Type: application/json
MS-CorrelationId: bfebe80c-ff89-4c4b-8897-67b45b916e47
MS-RequestId: 1b5fa630-d672-4971-b2c0-3713f4ea6c85
MS-CV: xu2HW6SrSkyfHyFh.0.0
MS-ServerId: 030011428
Date: Tue, 13 Sep 2019 07:31:12 GMT

{
    "key":"eyJ0eXAi..."
}
```

## Error codes

| Code | Error        | Inner error code           | Description   |
|------|--------------|----------------------------|---------------|
| 401  | Unauthorized | `AuthenticationTokenInvalid` | The Azure AD access token is invalid. In some cases, the details of `ServiceError`contains more information, such as when the token will expire or that the `appid` claim is missing. |
| 401  | Unauthorized | `InconsistentClientId`       | The `clientId` claim in the User Store ID key and the `appid` claim in the Azure AD access token don't match.                                                                     |


## See also

[Commerce (overview)](../commerce-nav.md)

[Manage products from your services](service-to-service-nav.md)

[Requesting a User Store ID for service-to-service authentication](xstore-requesting-a-userstoreid.md)

[Authenticating your service with the Microsoft Store APIs](xstore-authenticating-your-service.md)

[Microsoft.StoreServices library (GitHub)](https://github.com/microsoft/Microsoft-Store-Services)  

[Microsoft.StoreServices sample (GitHub)](https://github.com/microsoft/Microsoft-Store-Services-Sample)  

[XStore (API reference)](../../reference/system/xstore/xstore_members.md)  
