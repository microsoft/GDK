---
author: joannaleecy
title: XblTitleManagedStatistic
description: Contains information about a Title Managed statistic.
kindex: XblTitleManagedStatistic
ms.author: migreen
ms.topic: reference
security: public
edited: 00/00/0000
quality: good
applies-to: pc-gdk
---

# XblTitleManagedStatistic  

Contains information about a Title Managed statistic.  

## Syntax  
  
```cpp
typedef struct XblTitleManagedStatistic {  
    const char* statisticName;  
    XblTitleManagedStatType statisticType;  
    double numberValue;  
    const char* stringValue;  
} XblTitleManagedStatistic  
```
  
### Members  
  
*statisticName*  
Type: const char*  
  
The name of the statistic (case insensitive).
  
*statisticType*  
Type: [XblTitleManagedStatType](../enums/xbltitlemanagedstattype.md)  
  
The type of the statistic.
  
*numberValue*  
Type: double  
  
The value of the double statistic. Backed by a JSON number value, which can lead to precision issues when storing 64-bit fixed point values.
  
*stringValue*  
Type: const char*  
  
The value of the string statistic.
  
## Argument of
  
[XblTitleManagedStatsWriteAsync](../functions/xbltitlemanagedstatswriteasync.md)
  
## Requirements  
  
**Header:** title_managed_statistics_c.h
  
## See also  
[title_managed_statistics_c](../title_managed_statistics_c_members.md)  
  
  