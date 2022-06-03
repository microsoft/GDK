---
author: joannaleecy
title: Authenticating your service with the Microsoft Store APIs
description: Describes how to get and use either delegated authentication XSTS tokens or User Store IDs to authenticate with Microsoft Store Services.
kindex: Authenticating your service with the Microsoft Store APIs
ms.author: cagood
ms.topic: conceptual
edited: '09/08/2021'
security: public
---


<a id="authenticating-your-service"></a>

# Authenticating your service with the Microsoft Store APIs

This topic describes how to get and use either delegated authentication XSTS tokens or User Store IDs to authenticate with Microsoft Store Services.

You can authenticate with the Microsoft Store APIs in the following two ways.

* [User Store IDs and Azure Active Directory](#user-store-id): Ties authentication and results to the user account that's signed in to the Microsoft Store app.
* [Delegated Authentication XSTS tokens](#xtoken-auth): Ties authentication and results to the Xbox Live account of the user who's currently playing the game.

We recommend that new titles and services use the User Store ID authentication method for both PC titles and Xbox titles.
XSTS tokens are scoped to the user who's playing the game, and in some cases on PC, might not be the account that's performing the purchase transactions. (For more information, see [Handling mismatched store account scenarios on PC](../pc-specific-considerations/xstore-handling-mismatched-store-accounts.md).)
In addition, XSTS tokens aren't supported with some Microsoft Store Services such as the Recurrence and Purchase services.
Future services and development for Microsoft Store will use User Store IDs and not XSTS tokens.

Titles that are planning on cross-platform commerce solutions or services should be using User Store IDs because they can be renewed without a client interaction.
The XSTS authentication flow for services has a maximum lifetime of 30 days before a connection to an active client is required again.

Following are configuration and resources about how to get the proper authorization from the previously mentioned types.

<a id="xtoken-auth"></a>

## Authenticating through delegated authentication XSTS tokens

A delegated authentication XSTS token can be used to authenticate the service-to-service calls by adding the `Authorization` header of the request in the following format.  
  
    Authorization: XBL3.0 x=<user hash>;<XSTS token>
  
The target relying party for the XSTS token must be [https://licensing.xboxlive.com](https://licensing.xboxlive.com), the same as the legacy Xbox Inventory service.
If your previous services were set up to call Xbox Inventory, you can reuse the same token with this endpoint.
A signature header is also required where the signature that's generated matches the signature policy of the specified endpoint.  

For more information about how to get, manage, and use a delegated authentication XSTS token and signature, see the following resources.  

- [Game Service Sample](https://aka.ms/gdkdl): A comprehensive web service sample that demonstrates validation and handling of XSTS tokens from the client, server-to-server authentication, commerce services, and more.
Download the latest version from the [GDK download site](https://aka.ms/gdkdl). Download the latest release of All Samples.
Game Service Samples is under samples\Live\GameService in the downloaded .zip file.
- [Xfest 2019 - XSTS Auth and Server to Server made Easy](https://forums.xboxlive.com/articles/96129/xfest-online-2019-archive.html): Overview and explanation of XSTS tokens and how the Game Service Sample can help begin your own effort for service-to-service authentication.
To download the presentation information, select **GDK Track Downloads** on the archive site.
- [Xbox Live authentication and service-to-service calls (NDA topic)](../../live/features/s2s-auth-calls/live-s2s-auth-calls-nav.md): More detailed documentation on authentication, XSTS tokens, and the required steps and calls to make service-to-service calls to Xbox Live services.

<a id="Additional-Configuration-For-XSTS"></a>

### Additional configuration required to view and manage products with delegated authentication XSTS tokens

Because delegated authentication XSTS tokens are tied to a Business Partner from Partner Center, the products that you want to view or manage need to be linked to the Business Partner that your XSTS tokens are also tied to.
This is done by configuring the items into a product group.
This product group is tied to a Studio ID that's defined in Partner Center. The Studio ID must have the same ID as the Business Partner that your XSTS tokens will be tied to.  

The most common symptom for when your products aren't properly linked to the Business Partner ID in the XSTS tokens is that the calls to Collections will succeed, but there will be no items in the results. (For more information, see the forum post [B2B call to Collections LicensePreview service returns empty results (Partner Center configured game)](https://forums.xboxlive.com/questions/78683/b2b-call-to-collections-licensepreview-service-ret.html).)

**To properly configure your products and web services in Partner Center**

1. Create a Business Partner Certificate by using the **Generate Certificate** link of the web service. (Select **Developer Settings** > **Xbox Live** > **Web Services**.)
Choose the link in the row of the web service that your relying party is tied to.

2. Check the resulting page's URL.
The URL will have a `businessPartnerId` parameter with a GUID value.
Save this GUID because you'll need it for step 5 in these instructions.
(Example Business Partner ID: 12345678-9012-3456-7890-123456789012)

3. From the **Partner Center Overview** page of your products, select **Create a new** and then select **Product group**.

4. Assign this product group to a Dev Studio, or select **Create a new dev studio** if you don't have one yet.  

5. The Dev Studio that you selected or created must have its Studio ID match your Business Partner ID that you retrieved from step 2 in these instructions.
Copy this value into the **Dev Studio ID (optional)** text box.
If there's already a value in this box, we recommend that you create a new Dev Studio and not change the existing value. If the value is changed but is already being used by existing titles, this change might cause existing services and business-to-business calls to fail.

6. After the Dev Studio is configured with the matching ID of the Business Partner, return to your created Product Group. Add your game and all the products into the **Included in this product group** list.

7. Select **Save** to finish creating the product group.

8. Republish all the items in the product group to Microsoft Store in your sandbox or developer environment.  

After the publishing process has been completed, you should see proper items being returned from the service calls.  

<a id="user-store-id"></a>

## Authenticating through a User Store ID
> [!NOTE]
> On PC, entitlements are associated with the user who's signed in to the Microsoft Store app, instead of the user who's currently playing a title.
 Therefore, these accounts might be different. For more information, see [Handling mismatched store account scenarios on PC](../pc-specific-considerations/xstore-handling-mismatched-store-accounts.md).
>
> The Microsoft Store API requires Azure Active Directory (Azure AD) authentication to access customer ownership information.
To use this authentication type, you (or your organization) must have an Azure AD, and you must have [Global administrator](https://go.microsoft.com/fwlink/?LinkId=746654) permission for the directory.
If you already use Microsoft Office 365 or other business services from Microsoft, you already have an Azure AD.

For guidance about getting the needed ID keys for this authentication type, see [Requesting a User Store ID for service-to-service authentication](xstore-requesting-a-userstoreid.md).

When you call the Microsoft Store APIs, you'll use the Azure AD access token in the `Authorization` header of your request as follows.  
  
    Authorization: Bearer <AAD access token>  

If you're working in a sandbox, you must specify which sandbox by adding the following claim to the JSON body of the request.
Without this value, the sandbox scope of the results defaults to RETAIL.

Example:
```json
  "sbx": "XDKS.1"
```
  
You must also add the parameters as shown in the following table to the JSON body of the request with the User Store ID that you got from the client.  

| Parameter            | Type   | Description       | Required |
|----------------------|--------|-------------------|----------|
| `identityType`         | `string` | Specify the string value `b2b`.    | Yes      |
| `identityValue`        | `string` | The [User Store ID key](xstore-requesting-a-userstoreid.md#step-4) that represents the identity of the user for whom you want to report a consumable product as fulfilled.      | Yes      |
| `localTicketReference` | `string` | The requested identifier for the returned response. We recommend that you use the same value as the *userId* [claim](xstore-requesting-a-userstoreid.md#claims-in-a-user-store-id-key) in the User Store ID key. | Yes      |

Example:
```json
  "beneficiaries": [
    {
        "identitytype" : "b2b",
        "identityValue" : "eyJ0eXAiOiJ...",
        "localTicketReference" : "testReference"
    }
  ],
```

For more information about how to get, manage, and use User Store ID authentication, see the following resources.  

- [Microsoft.StoreServices (GitHub)](https://github.com/microsoft/Microsoft-Store-Services): Source code and library to help simplify the process for authenticating with and calling Microsoft Store Services from your own back-end services.
With these services, you can verify and manage user purchases that are made for your app or game within Microsoft Store (including Xbox consoles).
- [Microsoft.StoreServices Sample (GitHub)](https://github.com/microsoft/Microsoft-Store-Services-Sample): A web service sample that highlights the use of the `Microsoft.StoreServices` library to simplify the process of authenticating with and calling Microsoft Store Services from your own back-end services.
This sample also provides example logic for managing consumable products and reconciling refunded purchases with the Clawback service.
- [Requesting a User Store ID for service-to-service authentication](xstore-requesting-a-userstoreid.md)
- [Renewing a User Store ID key](xstore-renew-a-user-store-id-key.md)
- [Manage product entitlements from a service](/windows/uwp/monetize/view-and-grant-products-from-a-service)

### Diagram of calling a Microsoft Store API  

The following diagram describes the process of calling a Microsoft Store API by using the User Store ID from your service.

![Image of a diagram that has a Your service block, at the left, and is connected by arrows to the Azure AD and Store blocks, vertically, on the right. At the top, between Your service and Azure AD, an arrow to the right says Request token for collections or products API. At the bottom, between Your service and Store, an arrow to the right says Call collections or products API. Dotted arrows point from Azure AD and Store to Your service.](../../../../resources/gamecore/secure/images/en-us/xstore/b2b-2.png)

## See also

[Microsoft Store Service APIs](microsoft-store-apis/xstore-nav.md)

[Requesting a User Store ID for service-to-service authentication](xstore-requesting-a-userstoreid.md)

[Renewing a User Store ID key](xstore-renew-a-user-store-id-key.md)