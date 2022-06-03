---
author: M-Stahl
title: XPackageIsPackagedProcess
description: Returns a Boolean that indicates whether the current process has an installation identity.
kindex: XPackageIsPackagedProcess
ms.author: brianpe
ms.topic: reference
edited: 05/18/2019
security: public
applies-to: pc-gdk
---

# XPackageIsPackagedProcess  

Returns a Boolean that indicates whether the current process has an installation identity.  

## Syntax  
  
```cpp
bool XPackageIsPackagedProcess(  
)  
```  
  
### Parameters  

None.

  
### Return value
Type: bool
  
If the process has an installation identity, it returns true. Otherwise, it returns false.  
  
## Remarks

You can determine whether a game is fully installed. The following code example works for packaged MSICVC games and for loose deployments. The return value ``bool *isInstalled`` is set to true if the game is fully installed.

```cpp
HRESULT IsPackageCompletelyInstalled(bool *isInstalled)
{
    if (XPackageIsPackagedProcess())
    {
        char id[XPACKAGE_IDENTIFIER_MAX_LENGTH];
        HRESULT hr = XPackageGetCurrentProcessPackageIdentifier(_countof(id), id);
        if (FAILED(hr)) return hr;

        XPackageInstallationMonitorHandle monitor;
        hr = XPackageCreateInstallationMonitor(id, 0, nullptr, 0, nullptr, &monitor);
        if (FAILED(hr)) return hr;

        XPackageInstallationProgress progress;
        XPackageGetInstallationProgress(monitor, &progress);

        *isInstalled = (progress.completed);

        XPackageCloseInstallationMonitorHandle(monitor);
    }
    else
    {
        *isInstalled = true;
    }

    return S_OK;
}
 ```

## Requirements  
  
**Header:** XPackage.h
  
**Library:** xgameruntime.lib
  
**Supported platforms:** Windows, Xbox One family consoles and Xbox Series consoles  
  
## See also  

[Overview of Packaging](../../../../packaging/overviews/packaging.md)  
[Streaming Installation and Intelligent Delivery](../../../../packaging/overviews/streaming_install-intelligent_delivery.md)  
[XPackage](../xpackage_members.md)  

    

  
  