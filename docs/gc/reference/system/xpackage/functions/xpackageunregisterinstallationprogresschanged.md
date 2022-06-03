---
author: M-Stahl
title: XPackageUnregisterInstallationProgressChanged
description: Unregisters a previously registered install progress changed callback.
kindex: XPackageUnregisterInstallationProgressChanged
ms.author: brianpe
ms.topic: reference
edited: 05/21/2019
security: public
applies-to: pc-gdk
---

# XPackageUnregisterInstallationProgressChanged  

Unregisters a previously registered installation progress changed callback.  

## Syntax  
  
```cpp
bool XPackageUnregisterInstallationProgressChanged(  
         XPackageInstallationMonitorHandle installationMonitor,  
         XTaskQueueRegistrationToken token,  
         bool wait  
)  
```  
  
### Parameters  
  
*installationMonitor* &nbsp;&nbsp;\_In\_  
Type: XPackageInstallationMonitorHandle  

  
The installation monitor from which the specified callback is to be removed.  


*token* &nbsp;&nbsp;\_In\_  
Type: [XTaskQueueRegistrationToken](../../xtaskqueue/structs/xtaskqueueregistrationtoken.md)  

  
The token returned by [XPackageRegisterInstallationProgressChanged](xpackageregisterinstallationprogresschanged.md).  

*wait* &nbsp;&nbsp;\_In\_  
Type: bool  

  
Indicates whether to block until any pending callbacks are completed.


  
### Return value
Type: bool
  
If *wait* is false and unregistration is pending, returns false. Otherwise, returns true.


  
  
## Remarks
  > [!NOTE]
> This function isn't safe to call on a time-sensitive thread. For more information, see [Time-sensitive threads](../../../../system/overviews/time-sensitive-threads.md).  
  
Unregistration of a notification behaves as follows:  

* From the set of registered callbacks, unregistration removes the callback associated with the token.  
* If no callbacks are executing for that callback token, the call returns true.  
* If callbacks are executing and *wait* is true, the call will block until the executing callback has finished.  
* If callbacks are executing and *wait* is false, the call will not block but will return false. After the callback for the token is completed, the token is unregistered automatically.  
  
This mechanism allows for the following coding patterns:  
  
1. You can block on unregistration to ensure your callbacks are never invoked after a call to unregister.  
2. You can choose not to block. To ensure that your callbacks are completed before deleting data, periodically call unregister with false for *wait*. When it finally returns true, all your callbacks are done and you can delete the state.  
3. If your callback doesn't care whether it's being invoked during an unregister call, you can just pass false for *wait* and ignore the return value.  

Example:

```cpp
XPackageUnregisterInstallationProgressChanged(monitor, token, false); 
```

## Requirements  
  
**Header:** XPackage.h
  
**Library:** xgameruntime.lib  
  
**Supported platforms:** Windows, Xbox One family consoles and Xbox Series consoles  
  
## See also  
[XPackage](../xpackage_members.md)  
[Streaming Installation and Intelligent Delivery](../../../../packaging/overviews/streaming_install-intelligent_delivery.md)   

  