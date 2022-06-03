---
author: shawnfa
title: Localizing Touch Adaption Kit content
description: How to provide localized content for touch adaptation bundles
kindex: Localizing Touch Adaptation Kit Content
ms.author: shawnfa
ms.prod: xbox
ms.technology: gdk
ms.topic: conceptual
edited: 00/00/0000
security: public
---

# Localizing Touch Adaption Kit content

Touch adaptation bundles support content localized for different languages, enabling designers to build content which changes appearance to best match the language that their players are using their touch layouts in.

This localization is done by dividing the content up into directories, using the [IETF language tag](https://tools.ietf.org/search/bcp47) for the content in that directory. Content which is not locale specific goes into a directory named `neutral`. When the touch adaptation bundle is loaded into the Xbox Game Streaming app, the app will determine which language the player wishes to use on their device. As content is loaded out of the touch adaptation bundle, the Xbox Game Streaming app will look for the localized version of that content which best matches the player’s chosen language.

When doing this probing, the client app will start with the most specific match to the player’s language and will fall back through less specific matches until the content can be found.

For example, imagine a touch adaptation bundle with the following contents:  

```
assets/
    neutral/
        @1.0x/
            JumpButton.png
            LookJoystick.png
            TalkButton.png
    fr/
        fr-CA/
            @1.0x/
                JumpButton.png
        fr-FR/
            @1.0x/
                JumpButton.png
        @1.0x/
            LookJoystick.png
    ja/
        @1.0x/
            LookJoystick.png
layouts/
    neutral/
        FirstPerson.json
```

If a player is streaming a game with this touch adaptation bundle to an Xbox Game Streaming app which prefers to use French Canadian, then the following content would be loaded:

* `assets/fr/fr-CA/JumpButton.png` – this is an exact match to the player’s preferred `fr-CA` language.
* `assets/fr/LookJoystick.png` – there is no `fr/fr-CA/LookJoystick.png`, so the `fr` version is the next best match
* `assets/neutral/TalkButton.png` – there is neither an `fr-CA` nor an `fr` version of `TalkButton.png`, therefore the neutral version is the best match.
* `layouts/neutral/FirstPerson.json` – similarly, there is no localized version of the `FirstPerson` layout, so the neutral version is selected.

Since content loading will always use the neutral directory as its last fallback option, all content is required to have a neutral version. This ensures that layouts are always loadable, regardless of the language that the player is using on their device. In the above example, if the player’s device was configured to use `es-MX` as their preferred language, the neutral version of all content would be selected, as there is neither an `es-MX` nor an `es` version of any of the content.

It’s also important to note that content language is selected based upon the language the player has selected for the device which is streaming the game. If they are streaming a game to a web browser, the browser may also configure the player’s preferred language.  However this decision is based upon this client side configuration rather than the language of the title that the player is streaming. For example, if a player’s browser is using the `ja-JP` language, but the game being played was in English, the touch adaptation bundle would be probed for ja-JP content, and not `en` content.
