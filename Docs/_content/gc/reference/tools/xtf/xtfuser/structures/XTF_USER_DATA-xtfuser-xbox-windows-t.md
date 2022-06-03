---
author: aablackm
title: XTF_USER_DATA
description: Describes a simulated user.
ms.assetid: T:Windows.Xbox.xtfuser.XTF_USER_DATA
kindex: XTF_USER_DATA
ms.author: stevenpr
ms.topic: reference
edited: 06/05/2019
security: public
---

# XTF_USER_DATA  

Describes a simulated user.  

<a id="syntaxSection"></a>

## Syntax  

```cpp
typedef struct XTF_USER_DATA {
    UINT32 userId;
    WCHAR szEmailAddress[256];
    WCHAR szGamertag[32];
    BOOL bSignedIn;
    XTF_USER_XUID xuid;
    BOOL bAutoSignIn;
} XTF_USER_DATA, *PXTF_USER_DATA;  
```

<a id="ID4EG"></a>
<a id="membersSection"></a>

### Members  

**userId**  
Type: UINT32  

A unique identifier for the user  

**szEmailAddress**  
Type: WCHAR  

The email address used to sign in the user.  

**szGamertag**  
Type: WCHAR  

The gamertag of the user.  

**bSignedIn**  
Type: BOOL  

If true, the user is signed in.  

**xuid**  
Type: XTF_USER_XUID  

The Xbox user ID of the user.  

**bAutoSignIn**  
Type: BOOL  

If true, the user is set to automatically sign in.  

<a id="remarksSection"></a>

## Remarks  

This structure is used in the [IXtfUserClient::ListUsers](../classes/IXtfUserClient/methods/listusers-ixtfuserclient-xtfuser-xbox-windows-m.md) method.  

The members of this structure provide values that you can use when calling other [IXtfUserClient](../classes/IXtfUserClient/ixtfuserclient-xtfuser-xbox-windows-t.md) methods.  

To create an object that implements the `IXtfUserClient` interface, call [XtfCreateUserClient](../methods/xtfcreateuserclient-xtfuser-xbox-windows-m.md).  

<a id="requirements"></a>
<a id="requirementsSection"></a>

## Requirements  

**Header:** xtfuser.h  

**Library:** xtfuser.lib  

**Supported platforms:** Windows (for Xbox console tools)  

<a id="seealsoSection"></a>

## See also  

[XtfUser](../xtfuser-xbox-windows-n.md)  
  