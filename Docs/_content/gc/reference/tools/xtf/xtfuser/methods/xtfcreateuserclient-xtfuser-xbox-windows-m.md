---
author: aablackm
title: XtfCreateUserClient
description: Initializes a new instance of the IXtfUserClient interface with the specified address.
ms.assetid: M:Windows.Xbox.xtfuser.XtfCreateUserClient(LPCWSTR,REFIID,void)
kindex: XtfCreateUserClient
ms.author: stevenpr
ms.topic: reference
edited: 11/02/2020
security: public
---

# XtfCreateUserClient  

Initializes a new instance of the [IXtfUserClient](../classes/IXtfUserClient/ixtfuserclient-xtfuser-xbox-windows-t.md) interface with the specified address.  

<a id="syntaxSection"></a>

## Syntax  

```cpp
HRESULT XtfCreateUserClient(
         LPCWSTR pszAddress,
         REFIID riid,
         void **ppvObject
)  
```

<a id="ID4EG"></a>
<a id="parametersSection"></a>

### Parameters  

*pszAddress*  
Type: LPCWSTR  

Pointer to the tools IP address of the development console to use for the new [IXtfUserClient](../classes/IXtfUserClient/ixtfuserclient-xtfuser-xbox-windows-t.md) instand.  

*riid*  
Type: REFIID  

Pointer that receives the instance identifier of the newly created [IXtfUserClient](../classes/IXtfUserClient/ixtfuserclient-xtfuser-xbox-windows-t.md) instance.  

*ppvObject*  
Type: void \*\*  

Pointer that receives a reference to the newly created [IXtfUserClient](../classes/IXtfUserClient/ixtfuserclient-xtfuser-xbox-windows-t.md) instance.  

<a id="ID4EN"></a>
<a id="retvalSection"></a>

### Return value  

Type: HRESULT  

The result of the operation.  

<a id="remarksSection"></a>

## Remarks  

This function creates and attaches a new instance of [IXtfUserClient](../classes/IXtfUserClient/ixtfuserclient-xtfuser-xbox-windows-t.md) to the development console specified in `pszAddress`. You can then use the new `IXtfUserClient` instance to add and delete users, sign in and sign out users, and pair a user and a controller. You can also work with parties.  

<a id="requirements"></a>
<a id="requirementsSection"></a>

## Requirements  

**Header:** xtfuser.h  

**Library:** xtfuser.lib  

**Supported platforms:** Windows (for Xbox console tools)  

<a id="seealsoSection"></a>

## See also  

[IXtfUserClient](../classes/IXtfUserClient/ixtfuserclient-xtfuser-xbox-windows-t.md)  
[XtfUser](../xtfuser-xbox-windows-n.md)  
  