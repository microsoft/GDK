---
author: aablackm
title: OnDeployExtraFileDetected
description: Callback invoked when an extra file has been detected.
ms.assetid: M:Windows.Xbox.xtfapplication.IXtfDeployCallback.OnDeployExtraFileDetected(LPCWSTR)
kindex:
- OnDeployExtraFileDetected method
- IXtfDeployCallback--OnDeployExtraFileDetected method
ms.author: stevenpr
ms.topic: reference
edited: 06/05/2019
security: public
---

# IXtfDeployCallback::OnDeployExtraFileDetected
  
Callback invoked when an extra file has been detected.  
  
<a id="syntaxSection"></a>
  
## Syntax
  
```cpp
public:
HRESULT OnDeployExtraFileDetected(
         LPCWSTR pszFilePath
)  
```
  
<a id="parametersSection"></a>
  
### Parameters
  
*pszFilePath*  
Type: LPCWSTR  
  
The absolute path to the extra file, on the console.  
  
<a id="retvalSection"></a>
  
### Return value
  
Type: HRESULT  
  
Returns `S_OK` to continue deployment, or an HRESULT error code to cancel the deployment.  
  
<a id="remarksSection"></a>
  
## Remarks
  
This callback is invoked when the deployment system finds a file on the console that is not on the deploying PC. This callback is called once for each extra file detected. For more information about how files are evaluated and when callbacks are invoked during the deployment process, see [IXtfDeployCallback Interface](../ixtfdeploycallback-xtfapplication-xbox-microsoft-t.md).  
  
As with the other callbacks for `IXtfDeployCallback`, the deployment process continues if this callback returns `S_OK`. If this callback returns any `HRESULT` error code, then the deployment process is canceled immediately. Files that have already been transferred or deleted remain as they are, and partially transferred files are closed in their truncated form. Another deployment must be completed to ensure that all files on the console are complete and up to date.  
  
<a id="requirementsSection"></a>
  
## Requirements
  
**Header:** xtfapplication.h  
  
**Library:** xtfapplication.lib  
  
**Supported platforms:** Windows (for Xbox console tools)  
  
<a id="seealsoSection"></a>
  
## See also
  
[IXtfDeployCallback Interface](../ixtfdeploycallback-xtfapplication-xbox-microsoft-t.md)  
[XtfApplication](../../../xtfapplication-xbox-microsoft-n.md)  
  