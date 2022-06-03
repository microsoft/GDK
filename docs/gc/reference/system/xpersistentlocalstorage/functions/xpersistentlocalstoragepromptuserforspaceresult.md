---
author: M-Stahl
title: XPersistentLocalStoragePromptUserForSpaceResult
description: Returns the result of a call to the function [XPersistentLocalStoragePromptUserForSpaceAsync](xpersistentlocalstoragepromptuserforspaceasync.md).
kindex: XPersistentLocalStoragePromptUserForSpaceResult
ms.author: brianhud
ms.topic: reference
security: public
edited: 02/02/2021
applies-to: pc-gdk
---

# XPersistentLocalStoragePromptUserForSpaceResult

Returns the result of a call to the function [XPersistentLocalStoragePromptUserForSpaceAsync](xpersistentlocalstoragepromptuserforspaceasync.md).

<a id="syntaxSection"></a>

## Syntax

```cpp
HRESULT XPersistentLocalStoragePromptUserForSpaceResult(
         XAsyncBlock* asyncBlock
)
```

<a id="parametersSection"></a>

### Parameters

*asyncBlock* &nbsp;&nbsp;\_Inout\_  
Type: XAsyncBlock\d*

A pointer to an `XAsyncBlock` object, which you can use to monitor the status of the asynchronous call.

<a id="retvalSection"></a>

### Return value

Type: HRESULT

Returns **S_OK** if the user attempted to free up the requested space; otherwise, returns an error code. For a list of error codes, see [Error Codes](../../../errorcodes.md).  Returns **E_ABORT** if the user chooses not to attempt to free up space.

<a id="remarksSection"></a>

## Remarks

The result of the async operation is success if the user chose to free up space. There is no guarantee that the user freed the requested number of bytes, only that they took action.

Your game should query free space again using [XPersistentLocalStorageGetSpaceInfo](xpersistentlocalstoragegetspaceinfo.md) when the user retries the operation that resulted in the space request.

The async operation results in `E_ABORT` if the user chooses not to free up space.

Since Persistent Local Storage is not implemented on the PC platform, don't use this function on that platform.

<a id="requirementsSection"></a>

## Requirements

**Header:** XPersistentLocalStorage.h

**Library:** xgameruntime.lib

**Supported platforms:** Windows, Xbox One family consoles and Xbox Series consoles

<a id="seealsoSection"></a>

## See also

[XPersistentLocalStorage](../xpersistentlocalstorage_members.md)  
[XPersistentLocalStorageGetSpaceInfo](xpersistentlocalstoragegetspaceinfo.md)  