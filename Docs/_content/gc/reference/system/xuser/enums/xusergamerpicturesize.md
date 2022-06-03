---
author: M-Stahl
title: XUserGamerPictureSize
description: Specifies the size of the gamer picture in pixels.
kindex: XUserGamerPictureSize
ms.author: v-sahain
ms.topic: reference
edited: 00/00/0000
quality: good
security: public
applies-to: pc-gdk
---

# XUserGamerPictureSize  

Specifies the size of the gamer picture in pixels.  

## Syntax  
  
```cpp
enum class XUserGamerPictureSize  : uint32_t  
{  
    Small = 0,  
    Medium = 1,  
    Large = 2,  
    ExtraLarge = 3,  
}  
```  
  
## Constants  
  
| Constant | Description |
| --- | --- |
| Small | A small picture size: 64x64 pixels. |  
| Medium | A medium picture size: 208x208 pixels. |  
| Large | A large picture size: 424x424 pixels. |  
| ExtraLarge | An extra large picture size: 1080x1080 pixels. |  
  
## Remarks  
  
To asynchronously retrieve the gamer picture of a user, call the [XUserGetGamerPictureAsync](../functions/xusergetgamerpictureasync.md) function.
The [XUserGetGamerPictureAsync](../functions/xusergetgamerpictureasync.md) function takes an XUserGamerPictureSize enumeration as a parameter.
The [XUserGetGamerPictureResult](../functions/xusergetgamerpictureresult.md) function retrieves the result that the [XUserGetGamerPictureAsync](../functions/xusergetgamerpictureasync.md) function returns.

The following example demonstrates how to load a gamer picture.  
  
```cpp
HRESULT LoadGamerPicComplete(XAsyncBlock* abResult)
{
    try
    {
        struct CreateTextureContext
        {
            User* This;
            ImTextureID TextureId;
            std::vector<unsigned char> GamerpicBuffer;
        };

        auto context = std::make_unique<CreateTextureContext>();
        context->This = this;
        context->TextureId = IMTEXTUREID_INVALID;

        // Get the buffer size and set up a buffer to contain it
        size_t bufferSize;
        RETURN_IF_FAILED(XUserGetGamerPictureResultSize(abResult, &bufferSize));
        context->GamerpicBuffer.resize(bufferSize);

        size_t bufferUsed;
        RETURN_IF_FAILED(XUserGetGamerPictureResult(
            abResult,
            context->GamerpicBuffer.size(),
            context->GamerpicBuffer.data(),
            &bufferUsed));
        FAIL_FAST_HR_IF(E_UNEXPECTED, bufferSize != bufferUsed);

        // Create some async work to create a dx texture off the UI thread
        // and then set the texture id back on the UI thread
        auto abCreateTexture = std::make_unique<XAsyncBlock>();
        ZeroMemory(abCreateTexture.get(), sizeof(*abCreateTexture));
        abCreateTexture->queue = abResult->queue;
        abCreateTexture->context = context.get();

        // Set the texture id in the completion on the UI thread
        abCreateTexture->callback = [](XAsyncBlock* ab)
        {
            auto context = static_cast<CreateTextureContext*>(ab->context);
            context->This->_textureId = context->TextureId;
            delete context;
            delete ab;
        };

        // Worker will create the texture on a work thread
        auto createTextureWorker = [](XAsyncBlock* ab) -> HRESULT
        {
            auto context = static_cast<CreateTextureContext*>(ab->context);
            auto dimension = GetDimensionFromSize(GamerPicSize);
            RETURN_IF_FAILED(CreateTextureFromPng(context->GamerpicBuffer.data(), context->GamerpicBuffer.size(), &context->TextureId));
            return S_OK;
        };

        // Create the texture on a work thread
        if (SUCCEEDED_LOG(XAsyncRun(abCreateTexture.get(), createTextureWorker)))
        {
            context.release();
            abCreateTexture.release();
        }
    }
    CATCH_RETURN();
    return S_OK;
}

HRESULT LoadGamerPicAsync(XTaskQueueHandle queue, uint32_t cancelTime = 0)
{
    auto asyncBlock = std::make_shared<XAsyncBlock>();
    ZeroMemory(asyncBlock.get(), sizeof(*asyncBlock));
    asyncBlock->queue = queue;

    struct GamerPicContext
    {
        User* User;
        std::shared_ptr<XAsyncBlock> AsyncBlock;
    };

    auto context = std::make_unique<GamerPicContext>();
    context->User = this;
    context->AsyncBlock = asyncBlock;
    asyncBlock->context = context.get();

    asyncBlock->callback = [](XAsyncBlock* ab)
    {
        std::unique_ptr<GamerPicContext> context(reinterpret_cast<GamerPicContext*>(ab->context));
        LOG_IF_FAILED(context->User->LoadGamerPicComplete(ab));
    };

    if (cancelTime != 0)
    {
        std::thread cancelThread(
            [asyncBlock]()
        {
            std::this_thread::sleep_for(std::chrono::milliseconds(5000));
            XAsyncCancel(asyncBlock.get());
        });

        cancelThread.detach();
    }

    if (SUCCEEDED_LOG(XUserGetGamerPictureAsync(_handle.get(), GamerPicSize, asyncBlock.get())))
    {
        context.release();
    }

    return S_OK;
}
```
  
  
## Requirements  
  
**Header:** XUser.h
  
**Supported platforms:** Windows, Xbox One family consoles and Xbox Series consoles  
  
## See also

[XUser](../xuser_members.md)
  
[XUserGetGamerPictureAsync](../functions/xusergetgamerpictureasync.md)

[XUserGetGamerPictureResult](../functions/xusergetgamerpictureresult.md)