---
author: aablackm
title: CopyFiles
description: Copies files between two locations on a development console and returns information about the operation.
ms.assetid: M:Windows.Xbox.xtffileio.IXtfFileIOClient.CopyFiles(LPCWSTR,DWORD,DWORD,DWORD,LPCWSTR,DWORD,IXtfCopyFileCallback)
kindex:
- CopyFiles method
- IXtfFileIOClient--CopyFiles method
ms.author: stevenpr
ms.topic: reference
edited: 06/05/2019
quality: good
security: public
---

# IXtfFileIOClient::CopyFiles Method
  
Copies files between two locations on a development console and returns information about the operation.  
  
<a id="syntaxSection"></a>
  
## Syntax
  
```cpp
public:
HRESULT CopyFiles(
         LPCWSTR pszSearchPattern,
         DWORD dwIncludeAttributes,
         DWORD dwExcludeAttributes,
         DWORD dwRecursionLevels,
         LPCWSTR pszDstFileName,
         DWORD dwFlags,
         IXtfCopyFileCallback *pCallback
)  
```
  
<a id="parametersSection"></a>
  
### Parameters
  
*pszSearchPattern*  
Type: LPCWSTR  
  
A pointer to the search pattern that defines the filenames of the source files to copy. This parameter accepts wildcard characters to match strings with the indicated pattern.  
  
*dwIncludeAttributes*  
Type: DWORD  
  
A bitwise-OR combination of file attributes to include for the copy. See [File Attribute Constants](https://msdn.microsoft.com/library/windows/desktop/gg258117(v=vs.85).aspx) for a list of possible attributes.  
  
*dwExcludeAttributes*  
Type: DWORD  
  
A bitwise-OR combination of file attributes to exclude from the copy. See [File Attribute Constants](https://msdn.microsoft.com/library/windows/desktop/gg258117(v=vs.85).aspx) for a list of possible attributes.  
  
*dwRecursionLevels*  
Type: DWORD  
  
The number of directory levels to recurse for the copy, or -1 to cover all levels of the directory tree.  
  
*pszDstFileName*  
Type: LPCWSTR  
  
A pointer to the filenames of the target files to copy to.  
  
*dwFlags*  
Type: DWORD  
  
Flags that specify how to copy the files. This is a bitwise-OR combination of the macros listed in the following table.  
  
| Value| Macro | Description |  
| --- | --- | --- |  
| 0x80000000 | XTFCOPYFILE_DEFER| Defers the file copy. |  
  
*pCallback*  
Type: IXtfCopyFileCallback\*  
  
A pointer to the [IXtfCopyFileCallback](../../IXtfCopyFileCallback/ixtfcopyfilecallback-xtffileio-xbox-microsoft-t.md) callback to call when the status of the copy changes.  
  
<a id="retvalSection"></a>
  
### Return value
  
Type: HRESULT  
  
Returns `S_OK` if successful; otherwise, returns an HRESULT error code.  
  
<a id="remarksSection"></a>
  
## Remarks
  
**IXtfFileIOClient::CopyFiles** starts the process of copying a file or files from one location on the Xbox console to the other. To track the progress of the file copy command, define the callback functions with an instance of [IXtfCopyFileCallback](../../IXtfCopyFileCallback/ixtfcopyfilecallback-xtffileio-xbox-microsoft-t.md). `IXtfCopyFileCallback` contains callback functions that are called when the file copying operation begins, when it makes progress, and finally after it is finished.  
When copying multiple files through the use of wildcard characters, the *pszDstFileName* parameter is assumed to be a directory and all copied files are placed in that directory. If the directory does not exist, it is created before files are copied.  
  
The *dwIncludeAttributes* and *dwExcludeAttributes* parameters act as filters that indicate which files are copied. These parameters do not act as filters that indicate which file attributes are copied when copying files.  
  
<a id="requirementsSection"></a>
  
## Requirements
  
**Header:** xtffileio.h  
  
**Library:** xtffileio.lib  
  
**Supported platforms:** Windows (for Xbox console tools)  
  
<a id="seealsoSection"></a>
  
## See also
  
[IXtfFileIOClient Interface](../ixtffileioclient-xtffileio-xbox-microsoft-t.md)  
[XtfFileIO](../../../xtffileio-xbox-microsoft-n.md)  
  