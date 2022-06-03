---
author: M-Stahl
title: XStoreShowProductPageUIResult
description: Gets the result of a call to [XStoreShowProductPageUIAsync](xstoreshowproductpageuiasync.md).
kindex: XStoreShowProductPageUIResult
ms.author: shanede
ms.topic: reference
security: public
edited: 01/21/2021
applies-to: pc-gdk
---

# XStoreShowProductPageUIResult

Gets the result of a call to [XStoreShowProductPageUIAsync](xstoreshowproductpageuiasync.md).

<a id="syntaxSection"></a>

## Syntax

```cpp
HRESULT XStoreShowProductPageUIResult(
         XAsyncBlock* async
)
```

<a id="parametersSection"></a>

### Parameters

*async* &nbsp;&nbsp;\_Inout\_  
Type: XAsyncBlock\*

An [XAsyncBlock](../../xasync/structs/xasyncblock.md) object that when the call completes, contains the product page UI result.

<a id="retvalSection"></a>

### Return value

Type: HRESULT

Returns **S_OK** upon success, or an error code otherwise.

<a id="remarksSection"></a>

## Remarks

You can use the [XAsyncBlock](../../xasync/structs/xasyncblock.md) object to poll for the function call status, and to retrieve the result.

To get the result of a call to `XStoreDownloadAndInstallPackagesAsync`, call [XStoreDownloadAndInstallPackagesResult](xstoredownloadandinstallpackagesresult.md).

To get the number of items in the result that is returned by `XStoreDownloadAndInstallPackagesResult`, call [XStoreDownloadAndInstallPackagesResultCount](xstoredownloadandinstallpackagesresultcount.md).

<a id="requirementsSection"></a>

## Requirements

**Header:** XStore.h

**Supported Platforms**: Windows, Xbox One family consoles and Xbox Series consoles

<a id="seealsoSection"></a>

## See also

[XStore](../xstore_members.md)  
[XAsyncBlock](../../xasync/structs/xasyncblock.md)  
[XStoreShowAssociatedProductsUIResult](xstoreshowassociatedproductsuiresult.md)  