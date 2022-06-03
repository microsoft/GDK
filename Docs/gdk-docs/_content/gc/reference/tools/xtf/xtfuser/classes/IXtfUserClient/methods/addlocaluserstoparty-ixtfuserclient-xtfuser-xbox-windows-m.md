---
author: aablackm
title: AddLocalUsersToParty
description: Creates a party for the specified title ID and adds the specified users to the party.
ms.assetid: M:Windows.Xbox.xtfuser.IXtfUserClient.AddLocalUsersToParty(UINT32,XTF_USER_XUID,XTF_USER_XUID,UINT32)
kindex:
- AddLocalUsersToParty
- IXtfUserClient--AddLocalUsersToParty method
ms.author: stevenpr
ms.topic: reference
edited: 06/13/2019
security: public
---

# IXtfUserClient::AddLocalUsersToParty  

Creates a party for the specified title ID and adds the specified users to the party.  

<a id="syntaxSection"></a>

## Syntax  

```cpp
public:
HRESULT AddLocalUsersToParty(
         UINT32 titleId,
         XTF_USER_XUID actingUserXuid,
         XTF_USER_XUID *localUserXuids,
         UINT32 countLocalUserXuids
)  
```

<a id="parametersSection"></a>

### Parameters  

*titleId*  
Type: UINT32  

The title ID of the title to create the party for.  

*actingUserXuid*  
Type: XTF_USER_XUID  

The Xbox user ID of the user creating the party.  

*localUserXuids*  
Type: XTF_USER_XUID \*  

A pointer to an array of Xbox user IDs of users to add to the party.  

*countLocalUserXuids*  
Type: UINT32  

The count of users to add.  

<a id="retvalSection"></a>

### Return value  

Type: HRESULT  

HRESULT success or error code.  

<a id="remarksSection"></a>

## Remarks  

If a party does not already exist for the specified title, this method creates one.  

To get the current members of an existing party, use [GetPartyMembers](getpartymembers-ixtfuserclient-xtfuser-xbox-windows-m.md).  

To remove users from a party, use [RemoveLocalUsersFromParty](removelocalusersfromparty-ixtfuserclient-xtfuser-xbox-windows-m.md).  

<a id="requirementsSection"></a>

## Requirements  

**Header:** xtfuser.h  

**Library:** xtfuser.lib  

**Supported platforms:** Windows (for Xbox console tools)  

<a id="seealsoSection"></a>

## See also  

[IXtfUserClient interface](../ixtfuserclient-xtfuser-xbox-windows-t.md)  
  