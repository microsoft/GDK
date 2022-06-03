---
title: Server-side handling of Xbox Live User Privileges
description: Describes how the Xbox Live service determines which privileges an Xbox Live user has, and what that means for your title.
kindex: Server-side handling of Xbox Live User Privileges
ms.topic: conceptual
author: joannaleecy
ms.author: jeffshi
ms.date: 03/12/2020
edited: 02/18/2021
security: public
---

# Server-side handling of Xbox Live User Privileges

Use this topic to configure your [single sign-on (SSO) services](/azure/active-directory/manage-apps/what-is-single-sign-on) (also known as relying parties) to integrate with Xbox Live privileges.

## Prerequisites

To enforce privilege-based access control to your service, you must have a service that's configured for SSO with Xbox Live. 
This enables the Xbox Secure Token Service (XSTS) to issue tokens that are encrypted with a public key that you provide during configuration. 
This is referred to as *configuring your relying party*.

For more information, see [Service Authentication and Authorization to Xbox Live (Xbox Developer Downloads > Xbox One > All NDA Whitepapers)](https://www.microsoft.com/software-download/devcenter) and [Understanding Security Tokens for Xbox One (Xbox Developer Downloads > Xbox One > All Xbox One XDK CHMs)](https://www.microsoft.com/software-download/devcenter).


## Implementing privilege-based access control in partner services

The client app must send the XSTS token for the partner service by using the "authorization" header of the HTTP request.  

After the token is decrypted by the partner service, and the signature of the token and request is verified, the privilege claim must be extracted and verified with the expected privilege for the service.  

A sample web service that decrypts and retrieves claims from an XSTS token is available in the [Xbox One Simple Web Server](https://developer.microsoft.com/games/xbox/partner/development-education-samples) sample.
> [!NOTE]
> Xbox Live tokens can contain multiple user identities. Each user identity that's within the token has a privilege claim.  

If you're using the [Xbox Services and Relying Party SDK (Microsoft.XboxLive.Auth.dll (MXA))](https://developer.microsoft.com/games/xbox/partner/resources-softwaredownloads), you can use the following code to retrieve the privilege claim on each of the user identities that are present in the token.

```csharp
    ...
    using Microsoft.XboxLive.Auth;
    using Microsoft.XboxLive.Auth.Claims;
    ...

    // Use the Microsoft.XboxLive.Auth library to retrieve the current principal
    ClaimsPrincipal principal = ( ClaimsPrincipal ) Thread.CurrentPrincipal;

    if ( principal != null )
    {
        // Iterate over the user identities in the token and do something in case the // privilege is in the user identity
        foreach ( var uid in principal.GetUserIdentities() )
        {
            // Process the privileges claim
            string privilegesClaim = string.Empty;
            if ( uid.TryGetClaimValue( AuthClaimTypes.Privileges, out privilegesClaim ) )
            {
                //Error response to client
            }
            var privilegeValues = privilegesClaim.Split( ' ' );
            int[] privileges = Array.ConvertAll(
                privilegeValues,
                privilegeString =>
                {
                    // Return zero for any bytes that can't be parsed
                    int privilege;
                    return int.TryParse( privilegeString, out privilege ) ? privilege : 0;
            });
            HashSet< int > privilegesHash = new HashSet<int>(privileges );

            // Verify if the right privilege is included
            if ( !privilegesHash.Contains(AuthPrivileges.Multiplayer ) )
            {
                //Access denied response to the client
            }

            //Perform the authorized operation for the user
        }
    }
```

For example, you can use the code for a partner matchmaking service to determine if each user on a request is authorized to join multiplayer sessions.  

If you're using your own token handler instead of MXA, and you receive a request with an XBL 3.0 token, you must parse the token by using the token specification. 
For more information, see the Token format for privileges section of this topic and [Understanding Security Tokens for Xbox One (Xbox Developer Downloads > Xbox One > All Xbox One XDK CHMs)](https://www.microsoft.com/software-download/devcenter).









### Token format for privileges

Privileges are carried in the user and privileges claim for each user identity of a token. 
The privilege claim contains a space-delimited collection of integers. 
Each integer represents a specific privilege.  

If a value is in the collection, it means that the user currently has the privilege and is authorized to access the corresponding feature.

The following code is an example of a full-decrypted JSON web token that contains the privilege claim.  

```
...
{ "enc":"A128CBC+HS256", ... }.
{ "typ":"JWT", ... }.
{
"aud":"https://your_relying_party.com/",
"iss":"xsts.auth.xboxLive.com", ...
"cnf":"
{...}",
"xdi":"
{...}",
"xti":"
{...}",
"xui":"
[
{
"xid":"2533274991020393",
"gtg":"SampleGamertag1",
"agg":"Adult",
...,
"prv":"211 212 220 226 227 228 229 230 231 234 237 240 243 244 245 246 247 248 249 251 252 255"
},
{
"xid":"1234574991020397",
"gtg":"SampleGamertag2",
"agg":"Adult",
...,
"prv":"211 212 220 226 227 228 229 230 231 234 237 240 243 244 246 251 252 255"
}
]"
}
...
```
  
## See also  
  
[Xbox Live User Privileges overview](../live-user-privileges-overview.md)  
[Client-side use of Xbox Live User Privileges](live-user-privileges-client.md)