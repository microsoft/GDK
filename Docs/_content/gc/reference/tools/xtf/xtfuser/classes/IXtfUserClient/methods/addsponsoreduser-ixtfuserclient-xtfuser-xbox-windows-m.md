---
author: aablackm
title: AddSponsoredUser
description: Adds a guest user.
ms.assetid: M:Windows.Xbox.xtfuser.IXtfUserClient.AddSponsoredUser(UINT32)
kindex:
- AddSponsoredUser
- IXtfUserClient--AddSponsoredUser method
ms.author: stevenpr
ms.topic: reference
edited: 06/13/2019
security: public
---

# IXtfUserClient::AddSponsoredUser  

Adds a guest user.  

<a id="syntaxSection"></a>

## Syntax  

```cpp
public:
HRESULT AddSponsoredUser(
         UINT32 *pUserId
)  
```

<a id="parametersSection"></a>

### Parameters  

*pUserId*  
Type: UINT32 \*  

On successful completion, points to the user ID of the guest user.  

<a id="retvalSection"></a>

### Return value  

Type: HRESULT  

HRESULT success or error code.  

<a id="remarksSection"></a>

## Remarks  

Guest users, also known as *sponsored guests*, are associated with an account that is already signed in. When your code calls this method, the system uses the first signed-in user in the list as the sponsor and continues to use that user for all subsequent sponsored users. If the selected user signs out, all sponsored users are signed out at that time.  
> [!NOTE]
> Unlike the UI used to add a sponsored user, this method does not have access to the Xbox Live privacy setting and online safety settings when it makes the selection.  

To add a non-guest user, use [AddUser](adduser-ixtfuserclient-xtfuser-xbox-windows-m.md).  

For more information about guest users, see [Guest Users Overview](../../../../../../../system/overviews/user/users-guest-overview.md).  

<a id="requirementsSection"></a>

## Requirements  

**Header:** xtfuser.h  

**Library:** xtfuser.lib  

**Supported platforms:** Windows (for Xbox console tools)  

<a id="seealsoSection"></a>

## See also  

[IXtfUserClient interface](../ixtfuserclient-xtfuser-xbox-windows-t.md)  
  