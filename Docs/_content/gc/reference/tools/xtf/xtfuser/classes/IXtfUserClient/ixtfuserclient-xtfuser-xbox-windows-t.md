---
author: aablackm
title: IXtfUserClient Interface (Interface contents)
description: Represents an Xbox Tools Framework (XTF) user client.
ms.assetid: T:Windows.Xbox.xtfuser.IXtfUserClient
kindex: IXtfUserClient interface, about
ms.author: stevenpr
ms.topic: navigation
edited: 00/00/0000
security: public
---

# IXtfUserClient Interface
Represents an Xbox Tools Framework (XTF) user client.
<a id="syntaxSection"></a>



## Syntax  

```cpp
interface IXtfUserClient : public IUnknown  
```

  
## Methods  
  
| Method | Description |  
| --- | --- |  
| [AcceptInviteToParty](methods/acceptinvitetoparty-ixtfuserclient-xtfuser-xbox-windows-m.md) | Accepts a pending invitation to the specified party on behalf of the specified user. |  
| [AddLocalUsersToParty](methods/addlocaluserstoparty-ixtfuserclient-xtfuser-xbox-windows-m.md) | Creates a party for the specified title ID and adds the specified users to the party. |  
| [AddSponsoredUser](methods/addsponsoreduser-ixtfuserclient-xtfuser-xbox-windows-m.md) | Adds a guest user. |  
| [AddUser](methods/adduser-ixtfuserclient-xtfuser-xbox-windows-m.md) | Adds a user without signing them in. |  
| [DeclineInviteToParty](methods/declineinvitetoparty-ixtfuserclient-xtfuser-xbox-windows-m.md) | Declines a pending invitation to the specified party on behalf of the specified user. |  
| [DeleteAllUsers](methods/deleteallusers-ixtfuserclient-xtfuser-xbox-windows-m.md) | Removes all users from this console. |  
| [DeleteUser](methods/deleteuser-ixtfuserclient-xtfuser-xbox-windows-m.md) | Removes a user, specified by email address, from the console. |  
| [DeleteUserId](methods/deleteuserid-ixtfuserclient-xtfuser-xbox-windows-m.md) | Removes a user, specified by user ID, from the console. |  
| [GetPartyId](methods/getpartyid-ixtfuserclient-xtfuser-xbox-windows-m.md) | Returns the party ID of an existing party for the specified title. |  
| [GetPartyMembers](methods/getpartymembers-ixtfuserclient-xtfuser-xbox-windows-m.md) | Returns a list of the members of the party associated with the specified title. |  
| [InviteToParty](methods/invitetoparty-ixtfuserclient-xtfuser-xbox-windows-m.md) | Invites users to the party for the specified title ID. |  
| [ListUsers](methods/listusers-ixtfuserclient-xtfuser-xbox-windows-m.md) | Returns a list of all users currently associated with this console. |  
| [PairControllerWithUser](methods/paircontrollerwithuser-ixtfuserclient-xtfuser-xbox-windows-m.md) | Pairs the user with given email address, to the controller with given controller ID. |  
| [PairControllerWithUserId](methods/paircontrollerwithuserid-ixtfuserclient-xtfuser-xbox-windows-m.md) | Pairs the user with given user ID, to the controller with given controller ID. |  
| [RemoveLocalUsersFromParty](methods/removelocalusersfromparty-ixtfuserclient-xtfuser-xbox-windows-m.md) | Removes the specified users from a party. |  
| [SigninUser](methods/signinuser-ixtfuserclient-xtfuser-xbox-windows-m.md) | Signs in a user, specified by email address, and adds the user to the console if necessary. |  
| [SigninUserId](methods/signinuserid-ixtfuserclient-xtfuser-xbox-windows-m.md) | Signs in a user, specified by user ID, and adds the user to the console if necessary. |  
| [SignoutUser](methods/signoutuser-ixtfuserclient-xtfuser-xbox-windows-m.md) | Signs out a user, specified by email address. |  
| [SignoutUserId](methods/signoutuserid-ixtfuserclient-xtfuser-xbox-windows-m.md) | Signs out a user, specified by user ID. |  


<a id="requirements"></a>



## Requirements  

**Header:** xtfuser.h  

**Library:** xtfuser.lib  
  
**Supported platforms:** Windows (for Xbox console tools)  
  
<a id="ID4EZ"></a>



## See also  

<a id="ID4E2"></a>



##### Reference  

[XtfUser](../../xtfuser-xbox-windows-n.md)