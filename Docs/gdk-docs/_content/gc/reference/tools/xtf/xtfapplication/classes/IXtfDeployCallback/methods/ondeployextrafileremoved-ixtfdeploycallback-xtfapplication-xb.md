---
author: aablackm
title: OnDeployExtraFileRemoved
description: Callback invoked to report that an extra file on the console has been removed.
ms.assetid: M:Windows.Xbox.xtfapplication.IXtfDeployCallback.OnDeployExtraFileRemoved(LPCWSTR)
kindex:
- OnDeployExtraFileRemoved method
- IXtfDeployCallback--OnDeployExtraFileRemoved method
ms.author: stevenpr
ms.topic: reference
edited: 06/05/2019
security: public
---

# IXtfDeployCallback::OnDeployExtraFileRemoved
  
Callback invoked to report that an extra file on the console has been removed.  
  
<a id="syntaxSection"></a>
  
## Syntax
  
```cpp
public:
HRESULT OnDeployExtraFileRemoved(
         LPCWSTR pszFilePath
)  
```
  
<a id="parametersSection"></a>
  
### Parameters
  
*pszFilePath*  
Type: LPCWSTR  
  
The path to the extra file that was removed.  
  
<a id="retvalSection"></a>
  
### Return value
  
Type: HRESULT  
  
Returns `S_OK` to continue deployment, or an HRESULT error code to cancel the deployment.  
  
<a id="remarksSection"></a>
  
## Remarks
  
This callback is invoked only if the [IXtfApplicationClient::Deploy](../../IXtfApplicationClient/methods/deploy-ixtfapplicationclient-xtfapplication-xbox-microsoft-m.md) method is invoked with the `fRemoveExtraFiles` parameter set to TRUE, indicating that the deployment system should remove any file it finds on the console that is not on the deploying PC. This callback is called once for each extra file removed. For more information about how files are evaluated and when callbacks are invoked during the deployment process, see [IXtfDeployCallback Interface](../ixtfdeploycallback-xtfapplication-xbox-microsoft-t.md).  
  
As with the other callbacks for `IXtfDeployCallback`, the deployment process continues if this callback returns `S_OK`. If this callback returns any `HRESULT` error code, then the deployment process is canceled immediately. Files that have already been transferred or deleted remain as they are, and partially transferred files are closed in their truncated form. Another deployment must be completed to ensure that all files on the console are complete and up to date.  
  
<a id="requirementsSectoin"></a>
  
## Requirements  
  
**Header:** xtfapplication.h  
  
**Library:** xtfapplication.lib  
  
**Supported platforms:** Windows (for Xbox console tools)  
  
## See also
  
[IXtfDeployCallback Interface](../ixtfdeploycallback-xtfapplication-xbox-microsoft-t.md)  
[XtfApplication](../../../xtfapplication-xbox-microsoft-n.md)  
  