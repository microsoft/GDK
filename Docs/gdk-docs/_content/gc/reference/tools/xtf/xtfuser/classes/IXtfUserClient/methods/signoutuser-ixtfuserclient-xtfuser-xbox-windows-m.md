---
author: aablackm
title: SignoutUser
description: Signs out a user, specified by email address.
ms.assetid: M:Windows.Xbox.xtfuser.IXtfUserClient.SignoutUser(LPCWSTR)
kindex:
- SignoutUser
- IXtfUserClient--SignoutUser method
ms.author: stevenpr
ms.topic: reference
edited: 06/10/2019
security: public
---

# IXtfUserClient::SignoutUser  

Signs out a user, specified by email address.  

<a id="syntaxSection"></a>

## Syntax  

```cpp
public:
HRESULT SignoutUser(
         LPCWSTR userName
)  
```

<a id="ID4EG"></a>
<a id="parametersSection"></a>

### Parameters  

*userName*  
Type: LPCWSTR  

The email address of the user.  

<a id="ID4EP"></a>
<a id="retvalSection"></a>

### Return value  

Type: HRESULT  

HRESULT success or error code.  

<a id="remarks"></a>
<a id="remarksSection"></a>

## Remarks  

The *userName* value is the `pszEmailAddress` member of the [XTF_USER_DATA](../../../structures/XTF_USER_DATA-xtfuser-xbox-windows-t.md) object that describes the user.  

To sign out a user by specifying a user ID, use [SignoutUserId](signoutuserid-ixtfuserclient-xtfuser-xbox-windows-m.md).  

To sign in a user, use [SigninUser](signinuser-ixtfuserclient-xtfuser-xbox-windows-m.md) or [SigninUserId](signinuserid-ixtfuserclient-xtfuser-xbox-windows-m.md).  

<a id="requirements"></a>
<a id="requirementsSection"></a>

## Requirements  

**Header:** xtfuser.h  

**Library:** xtfuser.lib  

**Supported platforms:** Windows (for Xbox console tools)  

<a id="seealsoSection"></a>

## See also  

[IXtfUserClient interface](../ixtfuserclient-xtfuser-xbox-windows-t.md)  
  