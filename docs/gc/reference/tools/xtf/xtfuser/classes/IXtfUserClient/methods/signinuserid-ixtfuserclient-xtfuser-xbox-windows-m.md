---
author: aablackm
title: SigninUserId
description: Signs in a user, specified by user ID, and adds the user to the console if necessary.
ms.assetid: M:Windows.Xbox.xtfuser.IXtfUserClient.SigninUserId(UINT32,LPCWSTR,BOOL)
kindex:
- SigninUserId
- IXtfUserClient--SigninUserId method
ms.author: stevenpr
ms.topic: reference
edited: 06/10/2019
security: public
---

# IXtfUserClient::SigninUserId  

Signs in a user, specified by user ID, and adds the user to the console if necessary.  
> [!IMPORTANT]
> In this release, the password text is not encrypted when it is passed over the network to the console by this method. If this behavior is a concern in your network environment, use the [AddUser](adduser-ixtfuserclient-xtfuser-xbox-windows-m.md) method to add the user to the console and then use the Sign-In app on the console to sign in the user and store the user password. (The Sign-In app sends the password over the network encrypted.) You can subsequently use this method to sign in without passing a password.  

<a id="syntaxSection"></a>

## Syntax  

```cpp
public:
HRESULT SigninUserId(
         UINT32 userId,
         LPCWSTR password,
         BOOL bStorePassword
)  
```

<a id="ID4E1"></a>
<a id="parametersSection"></a>

### Parameters  

*userId*  
Type: UINT32  

The user ID of the user.  

*password*  
Type: LPCWSTR  

The password to be used for signing in. If a password has been stored on the console for this user, pass `nullptr` to sign in with the stored password.  

*bStorePassword*  
Type: BOOL  

If TRUE, saves the specified password on the console for later use.

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

To sign in a user by specifying an email address, use [SigninUser](signinuser-ixtfuserclient-xtfuser-xbox-windows-m.md).  

To sign out a user, use [SignoutUserId](signoutuserid-ixtfuserclient-xtfuser-xbox-windows-m.md) or [SignoutUser](signoutuser-ixtfuserclient-xtfuser-xbox-windows-m.md).  

<a id="requirementsSection"></a>

## Requirements  

**Header:** xtfuser.h  

**Library:** xtfuser.lib  

**Supported platforms:** Windows (for Xbox console tools)  

<a id="seealsoSection"></a>

## See also  

[IXtfUserClient interface](../ixtfuserclient-xtfuser-xbox-windows-t.md)  
  