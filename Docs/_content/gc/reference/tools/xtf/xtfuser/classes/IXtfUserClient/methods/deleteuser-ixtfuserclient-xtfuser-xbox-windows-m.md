---
author: aablackm
title: DeleteUser
description: Removes a user, specified by email address, from the console.
ms.assetid: M:Windows.Xbox.xtfuser.IXtfUserClient.DeleteUser(LPCWSTR)
kindex:
- DeleteUser
- IXtfUserClient--DeleteUser method
ms.author: stevenpr
ms.topic: reference
edited: 06/13/2019
security: public
---

# IXtfUserClient::DeleteUser  

Removes a user, specified by email address, from the console.  

<a id="syntaxSection"></a>

## Syntax  

```cpp
public:
HRESULT DeleteUser(
         LPCWSTR userName
)  
```

<a id="parametersSection"></a>

### Parameters  

*userName*  
Type: LPCWSTR  

The email address used to add the user to the console.  

<a id="retvalSection"></a>

### Return value  

Type: HRESULT  

HRESULT success or error code.  

<a id="remarksSection"></a>

## Remarks  

If a user is signed in to the console, the user is signed out before being removed.  

To delete a user by specifying a user ID, use [DeleteUserId](deleteuserid-ixtfuserclient-xtfuser-xbox-windows-m.md).  

To delete all users, use [DeleteAllUsers](deleteallusers-ixtfuserclient-xtfuser-xbox-windows-m.md).  

To add a user, use [AddUser](adduser-ixtfuserclient-xtfuser-xbox-windows-m.md).  

<a id="requirementsSection"></a>

## Requirements  

**Header:** xtfuser.h  

**Library:** xtfuser.lib  

**Supported platforms:** Windows (for Xbox console tools)  

<a id="seealsoSection"></a>

## See also  

[IXtfUserClient interface](../ixtfuserclient-xtfuser-xbox-windows-t.md)  
  