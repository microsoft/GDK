---
author: M-Stahl
title: Supported NLS functions
description: Describes the NLS functions that are part of `WINAPI FAMILY GAMES`.
kindex:
- NLS
- National Language Support (NLS) Functions
ms.author: jgup
ms.topic: conceptual
edited: 04/21/2020
security: public
---

# Supported NLS functions 

The National Language Support (NLS) functions help applications support the different 
language-specific and locale-specific needs of users around the world. Only those API functions that are 
defined under the `WINAPI_PARTITION_GAMES` partition in the `WinNLS.h` header file are 
available for use on Xbox One. The following functions are currently available for use 
by using the `WinNls.h` header file. 
> [!NOTE]
> APIs marked as "DEPRECATED" work with 
the Microsoft Game Development Kit (GDK) with caveats as documented on Microsoft Docs. However, we strongly recommend the replacement APIs.

| Function| State| Replacement |
| ---| ---| --- |
| `EnumSystemLocalesEx`| |  |
| `FindNLSStringEx`| |  |
| `FoldStringA`| |  |
| `GetACP`| |  |
| `GetCurrencyFormatEx`| |  |
| `GetGeoInfoEx`| |  |
| `GetLocaleInfoEx`| |  |
| `GetNumberFormatEx`| |  |
| `GetStringTypeA`| |  |
| `GetStringTypeExA`| |  |
| `GetThreadLocalevoid);`| |  |
| `GetUserDefaultGeoName`| |  |
| `GetUserDefaultLocaleName`| |  |
| `GetUserPreferredUILanguages` | NOT SUPPORTED  | Always returns en-US  |
| `IdnToAscii`| |  |
| `IdnToUnicode`             | |  |
| `IsValidCodePage`| |  |
| `IsValidLocaleName`| |  |
| `LCIDToLocaleName`| |  |
| `LCMapStringEx`| |  |
| `LocaleNameToLCID`| |  |
| `ResolveLocaleName`| |  |
| `SetThreadLocale`| |  |
| `CompareString`| DEPRECATED| `CompareStringEx` |
| `CompareStringA`| DEPRECATED| `CompareStringEx`|
| `EnumSystemLocalesA`| DEPRECATED| `EnumSystemLocalesEx` |
| `EnumSystemLocalesW`| DEPRECATED| `EnumSystemLocalesEx` |
| `FindNLSString`| DEPRECATED| `FindNLSStringEx` |
| `GetCPInfo`| DEPRECATED| Use Unicode |
| `GetCPInfoExA`| DEPRECATED| Use Unicode |
| `GetCPInfoExW`| DEPRECATED| Use Unicode |
| `GetCurrencyFormatA`| DEPRECATED| `GetCurrencyFormatEx` |
| `GetCurrencyFormatW`| DEPRECATED| `GetCurrencyFormatEx` |
| `GetGeoInfoA`| DEPRECATED| `GetGeoInfoEx` |
| `GetGeoInfoW`| DEPRECATED| `GetGeoInfoEx` |
| `GetLocaleInfoA`| DEPRECATED| `GetLocaleInfoEx` |
| `GetLocaleInfoW`| DEPRECATED| `GetLocaleInfoEx` |
| `GetNumberFormatA`| DEPRECATED| `GetNumberFormatEx` |
| `GetNumberFormatW`| DEPRECATED| `GetNumberFormatEx` |
| `GetUserGeoID`| DEPRECATED| `GetUserDefaultLocaleName` |
| `LCMapStringA`| DEPRECATED| `LCMapStringEx` |
| `LCMapStringW`| DEPRECATED| `LCMapStringEx` |


## See also

[Localization and globalization (overview)](localization_overview.md)