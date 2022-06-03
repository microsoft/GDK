---
author: M-Stahl
title: XGameUiShowWebAuthenticationResultSize
description: Retrieves the size of the buffer needed to contain the results of an authentication request.
kindex: XGameUiShowWebAuthenticationResultSize
ms.author: kevinasg
ms.topic: reference
edited: 00/00/0000
quality: good
security: public
applies-to: pc-gdk
---

# XGameUiShowWebAuthenticationResultSize  

Retrieves the size of the buffer needed to store a previously completed authentication request. This size is variable because the server response can contain an arbitrary amount of data.

## Syntax  
  
```cpp
HRESULT XGameUiShowWebAuthenticationResultSize(  
         XAsyncBlock* async,  
         size_t* bufferSize  
)  
```  
  
### Parameters  
  
*async* &nbsp;&nbsp;\_Inout\_  
Type: [XAsyncBlock*](../../xasync/structs/xasyncblock.md)  
  
A pointer to the [XAsyncBlock](../../xasync/structs/xasyncblock.md) that was passed to [XGameUiShowWebAuthenticationAsync](xgameuishowwebauthenticationasync.md).
  
*bufferSize* &nbsp;&nbsp;\_Out\_  
Type: size_t*  
  
The size, in bytes, of the [XGameUiWebAuthenticationResultData](../structs/xgameuiwebauthenticationresultdata.md) returned from the [XGameUiShowWebAuthenticationAsync](xgameuishowwebauthenticationasync.md) call.
  
### Return value
  
Type: HRESULT
  
HRESULT success or error code.
  
## Remarks  
  
Call this method inside the *AsyncBlock* callback or after the *AsyncBlock* is complete. You must call this method so that you can allocate a buffer of sufficient size to contain the result data returned in [XGameUiShowWebAuthenticationResult](xgameuishowwebauthenticationresult.md).

For an example of how to use this method, see the code example in [XGameUiShowWebAuthenticationAsync](xgameuishowwebauthenticationasync.md).
  
## Requirements  
  
**Header:** XGameUI.h
  
**Library:** xgameruntime.lib
  
**Supported platforms:** Windows, Xbox One family consoles and Xbox Series consoles  
  
## See also

[XGameUI](../xgameui_members.md)  
[XGameUiShowWebAuthenticationAsync](xgameuishowwebauthenticationasync.md)  
[XGameUiShowWebAuthenticationResult](xgameuishowwebauthenticationresult.md)  
[XGameUiWebAuthenticationResultData](../structs/xgameuiwebauthenticationresultdata.md)  
[Asynchronous Programming Model](../../../../system/overviews/async-programming-model.md)  