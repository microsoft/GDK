---
author: aablackm
title: OnDeployMetrics
description: Callback invoked when deployment metrics are reported.
ms.assetid: M:Windows.Xbox.xtfapplication.IXtfDeployCallback.OnDeployMetrics(ULONGLONG,ULONGLONG)
kindex:
- OnDeployMetrics method
- IXtfDeployCallback--OnDeployMetrics method
ms.author: stevenpr
ms.topic: reference
edited: 06/05/2019
security: public
---

# IXtfDeployCallback::OnDeployMetrics method
  
Callback invoked when deployment metrics are reported.  
  
<a id="syntaxSection"></a>
  
## Syntax
  
```cpp
public:
HRESULT OnDeployMetrics(
         ULONGLONG ullTotalFiles,
         ULONGLONG ullTotalBytes
)  
```
  
<a id="parametersSection"></a>
  
### Parameters
  
*ullTotalFiles*  
Type: ULONGLONG  
  
Number of files that will be deployed.  
  
*ullTotalBytes*  
Type: ULONGLONG  
  
Number of bytes that will be transferred during deployment.  
  
<a id="retvalSection"></a>
  
### Return value
  
Type: HRESULT  
  
Returns `S_OK` to continue deployment, or an HRESULT error code to cancel the deployment.  
  
<a id="remarksSection"></a>
  
## Remarks
  
This callback is invoked once, after the deployment system evaluates which files need to be deployed to the console or deleted from the development console, to report the expected total number of files to be deployed and bytes to be transferred during deployment. For more information about how files are evaluated and when callbacks are invoked during the deployment process, see [IXtfDeployCallback Interface](../ixtfdeploycallback-xtfapplication-xbox-microsoft-t.md).  
  
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
  