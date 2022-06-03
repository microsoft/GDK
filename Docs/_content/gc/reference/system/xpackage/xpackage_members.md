---
author: M-Stahl
title: XPackage (API contents)
description: Reference material for XPackage APIs.
kindex: XPackage
ms.author: scotmi
ms.topic: navigation
edited: 00/00/0000
security: public
applies-to: pc-gdk
---

# XPackage
  
Reference material for XPackage APIs.  
  
  
## Functions  
  
| Function | Description |  
| --- | --- |  
| [XPackageChangeChunkInstallOrder](functions/xpackagechangechunkinstallorder.md) | Sets the selected chunks to install first. |  
| [XPackageChunkAvailabilityCallback](functions/xpackagechunkavailabilitycallback.md) | A user-defined callback used by [XPackageEnumerateChunkAvailability](functions/xpackageenumeratechunkavailability.md). |  
| [XPackageCloseInstallationMonitorHandle](functions/xpackagecloseinstallationmonitorhandle.md) | Closes a specified installation monitor. |  
| [XPackageCloseMountHandle](functions/xpackageclosemounthandle.md) | Closes the specified mount handle. |  
| [XPackageCreateInstallationMonitor](functions/xpackagecreateinstallationmonitor.md) | Creates a monitor of the state of an installation. |  
| [XPackageEnumerateChunkAvailability](functions/xpackageenumeratechunkavailability.md) | Examines the installation package and enumerates the availability of all chunks that match the specified selectors. |  
| [XPackageEnumerateFeatures](functions/xpackageenumeratefeatures.md) | Enumerates features defined in the package's layout file. |  
| [XPackageEnumeratePackages](functions/xpackageenumeratepackages.md) | Finds installed or installing packages related to the calling process. |  
| [XPackageEnumerationCallback](functions/xpackageenumerationcallback.md) | A callback used by [XPackageEnumeratePackages](functions/xpackageenumeratepackages.md). |  
| [XPackageEstimateDownloadSize](functions/xpackageestimatedownloadsize.md) | Computes the download size of the chunks that match the specified installation selectors. |  
| [XPackageFeatureEnumerationCallback](functions/xpackagefeatureenumerationcallback.md) | The callback used by XPackageEnumerateFeatures to enumerate each feature. |  
| [XPackageFindChunkAvailability](functions/xpackagefindchunkavailability.md) | Returns the minimum availability for the collection of chunks that match the specified selectors. |  
| [XPackageGetCurrentProcessPackageIdentifier](functions/xpackagegetcurrentprocesspackageidentifier.md) | Returns an installation identity string that identifies the installation for this process. |  
| [XPackageGetInstallationProgress](functions/xpackagegetinstallationprogress.md) | Returns the current progress of an installation. |  
| [XPackageGetMountPath](functions/xpackagegetmountpath.md) | Gets the path to a mounted installation. |  
| [XPackageGetMountPathSize](functions/xpackagegetmountpathsize.md) | Gets the size required for an array to hold a mount path returned by [XPackageGetMountPath](functions/xpackagegetmountpath.md). |  
| [XPackageGetUserLocale](functions/xpackagegetuserlocale.md) | Gets the current user locale. |  
| [XPackageGetWriteStats](functions/xpackagegetwritestats.md) | Gets the output write statistics (writeStats). |  
| [XPackageInstallationProgressCallback](functions/xpackageinstallationprogresscallback.md) | A callback used by [XPackageRegisterInstallationProgressChanged](functions/xpackageregisterinstallationprogresschanged.md). |  
| [XPackageInstallChunks](functions/xpackageinstallchunks.md) | Starts the installation of chunks. |  
| [XPackageInstallChunksAsync](functions/xpackageinstallchunksasync.md) | Starts installation of chunks. |  
| [XPackageInstallChunksResult](functions/xpackageinstallchunksresult.md) | Retrieves the result of a call to [XPackageInstallChunksAsync](functions/xpackageinstallchunksasync.md). |  
| [XPackageInstalledCallback](functions/xpackageinstalledcallback.md) | A user-defined callback used by the XPackageRegisterPackageInstalled function. |  
| [XPackageIsPackagedProcess](functions/xpackageispackagedprocess.md) | Returns a Boolean that indicates whether the current process has an installation identity. |  
| [XPackageMount](functions/xpackagemount.md) | Mounts the installation of specified content, and returns a mount handle to it. |  
| [XPackageRegisterInstallationProgressChanged](functions/xpackageregisterinstallationprogresschanged.md) | Registers a callback to be called when installation progress changes. |  
| [XPackageRegisterPackageInstalled](functions/xpackageregisterpackageinstalled.md) | Registers a callback to be called when an installation is completed. |  
| [XPackageUninstallChunks](functions/xpackageuninstallchunks.md) | Uninstalls chunks that match the specified selectors. |  
| [XPackageUninstallUWPInstance](functions/xpackageuninstalluwpinstance.md) | Uninstalls a Universal Windows Platform (UWP) instance of a particular package for the current user if one is currently installed. |  
| [XPackageUnregisterInstallationProgressChanged](functions/xpackageunregisterinstallationprogresschanged.md) | Unregisters a previously registered install progress changed callback. |  
| [XPackageUnregisterPackageInstalled](functions/xpackageunregisterpackageinstalled.md) | Unregisters a previously registered install complete callback. |  
| [XPackageUpdateInstallationMonitor](functions/xpackageupdateinstallationmonitor.md) | Refreshes the progress returned from [XPackageGetInstallationProgress](functions/xpackagegetinstallationprogress.md). |  
  
## Structures  
  
| Structure | Description |  
| --- | --- |  
| [XPackageChunkSelector](structs/xpackagechunkselector.md) | Defines the criteria for selecting a set of chunks. |  
| [XPackageDetails](structs/xpackagedetails.md) | Contains details about an installation. |  
| [XPackageFeature](structs/xpackagefeature.md) | Describes a feature. |  
| [XPackageInstallationProgress](structs/xpackageinstallationprogress.md) | Contains information about the progress of an installation. |  
| [XPackageWriteStats](structs/xpackagewritestats.md) | Contains the output write statistics (writeStats). |  
  
## Enumerations  
  
| Enumeration | Description |  
| --- | --- |  
| [XPackageChunkAvailability](enums/xpackagechunkavailability.md) | Indicates the availability of installation chunks. |  
| [XPackageChunkSelectorType](enums/xpackagechunkselectortype.md) | Indicates the selector type. |  
| [XPackageEnumerationScope](enums/xpackageenumerationscope.md) | Indicates the scope of packages to be returned when installation packages are being enumerated. |  
| [XPackageKind](enums/xpackagekind.md) | Indicates the type of the installation package. |  
  
  
## See also  
[System API reference](../gc-reference-system-toc.md)  
[XStore API reference](../xstore/xstore_members.md)  