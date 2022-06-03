---
author: aablackm
title: PairControllerWithUser
description: Pairs the user with given email address, to the controller with given controller ID.
ms.assetid: M:Windows.Xbox.xtfuser.IXtfUserClient.PairControllerWithUser(LPCWSTR,UINT64)
kindex:
- PairControllerWithUser method
- IXtfUserClient--PairControllerWithUser method
ms.author: stevenpr
ms.topic: reference
edited: 06/13/2019
quality: good
security: public
---

# IXtfUserClient::PairControllerWithUser Method
Pairs the user identified by the specified email address to the controller with the specified controller ID.

## Syntax  

```cpp
public:
HRESULT PairControllerWithUser(
         LPCWSTR userName,
         UINT64 controllerId
)  
```

### Parameters  

*userName*  
Type: LPCWSTR 

The email address of the user to pair with the controller. 


*controllerId*  
Type: UINT64 

The controller ID of the controller. 

### Return value

Type: HRESULT 

HRESULT success or error code.

## Remarks  

To get the email address of the user, call [ListUsers](listusers-ixtfuserclient-xtfuser-xbox-windows-m.md). In the returned [XTF_USER_DATA](../../../structures/XTF_USER_DATA-xtfuser-xbox-windows-t.md) structure, examine the *pszEmailAddress* member.

Pairing a controller by using **PairControllerWithUser** is additive. If a user is already paired with the controller, the user specified by *userName* is also paired with the controller. To create an exclusive pairing, call [PairControllerWithUserIdExclusive]() or [PairControllerWithUserExclusive]().

## Requirements  

**Header:** xtfuser.h  

**Library:** xtfuser.lib  
  
**Supported platforms:** Windows (for Xbox console tools)  
  
## See also

[PairControllerWithUserId](paircontrollerwithuserid-ixtfuserclient-xtfuser-xbox-windows-m.md)  