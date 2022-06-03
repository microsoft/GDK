---
author: M-Stahl
title: XUserGetGamerPictureResult
description: Retrieves the result of a call to XUserGetGamerPictureAsync.
kindex: XUserGetGamerPictureResult
ms.author: jgup
ms.topic: reference
edited: 07/02/2019
quality: good
security: public
applies-to: pc-gdk
---

# XUserGetGamerPictureResult  

Retrieves the result of a call to [XUserGetGamerPictureAsync](xusergetgamerpictureasync.md).  

## Syntax  
  
```cpp
HRESULT XUserGetGamerPictureResult(  
         XAsyncBlock* async,  
         size_t bufferSize,  
         void* buffer,  
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

A buffer that contains the gamer picture.  

*bufferUsed* &nbsp;&nbsp;\_Out\_opt\_  
Type: size_t*  

Contains the amount of the buffer for holding the gamer picture.  

### Return value

Type: HRESULT
  
HRESULT success or error code.  
For a list of error codes, see [Error Codes](../../../errorcodes.md).  
  
## Remarks  

The "Display Name and Gamerpic" XR lists specific requirements for how user names and avatar images are displayed. 
Consult Xbox Requirements for Xbox One Games and Hub Apps [(Xbox Developer Downloads->Partner, Publishing, and Release Management Information->XGD Partner Documentation)](https://www.microsoft.com/software-download/devcenter) for details.

To retrieve the result of a call to [XUserGetGamerPictureAsync](xusergetgamerpictureasync.md), call 
[XUserGetGamerPictureResult](xusergetgamerpictureresult.md).

To retrieve the buffer size required by {XUserGetGamerPictureResult](xusergetgamerpictureresult.md) to retrieve 
the gamer picture returned by [XUserGetGamerPictureAsync](xusergetgamerpictureasync.md), call 
[XUserGetGamerPictureResultSize](xusergetgamerpictureresultsize.md).

The format of the returned gamer picture is a .PNG formatted image. The size of the picture could be up to 2^32
bytes.
  
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
  
**Library:** xgameruntime.lib  
  
**Supported platforms:** Windows, Xbox One family consoles and Xbox Series consoles  
  
## See also

[XUser](../xuser_members.md)
  
[XUserGetGamerPictureAsync](xusergetgamerpictureasync.md)

[XUserGetGamerPictureResultSize](xusergetgamerpictureresultsize.md)