---
author: aablackm
title: XtfCreateFileIOClient
description: Initializes a new instance of the IXtfFileIOClient interface with the specified address.
ms.assetid: M:Windows.Xbox.xtffileio.XtfCreateFileIOClient(LPCWSTR,REFIID,void@)
kindex: XtfCreateFileIOClient
ms.author: stevenpr
ms.topic: reference
edited: 00/00/0000
quality: good
security: public
---

# XtfCreateFileIOClient
Initializes a new instance of the [IXtfFileIOClient](../classes/IXtfFileIOClient/ixtffileioclient-xtffileio-xbox-microsoft-t.md) interface with the specified address.
<a id="syntaxSection"></a>



## Syntax  

```cpp
HRESULT XtfCreateFileIOClient(
         LPCWSTR pszAddress,
         REFIID riid,
         void **ppvObject
)  
```

<a id="ID4EL"></a>



### Parameters  

*pszAddress*  
Type: LPCWSTR 

Pointer to the tools IP address of the development console to use for the new [IXtfFileIOClient](../classes/IXtfFileIOClient/ixtffileioclient-xtffileio-xbox-microsoft-t.md).


*riid*  
Type: REFIID 

Pointer that receives the instance identifier of the newly created [IXtfFileIOClient](../classes/IXtfFileIOClient/ixtffileioclient-xtffileio-xbox-microsoft-t.md).


*ppvObject*  
Type: void **

[out] Pointer that receives a reference to the newly created [IXtfFileIOClient](../classes/IXtfFileIOClient/ixtffileioclient-xtffileio-xbox-microsoft-t.md).

<a id="ID4ES"></a>



### Return value  
Type: HRESULT 

HRESULT success or error code.  
<a id="requirements"></a>

## Remarks

This function creates an instance of the [IXtfFileIOClient](../classes/IXtfFileIOClient/ixtffileioclient-xtffileio-xbox-microsoft-t.md) interface. The file IO client handles all of the common file functions for XTFFileIO. These functions include finding, copying, creating, deleting, editing, and getting information for files and directories, on a development console.  

## Requirements  

**Header:** xtffileio.h  

**Library:** xtffileio.lib  
  
**Supported platforms:** Windows (for Xbox console tools)  
  
<a id="ID4EYB"></a>



## See also  

<a id="ID4E1B"></a>

[XtfFileIO](../xtffileio-xbox-microsoft-n.md)  
[IXtfFileIOClient](../classes/IXtfFileIOClient/ixtffileioclient-xtffileio-xbox-microsoft-t.md)  
[IXtfBatchFileIOClient](../classes/IXtfBatchFileIOClient/ixtfbatchfileioclient-xtffileio-xbox-microsoft-t.md)  