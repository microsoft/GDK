---
author: M-Stahl
title: XPackageInstallationProgress
description: Contains information about the progress of an installation.
kindex: XPackageInstallationProgress
ms.author: brianpe
ms.topic: reference
edited: 05/18/2019
security: public
applies-to: pc-gdk
---

# XPackageInstallationProgress
  
Contains information about the progress of an installation.  
  
<a id="syntaxSection"></a>
  
## Syntax
  
```cpp
typedef struct XPackageInstallationProgress {  
    uint64_t totalBytes;  
    uint64_t installedBytes;  
    uint64_t launchBytes;  
    bool launchable;  
    bool completed;  
} XPackageInstallationProgress  
```
  
<a id="membersSection"></a>
  
### Members
  
*totalBytes*  
Type: uint64_t  
  
The total number of bytes being installed.  
  
*installedBytes*  
Type: uint64_t  
  
The number of bytes installed so far.  
  
*launchBytes*  
Type: uint64_t  
  
The number of bytes required to launch the title.  
  
*launchable*  
Type: bool  
  
Indicates whether the installation can be launched now.  
  
*completed*  
Type: bool  
  
Indicates whether the installation is completed.  
  
<a id="remarksSection"></a>
  
## Remarks
  
The `XPackageInstallationProgress` structure provides the details about the installation progress of a package. `XPackageInstallationProgress` indicates the number of bytes that are being installed. It indicates the number of bytes already installed, and the number of bytes required to launch the title. It also lets you know when the package installation process is complete.  
  
For information about the packaging technology used with Xbox One titles, see [Overview of Packaging](../../../../packaging/overviews/packaging.md). For information about the steps to create an XVC package, see [Getting started packaging titles for Xbox consoles](../../../../packaging/overviews/packaging-getting-started-for-console.md).  
  
<a id="requirementsSection"></a>
  
## Requirements
  
**Header:** XPackage.h  
  
**Supported platforms:** Windows, Xbox One family consoles and Xbox Series consoles  
  
<a id="seealsoSection"></a>
  
## See also
  
[Overview of downloadable content (DLC) packages](../../../../packaging/packaging-downloadable-content-dlc.md)  
[XPackage](../xpackage_members.md)  
  