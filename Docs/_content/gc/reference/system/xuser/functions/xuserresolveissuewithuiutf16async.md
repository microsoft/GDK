---
author: M-Stahl
title: XUserResolveIssueWithUiUtf16Async
description: Displays a system User Interface for solving token issues with a specific unicode URL.
kindex: XUserResolveIssueWithUiUtf16Async
ms.author: v-sahain
ms.topic: reference
edited: 00/00/0000
quality: good
security: public
applies-to: pc-gdk
---

# XUserResolveIssueWithUiUtf16Async  

Displays a system User Interface for solving token issues with a specific unicode URL.

## Syntax  
  
```cpp
HRESULT XUserResolveIssueWithUiUtf16Async(  
         XUserHandle user,  
         const wchar_t* url,  
         XAsyncBlock* async  
)  
```  
  
### Parameters  
  
*user* &nbsp;&nbsp;\_In\_  
Type: XUserHandle  
  
A handle for the user with the token issue.  
  
*url* &nbsp;&nbsp;\_In\_opt\_z\_  
Type: wchar_t*  
  
For Xbox Live issues such as consent, pass **nullptr**. Otherwise, set to the Unicode URL of the web request that creates the issue.  
  
*async* &nbsp;&nbsp;\_Inout\_  
Type: XAsyncBlock*  
  
An [XAsyncBlock](../../xasync/structs/xasyncblock.md) for polling the call's status and retrieving the call results.  
  
### Return value

Type: HRESULT
  
Returns S_OK if successful; otherwise, returns an error code.
For a list of error codes, see [Error Codes](../../../errorcodes.md).  
  
## Remarks

If an XUsers API returns an E_GAMEUSER_RESOLVE_USER_ISSUE_REQUIRED error, the user must interact with the system user interface (UI) to resolve the issue.
Call **XUserResolveIssueWithUiUtf16Async** to show the appropriate system UI.
To retrieve the result of a call to XUserResolveIssueWithUiUtf16Async, call [XUserResolveIssueWithUiUtf16Result](xuserresolveissuewithuiutf16result.md).

To displays a system User Interface for solving token issues with a non-unicode URL, call [XUserResolveIssueWithUiAsync](xuserresolveissuewithuiasync.md).

The following example demonstrates how to display the system UI to resolve token issues with a URL.

```cpp
HRESULT ResolveUserIssueComplete(XAsyncBlock* ab)
{
    if (SUCCEEDED_LOG(XUserResolveIssueWithUiResult(ab)))
    {
        appLog.AddLog("Successfully Resolved User Issue\n");
    }

    return S_OK;
}

HRESULT ResolveUserIssueUtf16Complete(XAsyncBlock* ab)
{
    if (SUCCEEDED_LOG(XUserResolveIssueWithUiUtf16Result(ab)))
    {
        appLog.AddLog("Successfully Resolved User Issue\n");
    }

    return S_OK;
}

HRESULT ResolveUserIssueWithUiAsync(
    XTaskQueueHandle queue,
    const char* narrowUrl = nullptr,
    const wchar_t* wideUrl = nullptr,
    bool useUtf16 = false)
{
    auto resolveAsyncBlock = std::make_unique<XAsyncBlock>();
    ZeroMemory(resolveAsyncBlock.get(), sizeof(*resolveAsyncBlock));
    resolveAsyncBlock->queue = queue;
    resolveAsyncBlock->context = this;

    if (useUtf16)
    {
        resolveAsyncBlock->callback = [](XAsyncBlock* ab)
        {
            auto asyncBlock = std::unique_ptr<XAsyncBlock>(ab);
            LOG_IF_FAILED(static_cast<User*>(ab->context)->ResolveUserIssueUtf16Complete(ab));
        };

        if (SUCCEEDED_LOG(XUserResolveIssueWithUiUtf16Async(
            _handle.get(),
            wideUrl,
            resolveAsyncBlock.get())))
        {
            // The call succeeded, so release the std::unique_ptr ownership of XAsyncBlock* since the callback will take over ownership.
            // If the call fails, the std::unique_ptr will keep ownership and delete the XAsyncBlock*
            resolveAsyncBlock.release();
        }
    }
    else
    {
        resolveAsyncBlock->callback = [](XAsyncBlock* ab)
        {
            auto asyncBlock = std::unique_ptr<XAsyncBlock>(ab);
            LOG_IF_FAILED(static_cast<User*>(ab->context)->ResolveUserIssueComplete(ab));
        };

        if (SUCCEEDED_LOG(XUserResolveIssueWithUiAsync(
            _handle.get(),
            narrowUrl,
            resolveAsyncBlock.get())))
        {
            // The call succeeded, so release the std::unique_ptr ownership of XAsyncBlock* since the callback will take over ownership.
            // If the call fails, the std::unique_ptr will keep ownership and delete the XAsyncBlock*
            resolveAsyncBlock.release();
        }
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
  
[XUserResolveIssueWithUiUtf16Result](xuserresolveissuewithuiutf16result.md)

[XUserResolveIssueWithUiAsync](xuserresolveissuewithuiasync.md)