---
title: EDS Authorization
description: " EDS Authorization"
ms.date: 10/12/2017
ms.topic: article
keywords: xbox live, xbox, games, uwp, windows 10, xbox one
ms.author: joanlee
security: public
author: joannaleecy
---

# EDS Authorization
 
  * [Introduction](#ID4EN)
  * [Authorization Process](#ID4EFB)
  * [3.0 Tokens: Multiuser vs. Single User](#ID4EEC)
  * [Does EDS support multi-users?](#ID4EYC)
 
<a id="ID4EN"></a>

 
## Introduction
 
Entertainment Discovery Services (EDS) 3.1 will not support Anonymous traffic. Authentication is required for all requests to EDS. EDS will require an XToken from callers to properly authenticate clients. These tokens are produced by XSTS and can be obtained through various Xbox Authentication Services (XAS). There are separate authentication services for Device, Users and Titles which will all define the identity of the token.
 
XSTS is the gatekeeper for Xbox LIVE. It is the first line of defense to determine if a user or device is authorized to connect to any of the Xbox LIVE services. After authenticating the user, the XSTS generates an XToken that they can use to securely identify themselves to any component on the service. This XToken is your passport to LIVE.
 
People and things, want to use our services. And we want most of those things and people to be able to use our services. But how do we make sure that the things aren't pretending to be people, and that the people are actually who they say they are? We provide them with tokens which they can use to identify themselves to others.
 
These tokens are produced by the XSTS and are generally referred to as XTokens. XToken is a broad term that is used to cover tokens that contain a variety of different things and can come in many different forms, but they are all created, signed, and optionally encrypted by the XSTS server. Internally, XSTS uses MXAN to create and format the tokens. MXAN is the only component that ever extracts information from an XToken. Services consuming the tokens pass the request headers to MXAN to be cracked. The tokens are processed and validated and the claims expressed in the token are returned to the service. The service can then use these claim values to identify the calling user or device, and perform actions based on that information.
 
The basic identity tokens - for User, Device, and Title - are provided by the Xbox Authentication Services (XAS). Each XAS is responsible for generating an identity token which specifies values for various claims that they are responsible for.
 
   * XASD (XAS for Devices): creates a DToken which provides a Device identity
   * XASU (XAS for Users): creates a UToken which provides a User identity
   * XAST (XAS for Titles): creates a TToken which provides a Title identity
   
<a id="ID4EFB"></a>

 
## Authorization Process
 
   * Obtain one or more identity tokens. You can request an XToken with at most one each of D, U, and T tokens. You must provide at least one of D, or U. 
     * Request a DToken from XASD by providing device authentication details
     * Request a UToken from XASU with some form of user authentication. The user auth is probably provided in the form of an MSA (RPS) token.
     * Request a TToken from XAST. The titles that are available depend on the platform currently running so you must provide a DToken to XAST as well.
  
   * Create an XSTS Request.
 
     * Define the relying party that you are requesting a token for.
     * Populate the request properties with the D, U, and/or T tokens.
    * Execute the XSTS Request and cache the resulting XToken. The returned XToken contains (at most) all of the Device, User, and Title identity information from the identity tokens and any additional claims (current subscription status, user groups, etc.).
   
<a id="ID4EEC"></a>

 
## 3.0 Tokens: Multiuser vs. Single User
 
This is the form of the 3.0 token: `XBL3.0 x=&lt;hash>;&lt;token>`
 
Depending on the &lt;hash>, the token is treated differently:
 
   * If &lt;hash> is equal to * (asterisk), then no particular user is performing the request and all the users in the token are present in the deserialized principal. This is the true multiuser form.
   * If &lt;hash> is equal to - (dash), then no users are performing the request. Any users in the deserialized principal are stripped out.
   * If &lt;hash> is not equal to * or - then it is an identifier indicating which user in the token is making the request. Only the indicated user will be present in the deserialized principal. All other users are stripped out. This is the single-user 3.0 token.
   
<a id="ID4EYC"></a>

 
## Does EDS support multi-users?
 * The answer is no. In the case that was described, the console will always send single user tokens. Even if there are multiple users signed in, there must be an indicated "Caller", where all other identities are dropped.
  
<a id="ID4E6C"></a>

 
## See also
 
<a id="ID4EBD"></a>

 
##### Parent  

[Additional Reference](atoc-xboxlivews-reference-additional.md)

  
<a id="ID4END"></a>

 
##### Further Information 

[Marketplace URIs](../uri/marketplace/atoc-reference-marketplace.md)

   