---
author: M-Stahl
title: XGameUiShowWebAuthenticationResult
description: Gets the results from a [XGameUiShowWebAuthenticationAsync](xgameuishowwebauthenticationasync.md) call.
kindex: XGameUiShowWebAuthenticationResult
ms.author: kevinasg
ms.topic: reference
edited: 00/00/0000
quality: good
security: public
applies-to: pc-gdk
---

# XGameUiShowWebAuthenticationResult  

Gets the results from a [XGameUiShowWebAuthenticationAsync](xgameuishowwebauthenticationasync.md) call.

## Syntax  
  
```cpp
HRESULT XGameUiShowWebAuthenticationResult(  
         XAsyncBlock* async,  
         size_t bufferSize,  
         void* buffer,  
         XGameUiWebAuthenticationResultData** ptrToBuffer,  
         size_t* bufferUsed  
)  
```  
  
### Parameters  
  
*async* &nbsp;&nbsp;\_Inout\_  
Type: [XAsyncBlock*](../../xasync/structs/xasyncblock.md)  
  
A pointer to the [XAsyncBlock](../../xasync/structs/xasyncblock.md) that was passed to [XGameUiShowWebAuthenticationAsync](xgameuishowwebauthenticationasync.md).
  
*bufferSize* &nbsp;&nbsp;\_In\_  
Type: size_t  
  
The size, in bytes, of the buffer to receive the result data from the completed authentication request.
  
*buffer* &nbsp;&nbsp;\_Out\_writes\_bytes\_to\_(bufferSize,*bufferUsed)  
Type: void*  
  
A pointer to the buffer to receive the result data from the completed authentication request. This buffer holds the result data structure, as well as the variable size response data.
  
*ptrToBuffer* &nbsp;&nbsp;\_Outptr\_  
Type: [XGameUiWebAuthenticationResultData**](../structs/xgameuiwebauthenticationresultdata.md)  
  
A reference pointer to the result data structure. The result data structure is stored in the passed in *buffer*.
  
*bufferUsed* &nbsp;&nbsp;\_Out\_opt\_  
Type: size_t*  
  
The count of how many bytes of the *buffer* were used to store the result data and the variable response data.
  
### Return value

Type: HRESULT
  
HRESULT success or error code.
  
## Remarks  
  
Call this method inside the *AsyncBlock* callback or after the *AsyncBlock* is complete.

Before you call this method, you should call [XGameUiShowWebAuthenticationResultSize](xgameuishowwebauthenticationresultsize.md) so that you can allocate a buffer of memory of sufficient size to contain the results of the web authentication response.

After calling this method, the *buffer* contains both the XGameUiWebAuthenticationResultData structure, as well as the variable response data (which can be accessed via the *responseCompletionUri* field of the result data structure).

When you are done processing the results of the result data, you should release the *buffer* memory allocation.

For an example of how to use this method, see the code example in [XGameUiShowWebAuthenticationAsync](xgameuishowwebauthenticationasync.md).
  
## Requirements  
  
**Header:** XGameUI.h
  
**Library:** xgameruntime.lib
  
**Supported platforms:** Windows, Xbox One family consoles and Xbox Series consoles  
  
## See also

[XGameUI](../xgameui_members.md)  
[XGameUiShowWebAuthenticationAsync](xgameuishowwebauthenticationasync.md)  
[XGameUiShowWebAuthenticationResultSize](xgameuishowwebauthenticationresultsize.md)  
[XGameUiWebAuthenticationResultData](../structs/xgameuiwebauthenticationresultdata.md)  
[Asynchronous Programming Model](../../../../system/overviews/async-programming-model.md)  