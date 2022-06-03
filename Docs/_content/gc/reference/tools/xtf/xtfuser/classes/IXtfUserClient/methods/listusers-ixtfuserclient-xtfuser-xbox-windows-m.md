---
author: aablackm
title: ListUsers
description: Returns a list of all users currently associated with this console.
ms.assetid: M:Windows.Xbox.xtfuser.IXtfUserClient.ListUsers(XTF_USER_DATA,UINT32)
kindex:
- ListUsers
- IXtfUserClient--ListUsers method
ms.author: stevenpr
ms.topic: reference
edited: 06/10/2019
security: public
---

# IXtfUserClient::ListUsers  

Returns a list of all users currently associated with this console.  

<a id="syntaxSection"></a>

## Syntax  

```cpp
public:
HRESULT ListUsers(
         XTF_USER_DATA **ppUserData,
         UINT32 *pCount
)  
```

<a id="ID4EG"></a>
<a id="parametersSection"></a>

### Parameters  

*ppUserData*  
Type: XTF_USER_DATA \*\*  

On successful return, points to an array of [XTF_USER_DATA](../../../structures/XTF_USER_DATA-xtfuser-xbox-windows-t.md) objects describing users currently associated with the console.  

*pCount*  
Type: UINT32 \*  

On successful return, the count of elements in the *ppUserData* array.  

<a id="ID4EP"></a>
<a id="retvalSection"></a>

### Return value  

Type: HRESULT  

HRESULT success or error code.  

<a id="remarks"></a>
<a id="remarksSection"></a>

## Remarks  

Your calling code is responsible for freeing the memory associated with *ppUserData* by using `CoTaskMemFree`.  

If a user is a sponsored (guest) user, the value of `szEmailAddress` in the [XTF_USER_DATA](../../../structures/XTF_USER_DATA-xtfuser-xbox-windows-t.md) object is an empty string, and `szGamertag` is derived from the gamertag of the sponsoring user.  

If a user has never been signed in on this console, `szGamertag` is an empty string.  

To add a user to this console, use [AddUser](adduser-ixtfuserclient-xtfuser-xbox-windows-m.md). To add a guest user, use [AddSponsoredUser](addsponsoreduser-ixtfuserclient-xtfuser-xbox-windows-m.md).  

<a id="requirementsSection"></a>

## Requirements  

**Header:** xtfuser.h  

**Library:** xtfuser.lib  

**Supported platforms:** Windows (for Xbox console tools)  

<a id="seealsoSection"></a>

## See also  

[IXtfUserClient interface](../ixtfuserclient-xtfuser-xbox-windows-t.md)  
  