---
author: aablackm
title: XtfConsoleFieldType Enumeration
description: Identifies the type of the value returned from XtfGetConsoleFieldValue.
ms.assetid: T:Windows.Xbox.XtfConsoleFieldType
kindex: XtfConsoleFieldType enumeration
ms.author: stevenpr
ms.topic: reference
edited: 04/01/2020
security: public
---

# XtfConsoleFieldType Enumeration
  
Identifies the type of the value returned from [XtfGetConsoleFieldValue](../functions/xtfgetconsolefieldvalue-xbox-microsoft-m.md).  
  
<a id="syntaxSection"></a>
  
## Syntax
  
```cpp
typedef enum XtfConsoleFieldType
{
    FieldTypeUINT32,
    FieldTypePWCHAR
} XtfConsoleFieldType;  
```
  
<a id="constantsSection"></a>
  
## Constants
  
| Constant | Description |  
| -------- | ----------- |  
| FieldTypeUINT32 | Value is a <b>UINT32</b> integer. |  
| FieldTypePWCHAR | Value is a <b>PWCHAR</b> string. |  
  
<a id="remarksSection"></a>
  
## Remarks
  
This enumeration indicates the type of the console field value returned by the [XtfGetConsoleFieldValue](../functions/xtfgetconsolefieldvalue-xbox-microsoft-m.md) function. Use the value specified in the `field` parameter of that function to identify the returned console field value. For more information about console settings, see [Managing console settings (NDA topic)](../../../../../tools-console/xbox-tools-and-apis/xbom/manager-tool-console-settings.md).  
  
<a id="requirements"></a>
  
## Requirements  
  
**Header:** xtfapi.h  
  
**Library:** xtfapi.lib  
  
**Supported platforms:** Windows (for Xbox console tools)  
  
<a id="seealsoSection"></a>
  
## See also
  
[XtfConsoleFieldId Enumeration](xtfconsolefieldid-xbox-windows-t.md)  
[Additional Xtf APIs](../atoc-xtfapi.md)  
[Xbox Tools Framework native API reference](../../atoc-xtf-native.md)  
  