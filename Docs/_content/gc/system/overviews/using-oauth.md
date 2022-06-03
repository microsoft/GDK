---
author: M-Stahl
title: Using OAuth
description: Provides an overview of how to use OAuth in the Microsoft Game Development Kit (GDK).
kindex:
- OAuth
- XGameUiShowWebAuthentication, overview
ms.author: jgup
ms.topic: conceptual
edited: 04/09/2020
security: public
---

# Using OAuth 

Game developers need the ability to use *OAuth* to enable users to delegate access to external 
web sites and services without directly providing their credentials to the running title. In 
practice, this can mean anything from authenticating the game to share in-game highlights on 
social media to requesting user data from external providers. 
> [!NOTE]
> The *OAuth* solution described here does not provide support for 
every conceivable web page that might be shown. This solution depends on rendering a web page 
on top of the game in a highly memory restricted environment. Developers will need to test that
their web pages fit within the memory constraints without having issues.

The `XGameUiShowWebAuthentication` flow is made up of three functions, which are generally 
intended to be called in the following sequence. 

1. Call [XGameUiShowWebAuthenticationAsync](../../reference/system/xgameui/functions/xgameuishowwebauthenticationasync.md) or 
   [XGameUiShowWebAuthenticationWithOptionsAsync](../../reference/system/xgameui/functions/xgameuishowwebauthenticationwithoptionsasync.md) 
   to begin the asynchronous authentication request. This causes a web view to be presented to the 
   user (overlaying the current application), which they can interact with or dismiss by pressing 
   Back. The "option" variant allows the caller to choose whether to show the web view in 
   full screen.

   The request URI must be a secure HTTPS address. It represents the initial URI of the web 
   view that's presented to the user (likely containing fields for user authentication to the service). 

   The callback URI is matched against every URI that's navigated to in the web view that's 
   displayed to the user. The callback URI is never accessed, but rather control is given back 
   to the calling title when the user selects a link or the web server initiates a redirection. 

2. Call [XGameUiShowWebAuthenticationResultSize](../../reference/system/xgameui/functions/xgameuishowwebauthenticationresultsize.md) to 
   get the size of the buffer that's needed to store a previously completed authentication request. 
   This size is variable because the server response can contain an arbitrary amount of data. 

3. Call [XGameUiShowWebAuthenticationResult](../../reference/system/xgameui/functions/xgameuishowwebauthenticationresult.md) to get the 
   result of a previously completed authentication request. The necessary buffer size should 
   have been previously obtained by calling 
   [XGameUiShowWebAuthenticationResultSize](../../reference/system/xgameui/functions/xgameuishowwebauthenticationresultsize.md). 

   Invoking `XGameUiShowWebAuthenticationResult` yields the number of bytes that are used to store the 
   result, as well a pointer to the `XGameUiWebAuthenticationResultData` structure that's contained 
   within the provided buffer. 

   The result of the authentication request is stored in the 
   [XGameUiWebAuthenticationResultData](../../reference/system/xgameui/structs/xgameuiwebauthenticationresultdata.md) structure. 

   - The response status describes the overall result of the operation. 

   - The response data count contains the size of the response, including the string terminator.  

   - The response data contains the base callback URI, including any parameters that the OAuth 
     provider added on as a result of authenticating the user (for example, access token and expiration time) 
     on success and a null string on failure. Additionally, the `responseStatus` structure member 
     can be checked. It will contain `S_OK` if the authentication browser successfully navigated to 
     the completion URI. Otherwise, it will contain `E_CANCELLED` to indicate that the user canceled 
     by pressing Back.

## See also

[XGameUiShowWebAuthenticationAsync](../../reference/system/xgameui/functions/xgameuishowwebauthenticationasync.md)  
[XGameUiShowWebAuthenticationWithOptionsAsync](../../reference/system/xgameui/functions/xgameuishowwebauthenticationwithoptionsasync.md)