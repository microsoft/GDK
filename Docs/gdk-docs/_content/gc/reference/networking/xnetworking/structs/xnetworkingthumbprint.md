---
author: M-Stahl
title: XNetworkingThumbprint
description: Defines the certificate type, thumbprint, and thumbprint size.
kindex: XNetworkingThumbprint
ms.author: v-doglov
ms.topic: reference
edited: 07/15/2020
security: public
applies-to: pc-gdk
---

# XNetworkingThumbprint  

Defines the certificate type, thumbprint, and thumbprint size.

## Syntax  

```cpp
typedef struct XNetworkingThumbprint {  
    XNetworkingThumbprintType thumbprintType;  
    size_t thumbprintBufferByteCount;  
    uint8_t* thumbprintBuffer;  
} XNetworkingThumbprint  
```

### Members
  
*thumbprintType*  
Type: [XNetworkingThumbprintType](../enums/xnetworkingthumbprinttype.md)  
  
Indicates the certificate type of the thumbprint.
  
*thumbprintBufferByteCount*  
Type: size_t  
  
Indicates the size of the thumbprint buffer.
  
*thumbprintBuffer*  
Type: uint8_t\*  
  
Buffer that contains the certificate thumbprint information.
  
## Remarks  
  
This structure defines the certificate type, thumbprint, and thumbprint size. Certificate thumbprints are retrieved by calling the [XNetworkingQuerySecurityInformationForUrlAsync](../functions/xnetworkingquerysecurityinformationforurlasync.md) function. For network information in Microsoft Game Development Kit (GDK) titles, see [Retrieving Network Information](../../../../networking/overviews/initialization-connectivity-networking.md). 

## Requirements
  
**Header:** XNetworking.h
  
**Supported platforms:** Windows, Xbox One family consoles and Xbox Series consoles  
  
## See also  

[XNetworking](../xnetworking_members.md)  
  