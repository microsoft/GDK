---
author: M-Stahl
title: XUserGetTokenAndSignatureData
description: Specifies the xtokens and signatures that we retrieve for web requests.
kindex: XUserGetTokenAndSignatureData
ms.author: v-sahain
ms.topic: reference
edited: 00/00/0000
quality: good
security: public
applies-to: pc-gdk
---

# XUserGetTokenAndSignatureData  

Specifies the xtokens and signatures that we retrieve for web requests.  

## Syntax  
  
```cpp
typedef struct XUserGetTokenAndSignatureData {  
    size_t tokenSize;  
    size_t signatureSize;  
    const char* token;  
    const char* signature;  
} XUserGetTokenAndSignatureData  
```
  
### Members  
  
*tokenSize*  
Type: size_t  
  
The size in bytes of the buffer in the **token** property.  
  
*signatureSize*  
Type: size_t  
  
The size in bytes of the buffer in the **signature** property.  
  
*token*  
Type: const char*  
  
A buffer that contains the retrieved token.  
  
*signature*  
Type: const char*  
  
A buffer that contains the retrieved signature.
  
## Remarks

To retrieve the result of a call to [XUserGetTokenAndSignatureAsync](../functions/xusergettokenandsignatureasync.md), call the [XUserGetTokenAndSignatureResult](../functions/xusergettokenandsignatureresult.md) function.

The [XUserGetTokenAndSignatureAsync](../functions/xusergettokenandsignatureasync.md) function asynchronously retrieves xtokens and signatures for web requests.

The [XUserGetTokenAndSignatureResult](../functions/xusergettokenandsignatureresult.md) function uses a double pointer to an XUserGetTokenAndSignatureData structure as an argument.

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