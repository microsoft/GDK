---
author: M-Stahl
title: XUserGetTokenAndSignatureUtf16HttpHeader
description: Contains a Unicode HTTP header for a web request.
kindex: XUserGetTokenAndSignatureUtf16HttpHeader
ms.author: v-sahain
ms.topic: reference
edited: 00/00/0000
quality: good
security: public
applies-to: pc-gdk
---

# XUserGetTokenAndSignatureUtf16HttpHeader  

Contains a Unicode HTTP header for a web request.

## Syntax  
  
```cpp
typedef struct XUserGetTokenAndSignatureUtf16HttpHeader {  
    const wchar_t* name;  
    const wchar_t* value;  
} XUserGetTokenAndSignatureUtf16HttpHeader  
```
  
### Members  
  
*name*  
Type: const wchar_t*  
  
The Unicode header name.  
  
*value*  
Type: const wchar_t*  
  
The Unicode header value.  
  
## Remarks

To asynchronously retrieve unicode xtokens and signatures for web requests, call the [XUserGetTokenAndSignatureUtf16Async](../functions/xusergettokenandsignatureutf16async.md) function.
The function uses a pointer to a XUserGetTokenAndSignatureUtf16HttpHeader structure as an argument.

To get the result of a call to the [XUserGetTokenAndSignatureUtf16Async](../functions/xusergettokenandsignatureutf16async.md) function, call the [XUserGetTokenAndSignatureUtf16Result](../functions/xusergettokenandsignatureutf16result.md) function.

## Requirements  
  
**Header:** XUser.h
  
**Supported platforms:** Windows, Xbox One family consoles and Xbox Series consoles  
  
## See also

[XUser](../xuser_members.md)
  
[XUserGetTokenAndSignatureUtf16Async](../functions/xusergettokenandsignatureutf16async.md)

[XUserGetTokenAndSignatureUtf16Result](../functions/xusergettokenandsignatureutf16result.md)