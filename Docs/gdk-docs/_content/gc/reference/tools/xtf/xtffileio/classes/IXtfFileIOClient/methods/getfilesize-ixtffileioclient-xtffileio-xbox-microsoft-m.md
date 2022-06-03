---
author: aablackm
title: GetFileSize
description: Retrieves the size of the specified file on the development console.
ms.assetid: M:Windows.Xbox.xtffileio.IXtfFileIOClient.GetFileSize(LPCWSTR,PULONGLONG)
kindex:
- GetFileSize method
- IXtfFileIOClient--GetFileSize method
ms.author: stevenpr
ms.topic: reference
edited: 06/05/2019
security: public
---

# IXtfFileIOClient::GetFileSize Method
  
Retrieves the size of the specified file on the development console.  
  
<a id="syntaxSection"></a>
  
## Syntax
  
```cpp
public:
HRESULT GetFileSize(
         LPCWSTR pszFileName,
         PULONGLONG pullFileSize
)  
```
  
<a id="parametersSection"></a>
  
### Parameters
  
*pszFileName*  
Type: LPCWSTR  
  
Pointer to the filename of the file to get the size of.  
  
*pullFileSize*  
Type: PULONGLONG  
  
Pointer that receives the size of the specified file, in bytes.  
  
<a id="retvalSection"></a>
  
### Return value
  
Type: HRESULT  
  
Returns `S_OK` if successful; otherwise, returns an HRESULT error code.  
  
<a id="remarksSection"></a>
  
## Remarks
  
This function gets the size, in bytes, of a specified file on the development console. If an error occurs, this function returns an HRESULT error code. For more information about HRESULT error codes specific to Xbox Tools Framework (XTF) API, see [XTF transport errors (NDA topic)](../../../../../../../tools-console/xbox-tools-and-apis/commandlinetools/xtf-transport-errors.md).  
  
You can also use the [IXtfFileIOClient::GetFileInfo](getfileinfo-ixtffileioclient-xtffileio-xbox-microsoft-m.md) method to get an [XTFFILEINFO](../../../structures/xtffileinfo-xtffileio-xbox-microsoft-t.md) structure containing information, including the name, file attributes, creation time, last access time, last write time, and size, of a specified file on the development console.
  
<a id="requirementsSection"></a>
  
## Requirements
  
**Header:** xtffileio.h  
  
**Library:** xtffileio.lib  
  
**Supported platforms:** Windows (for Xbox console tools)  
  
<a id="seealsoSection"></a>
  
## See also
  
[IXtfFileIOClient Interface](../ixtffileioclient-xtffileio-xbox-microsoft-t.md)  
[XtfFileIO](../../../xtffileio-xbox-microsoft-n.md)  
  