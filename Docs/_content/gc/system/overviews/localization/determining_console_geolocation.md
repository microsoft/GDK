---
author: M-Stahl
title: Determining console location
description: Describes how to determine the console location.
kindex: Determining console location
ms.author: jgup
ms.topic: conceptual
edited: 05/08/2020
security: public
---

# Determining console location

In case you need to retrieve the country that the console is set in, independent of the package manifest, 
you can use the 
[GetUserDefaultGeoName](/windows/win32/api/winnls/nf-winnls-getuserdefaultgeoname) 
API. The "User" in this case is simply the signed-in session. This API actually retrieves the location 
that the console is set in. 

![alert](../../../../../resources/gamecore/images/en-us/common/note.gif) **NOTE:** The `GetUserDefaultGeoName` is useful for determining the country of origin 
when the language/locale returned by `GetUserDefaultLocaleName` is "en-GB." For simplification, the locale 
name for several countries indicates that the language is the English language as written and spoken in the United Kingdom (UK). These countries include Saudi Arabia, 
United Arab Emirates, Czech Republic, Hungary, Slovakia, and Greece.

## See also

[GetUserDefaultGeoName](/windows/win32/api/winnls/nf-winnls-getuserdefaultgeoname)  

[GetUserDefaultLocaleName](/windows/win32/api/winnls/nf-winnls-getuserdefaultlocalename)  

[Localization and globalization](localization_overview.md)