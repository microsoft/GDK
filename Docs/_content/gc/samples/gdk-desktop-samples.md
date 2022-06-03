---
author: M-Stahl
title: "GDK desktop samples"
description: Describes the desktop (Windows PC) samples that are available in the Microsoft Game Development Kit (GDK).
kindex:
- Desktop samples
- Samples, Desktop
ms.author: joanlee
ms.topic: conceptual
edited: 04/07/2020
security: public
---

# Microsoft Game Development Kit desktop samples

This topic describes all the secured NDA desktop samples and other samples that you'd need when developing desktop (Windows PC) titles. They're available in the latest .zip file that's uploaded on the Microsoft Game Development Kit (GDK) Developer Download site.

For detailed download information, see [Download instructions](gdk-samples-home.md#download-instructions). If you're looking for the full list of GDK samples, see [Microsoft Game Development Kit (GDK) samples](gdk-samples-home.md).

<a id="categories"></a>

## Categories

Following is a list of categories for the samples.

* [IntroGraphics](#intrographics)
* [Xbox Live](#xbox-live)
* [System](#system)

<a id="intrographics"></a>

### IntroGraphics

| Sample | Description | 
| ------ | ----------- |
| [Simple Triangle_Desktop](https://aka.ms/gdkdl) | Demonstrates how to create a static Direct3D 12 vertex buffer to render a triangle on the screen. This sample runs on any Windows 10 system that's equipped with a DirectX 12&ndash;capable video card. In the Debug configuration, if no DirectX 12&ndash;capable video card is found, the sample uses Windows Advanced Rasterization Platform (WARP12) if available (requires the Graphics Tools optional Windows component).|  

<a id="xbox-live"></a>

### Xbox Live  

| Sample | Description | 
| ------ | ----------- |
| [Achievements2017_Desktop](https://aka.ms/gdkdl)| Demonstrates how to use the Title Managed Achievements flat C API that's provided by the Microsoft Game Development Kit (GDK). The scenarios include querying Xbox Live for all achievements for the title, handling multiple pages of results, querying for a single achievement, and updating the progress on an achievement. |
| [Fundamentals_Desktop](https://aka.ms/gdkdl) | Demonstrates signing in to Xbox Live and making a license check to ensure that the game is owned by the user who is currently signed in.| 
| [InGameStore_Desktop](https://aka.ms/gdkdl) | Demonstrates the `XStore` APIs to create an in-game store for showcasing and purchasing available downloadable content (DLC) and consumables. Note that some of the visual elements that are seen in the console version of the sample aren't supported in this sample.|
| [Leaderboards_Desktop](https://aka.ms/gdkdl) | Demonstrates the use of Xbox Live Leaderboards with Events-Based stats. The sample is configured for building with Visual Studio 2017 with the Microsoft Game Development Kit (GDK) installed.|
| [NetRumble_Desktop](https://aka.ms/gdkdl) | Demonstrates multiplayer functionality by using the Multiplayer Manager APIs alongside PlayFab Party to build a complete end-to-end game experience. This sample provides options for the following multiplayer scenarios: creating joinable sessions, inviting friends and party members to your session, joining a friend’s session in progress, matchmaking (coming soon), handling host migration, and active gameplay.|
| [SimpleWinHttp_Desktop](https://aka.ms/gdkdl) | Demonstrates using WinHTTP for HTTP requests and WebSockets. Includes the use of XSTS tokens for client-to-server authorization with Xbox Live and custom game services. |
| [Social_Desktop](https://aka.ms/gdkdl) | Demonstrates the Social Manager flat C API provided by the Microsoft Game Development Kit (GDK). This sample includes scenarios for adding users and creating groups, retrieving social groups based on filters, and responding to Social Manager events. |

<a id="system"></a>

### System 

| Sample | Description | 
| ------ | ----------- |
| [GameSave_Desktop](https://aka.ms/gdkdl)| Demonstrates the use of the Microsoft Game Development Kit (GDK) `XGameSave` APIs to save and load game save data. This sample shows how to use the normal "full sync" method for handling cloud synchronization&mdash;where all the user’s game save containers are synchronized when the user plays the title on another console&mdash;and how to use "sync-on-demand" mode, which provides more detailed control over when and how containers are synced. This is typically intended for use with larger containers that might take some time to synchronize. The sample also demonstrates a variety of other techniques that are related to the new Microsoft Game Development Kit (GDK) API surface area. Most of the files related to this can be found in the _\\Helpers\\_ folder, and they demonstrate techniques such as wrapping asynchronous operations in C++ classes, resource acquisition is initialization (RAII) wrappers, and single-player user management. |
| [StreamingInstall_Desktop](https://aka.ms/gdkdl) | Demonstrates the streaming installation APIs. After the launch chunk is installed, the sample can be run to visualize the installation progress of the remaining chunks. It also demonstrates the intelligent installation features including localized chunks, hardware-specific chunks, and custom tags. Different content will be installed, depending on the target SKU of the target hardware and the language/locale settings of the console. |
| [SimpleDirectStorageCombo](https://aka.ms/gdkdl) | Demonstrates several ways to use DirectStorage on Windows and Xbox One family consoles and Xbox Series consoles. Xbox One family is handled through an emulation layer. |
 