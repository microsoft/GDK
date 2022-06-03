---
author: aablackm
title: SetFileAttributes
description: Sets attributes for files on the development console.
ms.assetid: M:Windows.Xbox.xtffileio.IXtfFileIOClient.SetFileAttributes(LPCWSTR,DWORD,DWORD,DWORD,DWORD,DWORD,IXtfFindFileCallback)
kindex:
- SetFileAttributes method
- IXtfFileIOClient--SetFileAttributes method
ms.author: stevenpr
ms.topic: reference
edited: 06/05/2019
security: public
---

# IXtfFileIOClient::SetFileAttributes Method
  
Sets attributes for files on the development console.  
  
<a id="syntaxSection"></a>
  
## Syntax
  
```cpp
public:
HRESULT SetFileAttributes(
         LPCWSTR pszSearchPattern,
         DWORD dwIncludeAttributes,
         DWORD dwExcludeAttributes,
         DWORD dwRecursionLevels,
         DWORD dwAddAttributes,
         DWORD dwRemoveAttributes,
         IXtfFindFileCallback *pCallback
)  
```
  
<a id="parametersSection"></a>
  
### Parameters
  
*pszSearchPattern*  
Type: LPCWSTR  
  
Pointer to the search pattern that defines the filenames of the files to set the attributes of. This parameter accepts wildcard characters to match strings with the indicated pattern.  
  
*dwIncludeAttributes*  
Type: DWORD  
  
Bitwise-OR combination of file attributes to include for the operation. See [File Attribute Constants](https://msdn.microsoft.com/library/windows/desktop/gg258117(v=vs.85).aspx) for a list of possible attributes.  
  
*dwExcludeAttributes*  
Type: DWORD  
  
Bitwise-OR combination of file attributes to exclude from the operation. See [File Attribute Constants](https://msdn.microsoft.com/library/windows/desktop/gg258117(v=vs.85).aspx) for a list of possible attributes.  
  
*dwRecursionLevels*  
Type: DWORD  
  
Number of directory levels to recurse for the operation.  
  
*dwAddAttributes*  
Type: DWORD  
  
Bitwise-OR combination of file attributes to add to the files.  
  
*dwRemoveAttributes*  
Type: DWORD  
  
Bitwise-OR combination of file attributes to remove from the files.  
  
*pCallback*  
Type: IXtfFindFileCallback\*  
  
Pointer to the [IXtfFindFileCallback](../../IXtfFindFileCallback/ixtffindfilecallback-xtffileio-xbox-microsoft-t.md) callback to call when a file is found to set the attributes of.  
  
<a id="retvalSection"></a>
  
### Return value
  
Type: HRESULT  
  
Returns `S_OK` if successful; otherwise, returns an HRESULT error code.  
  
<a id="remarksSection"></a>
  
## Remarks
  
This function sets the file attributes of a specified file on the development console. If an error occurs, this function returns an HRESULT error code. For more information about HRESULT error codes specific to Xbox Tools Framework (XTF) API, see [XTF transport errors (NDA topic)](../../../../../../../tools-console/xbox-tools-and-apis/commandlinetools/xtf-transport-errors.md).  
  
Use the [IXtfFileIOClient::GetFileAttributes](setfileattributes-ixtffileioclient-xtffileio-xbox-microsoft-m.md) method to get the file attributes of a specified file on the development console.  
  
<a id="requirementsSection"></a>
  
## Requirements
  
**Header:** xtffileio.h  
  
**Library:** xtffileio.lib  
  
**Supported platforms:** Windows (for Xbox console tools)  
  
<a id="seealsoSection"></a>
  
## See also
  
[IXtfFileIOClient Interface](../ixtffileioclient-xtffileio-xbox-microsoft-t.md)  
[XtfFileIO](../../../xtffileio-xbox-microsoft-n.md)  
  