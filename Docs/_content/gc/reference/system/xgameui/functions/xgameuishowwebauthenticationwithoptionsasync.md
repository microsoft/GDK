---
author: M-Stahl
title: XGameUiShowWebAuthenticationWithOptionsAsync
description: Displays a web UI, with the option of showing it fulll screen, that allows the user to delegate access to external web sites and services without directly providing their credentials to the running title.
kindex: XGameUiShowWebAuthenticationWithOptionsAsync
ms.author: kevinasg
ms.topic: reference
edited: 00/00/0000
quality: good
security: public
applies-to: pc-gdk
---

# XGameUiShowWebAuthenticationWithOptionsAsync  

Begins the asynchronous authentication request that displays a web UI, possibly full screen, that allows the user to delegate access to external web sites and services without directly providing their credentials to the running title.

## Syntax  
  
```cpp
STDAPI XGameUiShowWebAuthenticationWithOptionsAsync(
    _In_ XAsyncBlock* async,
    _In_ XUserHandle requestingUser,
    _In_z_ const char* requestUri,
    _In_z_ const char* completionUri,
    _In_ XGameUiWebAuthenticationOptions options
    ) noexcept;
)  
```  
  
### Parameters  
  
*async* &nbsp;&nbsp;\_In\_  
Type: [XAsyncBlock*](../../xasync/structs/xasyncblock.md)  
  
A pointer to the [XAsyncBlock](../../xasync/structs/xasyncblock.md) that is passed to [XAsyncRun](../../xasync/functions/xasyncrun.md).
  
*requestingUser* &nbsp;&nbsp;\_In\_  
Type: XUserHandle  
  
A handle to the user requesting the web authentication.
  
*requestUri* &nbsp;&nbsp;\_In\_z\_  
Type: char*  
  
The initial URI of the web view presented to the user (likely containing fields for user authentication to the service). The request URI must be a secure HTTPS address.
  
*completionUri* &nbsp;&nbsp;\_In\_z\_  
Type: char*  

Indicates the URI that represents successful completion of the web authentication process. When the web view is navigated to a uri that matches the *completionUri*, the web view is closed, and control is returned to the calling title.

*options* &nbps;&nbsp;\_In\_
Type: [XGameUiWebAuthenticationOptions](../enums/xgameuiwebauthenticationoptions.md)

Flag indicating whether or not try and show the UI full screen or not. On PC, this flag is ignored. Full screen
is not an option that is supported on PC.

### Return value

Type: HRESULT
  
HRESULT success or error code of the async call.

To get the result, call [xgameuishowwebauthenticationresultsize](xgameuishowwebauthenticationresultsize.md) and [xgameuishowwebauthenticationresult](xgameuishowwebauthenticationresult.md) inside the *AsyncBlock* callback or after the *AsyncBlock* is complete.

## Remarks  
  
When this asynchronous task runs, the system presents a web view to the user (overlaying the current application), which they can interact with or dismiss by pressing back. This allows users to use OAuth in order to grant authorization permission to external web sites and services. This can be used in scenarios such as authenticating the game to share in-game highlights on social media, requesting user data from external providers, and more.

The result of the authentication request is stored in the [XGameUiWebAuthenticationResultData](../structs/xgameuiwebauthenticationresultdata.md) object which is returned from the [XGameUiShowWebAuthenticationResult](xgameuishowwebauthenticationresult.md) method.

If the web view is closed as a result of navigating to the *completionUri*, then the *responseStatus* field of the result data structure will be `S_OK`.

If the user cancels or otherwise manually closes the web view, then the *responseStatus* field of the result data structure will be `E_CANCELLED`.

## Example

The following code example shows how to perform OAuth by using Facebook. This example does not include memory allocation error handling in order to keep the code brief.

```cpp
// Use Facebook example for OAuth; client_id should correspond to your registered application.
const char completionUri[] = "https://www.facebook.com/connect/login_success.html"; 
const char requestUri[] =
    "https://www.facebook.com/dialog/oauth?"
    "client_id=000000000000000&"
    "redirect_uri=https%3A%2F%2Fwww.facebook.com%2Fconnect%2Flogin_success.html&"
    "response_type=token&"
    "sdk=xboxone";

// Allocate and initialize XAsyncBlock for asynchronous authentication operation.
XAsyncBlock* block = new XAsyncBlock();
ZeroMemory(block, sizeof(XAsyncBlock));
block->callback = [](XAsyncBlock* block)
{
    // Query required size and allocate buffer for authentication result data.
    uint32_t bufferSize = 0;
    FAIL_FAST_IF_FAILED(XGameUiShowWebAuthenticationResultSize(block, &bufferSize));
    uint8_t* buffer = new uint8_t[bufferSize];

    // The currentUser is initialized with user to authenticate for.
    XGameUiWebAuthenticationResultData* resultData = nullptr;
    FAIL_FAST_IF_FAILED(XGameUiShowWebAuthenticationResult(
        block,
        bufferSize,
        buffer,
        &resultData,
        nullptr
        ));

    //
    // Use the result data here. If resultData->responseStatus is S_OK, then web authentication was successful.
    //

    // Free allocated buffer and XAsyncBlock.
    delete[] buffer;
    delete block;
};

//  Begin asynchronous authentication operation.
XUserHandle currentUser = GetCurrentUserForAuthentication();
FAIL_FAST_IF_FAILED(XGameUiShowWebAuthenticationWithOptionsAsync(
    block,
    currentUser,
    requestUri,
    completionUri,
    XGameUiWebAuthenticationOptions::PreferFullscreen
    ));
```
  
## Requirements  
  
**Header:** XGameUI.h
  
**Library:** xgameruntime.lib
  
**Supported platforms:** Windows, Xbox One family consoles and Xbox Series consoles  
  
## See also

[XGameUI](../xgameui_members.md) 
[XGameUiShowWebAuthenticationAsync](xgameuishowwebauthenticationasync.md)  
[XGameUiShowWebAuthenticationResultSize](xgameuishowwebauthenticationresultsize.md)  
[XGameUiShowWebAuthenticationResult](xgameuishowwebauthenticationresult.md)  
[XGameUiWebAuthenticationResultData](../structs/xgameuiwebauthenticationresultdata.md)  
[Asynchronous Programming Model](../../../../system/overviews/async-programming-model.md)  