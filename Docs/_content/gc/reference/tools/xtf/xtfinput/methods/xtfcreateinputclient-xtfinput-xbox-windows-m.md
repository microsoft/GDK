---
author: aablackm
title: XtfCreateInputClient
description: Initializes a new instance of the IXtfInputClient interface with the specified address.
ms.assetid: M:Windows.Xbox.xtfinput.XtfCreateInputClient(LPCWSTR,REFIID,void)
kindex: XtfCreateInputClient
ms.author: stevenpr
ms.topic: reference
edited: 11/02/2020
security: public
---

# XtfCreateInputClient  

Initializes a new instance of the [IXtfInputClient](../classes/IXtfInputClient/ixtfinputclient-xtfinput-xbox-windows-t.md) interface with the specified address.  

<a id="syntaxSection"></a>

## Syntax  

```cpp
HRESULT XtfCreateInputClient(
         LPCWSTR pszAddress,
         REFIID riid,
         void **ppvObject
)  
```  

<a id="ID4EK"></a>
<a id="parametersSection"></a>

### Parameters  

*pszAddress*  
Type: LPCWSTR  

Pointer to the tools IP address of the development console to use for the new [IXtfInputClient](../classes/IXtfInputClient/ixtfinputclient-xtfinput-xbox-windows-t.md) instance.  

*riid*  
Type: REFIID  

Pointer that receives the instance identifier of the newly created [IXtfInputClient](../classes/IXtfInputClient/ixtfinputclient-xtfinput-xbox-windows-t.md) instance.  

*ppvObject*  
Type: void \*\*  

Pointer that receives a reference to the newly created [IXtfInputClient](../classes/IXtfInputClient/ixtfinputclient-xtfinput-xbox-windows-t.md) instance.  

<a id="ID4ER"></a>
<a id="retvalSection"></a>

### Return value  

Type: HRESULT  

The result of the operation.  

<a id="remarksSection"></a>

## Remarks  

Use the [IXtfInputClient](../classes/IXtfInputClient/ixtfinputclient-xtfinput-xbox-windows-t.md) instance created by this function to create create, disconnect, and send game reports to a virtual controller on a development console. You can automate unit tests, stress tests, long-haul tests, and user tests by programmatically simulating gamepad input.  

For more information, see [Simulating gamepad input (NDA topic)](../../../../../test-automation-publishing/test-automation-publishing-overviews/test-automation-publishing-debugging/xtf-gamepad-input-testing.md).  

<a id="requirements"></a>
<a id="requirementsSection"></a>

## Requirements  

**Header:** xtfinput.h  

**Library:** xtfinput.lib  

**Supported platforms:** Windows (for Xbox console tools)  

<a id="seealsoSection"></a>

## See also  

[IXtfInputClient](../classes/IXtfInputClient/ixtfinputclient-xtfinput-xbox-windows-t.md)  
[XtfInput](../xtfinput-xbox-microsoft-n.md)  
  