---
author: M-Stahl
title: XUserGetTokenAndSignatureResult
description: Gets the result of a call to XUserGetTokenAndSignatureAsync.
kindex: XUserGetTokenAndSignatureResult
ms.author: v-sahain
ms.topic: reference
edited: 07/02/2019
quality: good
security: public
applies-to: pc-gdk
---

# XUserGetTokenAndSignatureResult  

Gets the result of a call to [XUserGetTokenAndSignatureAsync](xusergettokenandsignatureasync.md).  

## Syntax  
  
```cpp
HRESULT XUserGetTokenAndSignatureResult(  
         XAsyncBlock* async,  
         size_t bufferSize,  
         void* buffer,  
         XUserGetTokenAndSignatureData** ptrToBuffer,  
         size_t* bufferUsed  
)  
```  
  
### Parameters  
  
*async* &nbsp;&nbsp;\_Inout\_  
Type: [XAsyncBlock*](../../xasync/structs/xasyncblock.md)  

An [XAsyncBlock](../../xasync/structs/xasyncblock.md) for polling the call's status and retrieving call results.  

*bufferSize* &nbsp;&nbsp;\_In\_  
Type: size_t  

The size of the buffer in the *buffer* parameter.  

*buffer* &nbsp;&nbsp;\_Out\_writes\_bytes\_to\_(bufferSize,*bufferUsed)  
Type: void*  

Contains the results of the call to [XUserGetTokenAndSignatureAsync](xusergettokenandsignatureasync.md).  

*ptrToBuffer* &nbsp;&nbsp;\_Outptr\_  
Type: [XUserGetTokenAndSignatureData**](../structs/xusergettokenandsignaturedata.md)  

On return, *prtToBuffer* points to the buffer you specify in the *buffer* parameter. The parameter provides a typed pointer to *buffer* and does not need to be freed independently.

*bufferUsed* &nbsp;&nbsp;\_Out\_opt\_  
Type: size_t*  

The number of bytes written in the *buffer* parameter.

### Return value

Type: HRESULT
  
Returns S_OK if successful; otherwise, returns an error code.
For a list of error codes, see [Error Codes](../../../errorcodes.md).  
  
## Remarks  

To asynchronously retrieve xtokens and signatures for web requests, call [XUserGetTokenAndSignatureAsync](xusergettokenandsignatureasync.md).

To retrieve the required buffer size to hold the results of calling [XUserGetTokenAndSignatureAsync](xusergettokenandsignatureasync.md), call [XUserGetTokenAndSignatureResultSize](xusergettokenandsignatureresultsize.md).

The following example demonstrates how to asynchronously retrieve the token and signature of a user.  
  
```cpp
HRESULT RequestTokenComplete(XAsyncBlock* abResult)
{
    size_t bufferSize;
    RETURN_IF_FAILED(XUserGetTokenAndSignatureResultSize(abResult, &bufferSize));

    std::vector<uint8_t> buffer(bufferSize);
    XUserGetTokenAndSignatureData* data;
    if (SUCCEEDED_LOG(XUserGetTokenAndSignatureResult(abResult, buffer.size(), buffer.data(), &data, nullptr /*bufferUsed*/)))
    {
        appLog.AddLog("Token: %s\n", data->token);
        if (data->signature != nullptr)
        {    
            appLog.AddLog("Signature: %s\n", data->signature);
        }
    }

    return S_OK;
}

HRESULT RequestTokenAsync(
    XTaskQueueHandle queue,
    const char* url,
    bool forceRefresh)
{
    auto asyncBlock = std::make_unique<XAsyncBlock>();
    ZeroMemory(asyncBlock.get(), sizeof(*asyncBlock));
    asyncBlock->queue = queue;
    asyncBlock->context = this;
    asyncBlock->callback = [](XAsyncBlock* ab)
    {
        LOG_IF_FAILED(static_cast<User*>(ab->context)->RequestTokenComplete(ab));
        delete ab;
    };


    XUserGetTokenAndSignatureOptions options = XUserGetTokenAndSignatureOptions::None;

    if (forceRefresh)
    {
        WI_SET_FLAG(options, XUserGetTokenAndSignatureOptions::ForceRefresh);
    }

    static const XUserGetTokenAndSignatureHttpHeader headers[] =
    {
        { "Accept", "application/json"},
        { "Why", "Because"},
    };

    if (SUCCEEDED_LOG(XUserGetTokenAndSignatureAsync(
        _handle.get(),
        options,
        "GET",
        url,
        ARRAYSIZE(headers),
        headers,
        0,
        nullptr,
        asyncBlock.get())))
    {
        // The call succeeded, so release the std::unique_ptr ownership of XAsyncBlock* since the callback will take over ownership.
        // If the call fails, the std::unique_ptr will keep ownership and delete the XAsyncBlock*
        asyncBlock.release();
    }

    return S_OK;
}
```
  
  
## Requirements  
  
**Header:** XUser.h
  
**Library:** xgameruntime.lib  
  
**Supported platforms:** Windows, Xbox One family consoles and Xbox Series consoles  
  
## See also

[XUser](../xuser_members.md)
  
[XUserGetTokenAndSignatureAsync](xusergettokenandsignatureasync.md)

[XUserGetTokenAndSignatureResultSize](xusergettokenandsignatureresultsize.md)