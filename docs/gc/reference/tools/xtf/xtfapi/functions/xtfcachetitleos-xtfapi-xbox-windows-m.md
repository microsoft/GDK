---
author: aablackm
title: XtfCacheTitleOS
description: Adds a Game OS to the OS cache.
kindex: XtfCacheTitleOS
ms.author: zhooper
ms.topic: reference
edited: 04/15/2020
security: public
---

# XtfCacheTitleOS
  
Adds a Game OS to the OS cache.  
  
<a id="syntaxSection"></a>
  
## Syntax
  
```cpp
HRESULT XtfCacheTitleOS(
         PCWSTR address,
         PCWSTR osIdentifier
)  
```
  
<a id="parametersSection"></a>
  
### Parameters
  
*address*  
Type: PCWSTR  
  
\[in\] The address of the console.  
  
*osIdentifier*  
Type: PCWSTR  
  
\[in\] The identifier of the Game OS to be added. This identifier can be one of the following:  
  
- The full path and file name of a MicrosoftGame.config file that contains the four-part version number of the Game OS version to be added  
- The full path and file name of a GameOs.xvd file  
- The full path to a directory that contains a MicrosoftGame.config or GameOS.vxd file  
- The four-part version number of the Game OS to be added  
  
Examples of valid identifiers:  
  
- D:\MyGame  
- \\MyDevPC\share\MyGame\MicrosoftGame.config  
- xd:\Titles\MyGamePFN\GameOs.xvd  
- 10.0.18236.1002  
  
<a id="retvalSection"></a>
  
### Return value
  
Type: HRESULT  
  
Returns `S_OK` if successful; otherwise, returns an HRESULT error code.  
  
<a id="remarksSection"></a>
  
## Remarks
  
Use this function to manage provisioned Game OS files by adding the specified Game OS to the cache on the console. You can use the [XtfGetCachedTitleOSVersions](xtfgetcachedtitleosversions-xtfapi-xbox-windows-m.md) function to get the version information of each Game OS cached on the console. You can also remove an existing Game OS from the cache by calling the [XtfRemoveTitleOSFromCache](xtfremovetitleosfromcache-xtfapi-xbox-windows-m.md) or [XtfRemoveTitleOSFromCacheByVersion](xtfremovetitleosfromcachebyversion-xtfapi-xbox-windows-m.md) functions. For more information about managing provisioned Game OS files, see [Application Management (xbapp.exe) (NDA topic)](../../../../../tools-console/xbox-tools-and-apis/commandlinetools/xbapp.md) and [Provision (xbprovision.exe) (NDA topic)](../../../../../tools-console/xbox-tools-and-apis/commandlinetools/xbprovision.md).  
  
<a id="requirementsSection"></a>
  
## Requirements
  
**Header:** xtfapi.h  
  
**Library:** XtfApi.lib  
  
**Supported platforms:** Windows (for Xbox console tools)  
  
<a id="seealsoSection"></a>
  
## See also
  
[Run from PC Deployment (NDA topic)](../../../../../tools-console/usinggsdk/deployment/deployment.md)  
[XTF Transport Errors (NDA topic)](../../../../../tools-console/xbox-tools-and-apis/commandlinetools/xtf-transport-errors.md)  
[Additional Xtf APIs](../atoc-xtfapi.md)  
  