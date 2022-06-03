---
author: aablackm
title: GetInstalled
description: Gets a list of the apps that are currently installed on the development console.
ms.assetid: M:Windows.Xbox.xtfapplication.IXtfApplicationClient.GetInstalled(LPBSTR)
kindex:
- GetInstalled method
- IXtfApplicationClient--GetInstalled method
ms.author: stevenpr
ms.topic: reference
edited: 06/05/2019
security: public
---

# IXtfApplicationClient::GetInstalled
  
Gets a list of the apps that are currently installed on the development console.  
  
<a id="syntaxSection"></a>
  
## Syntax
  
```cpp
public:
HRESULT GetInstalled(
         LPBSTR pbstrAppList
)  
```
  
<a id="parametersSection"></a>
  
### Parameters
  
*pbstrAppList*  
Type: LPBSTR  
  
A pointer that receives a list of the apps that are currently installed on the development console.  
  
<a id="retvalSection"></a>
  
### Return value
  
Type: HRESULT  
  
Returns `S_OK` if successful; otherwise, returns an HRESULT error code.  
  
<a id="remarksSection"></a>
  
## Remarks
  
This method gets a list of the apps that are currently installed on the development console. This method is similar to the `xbapp list` command from the Application Management (xbapp.exe) tool,  included as part of the Xbox Tools Framework (XTF). For more information about the `xbapp list` command, see [Application Management (xbapp.exe) (NDA topic)](../../../../../../../tools-console/xbox-tools-and-apis/commandlinetools/xbapp.md).  
  
<a id="remarks_output"></a>
  
### Handling LPBSTR pointers
  
For more information about handling LPBSTR pointers returned by this function, see [Allocating and Releasing Memory for a BSTR](/cpp/atl-mfc-shared/allocating-and-releasing-memory-for-a-bstr?view=vs-2019).  
  
<a id="requirementsSection"></a>
  
## Requirements
  
**Header:** xtfapplication.h  
  
**Library:** xtfapplication.lib  
  
**Supported platforms:** Windows (for Xbox console tools)  
  
<a id="seealsoSection"></a>
  
## See also
  
[IXtfApplicationClient Interface](../ixtfapplicationclient-xtfapplication-xbox-microsoft-t.md)  
[XtfApplication](../../../xtfapplication-xbox-microsoft-n.md)  
  