---
author: aablackm
title: XtfGetCachedTitleOSVersionsCallback
description: Callback invoked for each Game OS found by [XtfGetCachedTitleOSVersions](xtfgetcachedtitleosversions-xtfapi-xbox-windows-m.md).
kindex: XtfGetCachedTitleOSVersionsCallback
ms.author: zhooper
ms.topic: reference
edited: 04/15/2020
security: public
---

# XtfGetCachedTitleOSVersionsCallback
  
Callback invoked for each Game OS found by [XtfGetCachedTitleOSVersions](xtfgetcachedtitleosversions-xtfapi-xbox-windows-m.md).  
  
<a id="syntaxSection"></a>
  
## Syntax
  
```cpp
HRESULT XtfGetCachedTitleOSVersionsCallback(
         FourPartVersion version,
         UINT32 flags,
         PVOID context
)  
```
  
<a id="parametersSection"></a>
  
### Parameters
  
*version*  
Type: [FourPartVersion](../structs/fourpartversion-xtfapi-xbox-windows-s.md)  
  
\[in\] The four-part version number of the cached Game OS.  
  
*flags*  
Type: UINT32  
  
\[in\] A bitwise-OR combination of flags that provide additional information about the cached Game OS. This parameter supports the following flags:
  
| Flag | Value | Description |  
| ---- | ----- | ----------- |  
| XTF_CACHED_TITLE_OS_IS_FALLBACK | 0x0001 | Indicates that this Game OS is the fallback OS, which cannot be deleted or replaced. |
  
*context*  
Type: PVOID  
  
\[in, optional\] A pointer to a context object, passed from `XtfGetCachedTitleOSVersions`.  
  
<a id="retvalSection"></a>
  
### Return value
  
None.  
  
<a id="remarksSection"></a>
  
## Remarks
  
This callback is invoked by `XtfGetCachedTitleOSVersions` for each provisioned Game OS cached on the console. You can use the `FourPartVersion` specified in `version` to invoke the [XtfRemoveTitleOSFromCacheByVersion](xtfremovetitleosfromcachebyversion-xtfapi-xbox-windows-m.md) or [XtfStartTitleOSByVersion](xtfstarttitleosbyversion-xtfapi-xbox-windows-m.md) functions. For more information about managing provisioned Game OS files, see [Application Management (xbapp.exe) (NDA topic)](../../../../../tools-console/xbox-tools-and-apis/commandlinetools/xbapp.md) and [Provision (xbprovision.exe) (NDA topic)](../../../../../tools-console/xbox-tools-and-apis/commandlinetools/xbprovision.md).  
  
<a id="requirementsSection"></a>
  
## Requirements
  
**Header:** xtfapi.h  
  
**Library:** XtfApi.lib  
  
**Supported platforms:** Windows (for Xbox console tools)  
  
<a id="seealsoSection"></a>
  
## See also  
  
[XTF Transport Errors (NDA topic)](../../../../../tools-console/xbox-tools-and-apis/commandlinetools/xtf-transport-errors.md)  
[Additional Xtf APIs](../atoc-xtfapi.md)  
  