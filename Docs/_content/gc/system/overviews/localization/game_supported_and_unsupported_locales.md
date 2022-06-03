---
author: M-Stahl
title: Game supported and unsupported locales
description: Provides an overview of working with supported and unsupported locales in your game.
kindex: Game Supported and Unsupported Locales
ms.author: jgup
ms.topic: conceptual
edited: 06/04/2020
security: public
---

# Game supported and unsupported locales 

Titles are expected to include all the locales that they're planning to support with all the resources
in their package&mdash;even though some locales might not be supported by Xbox One at this time. Include all the locales
that you plan to support in the `Resources` section of the manifest. Unsupported locales don't work
for users during launch because they can't select these locales through the console UI. However, including
everything in the initial package ensures that it automatically works when these locales become supported.
Titles can also provide users with a locale drop-down menu on startup to choose the language of their
preference. This can be used to localize all the in-title resources.

## Testing unsupported locales

You can use the following methods to test your title for unsupported locales.

1. Set the unsupported locale by using the command line. (For example, `xbconfig preferredlanguages=ja-JP`.)
    After you've set the locale and it's present in the manifest, you can test all the resources for that
    locale.
2. Create a temporary UI in your title for selecting a language. You can then select an unsupported language through this UI and check for all the localized resources. 
> [!NOTE]
> The first method ensures that you can test the manifest-localized resources and the in-title resources. The second method can be used only to test the in-title resources.

## See also

[Localization and globalization](localization_overview.md)