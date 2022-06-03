---
author: M-Stahl
title: 'Streaming installation: status'
description: Describes how titles can monitor the progress of installation.
kindex: Streaming Installation- Status
ms.author: brianhud
ms.topic: conceptual
edited: '08/07/2019'
security: public
---

# Streaming installation: status

While an installation is in progress and a user is playing, the title must track the content necessary for supporting gameplay and check whether the required content has been installed. A title can use system APIs to query for the status of chunks on the hard drive and for the progress of the content that's downloading. 

If the user attempts to enter a portion of gameplay that requires content that's not yet installed, the title should inform the user of this by displaying a dialog box or a progress bar, and it should communicate the progress of the installation. Also, the title should always offer the user the option of navigating away from the progress screen&mdash;ideally, to let the user experience content while it's installed. Following is an example.
  
While playing the single-player campaign of a shooter title, the user gets to the point where the content for supporting the next area of the campaign isn't yet installed. A good user experience would be to display a progress bar that shows the status of content acquisition along with an option to join a multiplayer game. This option would be enabled by including a subset of multiplayer content as part of the data required for launching the title.
   
A title can monitor and verify installation, and it can receive an alert upon the completion of an installation. You can monitor the installation of a whole package or a subset of chunks from the package. To create an installation monitor, use [XPackageCreateInstallationMonitor](../reference/system/xpackage/functions/xpackagecreateinstallationmonitor.md). Specify that the monitor is for one of the following:  
* A certain set of chunks by specifying selectors as parameters
* The whole package by specifying zero selectors

After creating the installation monitor, register a handler for one of the following: 
* The _installation progress changed_ event by using [XPackageRegisterInstallationProgressChanged](../reference/system/xpackage/functions/xpackageregisterinstallationprogresschanged.md)
* The _package installed_ event by using [XPackageRegisterPackageInstalled](../reference/system/xpackage/functions/xpackageregisterpackageinstalled.md)
  
The _package installed_ event indicates when the entire package has finished installing. The _progress changed_ event allows you to monitor the progress of the installation. Note that the _progress changed_ event also indicates when installation has completed, so it's not necessary to register a _package installed_ handler if you have already registered a _progress changed_ handler. Following is an example.

A game has implemented a launch marker, so it can be run before it's completely installed. The game will need to know which parts are installed and which aren't. To present available tracks to the user, the game needs to know when the chunks are installed that are associated with a race track that has a particular track name.

```cpp
class GameTrackMonitor 
{ 
public: 
 
    HRESULT StartMonitoring(XTaskQueueHandle queue, const char* trackName) 
    { 
        char id[PACKAGE_IDENTIFIER_MAX_LENGTH]; 
 
        XPackageChunkSelector selector; 
        selector.type = XPackageChunkSelectorType::Tag; 
        selector.tag = trackName; 
 
        RETURN_IF_FAILED(XPackageGetCurrentProcessPackageIdentifier(_countof(id), id)); 
 
        XPackageInstallationMonitorHandle monitor; 
 
        RETURN_IF_FAILED(XPackageCreateInstallationMonitor( 
            id,         // Identity to monitor. 
            1,          // Number of selectors. 
            &selector,  // Selectors. 
            1000,       // Resolution of monitor in ms. 
            queue,      // Queue where updates are performed. 
            &monitor)); 
 
        XTaskQueueRegistrationToken token; 
 
        HRESULT hr = XPackageRegisterInstallationProgressChanged( 
            monitor, 
            this, 
            [](void *context, XPackageInstallationMonitorHandle monitor) 
        { 
            GameTrackMonitor* pthis = static_cast<GameTrackMonitor*>(context); 
            XPackageInstallationProgress progress; 
 
            XPackageGetInstallationProgress(monitor, &progress); 
            pthis->DrawProgress(progress); 
            if (progress.completed) 
            { 
                pthis->TrackReady(); 
                XPackageCloseInstallationMonitorHandle(monitor); 
            } 
        }, &token); 
 
        if (FAILED(hr)) 
        { 
            XPackageCloseInstallationMonitorHandle(monitor); 
        } 
 
        return hr; 
    } 
 
private: 
 
    void DrawProgress(const XPackageInstallationProgress& progress) 
    { 
        // ... 
    } 
 
    void TrackReady() 
    { 
        // ... 
    } 
};
```

