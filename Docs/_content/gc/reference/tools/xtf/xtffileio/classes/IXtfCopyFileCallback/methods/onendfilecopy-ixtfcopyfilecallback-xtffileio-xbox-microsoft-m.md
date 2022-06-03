---
author: aablackm
title: OnEndFileCopy
description: Called when a file finishes copying between two locations on a development console.
ms.assetid: M:Windows.Xbox.xtffileio.IXtfCopyFileCallback.OnEndFileCopy(LPCWSTR,LPCWSTR,LPCXTFFILEINFO,LPCWSTR,HRESULT)
kindex:
- OnEndFileCopy method
- IXtfCopyFileCallback--OnEndFileCopy method
ms.author: stevenpr
ms.topic: reference
edited: 06/05/2019
security: public
---

# IXtfCopyFileCallback::OnEndFileCopy Method
  
Called when a file finishes copying between two locations on a development console.  
  
<a id="syntaxSection"></a>
  
## Syntax
  
```cpp
public:
HRESULT OnEndFileCopy(
         LPCWSTR pszRootDirectory,
         LPCWSTR pszSearchPattern,
         LPCXTFFILEINFO pSrcFileInfo,
         LPCWSTR pszDstFileName,
         HRESULT hrErrorCode
)  
```
  
<a id="parametersSection"></a>
  
### Parameters
  
*pszRootDirectory*  
Type: LPCWSTR  
  
A pointer to the root directory path for the copy.  
  
*pszSearchPattern*  
Type: LPCWSTR  
  
A pointer to the search pattern that defines the filenames of the source files to copy. This parameter accepts wildcard characters, to match strings with the indicated pattern.  
  
*pSrcFileInfo*  
Type: LPCXTFFILEINFO  
  
A pointer to an [XTFFILEINFO](../../../structures/xtffileinfo-xtffileio-xbox-microsoft-t.md) structure that contains information about the file copied.  
  
*pszDstFileName*  
Type: LPCWSTR  
  
A pointer to the filename of the target file.  
  
*hrErrorCode*  
Type: HRESULT  
  
An HRESULT success or error code.
  
<a id="retvalSection"></a>
  
### Return value
  
Type: HRESULT  
  
Returns `S_OK` if successful; otherwise, returns an HRESULT error code.  
  
<a id="remarksSection"></a>
  
## Remarks
  
This function is called by the [IXtfFileIOClient::CopyFiles](../../IXtfFileIOClient/methods/copyfiles-ixtffileioclient-xtffileio-xbox-microsoft-m.md) function once, at the end of a file copying operation. The information specified in the callback function includes the total number of bytes transferred in the [XTFFILEINFO](../../../structures/xtffileinfo-xtffileio-xbox-microsoft-t.md) structure. You can check this function's `hrErrorCode` parameter to identify any errors that may have occurred during the file copying operation.  
  
<a id="requirementsSection"></a>
  
## Requirements
  
**Header:** xtffileio.h  
  
**Library:** xtffileio.lib  
  
**Supported platforms:** Windows (for Xbox console tools)  
  
<a id="seealsoSection"></a>
  
## See also
  
[IXtfCopyFileCallback Interface](../ixtfcopyfilecallback-xtffileio-xbox-microsoft-t.md)  
[XtfFileIO](../../../xtffileio-xbox-microsoft-n.md)  
  