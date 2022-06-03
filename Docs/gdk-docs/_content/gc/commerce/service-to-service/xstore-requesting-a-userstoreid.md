---
author: joannaleecy
title: Requesting a User Store ID for service-to-service authentication
description: Describes the required configuration and steps to get a User Store ID for service-to-service authentication with the Microsoft Store service APIs.
kindex: Requesting a User Store ID for service to service authentication
ms.author: cagood
ms.topic: conceptual
edited: '09/08/2021'
security: public
---


# Requesting a User Store ID for service-to-service authentication

This topic describes the required configuration and steps to get a User Store ID for service-to-service authentication with the Microsoft Store service APIs.

A User Store ID can be used to authenticate a call from your own service to the Microsoft Store API.
This method of authentication is tied to the user who is signed in to the Microsoft Store app on the device that's the purchasing account for in-game commerce, regardless of which account is playing the game on a Windows PC.  

There are two types of User Store IDs.
1.  [UserCollectionsID](#usercollectionsid) to authenticate with the Microsoft Store Collections service
2.  [UserPurchaseID](#userpurchaseid) to authenticate with the Microsoft Store Purchase service

This topic provides the following steps as the process for getting a User Store ID to call their respective services from your own service.

1.  [Configure an application in Azure Active Directory (Azure AD)](#step-1).
2.  [Associate your Azure AD application ID with your client app in Partner Center](#step-2).
3.  In your service, [create Azure AD access tokens](#step-3) that represent your publisher identity.
4.  In your game, [create a User Store ID key](#step-4) that represents the identity of the user who's currently signed in to the store app. Pass this key back to your service.
5.  [Authenticate through a User Store ID for Windows PC titles](xstore-authenticating-your-service.md#user-store-id).
6.  [Renew a Microsoft Store ID key](xstore-renew-a-user-store-id-key.md) when it expires.

This process involves two software components that perform different tasks.

* **Your service:** This is an application that runs securely in the context of your business environment, and it can be implemented by using any development platform that you choose.
Your service is responsible for creating the Azure AD access tokens that are needed for calling the REST URIs for the Microsoft Store Collections service.
* **Your game:** This is the game for which you want to access and manage use entitlement information (including add-ons for the game).
This game is responsible for creating the User Store ID keys that you need to call the Microsoft Store APIs.

## The Microsoft.StoreServices .NET library and sample

To help streamline integration of this authentication flow, we've created a publicly available GitHub project for the Microsoft.StoreServices library.
This library helps manage the authentication keys and provides wrapper APIs to call into Microsoft Store Services.
The sample highlights how a web service can integrate with the Microsoft.StoreServices library and example logic for managing consumable products, reconciling refunded purchases, renewing expired User Store IDs, and more.
The sample provides a configuration guide that includes the steps in this topic about how to configure and set up your Azure AD for this authentication method.  

- [Microsoft.StoreServices library](https://github.com/microsoft/Microsoft-Store-Services) 
- [Microsoft.StoreServices sample](https://github.com/microsoft/Microsoft-Store-Services-Sample) 

<a id="step-1"/>

## Step 1: Configure an application in Azure AD

Before you can use the Microsoft Store APIs, you must create an Azure AD web application, retrieve the tenant ID and application ID for the application, and generate a key.
The Azure AD web application represents the service from which you want to call the Microsoft Store APIs.
You need the tenant ID, application ID, and key to generate the Azure AD access tokens that you need to call the API.
> [!NOTE]
> You need to perform the tasks in this section only once.
After you have your tenant ID, application ID, and secret key, you can reuse these values whenever you need to create a new Azure AD access token.

1.  If you haven't done so already, follow the instructions in [Quickstart: Register an application with the Microsoft identity platform](/azure/active-directory/develop/active-directory-integrating-applications) to register a **Web app / API** application with Azure AD.
        > [!NOTE]
    > When you register your application, you must choose **Web app / API** as the application type. This enables you to retrieve a key (also called a *client secret*) for your application.
    To call the Microsoft Store APIs, you must provide a client secret when you request an access token from Azure AD in a later step.

2.  In the [Azure Management Portal](https://portal.azure.com/), go to **Azure Active Directory**.
Select your directory, select **App registrations** in the left pane, and then select your application. The application's main registration page appears.
3.  Copy the **Application ID** value to use later.
4.  Create a key (a client secret) that you'll need later.
In the left pane, select **Settings** and then select **Keys**. On this page, complete the steps to [Add a client secret](/azure/active-directory/develop/quickstart-register-app#add-credentials).
Copy this key to use later.

<a id="step-2"/>

## Step 2: Associate your Azure AD application ID with your client app in Partner Center

Before you can use the Microsoft Store APIs to configure the ownership and purchases for your app or add-on, you must associate your Azure AD application ID with your game in Partner Center.
> [!NOTE]
> You need to perform this task only once.

1.  Sign in to [Partner Center](https://partner.microsoft.com/dashboard), and then select your game.
2.  Select **Services** &gt; **Product collections and purchases**. Enter your Azure AD application ID into one of the available **Client ID** fields.

<a id="step-3"/>

## Step 3: Create Azure AD access tokens

Before you can retrieve a User Store ID key or call the Microsoft Store APIs, your service must create several different Azure AD access tokens that represent your publisher identity.
Each token is used with a different API. The lifetime of each token is 60 minutes. You can refresh them after they expire.
> [!IMPORTANT]
> Create Azure AD access tokens only in the context of your service, not in your app.
Your client secret could be compromised if it's sent to your app.

<a id="access-tokens" />

### Understanding the different tokens and audience URIs

Depending on which API you want to call in the Microsoft Store Collections service, you must create either two or three different tokens.
Each access token is associated with a different audience URI.

  * In all cases, you must create a token with the `https://onestore.microsoft.com` audience URI.
  In a later step, you'll pass this token as the `Authorization` header of the request to the Microsoft Store APIs.
            > [!IMPORTANT]
      > Use the `https://onestore.microsoft.com` audience only with access tokens that are stored securely within your service.
      Exposing access tokens with this audience outside your service could make your service vulnerable to replay attacks.

  * If you want to call the Microsoft Store Collections service to query for products that are owned by a user or report a consumable product as fulfilled, you must also create a token with the `https://onestore.microsoft.com/b2b/keys/create/collections` audience URI.
  In a later step, you'll pass this token to a client method in the GDK [XStore APIs](../../reference/system/xstore/xstore_members.md) to request a User Store ID key that you can use with the Microsoft Store Collections service.

  * If you want to call the Microsoft Store Purchase service to grant a free product to a user, get subscriptions for a user, or change the billing state of a subscription for a user, you must also create a token with the `https://onestore.microsoft.com/b2b/keys/create/purchase` audience URI.
  In a later step, you'll pass this token to a client method in the GDK [XStore APIs](../../reference/system/xstore/xstore_members.md) to request a User Store ID key that you can use with the Microsoft Store Collections service.


### Create the tokens

To create the access tokens, use the OAuth 2.0 API in your service by following the instructions in [Microsoft identity platform and the OAuth 2.0 client credentials flow](/en-us/azure/active-directory/develop/v2-oauth2-client-creds-grant-flow) to send an HTTP POST to the `https://login.microsoftonline.com/<tenant_id>/oauth2/token` endpoint.
Following is a sample request.


``` syntax
POST https://login.microsoftonline.com/<tenant_id>/oauth2/token HTTP/1.1
Host: login.microsoftonline.com
Content-Type: application/x-www-form-urlencoded; charset=utf-8

grant_type=client_credentials
&client_id=<your_client_id>
&client_secret=<your_client_secret>
&resource=https://onestore.microsoft.com
```

For each token, specify the following parameter data.

* For the `client_id` and `client_secret` parameters, specify the application ID and the client secret for your application that you retrieved from the [Azure Management Portal](https://portal.azure.com/).
Both of these parameters are required to create an access token with the level of authentication that's required by the Microsoft Store APIs.

* For the `resource` parameter, specify one of the audience URIs that's listed in the [previous section](#access-tokens), depending on the type of access token that you're creating.

After your access token expires, you can refresh it by following the instructions in the Refresh the access token section in the [Microsoft identity platform and OAuth 2.0 authorization code flow](/en-us/azure/active-directory/develop/v2-oauth2-auth-code-flow) topic.
For more details about the structure of an access token, see [Security tokens](/en-us/azure/active-directory/develop/security-tokens).

<a id="step-4"/>

## Step 4: Create a User Store ID key

Before you can call any Microsoft Store APIs, your game must create a corresponding key on the client and send it to your service.
This key is a JSON Web Token (JWT) that represents the identity of the user who's currently signed in to the Microsoft Store App and whose product ownership information you want to access.
For more information about the claims in this key, see [Claims in a User Store ID key](#claims-in-a-user-store-id-key).
The format for both types of User Store ID keys is the same.
The only difference is which corresponding service they can be used to authenticate with.
> [!NOTE]
> Each User Store ID key is valid for 90 days. After a key expires, you can renew it.
For more information, see [Renewing a User Store ID key](xstore-renew-a-user-store-id-key.md).

<a id="usercollectionsid"></a>

### To create a User Collections ID key for the Microsoft Store Collections service

Follow these steps to create a User Store ID key that you can use with the Microsoft Store collection API to query for products that are owned by a user or report a consumable product as fulfilled.


1.  Pass the Azure AD access token that has the audience URI value `https://onestore.microsoft.com/b2b/keys/create/collections` from your service to your game. This is one of the tokens that you created [previously in step 3](#step-3).

2.  In your game, call [XStoreGetUserCollectionsIdAsync](../../reference/system/xstore/functions/xstoregetusercollectionsidasync.md) to retrieve a User Collections ID key:

    Pass your Azure AD access token to the `serviceTicket` parameter of the method.  

    If you maintain anonymous user IDs in the context of services that you manage as the publisher of the current app, you can also pass a user ID to the `publisherUserId` parameter. This associates the current user with the new User Collections ID key (the user ID will be embedded in the key).  

    Otherwise, if you don't need to associate a user ID with the User Collections ID key, you can pass any string value to the `publisherUserId` parameter.  

3.  After your app successfully creates a User Collections ID key, pass the key back to your service.


<a id="userpurchaseid"></a>

### To create a User Purchase ID key for the Microsoft Store Purchase service

Follow these steps to create a User Purchase ID key that you can use with the Microsoft Store Purchase service to grant a free product to a user, get subscriptions for a user, or change the billing state of a subscription for a user.

1.  Pass the Azure AD access token that has the audience URI value `https://onestore.microsoft.com/b2b/keys/create/purchase` from your service to your game. This is one of the tokens that you created [previously in step 3](#step-3).

2.  In your app code, call [XStoreGetUserPurchaseIdAsync](../../reference/system/xstore/functions/xstoregetuserpurchaseidasync.md) to retrieve a User Purchase ID key:

    Pass your Azure AD access token to the `serviceTicket` parameter of the method.  

    If you maintain anonymous user IDs in the context of services that you manage as the publisher of the current app, you can also pass a user ID to the `publisherUserId` parameter. This associates the current user with the new User Purchase ID key (the user ID will be embedded in the key).  
    
    Otherwise, if you don't need to associate a user ID with the User Purchase ID key, you can pass any string value to the `publisherUserId` parameter.  

3.  After your app successfully creates a User Purchase ID key, pass the key back to your service.


## Step 5: Authenticate through a User Store ID for Windows PC titles
For instructions, see [Authenticating through a User Store ID](xstore-authenticating-your-service.md#user-store-id).

## Step 6: Renew a Microsoft Store ID key when it expires
For instructions, see [Renewing a User Store ID key](xstore-renew-a-user-store-id-key.md).

## Additional information

### Diagram of creating a User Store ID key

The following diagram illustrates the process of creating a User Store ID key.

![Image of a diagram that shows the process of creating a User Store ID key. From left to right, there are blocks for Your service, Azure AD, and Your app with the previous two arranged vertically, Windows SDK, and Store. There are four numbered arrows that show the flow from Your service to Azure AD, Your service to Your app, Your app to Windows SDK and Store, and then from Your app to Your service. There are dotted arrows from Store to Windows SDK, Windows SDK to Your app, and from Azure AD to Your service.](../../../../resources/gamecore/secure/images/en-us/xstore/b2b-1.png)

<a id="claims-in-a-user-store-id-key" />

### Claims in a User Store ID key

A User Store ID key is a JWT that represents the identity of the user whose product ownership information you want to access.
When decoded by using Base64, a User Store ID key contains the claims as shown in the following table.

| Parameter     | Type   | Description                       |
|---------------|--------|-----------------------------------|
| `iat`           | `int`    | Identifies the time at which the key was issued. This claim can be used to determine the age of the token. This value is expressed as epoch time. | 
| `iss`           | `string` | Identifies the issuer. This has the same value as the `aud` claim. | 
| `aud`           | `string` | Identifies the audience. It must be one of the following values: `https://collections.mp.microsoft.com/v6.0/keys` or `https://purchase.mp.microsoft.com/v6.0/keys`. | 
| `exp`           | `int`    | Identifies the expiration time on which or after which the key will no longer be accepted for processing anything except for renewing keys. The value of this claim is expressed as epoch time. | 
| `nbf`           | `int`    | Identifies the time at which the token will be accepted for processing. The value of this claim is expressed as epoch time. | 
| `https://schemas.microsoft.com/marketplace/2015/08/claims/key/clientId` | `string` | The client ID that identifies the developer. | 
| `https://schemas.microsoft.com/marketplace/2015/08/claims/key/payload` | `string` | An opaque payload (encrypted and Base64-encoded) that contains information that's intended only for use by Microsoft Store Services. | 
| `https://schemas.microsoft.com/marketplace/2015/08/claims/key/userId` | `string` | A user ID that identifies the current user in the context of your services. This is the same value that you pass into the optional `publisherUserId` parameter of the [method you use to create the User Store ID key](#step-4). | 
| `https://schemas.microsoft.com/marketplace/2015/08/claims/key/refreshUri` | `string` | The URI that you can use to renew the key. | 



Following is an example of a decoded User Store ID key header.

```json
{
    "typ":"JWT",
    "alg":"RS256",
    "x5t":"agA_pgJ7Twx_Ex2_rEeQ2o5fZ5g"
}
```

Following is an example of a decoded User Store ID key claim set.

```json
{
    "https://schemas.microsoft.com/marketplace/2015/08/claims/key/clientId": "1d577369placeholder7393bfef1e13d",
    "https://schemas.microsoft.com/marketplace/2015/08/claims/key/payload": "placeholderytCRzCHSqnfczv3f0343wfSydx7hghfu0snWzMqyoAGy5DSJ5rMSsKoQFAccs1iNlwlGrX+/eIwh/VlUhLrncyP8c18mNAzAGK+lTAd2oiMQWRRAZxPwGrJrwiq2fTq5NOVDnQS9Za6/GdRjeiQrv6c0x+WNKxSQ7LV/uH1x+IEhYVtDu53GiXIwekltwaV6EkQGphYy7tbNsW2GqxgcoLLMUVOsQjI+FYBA3MdQpalV/aFN4UrJDkMWJBnmz3vrxBNGEApLWTS4Bd3cMswXsV9m+VhOEfnv+6PrL2jq8OZFoF3FUUpY8Fet2DfFr6xjZs3CBS1095J2yyNFWKBZxAXXNjn+zkvqqiVRjjkjNajhuaNKJk4MGHfk2rZiMy/aosyaEpCyncdisHVSx/S4JwIuxTnfnlY24vS0OXy7mFiZjjB8qL03cLsBXM4utCyXSIggb90GAx0+EFlVoJD7+ZKlm1M90xO/QSMDlrzFyuqcXXDBOnt7rPynPTrOZLVF+ODI5HhWEqArkVnc5MYnrZD06YEwClmTDkHQcxCvU+XUEvTbEk69qR2sfnuXV4cJRRWseUTfYoGyuxkQ2eWAAI1BXGxYECIaAnWF0W6ThweL5ZZDdadW9Ug5U3fZd4WxiDlB/EZ3aTy8kYXTW4Uo0adTkCmdLibw=",
    "https://schemas.microsoft.com/marketplace/2015/08/claims/key/userId": "infusQplaceholder/SZWoPB4FqLEwHXgZFuMJ6TuTY=",
    "https://schemas.microsoft.com/marketplace/2015/08/claims/key/refreshUri": "https://collections.mp.microsoft.com/v6.0/b2b/keys/renew",
    "iat": 1442395542,
    "iss": "https://collections.mp.microsoft.com/v6.0/keys",
    "aud": "https://collections.mp.microsoft.com/v6.0/keys",
    "exp": 1450171541,
    "nbf": 1442391941
}
```

## See also

[Manage products from your services](service-to-service-nav.md)

[Authenticating your service with the Microsoft Store APIs](xstore-authenticating-your-service.md)

[Renewing a User Store ID key](xstore-renew-a-user-store-id-key.md)  

[Microsoft.StoreServices library](https://github.com/microsoft/Microsoft-Store-Services)  

[Microsoft.StoreServices sample](https://github.com/microsoft/Microsoft-Store-Services-Sample)  
