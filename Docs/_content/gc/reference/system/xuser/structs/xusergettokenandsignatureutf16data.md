---
author: M-Stahl
title: XUserGetTokenAndSignatureUtf16Data
description: Contains Unicode xtokens and signatures for web requests.
kindex: XUserGetTokenAndSignatureUtf16Data
ms.author: v-sahain
ms.topic: reference
edited: 00/00/0000
quality: good
security: public
applies-to: pc-gdk
---

# XUserGetTokenAndSignatureUtf16Data  

Contains Unicode xtokens and signatures for web requests.

## Syntax  
  
```cpp
typedef struct XUserGetTokenAndSignatureUtf16Data {  
    size_t tokenCount;  
    size_t signatureCount;  
    const wchar_t* token;  
    const wchar_t* signature;  
} XUserGetTokenAndSignatureUtf16Data  
```
  
### Members  
  
*tokenCount*  
Type: size_t  
  
The size in bytes of the buffer in the **token** property.  
  
*signatureCount*  
Type: size_t  
  
The size in bytes of the buffer in the **signature** property.  
  
*token*  
Type: const wchar_t*  
  
A buffer containing the Unicode token.  
  
*signature*  
Type: const wchar_t*  
  
A buffer containing the Unicode signature.  
  
## Remarks

To get the result of a call to the [XUserGetTokenAndSignatureUtf16Async](../functions/xusergettokenandsignatureutf16async.md) function, call the [XUserGetTokenAndSignatureUtf16Result](../functions/xusergettokenandsignatureutf16result.md) function.

The [XUserGetTokenAndSignatureUtf16Async](../functions/xusergettokenandsignatureutf16async.md) function asynchronously retrieves unicode xtokens and signatures for web requests.

The [XUserGetTokenAndSignatureUtf16Result](../functions/xusergettokenandsignatureutf16result.md) function uses a double pointer to an XUserGetTokenAndSignatureUtf16Data structure as an argument.

## Requirements  
  
**Header:** XUser.h
  
**Supported platforms:** Windows, Xbox One family consoles and Xbox Series consoles  
  
## See also

[XUser](../xuser_members.md)
  
[XUserGetTokenAndSignatureUtf16Async](../functions/xusergettokenandsignatureutf16async.md)

[XUserGetTokenAndSignatureUtf16Result](../functions/xusergettokenandsignatureutf16result.md)