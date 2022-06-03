---
author: aablackm
title: IXtfDeployCallback Interface (Interface contents)
description: Provides a callback that is called when a trackable action occurs during an IXtfApplicationClient::Deploy Method    operation.
ms.assetid: T:Windows.Xbox.xtfapplication.IXtfDeployCallback
kindex: IXtfDeployCallback interface, about
ms.author: stevenpr
ms.topic: navigation
edited: 00/00/0000
security: public
---

# IXtfDeployCallback Interface
Provides a callback that is called when a trackable action occurs during an [IXtfApplicationClient::Deploy](../IXtfApplicationClient/methods/deploy-ixtfapplicationclient-xtfapplication-xbox-microsoft-m.md) operation.   

<a id="syntaxSection"></a>



## Syntax  

```cpp
interface IXtfDeployCallback : public IUnknown  
```

  
## Methods  
  
| Method | Description |  
| --- | --- |  
| [OnDeployChangeEvaluation](methods/ondeploychangeevaluation-ixtfdeploycallback-xtfapplication-xb.md) | Callback invoked when evaluating which files need to be transferred or deleted. |  
| [OnDeployError](methods/ondeployerror-ixtfdeploycallback-xtfapplication-xbox-windows-.md) | Reserved for internal use. |  
| [OnDeployExtraFileDetected](methods/ondeployextrafiledetected-ixtfdeploycallback-xtfapplication-x.md) | Callback invoked when an extra file has been detected. |  
| [OnDeployExtraFileRemoved](methods/ondeployextrafileremoved-ixtfdeploycallback-xtfapplication-xb.md) | Callback invoked to report that an extra file on the console has been removed. |  
| [OnDeployFileProgress](methods/ondeployfileprogress-ixtfdeploycallback-xtfapplication-xbox-w.md) | Callback invoked to report progress in deploying a file to the console |  
| [OnDeployInitialized](methods/ondeployinitialized-ixtfdeploycallback-xtfapplication-xbox-wi.md) | Callback invoked when deployment begins. |  
| [OnDeployMetrics](methods/ondeploymetrics-ixtfdeploycallback-xtfapplication-xbox-window.md) | Callback invoked when deployment metrics are reported. |  


<a id="requirements"></a>


## Remarks

All of the callback methods work in the same way with respect to their return values. If a callback returns a successful HResult, then the deployment process continues. If a callback returns any failure HResult, then the deployment process is canceled immediately. Files that have already been transferred or deleted remain as they are, and partially transferred files are closed in their truncated form.   


The callback process is simple. Each file on the deploying development PC is compared to its corresponding file on the target console.   

   *  If a file is the same on PC and console, nothing more is done.  
   *  If a file on the PC is newer than the file on the console, the file is copied from PC to console.  
   *  If a file exists on the PC and is not on the console, it is copied to the console.  
   *  If a file exists on the console, but not on the PC, it is optionally deleted from the console. (Whether it is deleted is determined by the value of the fRemoveExtraFiles parameter to [Deploy](../IXtfApplicationClient/methods/deploy-ixtfapplicationclient-xtfapplication-xbox-microsoft-m.md)).   



Callback methods are invoked at the appropriate time during the deployment process.   

   1. [OnDeployInitialized](methods/ondeployinitialized-ixtfdeploycallback-xtfapplication-xbox-wi.md): This callback is invoked when the deployment system has been engaged, and can be used to start timing deployment or initializing progress dialogs. When this callback has been invoked, all potential interop and DLL boundary crossings have been successfully completed. This callback is invoked once per deployment.   
   1. [OnDeployChangeEvaluation](methods/ondeploychangeevaluation-ixtfdeploycallback-xtfapplication-xb.md): This callback is invoked when the deployment system is evaluating which files need to be deployed to the console or deleted from the console. You can use this callback to update a progress indicator.   
   1. [OnDeployMetrics](methods/ondeploymetrics-ixtfdeploycallback-xtfapplication-xbox-window.md): This callback is invoked once at the end of the evaluation process, to report how many files will be deployed to the console and the total number of bytes to be transferred.   
   1. [OnDeployFileProgress](methods/ondeployfileprogress-ixtfdeploycallback-xtfapplication-xbox-w.md): This callback is invoked each time a buffer block is successfully transferred, per file. Transfers are performed on multiple threads simultaneously, so your code must ensure that it is tracking progress by filename, and protect agains normal multi-threading issues. This callback is called once at the start of a transfer and once at the end of the transfer, so a zero-length file will cause two invocations of this callback.   
   1. [OnDeployExtraFileDetected](methods/ondeployextrafiledetected-ixtfdeploycallback-xtfapplication-x.md): Indicates that a file was found on the console that is not on the PC.   
   1. [OnDeployExtraFileRemoved](methods/ondeployextrafileremoved-ixtfdeploycallback-xtfapplication-xb.md): If the fRemoveExtraFiles parameter to [Deploy](../IXtfApplicationClient/methods/deploy-ixtfapplicationclient-xtfapplication-xbox-microsoft-m.md) was set to TRUE, this callback is invoked when a file is deleted from the console.   
   1. [OnDeployError](methods/ondeployerror-ixtfdeploycallback-xtfapplication-xbox-windows-.md) is not used by the current implementation, but is reserved for future use.   



If you want to indicate overall deployment progress, your code should report the number of different files named in OnDeployFileProgress callbacks so far, as a percentage of the total number of files reported to the OnDeployMetrics callback.   



## Requirements  

**Header:** xtfapplication.h  

**Library:** xtfapplication.lib  
  
**Supported platforms:** Windows (for Xbox console tools)  
  
<a id="ID4EKD"></a>



## See also  

<a id="ID4EMD"></a>



##### Reference  

[XtfApplication](../../xtfapplication-xbox-microsoft-n.md)