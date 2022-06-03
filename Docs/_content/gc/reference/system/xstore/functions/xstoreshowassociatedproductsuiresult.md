---
author: M-Stahl
title: XStoreShowAssociatedProductsUIResult
description: Gets the result of a call to [XStoreShowAssociatedProductsUIAsync](xstoreshowassociatedproductsuiasync.md).
kindex: XStoreShowAssociatedProductsUIResult
ms.author: shanede
ms.topic: reference
security: public
edited: 01/21/2021
applies-to: pc-gdk
---

# XStoreShowAssociatedProductsUIResult

Gets the result of a call to [XStoreShowAssociatedProductsUIAsync](xstoreshowassociatedproductsuiasync.md).

<a id="syntaxSection"></a>

## Syntax

```cpp
HRESULT XStoreShowAssociatedProductsUIResult(
         XAsyncBlock* async
)
```

<a id="parametersSection"></a>

### Parameters

*async* &nbsp;&nbsp;\_Inout\_  
Type: XAsyncBlock\*

An [XAsyncBlock](../../xasync/structs/xasyncblock.md) object that when the call completes, contains the products UI result.

<a id="retvalSection"></a>

### Return value

Type: HRESULT

Returns **S_OK** upon success, or an error code otherwise.

<a id="remarksSection"></a>

## Remarks

You can use the [XAsyncBlock](../../xasync/structs/xasyncblock.md) structure to poll for the function call status, and to retrieve the result.

To see the set of available add&ndash;ons associated with your title, call [XStoreShowAssociatedProductsUIAsync](xstoreshowassociatedproductsuiasync.md).

To get the result of a call to `XStoreDownloadAndInstallPackagesAsync`, call [XStoreDownloadAndInstallPackagesResult](xstoredownloadandinstallpackagesresult.md).

<a id="requirementsSection"></a>

## Requirements

**Header:** XStore.h

**Supported Platforms**: Windows, Xbox One family consoles and Xbox Series consoles

<a id="seealsoSection"></a>

## See also

[XStore](../xstore_members.md)  
[XAsyncBlock](../../xasync/structs/xasyncblock.md)  
[XStoreShowProductPageUIResult](xstoreshowproductpageuiresult.md)  