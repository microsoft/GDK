---
author: aablackm
title: RemoveLocalUsersFromParty
description: Removes the specified users from a party.
ms.assetid: M:Windows.Xbox.xtfuser.IXtfUserClient.RemoveLocalUsersFromParty(UINT32,XTF_USER_XUID,UINT32)
kindex:
- RemoveLocalUsersFromParty
- IXtfUserClient--RemoveLocalUsersFromParty method
ms.author: stevenpr
ms.topic: reference
edited: 06/10/2019
security: public
---

# IXtfUserClient::RemoveLocalUsersFromParty  

Removes the specified users from a party.  

<a id="syntaxSection"></a>

## Syntax  

```cpp
public:
HRESULT RemoveLocalUsersFromParty(
         UINT32 titleId,
         XTF_USER_XUID *localUserXuids,
         UINT32 countLocalUserXuids
)  
```

<a id="parametersSection"></a>

### Parameters  

*titleId*  
Type: UINT32  

The title ID associated with the party.  

*localUserXuids*  
Type: XTF_USER_XUID \*  

An array of Xbox user IDs to be removed from the party.  

*countLocalUserXuids*  
Type: UINT32  

The count of elements in the *localUserXuids* array.  

<a id="retvalSection"></a>

### Return value  

Type: HRESULT  

HRESULT success or error code.  

<a id="remarksSection"></a>

## Remarks  

To get the current members of a party, use [GetPartyMembers](getpartymembers-ixtfuserclient-xtfuser-xbox-windows-m.md).  

To create a party and add users to the party, use [AddLocalUsersToParty](addlocaluserstoparty-ixtfuserclient-xtfuser-xbox-windows-m.md).  

To invite users to a party, use [InviteToParty](invitetoparty-ixtfuserclient-xtfuser-xbox-windows-m.md).  

<a id="requirementsSection"></a>

## Requirements  

**Header:** xtfuser.h  

**Library:** xtfuser.lib  

**Supported platforms:** Windows (for Xbox console tools)  

<a id="seealsoSection"></a>

## See also  

[IXtfUserClient interface](../ixtfuserclient-xtfuser-xbox-windows-t.md)  
  