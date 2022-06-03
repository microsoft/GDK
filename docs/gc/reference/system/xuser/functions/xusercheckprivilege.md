---
author: M-Stahl
title: XUserCheckPrivilege
description: Determines if a user has a specific privilege.
kindex: XUserCheckPrivilege
ms.author: v-sahain
ms.topic: reference
edited: 00/00/0000
quality: good
security: public
applies-to: pc-gdk
---

# XUserCheckPrivilege  

Determines if a user has a specific privilege.  

## Syntax  
  
```cpp
HRESULT XUserCheckPrivilege(  
         XUserHandle user,  
         XUserPrivilegeOptions options,  
         XUserPrivilege privilege,  
         bool* hasPrivilege,  
         XUserPrivilegeDenyReason* reason  
)  
```  
  
### Parameters  
  
*user* &nbsp;&nbsp;\_In\_  
Type: XUserHandle  

A handle to the user whose privilege we are checking.  

*options* &nbsp;&nbsp;\_In\_  
Type: [XUserPrivilegeOptions](../enums/xuserprivilegeoptions.md)  

User privilege options.  

*privilege* &nbsp;&nbsp;\_In\_  
Type: [XUserPrivilege](../enums/xuserprivilege.md)  

The privilege to check for.  

*hasPrivilege* &nbsp;&nbsp;\_Out\_  
Type: bool*  

True if the user has the specific privilege, false otherwise.  

*reason* &nbsp;&nbsp;\_Out\_opt\_  
Type: [XUserPrivilegeDenyReason*](../enums/xuserprivilegedenyreason.md)  

Contains the reason the user could not attain the privilege.  

### Return value

Type: HRESULT
  
HRESULT success or error code. 

| Return Code           | Description             |
|-----------------------|-------------------------|
| S_OK                  | The operation succeeded. |
| E_GAMEUSER_RESOLVE_USER_ISSUE_REQUIRED | The user must use a UI to resolve the issue. Call [XUserResolveIssueWithUiAsync](xuserresolveissuewithuiasync.md) to display the UI to the user. |

## Remarks

Determines whether the user has a given [XUserPrivilege](../enums/xuserprivilege.md). Games should use
the *hasPrivilege* value returned to indicate if the user has the privilege or not. Games should only use the 
*reason* for logging and not for making in-game decisions. Games who want to try and resolve any issues with a 
privilege should call [XUserResolvePrivilegeWithUiAsync](xuserresolveprivilegewithuiasync.md).
 
## Requirements  
  
**Header:** XUser.h
  
**Library:** xgameruntime.lib  
  
**Supported platforms:** Windows, Xbox One family consoles and Xbox Series consoles  
  
## See also

[XUser](../xuser_members.md)
  
[XUserResolvePrivilegeWithUiAsync](xuserresolveprivilegewithuiasync.md)