---
author: aablackm
title: OnFileCopyProgress
description: Called when the progress of a file copy changes.
ms.assetid: M:Windows.Xbox.xtffileio.IXtfCopyFileCallback.OnFileCopyProgress(LPCWSTR,LPCWSTR,ULONGLONG,ULONGLONG)
kindex:
- OnFileCopyProgress method
- IXtfCopyFileCallback--OnFileCopyProgress method
ms.author: stevenpr
ms.topic: reference
edited: 06/05/2019
security: public
---

# IXtfCopyFileCallback::OnFileCopyProgress Method
  
Called when the progress of a file copy changes.  
  
<a id="syntaxSection"></a>
  
## Syntax
  
```cpp
public:
HRESULT OnFileCopyProgress(
         LPCWSTR pszSrcFileName,
         LPCWSTR pszDstFileName,
         ULONGLONG ullFileSize,
         ULONGLONG ullBytesCopied
)  
```
  
<a id="parametersSection"></a>
  
### Parameters
  
*pszSrcFileName*  
Type: LPCWSTR  
  
A pointer to the filename of the source file. This parameter has been deprecated and the value is now a copy of pszDstFileName.
  
*pszDstFileName*  
Type: LPCWSTR  
  
A pointer to the filename of the target file.  
  
*ullFileSize*  
Type: ULONGLONG  
  
The total size of the source file, in bytes.  
  
*ullBytesCopied*  
Type: ULONGLONG  
  
The number of bytes of the file that have been copied so far.  
  
<a id="retvalSection"></a>
  
### Return value
  
Type: HRESULT  
  
Returns `S_OK` if successful; otherwise, returns an HRESULT error code.  
  
<a id="remarksSection"></a>
  
## Remarks
  
This function is called by the [IXtfFileIOClient::CopyFiles](../../IXtfFileIOClient/methods/copyfiles-ixtffileioclient-xtffileio-xbox-microsoft-m.md) method for each packet transferred during the file copying operation. The initial call to **IXtfCopyFileCallback::OnFileCopyProgress** for a file specifies 0 bytes in `ullBytesCopied` and MAX_FILE_SIZE bytes in `ullFileSize`. This initial call indicates that you have started copying a new file. You can then use the file information specified in subsequent **IXtfCopyFileCallback::OnFileCopyProgress** calls to track and display progress during the file copying operation. If this callback function returns an HRESULT error code, the file copying operation is aborted.  
  
<a id="requirementsSection"></a>
  
## Requirements
  
**Header:** xtffileio.h  
  
**Library:** xtffileio.lib  
  
**Supported platforms:** Windows (for Xbox console tools)  
  
<a id="seealsoSection"></a>
  
## See also
  
[IXtfCopyFileCallback Interface](../ixtfcopyfilecallback-xtffileio-xbox-microsoft-t.md)  
[XtfFileIO](../../../xtffileio-xbox-microsoft-n.md) 
  