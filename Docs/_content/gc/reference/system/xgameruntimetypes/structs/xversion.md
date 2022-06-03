---
author: M-Stahl
title: XVersion
description: Represents a four-part version number.
kindex: XVersion
ms.author: v-denken
ms.topic: reference
edited: 06/10/2019
quality: good
security: public
applies-to: pc-gdk
---

# XVersion  

Represents a four-part version number.  

## Syntax  
  
```cpp
typedef struct XVersion {  
    uint16_t major;  
    uint16_t minor;  
    uint16_t build;  
    uint16_t revision;  
} XVersion  
```
  
### Members  
  
*major*  
Type: uint16_t  
  
The major version number.  
  
*minor*  
Type: uint16_t  
  
The minor version number.  
  
*build*  
Type: uint16_t  
  
The build number.  
  
*revision*  
Type: uint16_t  
  
The revision number.  
  
## Remarks  
  
Gaming Runtime features use the **XVersion** structure to represent the version information. The [XSystemAnalyticsInfo](../../xsystem/structs/xsystemanalyticsinfo.md) structure uses **XVersion** to represent an operating system's version. In addition, the [XPackageDetails](../../xpackage/structs/xpackagedetails.md) structure uses **XVersion** to represent a package's version.  
  
## Requirements  
  
**Header:** XGameRuntimeTypes.h
  
**Supported platforms:** Windows, Xbox One family consoles and Xbox Series consoles  
  
## See also  
[XPackageDetails](../../xpackage/structs/xpackagedetails.md)  
[XSystemAnalyticsInfo](../../xsystem/structs/xsystemanalyticsinfo.md)  
[XGameRuntimeTypes](../xgameruntimetypes_members.md)  
  