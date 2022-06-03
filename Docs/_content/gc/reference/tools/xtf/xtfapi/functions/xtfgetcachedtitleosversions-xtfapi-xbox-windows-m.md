---
author: aablackm
title: XtfGetCachedTitleOSVersions
description: Gets the version information of each Game OS cached on the console.
ms.assetid: M:Windows.Xbox.xtfapi.XtfGetCachedTitleOSVersions(PCWSTR,XtfGetCachedTitleOSVersionsCallback,PVOID)
kindex: XtfGetCachedTitleOSVersions
ms.author: zhooper
ms.topic: reference
edited: 04/15/2020
security: public
---

# XtfGetCachedTitleOSVersions
  
Gets the version information of each Game OS cached on the console.  
  
<a id="syntaxSection"></a>
  
## Syntax
  
```cpp
HRESULT XtfGetCachedTitleOSVersions(
         PCWSTR address,
         XtfGetCachedTitleOSVersionsCallback clientCallback,
         PVOID context
)  
```
  
<a id="parametersSection"></a>
  
### Parameters
  
*address*  
Type: PCWSTR  
  
\[in\] The address of the console.  
  
*clientCallback*  
Type: [XtfGetCachedTitleOSVersionsCallback](xtfgetcachedtitleosversionscallback-xtfapi-xbox-windows-m.md)  
  
\[in\] The callback to be invoked for each Game OS in the cache on the console.  
  
*context*  
Type: PVOID  
  
\[in, optional\] A pointer to a context object, to be passed into the callback.  
  
<a id="retvalSection"></a>
  
### Return value
  
Type: HRESULT  
  
Returns `S_OK` if successful; otherwise, returns an HRESULT error code.  
  
<a id="remarksSection"></a>
  
## Remarks
  
Use this function, along with a [XtfGetCachedTitleOSVersionsCallback](xtfgetcachedtitleosversionscallback-xtfapi-xbox-windows-m.md) function, to get the version information of each Game OS cached on the console. The callback function provides a [FourPartVersion](../structs/fourpartversion-xtfapi-xbox-windows-s.md) containing the four-part version number, as well as additional information about that Game OS, for each Game OS in the cache.  
  
You can add a Game OS to the cache on the console by calling the [XtfCacheTitleOS](xtfcachetitleos-xtfapi-xbox-windows-m.md) function, or remove an existing Game OS from the cache by calling the [XtfRemoveTitleOSFromCache](xtfremovetitleosfromcache-xtfapi-xbox-windows-m.md) or [XtfRemoveTitleOSFromCacheByVersion](xtfremovetitleosfromcachebyversion-xtfapi-xbox-windows-m.md) functions. For more information about managing provisioned Game OS files, see [Application Management (xbapp.exe) (NDA topic)](../../../../../tools-console/xbox-tools-and-apis/commandlinetools/xbapp.md) and [Provision (xbprovision.exe) (NDA topic)](../../../../../tools-console/xbox-tools-and-apis/commandlinetools/xbprovision.md).  
  
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
  