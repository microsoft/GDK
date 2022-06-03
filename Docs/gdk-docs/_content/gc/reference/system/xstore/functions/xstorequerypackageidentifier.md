---
author: M-Stahl
title: XStoreQueryPackageIdentifier
description: Retrieves the package identifier for the specified store ID.
kindex: XStoreQueryPackageIdentifier
ms.author: shanede
ms.topic: reference
edited: '08/10/2021'
security: public
applies-to: pc-gdk
---

# XStoreQueryPackageIdentifier

Retrieves the package identifier for the specified store ID.

<a id="syntaxSection"></a>

## Syntax

```cpp
HRESULT XStoreQueryPackageIdentifier(
         const char* storeId,
         size_t size,
         char* packageIdentifier
)
```

<a id="parametersSection"></a>

### Parameters

*storeId* &nbsp;&nbsp;\_In\_z\_  
Type: char\*

The ID in the store of the product that contains the package.

*size* &nbsp;&nbsp;\_In\_  
Type: size_t

The number of characters in the package identifier. This size must be at least XPACKAGE_IDENTIFIER_MAX_LENGTH (33) 
in size.

*packageIdentifier* &nbsp;&nbsp;\_Out\_writes\_z\_(size)  
Type: char\*

Upon success, contains the package identifier. For more information about package identifiers, see [Manage and license downloadable content (DLC)](../../../../commerce/fundamentals/xstore-manage-and-license-optional-packages.md). 

<a id="retvalSection"></a>

### Return value

Type: HRESULT

Returns **S_OK** upon success, or an error code otherwise.

| Error code| Description |
| --- | --- |
| 0x80070057 `E_INVALIDARG` | There is no installed package corresponding to the Store ID |
 
<a id="remarksSection"></a>

## Remarks

To download and install the specified store packages, call [XStoreDownloadAndInstallPackagesAsync](xstoredownloadandinstallpackagesasync.md).

To get the result of a call to `XStoreDownloadAndInstallPackagesAsync`, call [XStoreDownloadAndInstallPackagesResult](xstoredownloadandinstallpackagesresult.md).

To get the number of items in the result that is returned by `XStoreDownloadAndInstallPackagesResult`, call [XStoreDownloadAndInstallPackagesResultCount](xstoredownloadandinstallpackagesresultcount.md).

<a id="requirementsSection"></a>

## Requirements

**Header:** XStore.h

**Library:** xgameruntime.lib

**Supported platforms:** Windows, Xbox One family consoles and Xbox Series consoles

<a id="seealsoSection"></a>

## See also

[XStore](../xstore_members.md)  