---
author: M-Stahl
title: XPackageUnregisterPackageInstalled
description: Unregisters a previously registered install complete callback.
kindex: XPackageUnregisterPackageInstalled
ms.author: brianpe
ms.topic: reference
edited: 05/21/2019
security: public
applies-to: pc-gdk
---

# XPackageUnregisterPackageInstalled  

Unregisters a previously registered package installed callback.  

## Syntax  
  
```cpp
bool XPackageUnregisterPackageInstalled(  
         XTaskQueueRegistrationToken token,  
         bool wait  
)  
```  
  
### Parameters  
  
*token* &nbsp;&nbsp;\_In\_  
Type: [XTaskQueueRegistrationToken](../../xtaskqueue/structs/xtaskqueueregistrationtoken.md)  

  
The token returned by [XPackageRegisterPackageInstalled](xpackageregisterpackageinstalled.md).  

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

The following code sample illustrates the use of **XPackageUnregisterPackageInstalled**:

```cpp
void StopListeningForDlc(XTaskQueueRegistrationToken token)
{
    XPackageUnregisterPackageInstalled(token, false);
}  
``` 
  
  
## Requirements  
  
**Header:** XPackage.h
  
**Library:** xgameruntime.lib  
  
**Supported platforms:** Windows, Xbox One family consoles and Xbox Series consoles  
  
## See also  
[XPackage](../xpackage_members.md)      
[How to create and use Downloadable Content Packages (DLC) for PC and Xbox One](../../../../packaging/packaging-downloadable-content-dlc.md)      

  