---
author: M-Stahl
title: XUserGetAgeGroup
description: Returns the age group of a user.
kindex: XUserGetAgeGroup
ms.author: v-sahain
ms.topic: reference
edited: 00/00/0000
quality: good
security: public
applies-to: pc-gdk
---

# XUserGetAgeGroup

Returns the age group of a user.
  
## Syntax  
  
```cpp
HRESULT XUserGetAgeGroup(  
         XUserHandle user,  
         XUserAgeGroup* ageGroup  
)  
```  
  
### Parameters  
  
*user* &nbsp;&nbsp;\_In\_  
Type: XUserHandle  

The user to get the age group of.  

*ageGroup* &nbsp;&nbsp;\_Out\_  
Type: [XUserAgeGroup*](../enums/xuseragegroup.md)  

Contains the age group of the user.  

### Return value

Type: HRESULT
  
HRESULT success or error code.  

| Return Code           | Description             |
|-----------------------|-------------------------|
| S_OK                  | The operation succeeded. |
| E_GAMEUSER_RESOLVE_USER_ISSUE_REQUIRED | The user must use a UI to resolve the issue. Call [XUserResolveIssueWithUiAsync](xuserresolveissuewithuiasync.md) to display the UI to the user. |

## Remarks

Retreives the user's [XUserAgeGroup](../enums/xuseragegroup.md). **E_GAMEUSER_RESOLVE_USER_ISSUE_REQUIRED** indicates there is a problem that the user needs to resolve using system UI before the code can retrieve the property. In that case, [XUserResolveIssueWithUiAsync](xuserresolveissuewithuiasync.md) can be used to trigger the system UI needed to resolve the issue.
  
## Requirements  
  
**Header:** XUser.h
  
**Library:** xgameruntime.lib  
  
**Supported platforms:** Windows, Xbox One family consoles and Xbox Series consoles  
  
## See also

[XUser](../xuser_members.md)

[XUserResolveIssueWithUiAsync](xuserresolveissuewithuiasync.md)