---
author: M-Stahl
title: XPackageInstallChunks
description: Starts the installation of chunks.
kindex: XPackageInstallChunks
ms.author: brianpe
ms.topic: reference
edited: 05/18/2019
security: public
applies-to: pc-gdk
---

# XPackageInstallChunks  

Starts the installation of chunks.  

## Syntax  
  
```cpp
HRESULT XPackageInstallChunks(  
         const char* packageIdentifier,  
         uint32_t selectorCount,  
         XPackageChunkSelector* selectors,  
         uint32_t minimumUpdateIntervalMs,  
         bool suppressUserConfirmation,  
         XTaskQueueHandle queue,  
         XPackageInstallationMonitorHandle* installationMonitor  
)  
```  
  
### Parameters  
  
*packageIdentifier* &nbsp;&nbsp;\_In\_z\_  
Type: char*  

  
A string that uniquely identifies the installed package on the disk. For more information about package identifiers, see [Manage and license downloadable content (DLC)](../../../../commerce/fundamentals/xstore-manage-and-license-optional-packages.md).    


*selectorCount* &nbsp;&nbsp;\_In\_  
Type: uint32_t  

  
The number of selectors in the *selectors* parameter.  


*selectors* &nbsp;&nbsp;\_In\_reads\_(selectorCount)  
Type: [XPackageChunkSelector*](../structs/xpackagechunkselector.md)  

  
An array of selectors that specify the chunks to be installed.  


*minimumUpdateIntervalMs* &nbsp;&nbsp;\_In\_  
Type: uint32_t  

  
The interval between updates, in milliseconds.  

*suppressUserConfirmation* &nbsp;&nbsp;\_In\_  
Type: bool  

  
If the chunks to be installed exceed a preset size, then a confirmation prompt will be displayed. If *suppressUserConfirmation* is true, then no prompt will be displayed and the installation will progress as if the user accepted. This lets the game present its own UI. If the game uses this, it should also call [XPackageEstimateDownloadSize](xpackageestimatedownloadsize.md) to get the size that will be presented to the user. [XPackageEstimateDownloadSize](xpackageestimatedownloadsize.md) also returns a Boolean, to indicate whether the size is large enough that a prompt is to be displayed. If a download confirmation is needed, then the game must either show it by using its own UI or let **XPackageInstallChunks** show it.  


*queue* &nbsp;&nbsp;\_In\_opt\_  
Type: XTaskQueueHandle  

  
The asynchronous queue on which work will be performed.


*installationMonitor* &nbsp;&nbsp;\_Out\_  
Type: XPackageInstallationMonitorHandle*  

  
On return, contains a handle to an installation monitor that will monitor the installation of the chunks that match the selector.  


  
### Return value
Type: HRESULT
  
HRESULT success or error code.  
Returns a cancellation error if the install is rejected.  

## Remarks
  > [!NOTE]
> This function isn't safe to call on a time-sensitive thread. For more information, see [Time-sensitive threads](../../../../system/overviews/time-sensitive-threads.md).  
  
Installation of chunks might involve prompting the user to accept the download size.

* If you use the synchronous version of this API, it will block until the user accepts or declines the download. If the user declines, the call will fail with the cancellation error E_ABORT. This will return an installation monitor you can use to monitor the installation status. The monitor must eventually be closed, by calling XPackageCloseInstallationMonitorHandle.   
* Setting suppressUserConfirmation to true will let you provide a custom UI that will prompt the user for the download.

This example will install the chunks that correspond to the “BigMaps” tag: 

```cpp
void CALLBACK BigMapsInstallProgress(
    void* /* context */,
    XPackageInstallationMonitorHandle monitor)
{
    XPackageInstallationProgress progress;
    XPackageGetInstallationProgress(monitor, &progress);
    if (progress.completed)
    {
        printf("BigMaps Installed\n");
        XPackageCloseInstallationMonitorHandle(monitor);
    }
}

HRESULT InstallBigMaps(XTaskQueueHandle queue)
{
    char id[XPACKAGE_IDENTIFIER_MAX_LENGTH];
    HRESULT hr = XPackageGetCurrentProcessPackageIdentifier(_countof(id), id);
    if (FAILED(hr)) return hr;

    XPackageChunkSelector selector;
    selector.type = XPackageChunkSelectorType::Tag;
    selector.tag = "BigMaps";

    XPackageInstallationMonitorHandle monitor;
    hr = XPackageInstallChunks(id, 1, &selector, 1000, false, queue, &monitor);

    if (SUCCEEDED(hr))
    {
        XTaskQueueRegistrationToken token;
        hr = XPackageRegisterInstallationProgressChanged(
            monitor,
            nullptr,
            BigMapsInstallProgress,
            &token);

        if (FAILED(hr))
        {
            XPackageCloseInstallationMonitorHandle(monitor);
        }
    }

    return hr;
}
```  

## Requirements  
  
**Header:** XPackage.h
  
**Library:** xgameruntime.lib  
  
**Supported platforms:** Windows, Xbox One family consoles and Xbox Series consoles  
  
## See also  
[XPackage](../xpackage_members.md)
  
  