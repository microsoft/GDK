---
author: M-Stahl
title: XUserGetTokenAndSignatureHttpHeader
description: Specifies the HTTP header for a web request.
kindex: XUserGetTokenAndSignatureHttpHeader
ms.author: v-sahain
ms.topic: reference
edited: 00/00/0000
quality: good
security: public
applies-to: pc-gdk
---

# XUserGetTokenAndSignatureHttpHeader

Specifies the HTTP header for a web request.  

## Syntax  
  
```cpp
typedef struct XUserGetTokenAndSignatureHttpHeader {  
    const char* name;  
    const char* value;  
} XUserGetTokenAndSignatureHttpHeader  
```
  
### Members  
  
*name*  
Type: const char*  
  
The header name.  
  
*value*  
Type: const char*  
  
The header value.  
  
## Remarks

To asynchronously retrieve xtokens and signatures for web requests, call the [XUserGetTokenAndSignatureAsync](../functions/xusergettokenandsignatureasync.md) function.
The function takes a pointer to an XUserGetTokenAndSignatureHttpHeader structure as an argument.

To retrieve the result of a call to [XUserGetTokenAndSignatureAsync](../functions/xusergettokenandsignatureasync.md), call the [XUserGetTokenAndSignatureResult](../functions/xusergettokenandsignatureresult.md) function.

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
  
**Supported platforms:** Windows, Xbox One family consoles and Xbox Series consoles  
  
## See also

[XUser](../xuser_members.md)
  
[XUserGetTokenAndSignatureAsync](../functions/xusergettokenandsignatureasync.md)

[XUserGetTokenAndSignatureResult](../functions/xusergettokenandsignatureresult.md)