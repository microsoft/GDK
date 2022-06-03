---
author: aablackm
title: GetPartyId
description: Returns the party ID of an existing party for the specified title.
ms.assetid: M:Windows.Xbox.xtfuser.IXtfUserClient.GetPartyId(UINT32,LPBSTR)
kindex:
- GetPartyId
- IXtfUserClient--GetPartyId method
ms.author: stevenpr
ms.topic: reference
edited: 06/10/2019
security: public
---

# IXtfUserClient::GetPartyId  

Returns the party ID of an existing party for the specified title.  

<a id="syntaxSection"></a>

## Syntax  

```cpp
public:
HRESULT GetPartyId(
         UINT32 titleId,
         LPBSTR pbstrPartyId
)  
```

<a id="parametersSection"></a>

### Parameters  

*titleId*  
Type: UINT32  

A title ID.  

*pbstrPartyId*  
Type: LPBSTR  

On successful return, points to the party ID for the party. If the specified title has no party, returns `NULL`.

<a id="retvalSection"></a>

### Return value  

Type: HRESULT  

HRESULT success or error code.  

<a id="remarksSection"></a>

## Remarks  

To create a party and add users to the party, use [AddLocalUsersToParty](addlocaluserstoparty-ixtfuserclient-xtfuser-xbox-windows-m.md).  

To get the current members of an existing party, use [GetPartyMembers](getpartymembers-ixtfuserclient-xtfuser-xbox-windows-m.md).  

To invite users to a party, use [InviteToParty](invitetoparty-ixtfuserclient-xtfuser-xbox-windows-m.md).  

<a id="requirementsSection"></a>

## Requirements  

**Header:** xtfuser.h  

**Library:** xtfuser.lib  

**Supported platforms:** Windows (for Xbox console tools)  

<a id="output"></a>

## Handling LPBSTR pointers

For more information on how to handle LPBSTR pointers returned by this API, see [Allocating and Releasing Memory for a BSTR](/cpp/atl-mfc-shared/allocating-and-releasing-memory-for-a-bstr?view=msvc-160).  

<a id="seealsoSection"></a>

## See also  

[IXtfUserClient interface](../ixtfuserclient-xtfuser-xbox-windows-t.md)  
  