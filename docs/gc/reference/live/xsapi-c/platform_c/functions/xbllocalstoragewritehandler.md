---
author: joannaleecy
title: XblLocalStorageWriteHandler
description: Invoked by XSAPI to request the client to perform a local storage write operation.
kindex: XblLocalStorageWriteHandler
ms.author: migreen
ms.topic: reference
security: public
edited: 00/00/0000
applies-to: pc-gdk
---

# XblLocalStorageWriteHandler  

Invoked by XSAPI to request the client to perform a local storage write operation.  

## Syntax  
  
```cpp
void XblLocalStorageWriteHandler(  
         void* context,  
         XblClientOperationHandle operation,  
         XblUserHandle user,  
         XblLocalStorageWriteMode mode,  
         char key,  
         size_t dataSize,  
         void data  
)  
```  
  
### Parameters  
  
*context* &nbsp;&nbsp;\_In\_opt\_  
Type: void*  
  
Optional pointer to data used by the event handler.  
  
*operation* &nbsp;&nbsp;\_In\_  
Type: [XblClientOperationHandle](../handles/xblclientoperationhandle.md)  
  
The handle for this operation.  
  
*user* &nbsp;&nbsp;\_In\_  
Type: XblUserHandle  
  
The user for which the data is being written.  
  
*mode* &nbsp;&nbsp;\_In\_  
Type: [XblLocalStorageWriteMode](../enums/xbllocalstoragewritemode.md)  
  
The mode to be used for the write operation.  
  
*key* &nbsp;&nbsp;\_In\_z\_  
Type: char  
  
Identifies the data being written.  
  
*dataSize* &nbsp;&nbsp;\_In\_  
Type: size_t  
  
The size (in bytes) of the data.  
  
*data* &nbsp;&nbsp;\_In\_reads\_bytes\_(dataSize)  
Type: void  
  
The data to write.  
  
  
### Return value  
Type: void
  

  
## Remarks  
  
When the operation is complete, XblLocalStorageWriteComplete should be called. Apart from context, all parameters are owned by XSAPI and are guaranteed to be valid until the operation is complete.
  
## Requirements  
  
**Header:** platform_c.h
  
**Library:** Microsoft.Xbox.Services.141.GSDK.C.lib
  
## See also  
[platform_c](../platform_c_members.md)  
  
  