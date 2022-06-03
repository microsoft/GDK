---
author: M-Stahl
title: XNetworkingThumbprintType
description: Defines types of certificate thumbprints used in a title.
kindex: XNetworkingThumbprintType
ms.author: v-doglov
ms.topic: reference
edited: 07/15/2020
security: public
applies-to: pc-gdk
---

# XNetworkingThumbprintType  

Defines types of certificate thumbprints used in a title. 

## Syntax  

```cpp
enum class XNetworkingThumbprintType : uint32_t   
{  
    Leaf = 0,  
    Issuer = 1,  
    Root = 2,  
}  
```  

## Constants  
  
| Constant | Description |
| --- | --- |
| Leaf | The thumbprint is for a leaf certificate.  |  
| Issuer | The thumbprint is for an issuer or intermediate certificate. |  
| Root | The thumbprint is for a root certificate that identifies the root certificate authority. |  
  
## Remarks  
  
This enumeration defines the type of certificate used in a title. The value 0 gets assigned to the leaf certificate. Values 1 and 2 get assigned to the issuer and root certificates. The [XNetworkingThumbprint](../structs/xnetworkingthumbprint.md) structure defines the certificate type of the thumbprint. For more information about certificates, see [Working with Certificates](/dotnet/framework/wcf/feature-details/working-with-certificates)
  
## Requirements  
  
**Header:** XNetworking.h
  
**Supported platforms:** Windows, Xbox One family consoles and Xbox Series consoles  
  
## See also  

[Retrieving Network Information](../../../../networking/overviews/initialization-connectivity-networking.md)  
[XNetworkingSecurityInformation](../structs/xnetworkingsecurityinformation.md)  
[XNetworking](../xnetworking_members.md)
  
  