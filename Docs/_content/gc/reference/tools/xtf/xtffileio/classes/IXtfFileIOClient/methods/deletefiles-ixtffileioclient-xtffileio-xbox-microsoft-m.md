---
author: aablackm
title: DeleteFiles
description: Deletes files from the development console.
ms.assetid: M:Windows.Xbox.xtffileio.IXtfFileIOClient.DeleteFiles(LPCWSTR,DWORD,DWORD,DWORD,DWORD,IXtfFindFileCallback)
kindex:
- DeleteFiles method
- IXtfFileIOClient--DeleteFiles method
ms.author: stevenpr
ms.topic: reference
edited: 06/05/2019
quality: good
security: public
---

# IXtfFileIOClient::DeleteFiles Method
Deletes files from the development console.
<a id="syntaxSection"></a>



## Syntax  

```cpp
public:
HRESULT DeleteFiles(
         LPCWSTR pszSearchPattern,
         DWORD dwIncludeAttributes,
         DWORD dwExcludeAttributes,
         DWORD dwRecursionLevels,
         DWORD dwFlags,
         IXtfFindFileCallback *pCallback
)  
```

<a id="ID4EH"></a>



### Parameters  

*pszSearchPattern*  
Type: LPCWSTR 

Pointer to the search pattern that defines the filenames of the files to delete.  
This parameter accepts wildcard characters to match strings with the indicated pattern.


*dwIncludeAttributes*  
Type: DWORD 

Bitwise-OR combination of file attributes to include for the delete. See [File Attribute Constants](https://msdn.microsoft.com/library/windows/desktop/gg258117(v=vs.85).aspx) for a list of possible attributes.


*dwExcludeAttributes*  
Type: DWORD 

Bitwise-OR combination of file attributes to exclude from the delete. See [File Attribute Constants](https://msdn.microsoft.com/library/windows/desktop/gg258117(v=vs.85).aspx) for a list of possible attributes.


*dwRecursionLevels*  
Type: DWORD 

Number of directory levels to recurse for the delete.


*dwFlags*  
Type: DWORD 

Flags that specify how to delete the files. This is a bitwise-OR combination of the macros listed in the following table.  

| Value| Macro| Description|
| --- | --- | --- |
| 0x80000000| XTFDELETEFILE_DEFER| Defer the file deletion.|




*pCallback*  
Type: IXtfFindFileCallback *

Pointer to the [IXtfFindFileCallback](../../IXtfFindFileCallback/ixtffindfilecallback-xtffileio-xbox-microsoft-t.md) callback to call when a file to delete is found.

<a id="ID4EQ"></a>



### Return value  
Type: HRESULT 

HRESULT success or error code.  
<a id="requirements"></a>

## Remarks

When deleting files *dwIncludeAttributes* and *dwExcludeAttributes* act as filters on which files are deleted, it does not act as a filter on which file attributes are deleted when deleting files. The [IXtfFindFileCallback's](../../IXtfFindFileCallback/ixtffindfilecallback-xtffileio-xbox-microsoft-t.md) **onfindfile** function call will be called for each file being deleted. The callback function will return information about each file being deleted. The returned information can be used to return progress information about the progress of deletion.

## Requirements  

**Header:** xtffileio.h  

**Library:** xtffileio.lib  
  
**Supported platforms:** Windows (for Xbox console tools)  
  
<a id="ID4EPC"></a>



## See also  

<a id="ID4ERC"></a>

[IXtfFileIOClient Interface](../ixtffileioclient-xtffileio-xbox-microsoft-t.md)  
[XtfFileIO](../../../xtffileio-xbox-microsoft-n.md)  
[IXtfFindFileCallback](../../IXtfFindFileCallback/ixtffindfilecallback-xtffileio-xbox-microsoft-t.md)  