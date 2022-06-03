---
author: aablackm
title: FindFiles
description: Searches for files on a development console.
ms.assetid: M:Windows.Xbox.xtffileio.IXtfFileIOClient.FindFiles(LPCWSTR,DWORD,DWORD,DWORD,DWORD,IXtfFindFileCallback)
kindex:
- FindFiles method
- IXtfFileIOClient--FindFiles method
ms.author: stevenpr
ms.topic: reference
edited: 06/05/2019
quality: good
security: public
---

# IXtfFileIOClient::FindFiles Method
Searches for files on a development console.
<a id="syntaxSection"></a>



## Syntax  

```cpp
public:
HRESULT FindFiles(
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

Pointer to the search pattern that defines the filenames of the source files to search for.  
This parameter accepts wildcard characters to match strings with the indicated pattern.


*dwIncludeAttributes*  
Type: DWORD 

Bitwise-OR combination of file attributes to include for the search. See [File Attribute Constants](https://msdn.microsoft.com/library/windows/desktop/gg258117(v=vs.85).aspx) for a list of possible attributes.


*dwExcludeAttributes*  
Type: DWORD 

Bitwise-OR combination of file attributes to exclude from the search. See [File Attribute Constants](https://msdn.microsoft.com/library/windows/desktop/gg258117(v=vs.85).aspx) for a list of possible attributes.


*dwRecursionLevels*  
Type: DWORD 

Number of directory levels to recurse for the search.


*dwFlags*  
Type: DWORD 

Bitwise-OR combination of flags that specify how to search for the files.


*pCallback*  
Type: IXtfFindFileCallback *

Pointer to the [IXtfFindFileCallback](../../IXtfFindFileCallback/ixtffindfilecallback-xtffileio-xbox-microsoft-t.md) callback to call when files are found.

<a id="ID4EQ"></a>



### Return value  
Type: HRESULT 

HRESULT success or error code.  
<a id="requirements"></a>



## Requirements  

**Header:** xtffileio.h  

**Library:** xtffileio.lib  
  
**Supported platforms:** Windows (for Xbox console tools)  
  
<a id="ID4EZB"></a>

## Remarks

When finding files *dwIncludeAttributes* and *dwExcludeAttributes* act as filters on which files are returned, it does not act as a filter on which file attributes are returned when finding files. The [IXtfFindFileCallback's](../../IXtfFindFileCallback/ixtffindfilecallback-xtffileio-xbox-microsoft-t.md) **onfindfile** function call will be called for each file being returned. The callback function will return information about each file found. The returned information can be used to return progress information.  

## See also  

<a id="ID4E2B"></a>

[IXtfFileIOClient Interface](../ixtffileioclient-xtffileio-xbox-microsoft-t.md)  
[XtfFileIO](../../../xtffileio-xbox-microsoft-n.md)  
[IXtfFindFileCallback](../../IXtfFindFileCallback/ixtffindfilecallback-xtffileio-xbox-microsoft-t.md)  