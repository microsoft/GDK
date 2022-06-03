---
author: aablackm
title: RemoveDirectory
description: Deletes the specified directory from the development console.
ms.assetid: M:Windows.Xbox.xtffileio.IXtfFileIOClient.RemoveDirectory(LPCWSTR,DWORD,IXtfFindFileCallback)
kindex:
- RemoveDirectory method
- IXtfFileIOClient--RemoveDirectory method
ms.author: stevenpr
ms.topic: reference
edited: 06/05/2019
security: public
---

# IXtfFileIOClient::RemoveDirectory Method
  
Deletes the specified directory from the development console.  
  
<a id="syntaxSection"></a>
  
## Syntax
  
```cpp
public:
HRESULT RemoveDirectory(
         LPCWSTR pszDirectory,
         DWORD dwFlags,
         IXtfFindFileCallback *pCallback
)  
```
  
<a id="parametersSection"></a>
  
### Parameters
  
*pszDirectory*  
Type: LPCWSTR  
  
Pointer to the directory path to the directory to delete from the development console.  
  
*dwFlags*  
Type: DWORD  
  
Flags that specify how to delete the directory. This is a bitwise-OR combination of the macros listed in the following table.  
  
| Value | Macro | Description |  
| --- | --- | --- |  
| 0x1 | XTFREMOVEDIRECTORY_FORCE | Forces the directory deletion to occur, even if the directory contains files or subdirectories. |  
| 0x80000000 | XTFDELETEFILE_DEFER | Defers the directory deletion. |  
  
*pCallback*  
Type: IXtfFindFileCallback\*
  
Pointer to the [IXtfFindFileCallback](../../IXtfFindFileCallback/ixtffindfilecallback-xtffileio-xbox-microsoft-t.md) callback to call when a directory to delete is found.  
  
<a id="retvalSection"></a>
  
### Return value
  
Type: HRESULT  
  
Returns `S_OK` if successful; otherwise, returns an HRESULT error code.  
  
<a id="remarksSection"></a>
  
## Remarks
  
This function removes a directory on the development console. If an error occurs, this function returns an HRESULT error code. For more information about HRESULT error codes specific to Xbox Tools Framework (XTF) API, see [XTF transport errors (NDA topic)](../../../../../../../tools-console/xbox-tools-and-apis/commandlinetools/xtf-transport-errors.md).  
  
If XTFREMOVEDIRECTORY_FORCE is specified and the directory to be removed contains files or subdirectories, the [IXtfFindFileCallback::OnFoundFile](../../IXtfFindFileCallback/methods/onfoundfile-ixtffindfilecallback-xtffileio-xbox-microsoft-m.md) callback function is invoked for each file and subdirectory in the directory to be removed. Information for each file and subdirectory in the directory is passed to the callback function, and that information can be used to track and display progress information.  
  
<a id="requirementsSection"></a>
  
## Requirements  
  
**Header:** xtffileio.h  
  
**Library:** xtffileio.lib  
  
**Supported platforms:** Windows (for Xbox console tools)  
  
<a id="seealsoSection"></a>
  
## See also
  
[IXtfFileIOClient::CreateDirectory](createdirectory-ixtffileioclient-xtffileio-xbox-microsoft-m.md)  
[IXtfFileIOClient Interface](../ixtffileioclient-xtffileio-xbox-microsoft-t.md)  
[XtfFileIO](../../../xtffileio-xbox-microsoft-n.md)  
  