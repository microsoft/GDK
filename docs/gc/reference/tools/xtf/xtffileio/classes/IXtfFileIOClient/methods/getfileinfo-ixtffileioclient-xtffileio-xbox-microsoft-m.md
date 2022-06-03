---
author: aablackm
title: GetFileInfo
description: Retrieves information about the specified file on the development console.
ms.assetid: M:Windows.Xbox.xtffileio.IXtfFileIOClient.GetFileInfo(LPCWSTR,LPXTFFILEINFO)
kindex:
- GetFileInfo method
- IXtfFileIOClient--GetFileInfo method
ms.author: stevenpr
ms.topic: reference
edited: 06/05/2019
security: public
---

# IXtfFileIOClient::GetFileInfo Method
  
Retrieves information about the specified file on the development console.  
  
<a id="syntaxSection"></a>
  
## Syntax
  
```cpp
public:
HRESULT GetFileInfo(
         LPCWSTR pszFileName,
         LPXTFFILEINFO pFileInfo
)  
```
  
<a id="parametersSection"></a>
  
### Parameters
  
*pszFileName*  
Type: LPCWSTR  
  
A pointer to the filename of the file to get the size of.  
  
*pFileInfo*  
Type: LPXTFFILEINFO  
  
A pointer to an [XTFFILEINFO](../../../structures/xtffileinfo-xtffileio-xbox-microsoft-t.md) structure that receives the file information.  
  
<a id="retvalSection"></a>
  
### Return value
  
Type: HRESULT  
  
Returns `S_OK` if successful; otherwise, returns an HRESULT error code.  
  
<a id="remarksSection"></a>
  
## Remarks
  
This function gets information, including the name, file attributes, creation time, last access time, last write time, and size, of a specified file on the development console as an [XTFFILEINFO](../../../structures/xtffileinfo-xtffileio-xbox-microsoft-t.md) structure. If an error occurs, this function returns an HRESULT error code. For more information about HRESULT error codes specific to Xbox Tools Framework (XTF) API, see [XTF transport errors (NDA topic)](../../../../../../../tools-console/xbox-tools-and-apis/commandlinetools/xtf-transport-errors.md).  
  
<a id="requirementsSection"></a>
  
## Requirements
  
**Header:** xtffileio.h  
  
**Library:** xtffileio.lib  
  
**Supported platforms:** Windows (for Xbox console tools)  
  
<a id="seealsoSection"></a>
  
## See also
  
[IXtfFileIOClient::GetFileAttributes](getfileattributes-ixtffileioclient-xtffileio-xbox-microsoft-m.md)  
[IXtfFileIOClient::GetFileSize](getfilesize-ixtffileioclient-xtffileio-xbox-microsoft-m.md)  
[IXtfFileIOClient Interface](../ixtffileioclient-xtffileio-xbox-microsoft-t.md)  
[XtfFileIO](../../../xtffileio-xbox-microsoft-n.md)  
  