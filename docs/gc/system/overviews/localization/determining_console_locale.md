---
author: M-Stahl
title: Determining console locale and language
description: Describes how to determine the console's locale and language.
kindex: Determining console locale and language
ms.author: jgup
ms.topic: conceptual
edited: 06/03/2020
security: public
---

# Determining console locale and language

The locale name can be retrieved by using the 
[GetUserDefaultLocaleName](/windows/win32/api/winnls/nf-winnls-getuserdefaultlocalename)
API. The `User` in this case is simply the signed-in session. This API actually retrieves the locale
that the console is set in, shown as follows. 

```cpp
wchar_t localeName[LOCALE_NAME_MAX_LENGTH];
int retVal = GetUserDefaultLocaleName( localeName, ARRAYSIZE( localeName ) );
// The value is returned in localeName.
```
In general, games shouldn't really care about the locale or language specified on the device. What they really care about is what language resources
they should be loading. At a high-level, the recommendation is to choose the language in the game's package that is 
"closest" to what the user has selected on the device. There are three contributors to this choice:

1. The languages that are declared in the game's microsoftgame.config.
2. The languages that are declared in the packages layout file.
3. The languages that are selected on the device.

Choosing a "closest" language can be hard. To make this really easy, developers can use the 
[XPackageGetUserLocale](../../../reference/system/xpackage/functions/xpackagegetuserlocale.md) function. It will always return the "closest" language. Games 
should use this language to figure out what game resources to load. The following code demonstrates how to use the 
function. 

```cpp
char gameLocale[LOCALE_NAME_MAX_LENGTH];

// Get the best user locale that is installed
HRESULT hr = XPackageGetUserLocale(_countof(gameLocale), gameLocale);
if (SUCCEEDED(hr))
{
    printf(“Game using locale: %s\n”, gameLocale);
} 
```

A few scenarios are possible, which are described in the following examples.

## Example 1

On console, a user selects French for their Language setting and selects France (fr-FR) for their Country
setting. The user's locale is fr-FR. The user has a game that contains the following in the `Resources` section
of the microsoftgame.config.

```xml
<Resources>
    <Resource Language="en-US"/>
    <Resource Language="fr-FR"/>
    <Resource Language="de-DE"/>
    <Resource Language="en-GB"/>
</Resources>
```

This implies that the game has localized strings and images for English-United States (en-US), French-France 
(fr-FR), German-Germany (de-DE), and English-Great Britain (en-GB). Because the user's locale matches a 
supported locale in the manifest, `XPackageGetUserLocale` returns the value fr-FR. All the in-game 
text is in French (fr-FR). The return value of `XPackageGetUserLocale` is fr-FR. The return value of 
`GetUserDefaultLocaleName` is also fr-FR.

## Example 2

On console, a user selects English for their Language setting and selects UK (en-GB) for their Country
setting. The user's locale is en-GB. The user has a game that contains the following in the `Resources` section
of the microsoftgame.config.

```xml
<Resources>
    <Resource Language="en-US"/>
    <Resource Language="fr-FR"/>
    <Resource Language="de-DE"/>
</Resources>
```

Because the user's locale isn't present in the manifest, the fallback locale with the same language (English)
is chosen as the default language. In this case, it's en-US, and so `XPackageGetUserLocale`
returns this value. All the in-game text is in English (en-US). The return value of
`XPackageGetUserLocale` is en-US. The return value of `GetUserDefaultLocaleName` is en-GB. Remember that 
`GetUserDefaultLocaleName` will return what is set on the console independant of what the game has declared.

## Example 3

In a scenario similar to the earlier examples, a user's settings on a console result in a user locale of fr-FR.
The `Resources` section of MicrosoftGame.config contains the following.

```xml
<Resources>
    <Resource Language="en-US"/>
    <Resource Language="de-DE"/>
</Resources>
```

Because the user's locale isn't present in the .config file and no other locale with the same language is present, 
the first language in the `Resources` tag is selected as the default language (en-US). `XPackageGetUserLocale` 
returns this value. All the in-game text is in English (en-US). The return value of `XPackageGetUserLocale` is en-US. 
The return value of `GetUserDefaultLocaleName` is fr-FR.

## Summary

The locale of the console is returned by `GetUserDefaultLocaleName`. This will return what is set by the user on 
the device independant of what may be declared by the game.

The language is returned by `XPackageGetUserLocale` and is based on the following:

1. If the user's selected locale is present in the microsoftgame.config file, the locale is returned. 
1. If the locale isn't available in the microsoftgame.config file, it looks for some other locale with the same language. 
   If there are multiple locales with the same language, the best fallback locale is returned. The fallback 
   language is based on the user's locale.
1. If the two previously mentioned situations fail, the first locale found in the `Resources` section is selected.
1. If there are no locales in the user's selected language, the first locale entry in the `Resources` section is returned.
1. If no languages are listed in microsoftgame.config at all, `XPackageGetUserLocale` returns the console language.

## See also

[GetUserDefaultLocaleName](/windows/win32/api/winnls/nf-winnls-getuserdefaultlocalename)  
[XPackageGetUserLocale](../../../reference/system/xpackage/functions/xpackagegetuserlocale.md)   
[Localization and globalization](localization_overview.md)   
[MicrosoftGame.config localization](../microsoft-game-config/MicrosoftGameConfig-Localization.md)