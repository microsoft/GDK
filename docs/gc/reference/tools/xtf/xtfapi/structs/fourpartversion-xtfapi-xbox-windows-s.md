---
author: aablackm
title: FourPartVersion
description: The four-part version number of a Game OS.
kindex: FourPartVersion
ms.author: zhooper
ms.topic: reference
edited: 04/15/2020
security: public
---

# FourPartVersion

The four-part version number of a Game OS.  
  
<a id="syntaxSection"></a>
  
## Syntax
  
```cpp
typedef struct FourPartVersion
{
    UINT32 MajorVersion;
    UINT32 MinorVersion;
    UINT32 BuildVersion;
    UINT32 RevisionVersion;
} FourPartVersion;
```
  
<a id="membersSection"></a>
  
### Members
  
*MajorVersion*  
Type: UINT32  
  
The major version number of a Game OS.  
  
*MinorVersion*  
Type: UINT32  
  
The minor version number of a Game OS.  
  
*BuildVersion*  
Type: UINT32  
  
The build number of a Game OS.  
  
*RevisionVersion*  
Type: UINT32  
  
The revision number of a Game OS.  
  
<a id="remarks"></a>
  
## Remarks
  
This structure represents the four-part version number for a Game OS. [XtfGetTitleOSFourPartVersion](../functions/xtfgettitleosfourpartversion-xtfapi-xbox-windows-m.md), [XtfStartTitleOSByVersion](../functions/xtfstarttitleosbyversion-xtfapi-xbox-windows-m.md), and [XtfRemoveTitleOSFromCacheByVersion](../functions/xtfremovetitleosfromcachebyversion-xtfapi-xbox-windows-m.md) functions use this structure to identify a Game OS. For more information about managing provisioned Game OS, see [Application Management (xbapp.exe) (NDA topic)](../../../../../tools-console/xbox-tools-and-apis/commandlinetools/xbapp.md) and [Provision (xbprovision.exe) (NDA topic)](../../../../../tools-console/xbox-tools-and-apis/commandlinetools/xbprovision.md).  
  
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
  