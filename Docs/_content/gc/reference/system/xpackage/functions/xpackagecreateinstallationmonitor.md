---
author: M-Stahl
title: XPackageCreateInstallationMonitor
description: Creates a monitor of the state of an installation.
kindex: XPackageCreateInstallationMonitor
ms.author: brianpe
ms.topic: reference
edited: 05/18/2019
quality: good
security: public
applies-to: pc-gdk
---

# XPackageCreateInstallationMonitor  

Creates a monitor of the state of installation.  

## Syntax  
  
```cpp
HRESULT XPackageCreateInstallationMonitor(  
         const char* packageIdentifier,  
         uint32_t selectorCount,  
         XPackageChunkSelector* selectors,  
         uint32_t minimumUpdateIntervalMs,  
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


*selectors* &nbsp;&nbsp;\_In\_reads\_opt\_(selectorCount)  
Type: [XPackageChunkSelector*](../structs/xpackagechunkselector.md)  

  
An array of selectors that specify the chunks to be monitored.  


*minimumUpdateIntervalMs* &nbsp;&nbsp;\_In\_  
Type: uint32_t  

  
The monitor's resolution, in milliseconds.  


*queue* &nbsp;&nbsp;\_In\_opt\_  
Type: XTaskQueueHandle  

  
The queue where updates are performed.  


*installationMonitor* &nbsp;&nbsp;\_Out\_  
Type: XPackageInstallationMonitorHandle*  

  
On return, points to the created installation monitor.  


  
### Return value
Type: HRESULT
  
HRESULT success or error code.    
  
## Remarks  
  > [!NOTE]
> This function isn't safe to call on a time-sensitive thread. For more information, see [Time-sensitive threads](../../../../system/overviews/time-sensitive-threads.md).  
  
**XPackageCreateInstallationMonitor** creates a monitor that keeps track of the state of installation. The monitor updates and refreshes itself at a regular cadence governed by the specified update interval. Updates are scheduled on the specified task queue. An interval of zero specifies that updates are never to be performed and creates an installation monitor that's a one-time snapshot of the installation. If a zero interval is passed, the queue parameter can be null. 

To get the current progress of an installation, call [XPackageGetInstallationProgress](xpackagegetinstallationprogress.md); to get notified of a change during an installation, register a callback. This installation monitor can be created for the whole package or a particular subset.  


A game has implemented a launch marker, so it can be run before it's installed completely. The game will need to know which parts are installed and which are not. In this example, the game needs to know when the chunks associated with a racetrack with the specified track name are installed: 

```cpp 
void CALLBACK ProgressChangedCallback(
    void* /* context*/,
    XPackageInstallationMonitorHandle monitor)
{
    XPackageInstallationProgress progress;
    XPackageGetInstallationProgress(monitor, &progress);

    if (progress.completed)
    {
        printf("Track ready\n");
        XPackageCloseInstallationMonitorHandle(monitor);
    }
}

HRESULT StartMonitoring(XTaskQueueHandle queue, char* trackName)
{
    char id[XPACKAGE_IDENTIFIER_MAX_LENGTH];

    HRESULT hr = XPackageGetCurrentProcessPackageIdentifier(_countof(id), id);
    if (FAILED(hr)) return hr;

    XPackageChunkSelector selector;
    selector.type = XPackageChunkSelectorType::Tag;
    selector.tag = trackName;

    XPackageInstallationMonitorHandle monitor;
    hr = XPackageCreateInstallationMonitor(
        id,         // Identity to be monitored
        1,          // Number of selectors
        &selector,  // Selectors
        1000,       // Resolution of the monitor, in milliseconds
        queue,      // Queue where updates are performed
        &monitor);
    if (FAILED(hr)) return hr;

    XTaskQueueRegistrationToken token;
    hr = XPackageRegisterInstallationProgressChanged(
        monitor,
        nullptr,
        ProgressChangedCallback,
        &token);

    if (FAILED(hr))
    {
        XPackageCloseInstallationMonitorHandle(monitor);
    }

    return hr;
}
```
 
Let's walk through each API call in the code shown above:

```cpp
XPackageGetCurrentProcessPackageIdentifier(_countof(id), id); 
 ```
All installed content will have a unique identifier. You can monitor any package's installation if you know the package's identifier and have access to that content. A running process can get its own package identifier.

```cpp
XPackageCreateInstallationMonitor( 
    id,         // Identity to be monitored 
    1,          // Number of selectors 
    &selector,  // Selectors 
    1000,       // Resolution of the monitor, in milliseconds 
    queue,      // Queue where updates are performed 
    &monitor));  
```
 
This creates a monitor that keeps track of the state of installation. This installation monitor updates itself on a regular cadence. To get the current progress of an installation, call [XPackageGetInstallationProgress](xpackagegetinstallationprogress.md); to get notified of a change during an installation, register a callback. 

You may create the installation monitor for the whole package or a particular subset. Here, you have defined a "selector" that says you want to know about the installation progress for a track name. You can specify a frequency (in this case 1000 ms) that indicates how often the installation monitor will update its snapshot of progress, up to this speed. If no progress has been made in time, it could be slower. 

```cpp
hr = XPackageRegisterInstallationProgressChanged(
    monitor,
    nullptr,
    ProgressChangedCallback,
    &token);
 ```
You want to know when the track has finished loading, so you register a progress-change event on the monitor. This callback will be invoked through the task queue that was provided when the monitor was created, roughly at the cadence specified in [XPackageCreateInstallationMonitor](xpackagecreateinstallationmonitor.md). Inside the callback, you can render in-game progress or notify the game that a track is ready. 


In this example, you close the installation monitor but don't unregister the notification. The lifetime of an installation monitor notification is tied to the installation monitor; therefore, closing the monitor unregisters all notifications to it. 

## Requirements  
  
**Header:** XPackage.h
  
**Library:** xgameruntime.lib
  
**Supported platforms:** Windows, Xbox One family consoles and Xbox Series consoles  
  
## See also  
[XPackage](../xpackage_members.md)
  
  