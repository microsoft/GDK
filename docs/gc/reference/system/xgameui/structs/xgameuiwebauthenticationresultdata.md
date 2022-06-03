---
author: M-Stahl
title: XGameUiWebAuthenticationResultData
description: Contains the response from a web authentication request.
kindex: XGameUiWebAuthenticationResultData
ms.author: kevinasg
ms.topic: reference
edited: 00/00/0000
quality: good
security: public
applies-to: pc-gdk
---

# XGameUiWebAuthenticationResultData  

Contains the response from a web authentication request.

## Syntax  
  
```cpp
typedef struct XGameUiWebAuthenticationResultData {  
    HRESULT responseStatus ;  
    size_t responseCompletionUriSize;  
    const char* responseCompletionUri;  
} XGameUiWebAuthenticationResultData  
```
  
### Members  
  
*responseStatus*
Type: HRESULT
  
Indicates the status of the web view authentication. `S_OK` if successful, or `E_CANCELLED` if the user manually closed the web view by hitting the back button.
  
*responseCompletionUriSize*  
Type: size_t  
  
The size, in bytes, of the response data, which is stored in *responseCompletionUri*.
  
*responseCompletionUri*  
Type: const char*  
  
The complete response data, which is contained in a URI format.
  
## Remarks  
  
You can access this structure after calling [XGameUiShowWebAuthenticationResult](../functions/xgameuishowwebauthenticationresult.md).

You can check the *responseStatus* field to see if the authorization request was successful or not. The field will contain `S_OK` if the authentication browser successfully navigated to the completion URI, otherwise it will contain `E_CANCELLED` to indicate that the user cancelled by pressing back.

If the authorization request was successful then the response data contains the base callback URI and any parameters that the OAuth provider added on as a result of authenticating the user (access token, expiration time, etc.)

If the authorization request was cancelled, the response data will be a null string.
  
## Requirements  
  
**Header:** XGameUI.h
  
**Supported platforms:** Windows, Xbox One family consoles and Xbox Series consoles  
  
## See also

[XGameUI](../xgameui_members.md)  
[XGameUiShowWebAuthenticationAsync](../functions/xgameuishowwebauthenticationasync.md)  
[XGameUiShowWebAuthenticationResultSize](../functions/xgameuishowwebauthenticationresultsize.md)  
[XGameUiShowWebAuthenticationResult](../functions/xgameuishowwebauthenticationresult.md)  
[Asynchronous Programming Model](../../../../system/overviews/async-programming-model.md)  