---
author: aablackm
title: AcceptInviteToParty
description: Accepts a pending invitation to the specified party on behalf of the specified user.
ms.assetid: M:Windows.Xbox.xtfuser.IXtfUserClient.AcceptInviteToParty(XTF_USER_XUID,LPCWSTR)
kindex:
- AcceptInviteToParty
- IXtfUserClient--AcceptInviteToParty
ms.author: stevenpr
ms.topic: reference
edited: 06/10/2019
security: public
---

# IXtfUserClient::AcceptInviteToParty  

Accepts a pending invitation to the specified party on behalf of the specified user.  

<a id="syntaxSection"></a>

## Syntax  

```cpp
public:
HRESULT AcceptInviteToParty(
         XTF_USER_XUID actingUserXuid,
         LPCWSTR partyId
)  
```

<a id="parametersSection"></a>

### Parameters  

*actingUserXuid*  
Type: XTF_USER_XUID  

The Xbox user ID of the user accepting the invitation.  

*partyId*  
Type: LPCWSTR  

The party ID of the party to join.  

<a id="retvalSection"></a>

### Return value  

Type: HRESULT  

HRESULT success or error code.  

<a id="remarksSection"></a>

## Remarks  

To get the party ID of a party, use [GetPartyId](getpartyid-ixtfuserclient-xtfuser-xbox-windows-m.md).  

To invite users to a party, use [InviteToParty](invitetoparty-ixtfuserclient-xtfuser-xbox-windows-m.md).  

To decline a pending invitation, use [DeclineInviteToParty](declineinvitetoparty-ixtfuserclient-xtfuser-xbox-windows-m.md).  

<a id="requirementsSection"></a>

## Requirements  

**Header:** xtfuser.h  

**Library:** xtfuser.lib  

**Supported platforms:** Windows (for Xbox console tools)  

<a id="seealsoSection"></a>

## See also  

[IXtfUserClient interface](../ixtfuserclient-xtfuser-xbox-windows-t.md)  
  