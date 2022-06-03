---
author: aablackm
title: CopyFiles
description: Batch-copies files between two locations on a development console and returns information about the operation.
ms.assetid: M:Windows.Xbox.xtffileio.IXtfBatchFileIOClient.CopyFiles(LPCWSTR,LPCWSTR,DWORD,LPCWSTR,DWORD,IXtfCopyFileCallback)
kindex:
- CopyFiles method
- IXtfBatchFileIOClient--CopyFiles method
ms.author: stevenpr
ms.topic: reference
edited: 06/05/2019
security: public
---

# IXtfBatchFileIOClient::CopyFiles Method
  
Batch-copies files enumerated in a list of strings between two locations on a development console and returns information about the operation.  
  > [!NOTE]
> This method is deprecated. Use the [IXtfFileIOClient::CopyFiles](../../IXtfFileIOClient/methods/copyfiles-ixtffileioclient-xtffileio-xbox-microsoft-m.md) method instead.  
  
<a id="syntaxSection"></a>
  
## Syntax
  
```cpp
public:
HRESULT CopyFiles(
         LPCWSTR pszRootDirectory,
         LPCWSTR *rgszRootDirectoryRelativeFiles,
         DWORD cRootDirectoryRelativeFiles,
         LPCWSTR pszDstDirectoryName,
         DWORD dwFlags,
         IXtfCopyFileCallback *pCallback
)  
```
  
<a id="parametersSection"></a>
  
### Parameters
  
*pszRootDirectory*  
Type: LPCWSTR  
  
A pointer to the root directory for the batch copy.  
  
*rgszRootDirectoryRelativeFiles*  
Type: LPCWSTR\*  
  
A pointer to a list of strings which contains the names of the files to be copied.  
  
*cRootDirectoryRelativeFiles*  
Type: DWORD  
  
The number of files for the batch copy.  
  
*pszDstDirectoryName*  
Type: LPCWSTR  
  
A pointer to the destination directory name for the batch copy.  
  
*dwFlags*  
Type: DWORD  
  
Flags that specify how to copy the files. This parameter is a bitwise-OR combination of the macros listed in the following table.  
  
| Value | Macro | Description |  
| --- | --- | --- |  
| 0x80000000 | XTFCOPYFILE_DEFER| Defer the file copy. |  
  
*pCallback*  
Type: IXtfCopyFileCallback\*  
  
Pointer to the [IXtfCopyFileCallback](../../IXtfCopyFileCallback/ixtfcopyfilecallback-xtffileio-xbox-microsoft-t.md) callback to call when the status of the copy changes.  
  
<a id="retvalSection"></a>
  
### Return value
  
Type: HRESULT  
  
Returns `S_OK` if successful; otherwise, returns an HRESULT error code.  
  
<a id="remarksSection"></a>
  
## Remarks
  
This function copies files enumerated in a list of strings between two locations on a development console as a batch operation and returns information about the operation.  
  > [!NOTE]
> This method is deprecated. Use the [IXtfFileIOClient::CopyFiles](../../IXtfFileIOClient/methods/copyfiles-ixtffileioclient-xtffileio-xbox-microsoft-m.md) method instead.  
  
## Requirements
  
**Header:** xtffileio.h  
  
**Library:** xtffileio.lib  
  
**Supported platforms:** Windows (for Xbox console tools)  
  
## See also
  
[IXtfFileIOClient::CopyFiles](../../IXtfFileIOClient/methods/copyfiles-ixtffileioclient-xtffileio-xbox-microsoft-m.md)  
[IXtfBatchFileIOClient Interface](../ixtfbatchfileioclient-xtffileio-xbox-microsoft-t.md)  
[XtfFileIO](../../../xtffileio-xbox-microsoft-n.md)  
  