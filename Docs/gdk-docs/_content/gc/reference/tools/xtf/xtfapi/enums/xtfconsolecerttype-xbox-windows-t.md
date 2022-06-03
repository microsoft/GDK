---
author: aablackm
title: XtfConsoleCertType Enumeration
description: Reserved for internal use.
ms.assetid: T:Windows.Xbox.XtfConsoleCertType
kindex: XtfConsoleCertType enumeration
ms.author: stevenpr
ms.topic: reference-internal
edited: 04/01/2020
quality: good
security: public
---

# XtfConsoleCertType Enumeration
  
Reserved for internal use.  
  
<a id="syntaxSection"></a>
  
## Syntax

```cpp
typedef enum XtfConsoleCertType
{
    NoCert,
    EraDevKit,
    SraDevKit,
    EraTestKit,
    Other1
} XtfConsoleCertType;  
```
  
<a id="constantsSection"></a>
  
## Constants
  
| Constant | Description |
| ------- | ----------- |
| NoCert | Reserved for internal use. |  
| EraDevKit | Reserved for internal use. |  
| SraDevKit | Reserved for internal use. |  
| EraTestKit | Reserved for internal use. |  
| Other1 | Reserved for internal use. |  
  
<a id="requirements"></a>
  
## Requirements
  
**Header:** xtfapi.h  
  
**Library:** xtfapi.lib  
  
**Supported platforms:** Windows (for Xbox console tools)  
  
<a id="seealsoSection"></a>
  
## See also
  
[XtfGetConsoleFieldValue](../functions/xtfgetconsolefieldvalue-xbox-microsoft-m.md)  
[Additional Xtf APIs](../atoc-xtfapi.md)  
[Xbox Tools Framework native API reference](../../atoc-xtf-native.md)  
  