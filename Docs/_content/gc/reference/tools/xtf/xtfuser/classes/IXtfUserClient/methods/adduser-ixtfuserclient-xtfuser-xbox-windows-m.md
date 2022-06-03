---
author: aablackm
title: AddUser
description: Adds a user without signing them in.
ms.assetid: M:Windows.Xbox.xtfuser.IXtfUserClient.AddUser(LPCWSTR,UINT32)
kindex:
- AddUser method
- IXtfUserClient--AddUser method
ms.author: stevenpr
ms.topic: reference
edited: 06/13/2019
quality: good
security: public
---

# IXtfUserClient::AddUser Method
Adds a user without signing them in.

## Syntax  

```cpp
public:
HRESULT AddUser(
         LPCWSTR emailAddress,
         UINT32 *pUserId
)  
```
### Parameters  

*emailAddress*  
Type: LPCWSTR 

The email address of the user to add.


*pUserId*  
Type: UINT32 *

On successful completion, points to the User ID of the user.

### Return value  
Type: HRESULT 

HRESULT success or error code.

## Remarks  

In this release, password text is not encrypted when sent to the console over the network. If this is a concern in your network environment, then use the **AddUser** method to add the user to the console, then use the Sign-In app on the console to sign in the user and store the password. (The Sign-In app sends the encrypted password over the network.) After this, you can use [SigninUser](signinuser-ixtfuserclient-xtfuser-xbox-windows-m.md) or [SigninUserId](signinuserid-ixtfuserclient-xtfuser-xbox-windows-m.md) to sign in without sending a password.

## Requirements  

**Header:** xtfuser.h  

**Library:** xtfuser.lib  
  
**Supported platforms:** Windows (for Xbox console tools)  
  
## See also  
[IXtfUserClient Interface](../ixtfuserclient-xtfuser-xbox-windows-t.md)  