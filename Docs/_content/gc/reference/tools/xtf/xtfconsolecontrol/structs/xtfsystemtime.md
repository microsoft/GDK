---
author: aablackm
title: XTFSYSTEMTIME
description: Contains system time information for Xbox Tools Framework (XTF) apps.
ms.assetid: T:Windows.Xbox.xtfconsolecontrol.XTFSYSTEMTIME
kindex: XTFSYSTEMTIME structure
ms.author: stevenpr
ms.topic: reference
edited: 06/29/2020
security: public
---

# XTFSYSTEMTIME
  
Contains system time information for Xbox Tools Framework (XTF) apps.  
  
<a id="syntaxSection"></a>
  
## Syntax
  
```cpp
typedef struct XTFSYSTEMTIME {
    WORD wYear;
    WORD wMonth;
    WORD wDayOfWeek;
    WORD wDay;
    WORD wHour;
    WORD wMinute;
    WORD wSecond;
    WORD wMilliseconds;
} XTFSYSTEMTIME, *PXTFSYSTEMTIME;  
```
  
<a id="membersSection"></a>
  
### Members  
  
*wYear*  
Type: WORD  
  
Year component of the system time.  
  
*wMonth*  
Type: WORD  
  
Month component of the system time.  
  
*wDayOfWeek*  
Type: WORD  
  
Day of week component of the system time.  
  
*wDay*  
Type: WORD  
  
Day component of the system time.  
  
*wHour*  
Type: WORD  
  
Hour component of the system time.  
  
*wMinute*  
Type: WORD  
  
Minute component of the system time.  
  
*wSecond*  
Type: WORD  
  
Second component of the system time.  
  
*wMilliseconds*  
Type: WORD  
  
Milliseconds component of the system time.  
  
<a id="remarksSection"></a>
  
## Remarks
  
This structure represents the date and time components of the system time for a development console. The [IXtfConsoleControlClient::GetSystemTime](../interfaces/IXtfConsoleControlClient/methods/ixtfconsolecontrolclient_getsystemtime.md) function provides a pointer to an `XTFSYSTEMTIME` structure for the system time of a development console. For more information about Xbox Tools Framework (XTF) tools, see [Command-line tools (NDA topic)](../../../../../tools-console/xbox-tools-and-apis/commandlinetools/commandlinetools.md).  
  
<a id="requirements"></a>
  
## Requirements
  
**Header:** xtfconsolecontrol.h  
  
**Library:** xtfconsolecontrol.lib  
  
**Supported platforms:** Windows (for Xbox console tools)  
  
<a id="seealsoSection"></a>
  
## See also
  
[XtfConsoleControl](../xtfconsolecontrol_members.md)  
[Xbox Tools Framework native API reference](../../atoc-xtf-native.md)  
  