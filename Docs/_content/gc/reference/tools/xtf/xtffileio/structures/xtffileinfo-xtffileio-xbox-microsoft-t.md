---
author: aablackm
title: XTFFILEINFO
description: Contains information about a file for Xbox Tools Framework (XTF) apps.
ms.assetid: T:Windows.Xbox.xtffileio.XTFFILEINFO
kindex: XTFFILEINFO
ms.author: stevenpr
ms.topic: reference
edited: 06/05/2019
security: public
---

# XTFFILEINFO
  
Contains information about a file for Xbox Tools Framework (XTF) apps.  
  
<a id="syntaxSection"></a>
  
## Syntax
  
```cpp
typedef struct XTFFILEINFO {
    LPCWSTR pszFileName;
    DWORD dwFileAttributes;
    ULONGLONG ullCreationTime;
    ULONGLONG ullLastAccessTime;
    ULONGLONG ullLastWriteTime;
    ULONGLONG ullFileSize;
    XTFFILEIORESERVED Reserved;
} XTFFILEINFO, *LPXTFFILEINFO;  
```
  
<a id="membersSection"></a>
  
### Members
  
*pszFileName*  
Type: LPCWSTR  
  
A pointer to the filename of the file.  
  
*dwFileAttributes*  
Type: DWORD  
  
The bitwise-OR combination of file attributes for the file. See [File Attribute Constants](https://msdn.microsoft.com/library/windows/desktop/gg258117(v=vs.85).aspx) for a list of possible attributes.  
  
*ullCreationTime*  
Type: ULONGLONG  
  
The date and time that the file was created.  
  
*ullLastAccessTime*  
Type: ULONGLONG  
  
The date and time that the file was last accessed.  
  
*ullLastWriteTime*  
Type: ULONGLONG  
  
The date and time that the file was last written to.  
  
*ullFileSize*  
Type: ULONGLONG  
  
The size of the file, in bytes.  
  
*Reserved*  
Type: [XTFFILEIORESERVED](xtffileioreserved-xtffileio-xbox-microsoft-t.md)  
  
Reserved for internal use.  
  
<a id="remarksSection"></a>
  
## Remarks
  
This structure provides information about a file for use with XTF apps. The structure contains the name, file attributes, and size of the file, as well as the date and time when the file was created, last accessed, and last written to.  
  
The `XTFFILEINFO` structure is used by other interface members in the XtfFileIO API, including [IXtfCopyFileCallback::OnEndFileCopy](../classes/IXtfCopyFileCallback/methods/onendfilecopy-ixtfcopyfilecallback-xtffileio-xbox-microsoft-m.md), [IXtfCopyFileCallback::OnStartFileCopy](../classes/IXtfCopyFileCallback/methods/onstartfilecopy-ixtfcopyfilecallback-xtffileio-xbox-microsoft-m.md), [IXtfFindFileCallback::OnFoundFile](../classes/IXtfFindFileCallback/methods/onfoundfile-ixtffindfilecallback-xtffileio-xbox-microsoft-m.md), and [IXtfFileIOClient::GetFileInfo](../classes/IXtfFileIOClient/methods/getfileinfo-ixtffileioclient-xtffileio-xbox-microsoft-m.md).  
  
<a id="requirementsSection"></a>
  
## Requirements  
  
**Header:** xtffileio.h  
  
**Library:** xtffileio.lib  
  
**Supported platforms:** Windows (for Xbox console tools)  
  
<a id="seealsoSection"></a>
  
## See also
  
[IXtfCopyFileCallback::OnEndFileCopy](../classes/IXtfCopyFileCallback/methods/onendfilecopy-ixtfcopyfilecallback-xtffileio-xbox-microsoft-m.md)  
[IXtfCopyFileCallback::OnStartFileCopy](../classes/IXtfCopyFileCallback/methods/onstartfilecopy-ixtfcopyfilecallback-xtffileio-xbox-microsoft-m.md)  
[IXtfFindFileCallback::OnFoundFile](../classes/IXtfFindFileCallback/methods/onfoundfile-ixtffindfilecallback-xtffileio-xbox-microsoft-m.md)  
[IXtfFileIOClient::GetFileInfo](../classes/IXtfFileIOClient/methods/getfileinfo-ixtffileioclient-xtffileio-xbox-microsoft-m.md)  
[XtfFileIO](../xtffileio-xbox-microsoft-n.md)  
  