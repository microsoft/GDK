---
author: aablackm
title: OnDeployFileProgress
description: Callback invoked to report progress in deploying a file to the console
ms.assetid: M:Windows.Xbox.xtfapplication.IXtfDeployCallback.OnDeployFileProgress(LPCWSTR,ULONGLONG,ULONGLONG)
kindex:
- OnDeployFileProgress method
- IXtfDeployCallback--OnDeployFileProgress method
ms.author: stevenpr
ms.topic: reference
edited: 06/05/2019
security: public
---

# IXtfDeployCallback::OnDeployFileProgress
  
Callback invoked to report progress in deploying a file to the console.  
  
<a id="syntaxSection"></a>
  
## Syntax
  
```cpp
public:
HRESULT OnDeployFileProgress(
         LPCWSTR pszFilePath,
         ULONGLONG ullBytesTransferred,
         ULONGLONG ullFileSize
)  
```
  
<a id="parametersSection"></a>
  
### Parameters
  
*pszFilePath*  
Type: LPCWSTR  
  
The path of the file being deployed.  
  
*ullBytesTransferred*  
Type: ULONGLONG  
  
The number of bytes transferred so far.  
  
*ullFileSize*  
Type: ULONGLONG  
  
The total size of the file being transferred, in bytes.  
  
<a id="retvalSection"></a>
  
### Return value
  
Type: HRESULT  
  
Returns `S_OK` to continue deployment, or an HRESULT error code to cancel the deployment.  
  
<a id="remarksSection"></a>
  
## Remarks
  
This callback is invoked when the deployment system transfers files from the deploying PC to the console. This callback is called once for each buffer block that is successfully transferred for a file. This callback is always invoked at least twice for each successfully transferred file: once at the start of the deployment, and once at the end of deployment. If a zero-length file is deployed, both invocations report that zero bytes out of zero bytes have been transferred. For more information about how files are evaluated and when callbacks are invoked during the deployment process, see [IXtfDeployCallback Interface](../ixtfdeploycallback-xtfapplication-xbox-microsoft-t.md).  
  > [!NOTE]
> The file transfer process for deployment uses multiple threads. Your code must ensure that it correlates progress messages by `pszFilePath` and protects against typical multi-threading issues.
  
As with the other callbacks for `IXtfDeployCallback`, the deployment process continues if this callback returns `S_OK`. If this callback returns any `HRESULT` error code, then the deployment process is canceled immediately. Files that have already been transferred or deleted remain as they are, and partially transferred files are closed in their truncated form. Another deployment must be completed to ensure that all files on the console are complete and up to date.  
  
## Requirements  
  
**Header:** xtfapplication.h  
  
**Library:** xtfapplication.lib  
  
**Supported platforms:** Windows (for Xbox console tools)  
  
## See also
  
[IXtfDeployCallback Interface](../ixtfdeploycallback-xtfapplication-xbox-microsoft-t.md)  
[XtfApplication](../../../xtfapplication-xbox-microsoft-n.md)  
  