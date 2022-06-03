---
author: M-Stahl
title: XPersistentLocalStoragePromptUserForSpaceAsync
description: Allows titles to prompt users to free up a requested total number of Bytes of Growable Persistent Local Storage.
kindex: XPersistentLocalStoragePromptUserForSpaceAsync
ms.author: brianhud
ms.topic: reference
security: public
edited: 00/00/0000
applies-to: pc-gdk
---

# XPersistentLocalStoragePromptUserForSpaceAsync  

Allows titles to prompt users to free up a requested total number of Bytes of Growable Persistent Local Storage.    

## Syntax  
  
```cpp
HRESULT XPersistentLocalStoragePromptUserForSpaceAsync(  
         uint64_t requestedBytes,  
         XAsyncBlock* asyncBlock  
)  
```  
  
### Parameters  
  
*requestedBytes* &nbsp;&nbsp;\_In\_  
Type: uint64_t  
  
The total amount of space the title wishes to be made available for use.    
  
*asyncBlock* &nbsp;&nbsp;\_Inout\_  
Type: XAsyncBlock*

An XAsyncBlock for monitoring the status of the asynchronous call.
  
  
### Return value
Type: [HRESULT](/openspecs/windows_protocols/ms-erref/0642cb2f-2075-4469-918c-4441e69c548a)  
  
Returns **S_OK** if succesful; otherwise, returns an error code. For a list of error codes, see [Error Codes](../../../errorcodes.md).
    
  
## Remarks  
  
Prior to calling, titles should check free space availability by using [XPersistentLocalStorageGetSpaceInfo](xpersistentlocalstoragegetspaceinfo.md). 

The result of the request should be checked within the callback function by calling [XPersistentLocalStoragePromptUserForSpaceResult](xpersistentlocalstoragepromptuserforspaceresult.md). This is not a guarantee that the user freed the requested number of bytes; only that the user took action. Your game should query free space again using [XPersistentLocalStorageGetSpaceInfo](xpersistentlocalstoragegetspaceinfo.md) when the user retries the operation that resulted in the space request. Result of the async operation is E_ABORT if the user chose not to free up space.

Persistent Local Storage is not implemented on PC platforms.  Although present, this method should not be used on PC.

This is disabled on datacenter streaming servers. It will always return E_ABORT when called on datacenter streaming servers.
  
## Requirements  
  
**Header:** XPersistentLocalStorage.h
  
**Library:** xgameruntime.lib
  
**Supported platforms:** Windows, Xbox One family consoles and Xbox Series consoles 

  
## See also  
[XPersistentLocalStorage](../xpersistentlocalstorage_members.md)  

  
  