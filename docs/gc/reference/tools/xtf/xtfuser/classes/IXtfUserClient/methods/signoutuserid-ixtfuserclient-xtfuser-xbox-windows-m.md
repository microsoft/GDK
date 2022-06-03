---
author: aablackm
title: SignoutUserId
description: Signs out a user, specified by user ID.
ms.assetid: M:Windows.Xbox.xtfuser.IXtfUserClient.SignoutUserId(UINT32)
kindex:
- SignoutUserId
- IXtfUserClient--SignoutUserId method
ms.author: stevenpr
ms.topic: reference
edited: 06/10/2019
security: public
---

# IXtfUserClient::SignoutUserId  

Signs out a user, specified by user ID.  

<a id="syntaxSection"></a>

## Syntax  

```cpp
public:
HRESULT SignoutUserId(
         UINT32 userId
)  
```

<a id="ID4EG"></a>
<a id="parametersSection"></a>

### Parameters  

*userId*  
Type: UINT32  

The user ID of the user.  

<a id="ID4EP"></a>
<a id="retvalSection"></a>

### Return value  

Type: HRESULT  

HRESULT success or error code.  

<a id="remarksSection"></a>

## Remarks  

The *userId* value is returned by the [SigninUser](signinuser-ixtfuserclient-xtfuser-xbox-windows-m.md) method.  

To sign out a user by specifying an email address, use [SignoutUser](signoutuser-ixtfuserclient-xtfuser-xbox-windows-m.md).  

To sign in a user, use [SigninUserId](signinuserid-ixtfuserclient-xtfuser-xbox-windows-m.md) or [SigninUser](signinuser-ixtfuserclient-xtfuser-xbox-windows-m.md).  

<a id="requirementsSection"></a>

## Requirements  

**Header:** xtfuser.h  

**Library:** xtfuser.lib  

**Supported platforms:** Windows (for Xbox console tools)  

<a id="seealsoSection"></a>

## See also  

[IXtfUserClient interface](../ixtfuserclient-xtfuser-xbox-windows-t.md)  
  