---
author: M-Stahl
title: XNetworkingSecurityInformation
description: Defines the security information used in configuring the HTTP stack for a specific URL endpoint.
kindex: XNetworkingSecurityInformation
ms.author: v-doglov
ms.topic: reference
edited: 07/02/2019
security: public
applies-to: pc-gdk
---

# XNetworkingSecurityInformation

Defines the security information used in configuring the HTTP stack for a specific URL endpoint.

## Syntax

```cpp
typedef struct XNetworkingSecurityInformation {
    uint32_t enabledHttpSecurityProtocolFlags;
    size_t thumbprintCount;
    XNetworkingThumbprint* thumbprints;
} XNetworkingSecurityInformation
```

### Members

*enabledHttpSecurityProtocolFlags*  
Type: uint32_t

A bitmask of flags that indicate which Transport Layer Security (TLS) protocols the HTTP request should restrict for this URL endpoint and should be passed to the `WINHTTP_OPTION_SECURE_PROTOCOLS` WinHTTP option with a call to `WinHttpSetOption`. It can be any combination of `WINHTTP_FLAG_SECURE_PROTOCOL_TLS1`, `WINHTTP_FLAG_SECURE_PROTOCOL_TLS1_1`, `WINHTTP_FLAG_SECURE_PROTOCOL_TLS1_2`, and `WINHTTP_FLAG_SECURE_PROTOCOL_TLS1_3`.

*thumbprintCount*  
Type: size_t

Number of thumbprints in the array pointed to by the `thumbprints` field.

*thumbprints*  
Type: [XNetworkingThumbprint](xnetworkingthumbprint.md)\*

The array of thumbprints expected to be in the certificate chain presented by the server for this URL endpoint.

 
## Remarks

This structure describes the security information used in configuring the HTTP stack. It determines which TLS protocols the HTTP request should be restricted for a specific URL endpoint. There may not always be any thumbprints. Typical Fiddler usage will have one root thumbprint. 


## Requirements 

**Header:** XNetworking.h
  
**Supported platforms:** Windows, Xbox One family consoles and Xbox Series consoles  
  
## See also

[XNetworkingQuerySecurityInformationForUrlAsync](../functions/xnetworkingquerysecurityinformationforurlasync.md)  
[XNetworkingQuerySecurityInformationForUrlUtf16Async](../functions/xnetworkingquerysecurityinformationforurlutf16async.md)  
[XNetworking](../xnetworking_members.md)