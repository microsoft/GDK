---
author: joannaleecy
title: XblVerifyStringResult
description: Contains information about the results of a string verification.
kindex: XblVerifyStringResult
ms.author: migreen
ms.topic: reference
security: public
edited: 00/00/0000
quality: good
applies-to: pc-gdk
---

# XblVerifyStringResult  

Contains information about the results of a string verification.  

## Syntax  
  
```cpp
typedef struct XblVerifyStringResult {  
    XblVerifyStringResultCode resultCode;  
    char* firstOffendingSubstring;  
} XblVerifyStringResult  
```
  
### Members  
  
*resultCode*  
Type: [XblVerifyStringResultCode](../enums/xblverifystringresultcode.md)  
  
The result code for the string verification.
  
*firstOffendingSubstring*  
Type: char*  
  
Contains the first offending substring if the resultCode is XblVerifyStringResultCode::Offensive.
  
## Argument of
  
[XblStringVerifyStringResult](../functions/xblstringverifystringresult.md)  
[XblStringVerifyStringsResult](../functions/xblstringverifystringsresult.md)
  
## Requirements  
  
**Header:** string_verify_c.h
  
## See also  
[string_verify_c](../string_verify_c_members.md)  
  
  