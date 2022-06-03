---
author: M-Stahl
title: XPackageCloseInstallationMonitorHandle
description: Closes a specified installation monitor.
kindex: XPackageCloseInstallationMonitorHandle
ms.author: brianpe
ms.topic: reference
edited: 05/18/2019
quality: good
security: public
applies-to: pc-gdk
---

# XPackageCloseInstallationMonitorHandle  

Closes a specified installation monitor that was previously opened.  

## Syntax  
  
```cpp
void XPackageCloseInstallationMonitorHandle(  
         XPackageInstallationMonitorHandle installationMonitor  
)  
```  
  
### Parameters  
  
*installationMonitor* &nbsp;&nbsp;\_In\_  
Type: XPackageInstallationMonitorHandle  

  
A handle to the installation monitor to be closed.  
  
### Return value
Type: void
  
## Remarks  
 
 Any installation monitor that you use to monitor the installation status must eventually be closed by calling **XPackageCloseInstallationMonitorHandle**. 

 A game has implemented a launch marker, so it can be run before it's installed completely. The game will need to know which parts are installed and which are not. In this example, the game needs to know when the chunks associated with a racetrack with the specified track name are installed: 

```cpp 
void CALLBACK ProgressChangedCallback( 
    void* /* context*/, XPackageInstallationMonitorHandle monitor) 
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
All installed content will have a unique identifier. You can monitor any package installation if you know its package identifier and you have access to that content. A running process can get its own package identifier. For more information about package identifiers, see [Manage and license downloadable content (DLC)](../../../../commerce/fundamentals/xstore-manage-and-license-optional-packages.md). 

```cpp
XPackageCreateInstallationMonitor( 
    id,         // Identity to be monitored 
    1,          // Number of selectors 
    &selector,  // Selectors 
    1000,       // Resolution of the monitor, in milliseconds 
    queue,      // Queue where updates are performed 
    &monitor);  
```
 
This creates a monitor that keeps track of the state of installation. This installation monitor updates itself on a regular cadence. To get the current progress of an installation, call [XPackageGetInstallationProgress](xpackagegetinstallationprogress.md); to get notified of a change during an installation, register a callback. 


You may create the installation monitor for the whole package or a particular subset. Here, you have defined a "selector" that says you want to know about the installation progress for a track name. You can specify a frequency (in this case 1000 ms) that indicates how often the installation monitor will update its snapshot of progress, up to this speed. If no progress has been made in time, it could be slower. 

```cpp
HRESULT hr = XPackageRegisterInstallationProgressChanged( 
    monitor, 
    this, 
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
  
  