---
author: M-Stahl
title: XUserResolvePrivilegeWithUiAsync
description: Displays a resolution user interface for required user privileges.
kindex: XUserResolvePrivilegeWithUiAsync
ms.author: v-sahain
ms.topic: reference
edited: 00/00/0000
quality: good
security: public
applies-to: pc-gdk
---

# XUserResolvePrivilegeWithUiAsync  

Displays a resolution user interface for required user privileges.  

## Syntax  
  
```cpp
HRESULT XUserResolvePrivilegeWithUiAsync(  
         XUserHandle user,  
         XUserPrivilegeOptions options,  
         XUserPrivilege privilege,  
         XAsyncBlock* async  
)  
```  
  
### Parameters  
  
*user* &nbsp;&nbsp;\_In\_  
Type: XUserHandle  

The user that we are displaying the resolution UI to.  

*options* &nbsp;&nbsp;\_In\_  
Type: [XUserPrivilegeOptions](../enums/xuserprivilegeoptions.md)  

User privilege options.  

*privilege* &nbsp;&nbsp;\_In\_  
Type: [XUserPrivilege](../enums/xuserprivilege.md)  

The required user privilege.  

*async* &nbsp;&nbsp;\_Inout\_  
Type: [XAsyncBlock*](../../xasync/structs/xasyncblock.md)  

An [XAsyncBlock](../../xasync/structs/xasyncblock.md) for polling for the call's status and retrieving call results.  

### Return value

Type: HRESULT
  
HRESULT success or error code.  
For a list of error codes, see [Error Codes](../../../errorcodes.md).

## Remarks

To retrieve the result of a call to XUserResolvePrivilegeWithUiAsync, call [XUserResolvePrivilegeWithUiResult](xuserresolveprivilegewithuiresult.md).

To display a system User Interface for solving token issues with a specific unicode URL, call [XUserResolveIssueWithUiUtf16Async](xuserresolveissuewithuiutf16async.md).

To retrieve the result of a call to [XUserResolveIssueWithUiUtf16Async](xuserresolveissuewithuiutf16async.md), call [XUserResolveIssueWithUiUtf16Result](xuserresolveissuewithuiutf16result.md).

The following example shows how to use the XUserResolvePrivilegeWithUiAsync function.

 ```cpp
if (SUCCEEDED_LOG(XUserResolvePrivilegeWithUiAsync(
   iter->Handle(),
   resolveUserPrivilegeOptions,
   entry.Privilege,
   asyncBlock.get())))
   {
        // The call succeeded, so release the std::unique_ptr ownership of XAsyncBlock* since the callback will take over ownership.
        // If the call fails, the std::unique_ptr will keep ownership and delete the XAsyncBlock*
        asyncBlock.release();
   }
```

## Requirements  
  
**Header:** XUser.h
  
**Library:** xgameruntime.lib  
  
**Supported platforms:** Windows, Xbox One family consoles and Xbox Series consoles  
  
## See also

[XUser](../xuser_members.md)
  
[XUserResolvePrivilegeWithUiResult](xuserresolveprivilegewithuiresult.md)

[XUserResolveIssueWithUiUtf16Async](xuserresolveissuewithuiutf16async.md)

[XUserResolveIssueWithUiUtf16Result](xuserresolveissuewithuiutf16result.md)