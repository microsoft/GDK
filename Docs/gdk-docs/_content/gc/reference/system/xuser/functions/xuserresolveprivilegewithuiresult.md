---
author: M-Stahl
title: XUserResolvePrivilegeWithUiResult
description: Retrieves the result of a call to XUserResolvePrivilegeWithUiAsync.
kindex: XUserResolvePrivilegeWithUiResult
ms.author: v-sahain
ms.topic: reference
edited: 00/00/0000
quality: good
security: public
applies-to: pc-gdk
---

# XUserResolvePrivilegeWithUiResult  

Retrieves the result of a call to [XUserResolvePrivilegeWithUiAsync](xuserresolveprivilegewithuiasync.md).  

## Syntax  
  
```cpp
HRESULT XUserResolvePrivilegeWithUiResult(  
         XAsyncBlock* async  
)  
```  
  
### Parameters  
  
*async* &nbsp;&nbsp;\_Inout\_  
Type: [XAsyncBlock*](../../xasync/structs/xasyncblock.md)  

An [XAsyncBlock](../../xasync/structs/xasyncblock.md) for polling for the call's status and retrieving call results.  

### Return value

Type: HRESULT
  
HRESULT success or error code.  

| Return Code           | Description             |
|-----------------------|-------------------------|
| S_OK                  | The operation succeeded |
| E_ABORT               | The user canceled the operation |

## Remarks

To display a resolution user interface for required user privileges, call [XUserResolvePrivilegeWithUiAsync](xuserresolveprivilegewithuiasync.md).

To display a system User Interface for solving token issues with a specific unicode URL, call [XUserResolveIssueWithUiUtf16Async](xuserresolveissuewithuiutf16async.md).

To retrieve the result of a call to [XUserResolveIssueWithUiUtf16Async](xuserresolveissuewithuiutf16async.md), call [XUserResolveIssueWithUiUtf16Result](xuserresolveissuewithuiutf16result.md).

The following example shows how to use the **XUserResolvePrivilegeWithUiResult** function.

```cpp
HRESULT hrResolve = XUserResolvePrivilegeWithUiResult(asyncBlock.get());

 if (SUCCEEDED_LOG(hrResolve))
 {
  appLog.AddLog(""Successfully resolved privilege\n"");
                                    }
  else
 {
  appLog.AddLog(""Failed to resolved privilege\n"");
            }
```

## Requirements  
  
**Header:** XUser.h
  
**Library:** xgameruntime.lib  
  
**Supported platforms:** Windows, Xbox One family consoles and Xbox Series consoles  
  
## See also

[XUser](../xuser_members.md)
  
[XUserResolvePrivilegeWithUiAsync](xuserresolveprivilegewithuiasync.md)

[XUserResolveIssueWithUiUtf16Async](xuserresolveissuewithuiutf16async.md)

[XUserResolveIssueWithUiUtf16Result](xuserresolveissuewithuiutf16result.md)