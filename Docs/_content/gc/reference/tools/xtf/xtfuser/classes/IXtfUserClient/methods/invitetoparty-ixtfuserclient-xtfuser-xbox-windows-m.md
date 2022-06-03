---
author: aablackm
title: InviteToParty
description: Invites users to the party for the specified title ID.
ms.assetid: M:Windows.Xbox.xtfuser.IXtfUserClient.InviteToParty(UINT32,XTF_USER_XUID,XTF_USER_XUID,UINT32)
kindex:
- InviteToParty
- IXtfUserClient--InviteToParty method
ms.author: stevenpr
ms.topic: reference
edited: 06/10/2019
security: public
---

# IXtfUserClient::InviteToParty Method  

Invites users to the party for the specified title ID.  

<a id="syntaxSection"></a>

## Syntax  

```cpp
public:
HRESULT InviteToParty(
         UINT32 titleId,
         XTF_USER_XUID actingUserXuid,
         XTF_USER_XUID *pXuidsToInvite,
         UINT32 countXuidsToInvite
)  
```

<a id="parametersSection"></a>

### Parameters  

*titleId*  
Type: UINT32  

The title ID associated with the party.  

*actingUserXuid*  
Type: XTF_USER_XUID  

The Xbox user ID of the user issuing the invitation.  

*pXuidsToInvite*  
Type: XTF_USER_XUID \*  

An array of Xbox user IDs of users to invite.  

*countXuidsToInvite*  
Type: UINT32  

The count of users to invite.  

<a id="retvalSection"></a>

### Return value  

Type: HRESULT  

HRESULT success or error code.  

<a id="remarksSection"></a>

## Remarks

To get the party ID of a party, use [GetPartyId](getpartyid-ixtfuserclient-xtfuser-xbox-windows-m.md).  

To create a party and add users to the party, use [AddLocalUsersToParty](addlocaluserstoparty-ixtfuserclient-xtfuser-xbox-windows-m.md).  

To get the current members of a party, use [GetPartyMembers](getpartymembers-ixtfuserclient-xtfuser-xbox-windows-m.md).  

<a id="requirementsSection"></a>

## Requirements  

**Header:** xtfuser.h  

**Library:** xtfuser.lib  

**Supported platforms:** Windows (for Xbox console tools)  

<a id="seealsoSection"></a>

## See also  

[IXtfUserClient interface](../ixtfuserclient-xtfuser-xbox-windows-t.md)  
  