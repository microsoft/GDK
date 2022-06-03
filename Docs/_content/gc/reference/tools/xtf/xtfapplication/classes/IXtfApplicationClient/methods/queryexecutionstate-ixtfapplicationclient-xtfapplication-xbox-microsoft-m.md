---
author: aablackm
title: QueryExecutionState
description: Queries the execution state of the app with the specified package moniker.
ms.assetid: M:Windows.Xbox.xtfapplication.IXtfApplicationClient.QueryExecutionState(LPCWSTR,DWORD)
kindex:
- QueryExecutionState method
- IXtfApplicationClient--QueryExecutionState method
ms.author: stevenpr
ms.topic: reference
edited: 06/05/2019
security: public
---

# IXtfApplicationClient::QueryExecutionState
  
Queries the execution state of the app with the specified package moniker.  
  
<a id="syntaxSection"></a>
  
## Syntax
  
```cpp
public:
HRESULT QueryExecutionState(
         LPCWSTR pszPackageMoniker,
         DWORD *dwState
)  
```
  
<a id="parametersSection"></a>
  
### Parameters
  
*pszPackageMoniker*  
Type: LPCWSTR  
  
A pointer to the package moniker of the app to query.  
  
*dwState*  
Type: DWORD\*  
  
A pointer that receives the execution state of the app. This parameter is set to one of the values listed in the following table.  
  
| Constant | Value | Description |  
| -------- | ----- | ----------- |  
| Unknown | 0 | The execution state of the app is unknown. |  
| Running | 1 | The app is currently running. |  
| Suspending | 2 | The app is in the process of suspending. |  
| Suspended | 3 | Execution of the app is currently suspended. |  
| Terminated | 4 | The app has been terminated. |  
  
<a id="retvalSection"></a>
  
### Return value
  
Type: HRESULT  
  
Returns `S_OK` if successful; otherwise, returns an HRESULT error code.  
  
<a id="remarksSection"></a>
  
## Remarks
  
This method queries the execution state of the app with the specified package name. This method is similar to the `xbapp query` command from the Application Management (xbapp.exe) tool,  included as part of the Xbox Tools Framework (XTF). For more information about the `xbapp query` command, see [Application Management (xbapp.exe) (NDA topic)](../../../../../../../tools-console/xbox-tools-and-apis/commandlinetools/xbapp.md).  
  
For more information about game life cycle states, see [Xbox Game Life Cycle (NDA topic)](../../../../../../../system/overviews/xbox-game-life-cycle.md).  
  
<a id="requirementsSection"></a>
  
## Requirements
  
**Header:** xtfapplication.h  
  
**Library:** xtfapplication.lib  
  
**Supported platforms:** Windows (for Xbox console tools)  
  
<a id="seealsoSection"></a>
  
## See also
  
[IXtfApplicationClient Interface](../ixtfapplicationclient-xtfapplication-xbox-microsoft-t.md)  
[XtfApplication](../../../xtfapplication-xbox-microsoft-n.md)  
  