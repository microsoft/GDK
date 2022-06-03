---
author: aablackm
title: DeleteUserId
description: Removes a user, specified by user ID, from the console.
ms.assetid: M:Windows.Xbox.xtfuser.IXtfUserClient.DeleteUserId(UINT32)
kindex:
- DeleteUserId
- IXtfUserClient--DeleteUserId method
ms.author: stevenpr
ms.topic: reference
edited: 06/13/2019
security: public
---

# IXtfUserClient::DeleteUserId  

Removes a user, specified by user ID, from the console.  

<a id="syntaxSection"></a>

## Syntax  

```cpp
public:
HRESULT DeleteUserId(
         UINT32 userId
)  
```

<a id="parametersSection"></a>

### Parameters  

*userId*  
Type: UINT32  

The user ID of the user to remove.  

<a id="retvalSection"></a>

### Return value  

Type: HRESULT  

HRESULT success or error code.  

<a id="remarksSection"></a>

## Remarks  

If a user is signed in to the console, the user is signed out before being removed.  

To delete a user by specifying an email address, use [DeleteUser](deleteuser-ixtfuserclient-xtfuser-xbox-windows-m.md).  

To delete all users, use [DeleteAllUsers](deleteallusers-ixtfuserclient-xtfuser-xbox-windows-m.md).  

To add a user, use [AddUser](adduser-ixtfuserclient-xtfuser-xbox-windows-m.md).  

<a id="requirementsSection"></a>

## Requirements  

**Header:** xtfuser.h  

**Library:** xtfuser.lib  

**Supported platforms:** Windows (for Xbox console tools)  

## See also  

[IXtfUserClient interface](../ixtfuserclient-xtfuser-xbox-windows-t.md)  
  