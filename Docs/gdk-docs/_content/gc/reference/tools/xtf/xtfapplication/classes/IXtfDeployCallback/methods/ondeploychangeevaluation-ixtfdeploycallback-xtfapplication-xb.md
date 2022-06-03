---
author: aablackm
title: OnDeployChangeEvaluation
description: Callback invoked when evaluating which files need to be transferred or deleted.
ms.assetid: M:Windows.Xbox.xtfapplication.IXtfDeployCallback.OnDeployChangeEvaluation(ULONGLONG,ULONGLONG)
kindex:
- OnDeployChangeEvaluation method
- IXtfDeployCallback--OnDeployChangeEvaluation method
ms.author: stevenpr
ms.topic: reference
edited: 06/05/2019
security: public
---

# IXtfDeployCallback::OnDeployChangeEvaluation
  
Callback invoked when evaluating which files need to be transferred or deleted.  
  
<a id="syntaxSection"></a>
  
## Syntax
  
```cpp
public:
HRESULT OnDeployChangeEvaluation(
         ULONGLONG ullFilesProcessed,
         ULONGLONG ullTotalFiles
)  
```
  
<a id="parametersSection"></a>
  
### Parameters
  
*ullFilesProcessed*  
Type: ULONGLONG  
  
The number of files that have been evaluated so far.  
  
*ullTotalFiles*  
Type: ULONGLONG  
  
The total number of files to be evaluated.  
  
<a id="retvalSection"></a>
  
### Return value
  
Type: HRESULT  
  
Returns `S_OK` to continue deployment, or an HRESULT error code to cancel the deployment.  
  
<a id="remarksSection"></a>
  
## Remarks
  
This callback is invoked when the deployment system is evaluating which files need to be deployed to the console or deleted from the console. You can use this callback to update a progress indicator. For more information about how files are evaluated and when callbacks are invoked during the deployment process, see [IXtfDeployCallback Interface](../ixtfdeploycallback-xtfapplication-xbox-microsoft-t.md).  
  
As with the other callbacks for `IXtfDeployCallback`, the deployment process continues if this callback returns `S_OK`. If this callback returns any `HRESULT` error code, then the deployment process is canceled immediately. Files that have already been transferred or deleted remain as they are, and partially transferred files are closed in their truncated form. Another deployment must be completed to ensure that all files on the console are complete and up to date.  
  
If you are deploying a game or app that has not been registered on the target console, then all files must be deployed, and this callback will not be invoked at all.  
  
<a id="requirementsSection"></a>
  
## Requirements
  
**Header:** xtfapplication.h  
  
**Library:** xtfapplication.lib  
  
**Supported platforms:** Windows (for Xbox console tools)  
  
<a id="seealsoSection"></a>
  
## See also
  
[IXtfDeployCallback Interface](../ixtfdeploycallback-xtfapplication-xbox-microsoft-t.md)  
[XtfApplication](../../../xtfapplication-xbox-microsoft-n.md)  
  