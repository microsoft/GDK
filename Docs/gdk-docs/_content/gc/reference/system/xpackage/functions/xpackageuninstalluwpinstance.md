---
author: M-Stahl
title: XPackageUninstallUWPInstance
description: Uninstalls a Universal Windows Platform (UWP) instance of a particular package for the current user if one is currently installed.
kindex: XPackageUninstallUWPInstance
ms.author: brianpe
ms.topic: reference
edited: 07/08/2020
security: public
applies-to: pc-gdk
---

# XPackageUninstallUWPInstance
  
Uninstalls a Universal Windows Platform (UWP) instance of the specified package for the current user, if one is currently installed.  
  
<a id="syntaxSection"></a>
  
## Syntax
  
```cpp
HRESULT XPackageUninstallUWPInstance(  
         const char* packageName  
)  
```  
  
<a id="parametersSection"></a>
  
### Parameters
  
*packageName* &nbsp;&nbsp;\_In\_z\_  
Type: char\*  
  
The name of the package to uninstall. This value must match the value of the `Name` attribute for the `Identity` element in the `AppXManifest` for the UWP package.  
  
<a id="retvalSection"></a>
  
### Return value
  
Type: HRESULT  
  
Returns `S_OK` if the package was uninstalled (or was not installed for the user); otherwise, returns an HRESULT error code. Returns `E_NOTIMPL` if the platform does not support this API.  
  
<a id="remarksSection"></a>
  
## Remarks
  > [!NOTE]
> This function is available only for the PC platform.  
  
This function uninstalls a Universal Windows Platform (UWP) instance of the package specified in `packageName` for the current user, if an instance is currently installed. If the current user does not have a UWP instance of the specified package currently installed, nothing happens and the function returns `S_OK`.  
  
The publisher of the package to be uninstalled must match the publisher of the package invoking this function; otherwise, an error occurs.  
  
<a id="requirementsSection"></a>
  
## Requirements
  
**Header:** XPackage.h  
  
**Library:** xgameruntime.lib  
  
**Supported Platforms**: Windows, Xbox One family consoles and Xbox Series consoles  
  
<a id="seealsoSection"></a>
  
## See also
  
[XPackageUninstallChunks](xpackageuninstallchunks.md)  
[XPackage](../xpackage_members.md)  
  