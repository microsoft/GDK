---
author: aablackm
title: SigninUser
description: Signs in a user, specified by email address, and adds the user to the console if necessary.
ms.assetid: M:Windows.Xbox.xtfuser.IXtfUserClient.SigninUser(LPCWSTR,LPCWSTR,BOOL,UINT32)
kindex:
- SigninUser
- IXtfUserClient--SigninUser method
ms.author: stevenpr
ms.topic: reference
edited: 06/13/2019
security: public
---

# IXtfUserClient::SigninUser  

Signs in a user, specified by email address, and adds the user to the console if necessary.  
> [!IMPORTANT]
> In this release, the password text is not encrypted when it is passed over the network to the console by this method. If this behavior is a concern in your network environment, use the [AddUser](adduser-ixtfuserclient-xtfuser-xbox-windows-m.md) method to add the user to the console and then use the Sign-In app on the console to sign in the user and store the user password. (The Sign-In app sends the password over the network encrypted.) You can subsequently use this method to sign in without passing a password.  

<a id="syntaxSection"></a>

## Syntax  

```cpp
public:
HRESULT SigninUser(
         LPCWSTR emailAddress,
         LPCWSTR password,
         BOOL bStorePassword,
         UINT32 *pUserId
)  
```

<a id="ID4E1"></a>
<a id="parametersSection"></a>

### Parameters  

*emailAddress*  
Type: LPCWSTR  

The email address of the user.  

*password*  
Type: LPCWSTR  

The password to be used for signing in. If a password has been stored on the console for this user, pass `nullptr` to sign in with the stored password.  

*bStorePassword*  
Type: BOOL  

If TRUE, saves the specified password on the console for later use.  

*pUserId*  
Type: UINT32 \*  

On successful sign in, points to the user ID of the user.  

<a id="ID4EDB"></a>
<a id="retvalSection"></a>

### Return value  

Type: HRESULT  

HRESULT success or error code.  

<a id="remarks"></a>
<a id="remarksSection"></a>

## Remarks  

If the user is already signed in, calling this method has no effect.  

This method can return the following error codes.  

| Error code | Meaning |  
| --- | --- |  
| 0x80048823 | The email address is not valid. |  
| 0x8004882E | The password for the specified user is not stored on the console. You must supply a password as part of the sign-in operation. |  
| 0x80048821 | The password specified for the user is invalid. |  
| 0x8015DC16 | The user is signed in on another console. |  

To sign in a user by specifying a user ID, use [SigninUserId](signinuserid-ixtfuserclient-xtfuser-xbox-windows-m.md).  

To sign out a user, use [SignoutUser](signoutuser-ixtfuserclient-xtfuser-xbox-windows-m.md) or [SignoutUserId](signoutuserid-ixtfuserclient-xtfuser-xbox-windows-m.md).  

<a id="requirementsSection"></a>

## Requirements  

**Header:** xtfuser.h  

**Library:** xtfuser.lib  

**Supported platforms:** Windows (for Xbox console tools)  

<a id="seealsoSection"></a>

## See also  

[IXtfUserClient interface](../ixtfuserclient-xtfuser-xbox-windows-t.md)  
  