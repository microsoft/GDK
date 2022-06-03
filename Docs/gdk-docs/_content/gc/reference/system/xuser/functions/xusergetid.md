---
author: M-Stahl
title: XUserGetId
description: Gets the user ID for a specific user.
kindex: XUserGetId
ms.author: v-sahain
ms.topic: reference
edited: 00/00/0000
quality: good
security: public
applies-to: pc-gdk
---

# XUserGetId  

Gets the user ID for a specific user.  

## Syntax  
  
```cpp
HRESULT XUserGetId(  
         XUserHandle user,  
         uint64_t* userId  
)  
```  
  
### Parameters  
  
*user* &nbsp;&nbsp;\_In\_  
Type: XUserHandle  

A handle to the user to retrieve the user ID for.  

*userId* &nbsp;&nbsp;\_Out\_  
Type: uint64_t*  

Contains the user ID for a specific user.  

### Return value

Type: HRESULT
  
HRESULT success or error code.  

| Return Code           | Description             |
|-----------------------|-------------------------|
| S_OK                  | The operation succeeded. |
| E_GAMEUSER_RESOLVE_USER_ISSUE_REQUIRED | The user must use a UI to resolve the issue. Call [XUserResolveIssueWithUiAsync](xuserresolveissuewithuiasync.md) to display the UI to the user. |

## Remarks

Retrieves the user’s XUID. If the function returns **E_GAMEUSER_RESOLVE_USER_ISSUE_REQUIRED**, the user needs to use the system UI to resolve the problem before the function can retrieve the property. Call [XUserResolveIssueWithUiAsync](xuserresolveissuewithuiasync.md) to display the system UI and resolve the issue.

## Requirements  
  
**Header:** XUser.h
  
**Library:** xgameruntime.lib  
  
**Supported platforms:** Windows, Xbox One family consoles and Xbox Series consoles  
  
## See also  

[XUser](../xuser_members.md)
  
[XUserFindUserById](xuserfinduserbyid.md)

[XUserFindUserByLocalId](xuserfinduserbylocalid.md)