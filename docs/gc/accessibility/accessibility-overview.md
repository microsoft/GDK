---
author: joannaleecy
title: Accessibility overview
description: Overview of tools, features, and services to make games more accessible.
ms.assetid: 2cec99d3-b186-18cf-09e5-3515db6b3f89
kindex:
- accessibility overview
- accessible games
- TTS, STT, Text-to-speech, Speech-to-text
- XAGs, Xbox accessibility guidelines
ms.author: joanlee
ms.topic: conceptual
edited: 00/00/0000
security: public
---

# Accessibility overview 
  
Accessibility can empower every person and every organization on the planet to achieve more, and this applies to making games more accessible too.

You'll gain an understanding of how accessible games results in having more people play your game. Then walk in the shoes of customers with disabilities and learn how they may be experiencing your game.

Next, design game features based on [Xbox Accessibility Guidelines](/gaming/accessibility/guidelines). This guide contains a set of best practices we developed in partnership with industry experts and members of the Gaming and Disability Community. Lastly, find out what APIs/services are available today to help you create more accessible games.

As more developers are making games accessible, we also received requests for help on reviewing accessibility and inclusivity in games. So we recently launched a new service called [Microsoft Gaming Accessibility Testing (MGATS)](https://developer.microsoft.com/en-us/games/xbox/partner/certification-mgats), an optional testing service, to help you identify accessibility and inclusivity issues for prerelease/launched Xbox and Windows PC titles.

## Start with accessibility

One of the common misconceptions in the development process is that accessibility is expensive. In fact, if you start with accessibility in mind, it isn’t as costly as you think. Ultimately, you get even more people playing your game. To learn more, see [Why make games accessible?](accessibility-motivation.md)

## Understand your customer

Understand how players with certain types of disabilities experience your video game when they're not developed with accessibilty in mind. To get started, see [Gaming and Disability Player Experience Guide](/gaming/accessibility/gadpeg).

## Frame your design and testing approach

Xbox Accessibility Guidelines (XAGs) is a set of best practices we've developed in partnership with industry experts and members of the Gaming and Disability Community. These guidelines are intended for designers as a catalyst for generating ideas, for developers as guardrails when developing their games, and for test teams as a checklist to validate the accessibility of their titles. To get started, see [Xbox Accessibility Guidelines (XAGs)](/gaming/accessibility/guidelines). 

Topics include: [Text display](/gaming/accessibility/xbox-accessibility-guidelines/101), [Contrast](/gaming/accessibility/xbox-accessibility-guidelines/102), [Additional channels for visual and audio cues](/gaming/accessibility/xbox-accessibility-guidelines/103), [Subtitles and captions](/gaming/accessibility/xbox-accessibility-guidelines/104), [Audio customization](/gaming/accessibility/xbox-accessibility-guidelines/105), [Screen narration](/gaming/accessibility/xbox-accessibility-guidelines/106), [Input](/gaming/accessibility/xbox-accessibility-guidelines/107), [Game difficulty options](/gaming/accessibility/xbox-accessibility-guidelines/108), [Object clarity](/gaming/accessibility/xbox-accessibility-guidelines/109), [Haptic feedback](/gaming/accessibility/xbox-accessibility-guidelines/110), [Audio description](/gaming/accessibility/xbox-accessibility-guidelines/111), [UI navigation](/gaming/accessibility/xbox-accessibility-guidelines/112), [UI focus handling](/gaming/accessibility/xbox-accessibility-guidelines/113), [UI context](/gaming/accessibility/xbox-accessibility-guidelines/114), [Error messages and destructive actions](/gaming/accessibility/xbox-accessibility-guidelines/115), [Time limits](/gaming/accessibility/xbox-accessibility-guidelines/116), [Visual distractions](/gaming/accessibility/xbox-accessibility-guidelines/117), [Photosensitivity](/gaming/accessibility/xbox-accessibility-guidelines/118), [Speech-to-Text (STT)/Text-to-Speech (TTS) chat](/gaming/accessibility/xbox-accessibility-guidelines/119), [Communication experiences](/gaming/accessibility/xbox-accessibility-guidelines/120), [Accessible feature documentation](/gaming/accessibility/xbox-accessibility-guidelines/121), [Accessible customer support](/gaming/accessibility/xbox-accessibility-guidelines/122), [Advanced best practices](/gaming/accessibility/xbox-accessibility-guidelines/123).

## Implement accessibility today

We want to support your journey in making games more accessible. If there are services or resources you want added, feel free to let us know on [Xbox Developers Forum](https://forums.xboxlive.com).

### Development

These are resources to help you implement accessible features in your title during development. 

In addition to leveraging these resources, we recommend bringing in people with disabilities throughout the development process to make sure that your designed features work for them.

| Area | Feature/API    | Use case              | Supported platforms                         |
|------|---------|----------------------------|---------------------------------------------|
| Subtitles and captions, text display | [XAccessibility](../reference/system/xaccessibility/xaccessibility_members.md) | Displays closed caption text| Windows, Xbox One and Series console titles using Microsoft Game Development Kit (GDK) |
| Subtitles and captions, contrast| [XAccessibility](../reference/system/xaccessibility/xaccessibility_members.md) ([XHighContrastMode](../reference/system/xaccessibility/enums/xhighcontrastmode.md))    | Enables high contrast mode for closed caption text | Windows, Xbox One and Series console titles using Microsoft Game Development Kit (GDK) |
| Communication experiences | [Azure PlayFab Party](/gaming/playfab/features/multiplayer/networking/)    | Provides text and voice chat capabilities | Cross-platform titles, including Android, iOS, Google Stadia, Nintendo Switch, PlayStation, Windows, and Xbox. Suitable for titles developed using game engines like Unity and Unreal as well. |
| Speech-to-Text (STT) and Text-to-Speech (TTS)| [PlayFab Party STT](/gaming/playfab/features/multiplayer/networking/party-speech-to-text-ux-guidelines) and [PlayFab Party TTS](/gaming/playfab/features/multiplayer/networking/party-text-to-speech-ux-guidelines) | Enables STT and TTS |  Cross-platform titles, including Android, iOS, Google Stadia, Nintendo Switch, PlayStation, Windows, and Xbox. Suitable for titles developed using game engines like Unity and Unreal as well. |
| Screen narration | [SpeechAccessibility](speech-accessibility.md) | Enables Windows and Xbox shell UI elements narration (Let games read to me). Additionally, obtain user settings for Game Chat 2/Party Chat STT and TTS | Windows, Xbox One and Series console titles using Microsoft Game Development Kit (GDK) |
| Audio            | [Responsive Spatial Audio for Immersive Gaming](https://assetstore.unity.com/packages/tools/game-toolkits/responsive-spatial-audio-for-immersive-gaming-a-microsoft-garage-144702) | Responsive Spatial Audio for Immersive Gaming is an interaction toolkit that improves game accessibility using spatial audio. It is available as a plug-in in Unity. Features include: Tag 3D objects with metadata descriptions like object type and item descriptions. An accessible first-person shooter (FPS) type controller which scans the environment for tagged objects and conveys the information to the player. Droppable vantage point objects to provide descriptions of the view ahead depending on the player's orientation. Audio navigation guides players to either objects of their choosing or the nearest vantage point object. | Titles developed using Unity |

### Release management&mdash;Testing, publishing, and marketing

These are resources to help you implement or test accessible features as part of the release management process. 

| Area    | Feature/service   | Use case | Description         | 
|---------|-------------------|----------|---------------------|
| Game testing | [Microsoft Gaming Accessibility Testing (MGATS)](https://developer.microsoft.com/en-us/games/xbox/partner/certification-mgats) | Test prerelease/launched titles securely and confidentially to identify accessibility issues/concerns | MGATS is an **optional** testing service for developers and publishers. It is designed to help you improve the inclusivity of Xbox and Windows PC titles. Testing is performed by accessibility subject matter experts and gamers with disabilities against the Xbox Accessibility Guidelines. |
| Communications | [Accessibility Insights](https://accessibilityinsights.io/) | Review accessibility issues for game related websites and apps. | Accessibility Insights is a free accessibility toolset that helps you find and fix accessibility issues in Windows apps, Android apps, web pages, and web applications. Live inspect allows you to verify that an element in an app has the right [UI Automation](/dotnet/framework/ui-automation/ui-automation-overview) properties simply by hovering over the element or setting keyboard focus on it. Fast Pass helps you identify common, high-impact accessibility issues in less than five minutes. |
| Community feedback | [Xbox Accessibility Insiders League (XAIL)](https://support.xbox.com/help/account-profile/manage-account/xbox-accessibility-insider-league) | Get public feedback about your game's accessibility features. | The Xbox Accessibility Insider League (XAIL) is a public group of Xbox players. Their goal is to provide feedback to developers about the accessibility of their content and experiences to make gaming more accessible for everyone. |

## See also

* [Why make games accessible?](accessibility-motivation.md)
* [Xbox Accessibility Guidelines](/gaming/accessibility/guidelines) 
* [Microsoft Gaming Accessibility Testing (MGATS)](https://developer.microsoft.com/en-us/games/xbox/partner/certification-mgats)