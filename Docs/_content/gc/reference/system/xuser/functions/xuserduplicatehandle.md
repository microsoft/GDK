---
author: M-Stahl
title: XUserDuplicateHandle
description: Duplicates a user handle.
kindex: XUserDuplicateHandle
ms.author: v-sahain
ms.topic: reference
edited: 00/00/0000
quality: good
security: public
applies-to: pc-gdk
---

# XUserDuplicateHandle  

Duplicates a user handle.

## Syntax  
  
```cpp
HRESULT XUserDuplicateHandle(  
         XUserHandle handle,  
         XUserHandle* duplicatedHandle  
)  
```  
  
### Parameters  
  
*handle* &nbsp;&nbsp;\_In\_  
Type: XUserHandle  
  
The user handle to duplicate.
  
*duplicatedHandle* &nbsp;&nbsp;\_Out\_  
Type: XUserHandle*  
  
Contains the duplicate user handle.
  
### Return value

Type: HRESULT
  
HRESULT success or error code.  
For a list of error codes, see [Error Codes](../../../errorcodes.md).  
  
## Remarks

An **XUserHandle** represents an XBox game user.
To see if two different XUserHandles point to the same user, call the [XUserCompare](xusercompare.md) function.

To close a user handle, call [XUserCloseHandle](xuserclosehandle.md).

## Requirements  
  
**Header:** XUser.h
  
**Library:** xgameruntime.lib
  
**Supported platforms:** Windows, Xbox One family consoles and Xbox Series consoles  
  
## See also

[XUser](../xuser_members.md)  

[XUserCompare](xusercompare.md)

[XUserCloseHandle](xuserclosehandle.md)