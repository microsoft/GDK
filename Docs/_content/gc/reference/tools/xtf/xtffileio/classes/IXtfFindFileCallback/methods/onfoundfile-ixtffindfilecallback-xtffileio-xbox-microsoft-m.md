---
author: aablackm
title: OnFoundFile
description: Called when a file is found during a find or delete operation.
ms.assetid: M:Windows.Xbox.xtffileio.IXtfFindFileCallback.OnFoundFile(LPCWSTR,LPCWSTR,LPCXTFFILEINFO)
kindex:
- OnFoundFile method
- IXtfFindFileCallback--OnFoundFile method
ms.author: stevenpr
ms.topic: reference
edited: 06/05/2019
security: public
---

# IXtfFindFileCallback::OnFoundFile Method
Called when a file is found during a find or delete operation.
<a id="syntaxSection"></a>



## Syntax  

```cpp
public:
HRESULT OnFoundFile(
         LPCWSTR pszRootDirectory,
         LPCWSTR pszSearchPattern,
         LPCXTFFILEINFO pFileInfo
)  
```

<a id="ID4EH"></a>



### Parameters  

*pszRootDirectory*  
Type: LPCWSTR 

Pointer to the root directory path for the operation.


*pszSearchPattern*  
Type: LPCWSTR 

Pointer to the search pattern that defines the filenames of the files for the operation.  
This parameter accepts wildcard characters to match strings with the indicated pattern.


*pFileInfo*  
Type: LPCXTFFILEINFO 

Pointer to an [XTFFILEINFO](../../../structures/xtffileinfo-xtffileio-xbox-microsoft-t.md) structure that contains information about the located file.

<a id="ID4EQ"></a>


### Return value  
Type: HRESULT 

HRESULT success or error code.  
<a id="requirements"></a>

## Remarks

This function is called every time that a file is found as the result of a call to the find or delete functions [IXtfFileIOClient::FindFiles](../../IXtfFileIOClient/methods/findfiles-ixtffileioclient-xtffileio-xbox-microsoft-m.md), and [IXtfFileIOClient::DeleteFiles](../../IXtfFileIOClient/methods/deletefiles-ixtffileioclient-xtffileio-xbox-microsoft-m.md). This function will return information about each file found during the find or deletion process. Found information can be used to report progress on the requested file io occurring. Returning an error result from this callback function will abort the xtf IO operation with an error.  

## Requirements  

**Header:** xtffileio.h  

**Library:** xtffileio.lib  
  
**Supported platforms:** Windows (for Xbox console tools)  
  
## See also  

[IXtfFindFileCallback](../ixtffindfilecallback-xtffileio-xbox-microsoft-t.md)  
[IXtfFileIOClient::DeleteFiles](../../IXtfFileIOClient/methods/deletefiles-ixtffileioclient-xtffileio-xbox-microsoft-m.md)  
[IXtfFileIOClient::FindFiles](../../IXtfFileIOClient/methods/findfiles-ixtffileioclient-xtffileio-xbox-microsoft-m.md)  