---
author: aablackm
title: GetFileAttributes
description: Retrieves the attributes of the specified file on the development console.
ms.assetid: M:Windows.Xbox.xtffileio.IXtfFileIOClient.GetFileAttributes(LPCWSTR,LPDWORD@)
kindex:
- GetFileAttributes method
- IXtfFileIOClient--GetFileAttributes method
ms.author: stevenpr
ms.topic: reference
edited: 06/05/2019
security: public
---

# IXtfFileIOClient::GetFileAttributes Method
  
Retrieves the attributes of the specified file on the development console.  
  
<a id="syntaxSection"></a>
  
## Syntax
  
```cpp
public:
HRESULT GetFileAttributes(
         LPCWSTR pszFileName,
         LPDWORD pdwFileAttributes
)  
```
  
<a id="parametersSection"></a>
  
### Parameters
  
*pszFileName*  
Type: LPCWSTR  
  
\[in\] A pointer to the filename of the file to get the attributes of.  
  
*pdwFileAttributes*  
Type: LPDWORD  
  
\[out\] A pointer that receives the bitwise-OR combination of file attributes for the specified file. See [File Attribute Constants](https://msdn.microsoft.com/library/windows/desktop/gg258117(v=vs.85).aspx) for a list of possible attributes.  
  
<a id="retvalSection"></a>
  
### Return value
  
Type: HRESULT  
  
Returns `S_OK` if successful; otherwise, returns an HRESULT error code.  
  
<a id="remarksSection"></a>
  
## Remarks
  
This function gets the file attributes of a specified file on the development console. If an error occurs, this function returns an HRESULT error code. For more information about HRESULT error codes specific to Xbox Tools Framework (XTF) API, see [XTF transport errors (NDA topic)](../../../../../../../tools-console/xbox-tools-and-apis/commandlinetools/xtf-transport-errors.md).  
  
Use the [IXtfFileIOClient::SetFileAttributes](setfileattributes-ixtffileioclient-xtffileio-xbox-microsoft-m.md) method to set the file attributes of a specified file on the development console.  
  
<a id="requirementsSection"></a>
  
## Requirements
  
**Header:** xtffileio.h  
  
**Library:** xtffileio.lib  
  
**Supported platforms:** Windows (for Xbox console tools)  
  
<a id="seealsoSection"></a>
  
## See also
  
[IXtfFileIOClient::GetFileInfo](getfileinfo-ixtffileioclient-xtffileio-xbox-microsoft-m.md)  
[IXtfFileIOClient Interface](../ixtffileioclient-xtffileio-xbox-microsoft-t.md)  
[XtfFileIO](../../../xtffileio-xbox-microsoft-n.md)  
  