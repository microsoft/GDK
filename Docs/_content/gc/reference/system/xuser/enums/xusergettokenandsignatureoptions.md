---
author: M-Stahl
title: XUserGetTokenAndSignatureOptions
description: Options for GetUserTokenAndSignatureAsync.
kindex: XUserGetTokenAndSignatureOptions
ms.author: v-sahain
ms.topic: reference
edited: 00/00/0000
quality: good
security: public
applies-to: pc-gdk
---

# XUserGetTokenAndSignatureOptions  

Options for [XUserGetTokenAndSignatureAsync](../functions/xusergettokenandsignatureasync.md).  

## Syntax  
  
```cpp
enum class XUserGetTokenAndSignatureOptions  : uint32_t  
{  
    None = 0x00,  
    ForceRefresh = 0x01,  
    AllUsers = 0x02,  
}  
```  
  
## Constants  
  
| Constant | Description |
| --- | --- |
| None | No options. |  
| ForceRefresh | Force a refresh. |  
| AllUsers | Get tokens and signatures for all users. |  
  
## Remarks

The [XUserGetTokenAndSignatureAsync](../functions/xusergettokenandsignatureasync.md) function uses an XUserGetTokenAndSignatureOptions enumeration argument to asynchronously retrieve xtokens and signatures for web requests.

Similarly, the [XUserGetTokenAndSignatureUtf16Async](../functions/xusergettokenandsignatureutf16async.md) function uses an XUserGetTokenAndSignatureOptions enumeration argument to asynchronously retrieve unicode xtokens and signatures for web requests.

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

[XUserGetTokenAndSignatureUtf16Async](../functions/xusergettokenandsignatureutf16async.md)