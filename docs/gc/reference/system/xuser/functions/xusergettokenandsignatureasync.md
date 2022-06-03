---
author: M-Stahl
title: XUserGetTokenAndSignatureAsync
description: Asynchronously retrieves xtokens and signatures for web requests.
kindex: XUserGetTokenAndSignatureAsync
ms.author: v-sahain
ms.topic: reference
edited: 00/00/0000
quality: good
security: public
applies-to: pc-gdk
---

# XUserGetTokenAndSignatureAsync  

Asynchronously retrieves xtokens and signatures for web requests.  

## Syntax  
  
```cpp
HRESULT XUserGetTokenAndSignatureAsync(  
         XUserHandle user,  
         XUserGetTokenAndSignatureOptions options,  
         const char* method,  
         const char* url,  
         size_t headerCount,  
         const XUserGetTokenAndSignatureHttpHeader* headers,  
         size_t bodySize,  
         const void* bodyBuffer,  
         XAsyncBlock* async  
)  
```  
  
### Parameters  
  
*user* &nbsp;&nbsp;\_In\_  
Type: XUserHandle  

A handle to the user that the web request is for.  

*options* &nbsp;&nbsp;\_In\_  
Type: [XUserGetTokenAndSignatureOptions](../enums/xusergettokenandsignatureoptions.md)  

Options for retrieving the user token and signature.  

*method* &nbsp;&nbsp;\_In\_z\_  
Type: char*  

The method type for the web request.  

*url* &nbsp;&nbsp;\_In\_z\_  
Type: char*  

The URL for the web request.  

*headerCount* &nbsp;&nbsp;\_In\_  
Type: size_t  

The number of headers in the *headers* parameter.  

*headers* &nbsp;&nbsp;\_In\_reads\_opt\_(headerCount)  
Type: [XUserGetTokenAndSignatureHttpHeader*](../structs/xusergettokenandsignaturehttpheader.md)  

Headers for the web request.  

*bodySize* &nbsp;&nbsp;\_In\_  
Type: size_t  

The size of the buffer in the *bodyBuffer* parameter.  

*bodyBuffer* &nbsp;&nbsp;\_In\_reads\_bytes\_opt\_(bodySize)  
Type: void*  

A buffer that contains the body of the web request.  

*async* &nbsp;&nbsp;\_Inout\_  
Type: [XAsyncBlock*](../../xasync/structs/xasyncblock.md)  

An [XAsyncBlock](../../xasync/structs/xasyncblock.md) for polling the call's status and retrieving call results.  

### Return value

Type: HRESULT
  
Returns S_OK if successful; otherwise, returns an error code.
For a list of error codes, see [Error Codes](../../../errorcodes.md).  
  
## Remarks

To retrieve the result of calling XUserGetTokenAndSignatureAsync, call [XUserGetTokenAndSignatureResult](xusergettokenandsignatureresult.md).

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
  
[XUserGetTokenAndSignatureResult](xusergettokenandsignatureresult.md)

[XUserGetTokenAndSignatureResultSize](xusergettokenandsignatureresultsize.md)