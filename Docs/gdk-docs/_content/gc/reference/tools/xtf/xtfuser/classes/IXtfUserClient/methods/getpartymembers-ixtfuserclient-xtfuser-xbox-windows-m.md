---
author: aablackm
title: GetPartyMembers
description: Returns a list of the members of the party associated with the specified title.
ms.assetid: M:Windows.Xbox.xtfuser.IXtfUserClient.GetPartyMembers(UINT32,XTF_USER_XUID,UINT32,XTF_USER_XUID,UINT32)
kindex:
- GetPartyMembers
- IXtfUserClient--GetPartyMembers method
ms.author: stevenpr
ms.topic: reference
edited: 06/13/2019
security: public
---

# IXtfUserClient::GetPartyMembers  

Returns a list of the members of the party associated with the specified title.  

<a id="syntaxSection"></a>

## Syntax  

```cpp
public:
HRESULT GetPartyMembers(
         UINT32 titleId,
         XTF_USER_XUID **ppMembers,
         UINT32 *pCountMembers,
         XTF_USER_XUID **ppReservedMembers,
         UINT32 *pCountReservedMembers
)  
```

<a id="ID4EG"></a>
<a id="parametersSection"></a>

### Parameters  

*titleId*  
Type: UINT32  

A title ID.  

*ppMembers*  
Type: XTF_USER_XUID \*\*  

On successful return, points to an array of Xbox user IDs of the party members.  

*pCountMembers*  
Type: UINT32 \*  

On successful return, points to the count of elements in the *ppMembers* array.  

*ppReservedMembers*  
Type: XTF_USER_XUID \*\*  

On successful return, points to an array of Xbox user IDs of reserved party members.  

*pCountReservedMembers*  
Type: UINT32 \*  

On successful return, points to the count of elements in the *pCountReservedMembers* array.  

<a id="retvalSection"></a>

### Return value  

Type: HRESULT  

HRESULT success or error code.  

<a id="remarksSection"></a>

## Remarks  

Reserved party members are those who have been added to a party but who have not yet accepted the invitation.  

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
  