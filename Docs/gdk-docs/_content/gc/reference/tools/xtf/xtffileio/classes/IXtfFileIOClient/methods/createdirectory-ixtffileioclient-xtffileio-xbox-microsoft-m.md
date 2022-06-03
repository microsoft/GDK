---
author: aablackm
title: CreateDirectory
description: Creates the specified directory on the development console.
ms.assetid: M:Windows.Xbox.xtffileio.IXtfFileIOClient.CreateDirectory(LPCWSTR)
kindex:
- CreateDirectory method
- IXtfFileIOClient--CreateDirectory method
ms.author: stevenpr
ms.topic: reference
edited: 06/05/2019
security: public
---

# IXtfFileIOClient::CreateDirectory Method
  
Creates the specified directory on the development console.  
  
<a id="syntaxSection"></a>
  
## Syntax
  
```cpp
public:
HRESULT CreateDirectory(
         LPCWSTR pszDirectory
)  
```
  
<a id="parametersSection"></a>
  
### Parameters
  
*pszDirectory*  
Type: LPCWSTR  
  
Pointer to the directory path to the directory to create on the development console.  
  
<a id="retvalSection"></a>
  
### Return value
  
Type: HRESULT  
  
Returns `S_OK` if successful; otherwise, returns an HRESULT error code.  
  
<a id="remarksSection"></a>
  
## Remarks
  
This function creates a directory on the development console. If an error occurs, this function returns an HRESULT error code. For more information about HRESULT error codes specific to Xbox Tools Framework (XTF) API, see [XTF transport errors (NDA topic)](../../../../../../../tools-console/xbox-tools-and-apis/commandlinetools/xtf-transport-errors.md).  
  
Use the [IXtfFileIOClient::RemoveDirectory](removedirectory-ixtffileioclient-xtffileio-xbox-microsoft-m.md) method to remove a directory on the development console.  
  
<a id="requirementsSection"></a>
  
## Requirements
  
**Header:** xtffileio.h  
  
**Library:** xtffileio.lib  
  
**Supported platforms:** Windows (for Xbox console tools)  
  
<a id="seealsoSection"></a>
  
## See also
  
[IXtfFileIOClient Interface](../ixtffileioclient-xtffileio-xbox-microsoft-t.md)  
[XtfFileIO](../../../xtffileio-xbox-microsoft-n.md)  
  