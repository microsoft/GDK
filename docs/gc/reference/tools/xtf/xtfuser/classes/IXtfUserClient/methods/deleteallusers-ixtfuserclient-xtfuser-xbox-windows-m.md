---
author: aablackm
title: DeleteAllUsers
description: Removes all users from this console.
ms.assetid: M:Windows.Xbox.xtfuser.IXtfUserClient.DeleteAllUsers
kindex:
- DeleteAllUsers
- IXtfUserClient--DeleteAllUsers method
ms.author: stevenpr
ms.topic: reference
edited: 06/13/2019
security: public
---

# IXtfUserClient::DeleteAllUsers  

Removes all users from this console.  

<a id="syntaxSection"></a>

## Syntax  

```cpp
public:
HRESULT DeleteAllUsers()  
```

<a id="parametersSection"></a>

### Parameters  

This method has no parameters.  

<a id="retvalSection"></a>

### Return value  

Type: HRESULT  

HRESULT success or error code.  

<a id="remarksSection"></a>

## Remarks  

If a user is signed in to the console, the user is signed out before being removed.  

To delete a single user, use either [DeleteUser](deleteuser-ixtfuserclient-xtfuser-xbox-windows-m.md) or [DeleteUserId](deleteuserid-ixtfuserclient-xtfuser-xbox-windows-m.md).  

To add a user, use [AddUser](adduser-ixtfuserclient-xtfuser-xbox-windows-m.md).  

<a id="requirementsSection"></a>

## Requirements  

**Header:** xtfuser.h  

**Library:** xtfuser.lib  

**Supported platforms:** Windows (for Xbox console tools)  

<a id="seealsoSection"></a>

## See also  

[IXtfUserClient interface](../ixtfuserclient-xtfuser-xbox-windows-t.md)  
  