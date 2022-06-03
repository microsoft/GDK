---
author: M-Stahl
title: XStoreAcquireLicenseForDurablesResult
description: Retrieves the result of a call to [XStoreAcquireLicenseForDurablesAsync](xstoreacquirelicensefordurablesasync.md).
kindex: XStoreAcquireLicenseForDurablesResult
ms.author: shanede
ms.topic: reference
edited: 07/12/2021
security: public
applies-to: pc-gdk
---

# XStoreAcquireLicenseForDurablesResult

Retrieves the result of a call to [XStoreAcquireLicenseForDurablesAsync](xstoreacquirelicensefordurablesasync.md).

<a id="syntaxSection"></a>

## Syntax

```cpp
HRESULT XStoreAcquireLicenseForDurablesResult(
         XAsyncBlock* async,
         XStoreLicenseHandle* storeLicenseHandle
)
```

<a id="parametersSection"></a>

### Parameters

*async* &nbsp;&nbsp;\_Inout\_  
Type: XAsyncBlock*

The `XAsyncBlock` object passed to [XStoreAcquireLicenseForDurablesAsync](xstoreacquirelicensefordurablesasync.md).

*storeLicenseHandle* &nbsp;&nbsp;\_Out\_  
Type: XStoreLicenseHandle\*

On success, contains the handle to the store license.
Pass this into [XStoreIsLicenseValid](xstoreislicensevalid.md) to see of the license is valid.

<a id="retvalSection"></a>

### Return value

Type: HRESULT

Returns **S_OK** upon success, or an error code otherwise.

`XStoreAcquireLicenseForDurablesResult` can return the following error codes:

| Error code| Description |
| --- | --- |
| 0x87e10bc6 `LM_E_CONTENT_NOT_IN_CATALOG` | The product is not of the appropriate durable type. |
| 0x803f9006 `LM_E_ENTITLED_USER_SIGNED_OUT` | Owner of the product is not signed in. |

<a id="remarksSection"></a>

## Remarks

This function is safe to call on a time-sensitive thread.

The result of the call is contained in the [XAsyncBlock](../../xasync/structs/xasyncblock.md) structure.
You can use the [XAsyncBlock](../../xasync/structs/xasyncblock.md) object to poll for the function call status, and to retrieve the result.
To acquire a license for the specified durable, call [XStoreAcquireLicenseForDurablesAsync](xstoreacquirelicensefordurablesasync.md).

<a id="requirementsSection"></a>

## Requirements

**Header:** XStore.h

**Library:** xgameruntime.lib

**Supported Platforms**: Windows, Xbox One family consoles and Xbox Series consoles

<a id="seealsoSection"></a>

## See also

[XStore](../xstore_members.md)  
[XAsyncBlock](../../xasync/structs/xasyncblock.md)  
[XStoreAcquireLicenseForDurablesAsync](xstoreacquirelicensefordurablesasync.md)