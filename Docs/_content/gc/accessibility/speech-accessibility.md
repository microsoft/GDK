---
author: joannaleecy
title: User settings for speech accessibility
description: How to retrieve user settings for speech accessibility features.
ms.assetid: 2cec99d3-b186-18cf-09e5-3515db6b3f89
kindex:
- speech accessibility
- accessible games
- user settings
- TTS, STT, Text-to-speech, Speech-to-text
ms.author: joanlee
ms.topic: conceptual
edited: 00/00/0000
security: public
---

# User settings for speech accessibility 
  
This article describes how users configure the following speech accessibility settings through the Ease of access settings menu on Xbox consoles and Windows devices.

* Speech synthesis ("Let games read to me")
* Synthesized voice type
* Speech-to-Text (STT)/Text-to-Speech (TTS)

Then learn how to use the STT and TTS settings when implementing Game Chat 2 and PlayFab Party.

## User settings configuration

Let's take a look at how players configure these settings.

### Xbox consoles

* Go to **Settings** > **Ease of access**
* Select the checkboxes for "Speech-to-text on", "Text-to-speech on", "Text-to-speech voice", and "Let games read to me" to indicate your preferred settings.

### Windows devices

* Download and install [Xbox Game Bar](https://www.microsoft.com/p/xbox-game-bar/9nzkpstsnw4p)
* After installation, open the Game Bar app. Select **Start** and then navigate to the app. Alternatively, press the **Windows logo key** + **G** to open the app.
* Select the Settings icon > **Gaming features**.
* Select the checkboxes for "Speech-to-text on", "Text-to-speech on", "Text-to-speech voice", and "Let games read to me" to indicate your preferred settings. 

## Apply STT and TTS user preference

When using PlayFab Party, use [GetAccessibilitySettings](/gaming/playfab/features/multiplayer/networking/xblreference/classes/partyxbllocalchatuser/methods/partyxbllocalchatuser_getaccessibilitysettings) method, part of the [Xbox Live Helper Library](/gaming/playfab/features/multiplayer/networking/party-xbox-live-guide), to retrieve Xbox Live players' STT and TTS settings. 

In other words, your title needs to retrieve user settings using Xbox Live Helper Library to determine if the player wants to have TTS/STT functionalities enabled. If you have implemented PlayFab Party for your title, the service will respect the retrieved user settings and enable/disable TTS/STT for the player. Since PlayFab Party is a cross-platform solution, you can also retrieve settings from other custom player profiles to determine TTS/STT user preference.

On the other hand, Game Chat 2 is instrinsically tied to Xbox Live players' STT and TTS settings when initialized with __game_chat_speech_to_text_conversion_mode::automatic__ (which is the default). This means that your title won't have to call additional methods to retrieve user preference for STT and TTS.

For both services, your title still needs to take the transcribed text and render it using in-game UI or TCUI (if TTS is enabled) and synthesize voice from text (if STT is enabled).

## See also

* [Accessibility overview](accessibility-overview.md)
* [Why make games accessible?](accessibility-motivation.md)
* [Xbox Accessibility Guidelines](/gaming/accessibility/guidelines) 
* [Microsoft Gaming Accessibility Testing (MGATS)](https://developer.microsoft.com/en-us/games/xbox/partner/certification-mgats)