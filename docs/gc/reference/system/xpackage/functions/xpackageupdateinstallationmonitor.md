---
author: M-Stahl
title: XPackageUpdateInstallationMonitor
description: Refreshes the progress returned from [XPackageGetInstallationProgress](xpackagegetinstallationprogress.md).
kindex: XPackageUpdateInstallationMonitor
ms.author: brianpe
ms.topic: reference
edited: 05/18/2019
quality: good
security: public
applies-to: pc-gdk
---

# XPackageUpdateInstallationMonitor  

Refreshes the progress returned from [XPackageGetInstallationProgress](xpackagegetinstallationprogress.md).  

## Syntax  
  
```cpp
bool XPackageUpdateInstallationMonitor(  
         XPackageInstallationMonitorHandle installationMonitor  
)  
```  
  
### Parameters  
  
*installationMonitor* &nbsp;&nbsp;\_In\_  
Type: XPackageInstallationMonitorHandle  

  
The handle to the installation monitor to be updated.  

  
### Return value
Type: bool  
  
If any aspect of the progress snapshot has changed, returns true. Otherwise, returns false.
  
## Remarks  
  > [!NOTE]
> This function isn't safe to call on a time-sensitive thread. For more information, see [Time-sensitive threads](../../../../system/overviews/time-sensitive-threads.md).  
  
**XPackageUpdateInstallationMonitor** can be called to refresh the progress returned from [XPackageGetInstallationProgress](xpackagegetinstallationprogress.md). If the installation monitor's refresh cadence is not zero, this API will be automatically called on the refresh cadence from a timer thread. To control which thread updates the progress, set the cadence to zero and call this yourself. **XPackageUpdateInstallationMonitor** returns true if any aspect of the progress snapshot has changed. 

The following is an example of using **XPackageUpdateInstallationMonitor** to manually poll an installation monitor to determine whether installation of a game is completed. After installation is completed, this code closes the monitor handle. 

```cpp
bool CheckIfInstalled(XPackageInstallationMonitorHandle monitor)
{
    XPackageInstallationProgress progress;
    XPackageGetInstallationProgress(monitor, &progress);

    if (!progress.completed && XPackageUpdateInstallationMonitor(monitor))
    {
        XPackageGetInstallationProgress(monitor, &progress);
    }

    if (progress.completed)
    {
        XPackageCloseInstallationMonitorHandle(monitor);
    }

    return progress.completed;
}
```

## Requirements  
  
**Header:** XPackage.h
  
**Library:** xgameruntime.lib  
  
**Supported platforms:** Windows, Xbox One family consoles and Xbox Series consoles  
  
## See also  
[XPackage](../xpackage_members.md)  
[Streaming Installation and Intelligent Delivery](../../../../packaging/overviews/streaming_install-intelligent_delivery.md)   
  [XPackageGetInstallationProgress](xpackagegetinstallationprogress.md)
  
  