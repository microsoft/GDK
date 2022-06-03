---
author: aablackm
title: OnStartFileCopy
description: Called when a file starts copying between two locations on a development console.
ms.assetid: M:Windows.Xbox.xtffileio.IXtfCopyFileCallback.OnStartFileCopy(LPCWSTR,LPCWSTR,LPCXTFFILEINFO,LPCWSTR)
kindex:
- OnStartFileCopy method
- IXtfCopyFileCallback--OnStartFileCopy method
ms.author: stevenpr
ms.topic: reference
edited: 06/05/2019
security: public
---

# IXtfCopyFileCallback::OnStartFileCopy Method
  
Called when a file starts copying between two locations on a development console.  
  
<a id="syntaxSection"></a>
  
## Syntax
  
```cpp
public:
HRESULT OnStartFileCopy(
         LPCWSTR pszRootDirectory,
         LPCWSTR pszSearchPattern,
         LPCXTFFILEINFO pSrcFileInfo,
         LPCWSTR pszDstFileName
)  
```
  
<a id="parametersSection"></a>
  
### Parameters
  
*pszRootDirectory*  
Type: LPCWSTR  
  
Pointer to the root directory path for the copy.  
  
*pszSearchPattern*  
Type: LPCWSTR  
  
Pointer to the search pattern that defines the filenames of the source files to copy. This parameter accepts wildcard characters to match strings with the indicated pattern.  
  
*pSrcFileInfo*  
Type: LPCXTFFILEINFO  
  
Pointer to an [XTFFILEINFO](../../../structures/xtffileinfo-xtffileio-xbox-microsoft-t.md) structure that contains information about the file copied.  
  
*pszDstFileName*  
Type: LPCWSTR  
  
Pointer to the filename of the target file.  
  
<a id="retvalSection"></a>
  
### Return value
  
Type: HRESULT  
  
Returns `S_OK` if successful; otherwise, returns an HRESULT error code.  
  
<a id="remarksSection"></a>
  
## Remarks
  
This callback function is called once by the [IXtfFileIOClient::CopyFiles](../../IXtfFileIOClient/methods/copyfiles-ixtffileioclient-xtffileio-xbox-microsoft-m.md) method at the beginning of a file copying operation. The file size returned in the [XTFFILEINFO](../../../structures/xtffileinfo-xtffileio-xbox-microsoft-t.md) structure represents the sum of the size of the files that needs to be copied, in bytes. You can use this sum to track overall progress of the file copying operation. If this callback function returns an HRESULT error code, the file copying operation is aborted.  
  
<a id="requirementsSection"></a>
  
## Requirements
  
**Header:** xtffileio.h  
  
**Library:** xtffileio.lib  
  
**Supported platforms:** Windows (for Xbox console tools)  
  
<a id="seealsoSection"></a>
  
## See also
  
[IXtfCopyFileCallback Interface](../ixtfcopyfilecallback-xtffileio-xbox-microsoft-t.md)  
[XtfFileIO](../../../xtffileio-xbox-microsoft-n.md) 
  