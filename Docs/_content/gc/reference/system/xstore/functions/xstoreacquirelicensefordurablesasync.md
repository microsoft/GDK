---
author: M-Stahl
title: XStoreAcquireLicenseForDurablesAsync
description: Acquires a license for the specified durable.
kindex: XStoreAcquireLicenseForDurablesAsync
ms.author: shanede
ms.topic: reference
edited: 07/12/2021
security: public
applies-to: pc-gdk
---

# XStoreAcquireLicenseForDurablesAsync

Acquires a license for a Durable without a package or Durable add-on product.  
> [!NOTE]
> This API will not work for the Durables with a package product type.
If you are attempting to call this API for a Durable with a package, [XStoreAcquireLicenseForDurablesResult](xstoreacquirelicensefordurablesresult.md) will return an error.
To get the license of a Durable with a package use [XStoreAcquireLicenseForPackageAsync](xstoreacquirelicenseforpackageasync.md).

<a id="syntaxSection"></a>

## Syntax

```cpp
HRESULT XStoreAcquireLicenseForDurablesAsync(
         const XStoreContextHandle storeContextHandle,
         const char* storeId,
         XAsyncBlock* async
)
```

<a id="parametersSection"></a>

### Parameters

*storeContextHandle* &nbsp;&nbsp;\_In\_  
Type: XStoreContextHandle

The store context handle for the user, returned by [XStoreCreateContext](xstorecreatecontext.md).

*storeId* &nbsp;&nbsp;\_In\_z\_  
Type: char\*

The store ID for the durable to acquire a license for.

*async* &nbsp;&nbsp;\_Inout\_  
Type: XAsyncBlock\*

An [XAsyncBlock](../../xasync/structs/xasyncblock.md) defining the asynchronous work being done. The [XAsyncBlock](../../xasync/structs/xasyncblock.md) can be used to poll for the call's status and retrieve call results. See [XAsyncBlock](../../xasync/structs/xasyncblock.md) for more information.

<a id="retvalSection"></a>

### Return value

Type: HRESULT

Returns **S_OK** upon success, or an error code otherwise.

<a id="remarksSection"></a>

## Remarks

This API is intended for the durables without packages add-on type. For durables with packages, use [XStoreAcquireLicenseForPackageAsync](xstoreacquirelicenseforpackageasync.md) instead.

This API attempts to acquire a license for the requested durable.
If it is the first time this device has acquired the license, a service call will be made, therefore requiring an online connection.
Subsequent calls for the same license may be faster due to caching, but this can be invalidated at any time.
Offline access to this license can only occur when the license was obtained once while online.
For PC, this requires the Offline Permissions to be set for the account that owns the license.

[XStoreRegisterPackageLicenseLost](xstoreregisterpackagelicenselost.md) can be used to monitor if the license obtained from this API is lost.

<a id="requirementsSection"></a>

## Requirements

**Header:** XStore.h

**Library:** xgameruntime.lib

**Supported Platforms**: Windows, Xbox One family consoles and Xbox Series consoles

<a id="seealsoSection"></a>

## See also

[XStore](../xstore_members.md)  
[XAsyncBlock](../../xasync/structs/xasyncblock.md)  
[XStoreAcquireLicenseForDurablesResult](xstoreacquirelicensefordurablesresult.md)
