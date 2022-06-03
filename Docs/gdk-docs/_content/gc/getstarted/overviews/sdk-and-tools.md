---
author: M-Stahl
title: SDK & tools requirements
description: Describes the SDKs and tools required on your development PC for developing titles with the Microsoft Game Development Kit (GDK).
kindex: SDK & tools
ms.author: douglau
ms.topic: conceptual
edited: 10/08/2019
security: public
---

# Software Development Kits (SDKs) and tools

To develop Microsoft Game Development Kit (GDK) games, developers must install the following SDKs and tools on their development computers:  

* [Windows 10 Software Development Kit (Win10SDK)](sdk-and-tools.md#IDWSDK)
* [Visual Studio](sdk-and-tools.md#install-visual-studio)
* [Microsoft Game Development Kit (GDK)](sdk-and-tools.md#IDGDK)

This applies to games that target the PC, Xbox console, or both platforms.
> [!NOTE]
> Before you install any software on your development computer, consider creating a system restore point.  

<a id="IDWSDK"></a>

## Windows 10 Software Development Kit (Win10SDK)  

Because Microsoft Game Development Kit (GDK) games are based on Win32, [Win10SDK](https://developer.microsoft.com/windows/downloads/windows-10-sdk/) is a core part of the developer experience. Win10SDK defines the headers, libraries, and tools required to build a basic Win32 game. From the perspective of logical architecture, the Windows SDK provides developers with the assets they need to consume the Microsoft Game Development Kit (GDK) *gaming platform*. Components and tools such as the following.

- Direct3D public API: stock; no device-specific graphics extensions

- XAudio and related public audio APIs: stock; no device-specific audio extensions

- Public API for PIX for Windows: stock; no device-specific profiling extensions

- Networking and other core OS services, such as file I/O, memory, window management, and message pump


The Windows 10 SDK exposes the following components of the gaming platform:

- New API family WINAPI_FAMILY_GAMES, which represents the set of Win32 core platform APIs that are relevant to game development and are supported on PCs as well as Xbox consoles.

     Use of the API family is optional for a game that targets only PCs, because a PC game developer can instead use the full set of APIs that are supported on the PC.

- New umbrella library xgameplatform.lib, which defines the entry points for all APIs in WINAPI_FAMILY_GAMES.  

- New API for [gaming input](../../input/gc-input-toc.md), which unifies the input model across gamepad, keyboard, mouse, touch, and other input devices.

- New API for process lifetime management (PLM).  

The Microsoft Game Development Kit (GDK) requires Windows 10 SDK version 19041 or later. You can get the Windows 10 SDK in two ways: install it by selecting the download link on the [Windows 10 SDK](https://developer.microsoft.com/windows/downloads/windows-10-sdk/) download page or by selecting "Windows 10 SDK" in the optional components of the Visual Studio 2019 Installer.  


<a id="install-visual-studio"></a> 

## Visual Studio  

Visual Studio 2019, or Visual Studio 2017 (Update 15.9 or later) is recommended for Gaming Runtime development. 
For more information on supported versions of Visual Studio, see [Visual Studio (NDA topic)](../../tools-console/xbox-tools-and-apis/visualstudio/visualstudio.md).   > [!NOTE]
> If you install a new edition of Visual Studio after installing the Microsoft Game Development Kit (GDK), you must repair the Microsoft Game Development Kit (GDK) so that the Microsoft Game Development Kit (GDK) can integrate with the newly installed edition of Visual Studio.  > [!NOTE]
> If you need to uninstall Visual Studio, uninstall the Microsoft Game Development Kit (GDK) first.   


<a id="IDGDK"></a>

### Gaming Development Kit (GDK)  

The GDK contains all the developer kit assets (beyond those of the WinSDK) needed to develop a fully featured game that uses the Microsoft Game Development Kit (GDK) services. From the perspective of logical architecture, the contents of the Microsoft Game Development Kit (GDK) represent:  
- **Gaming Runtime:** These components extend the underlying gaming platform with services that execute on the device where the game is running. Examples of Gaming Runtime services include:
  - MSIXVC has packaging with support for package management, downloadable content, Intelligent Delivery, and custom actions
  - Title-callable UI (TCUI)
  - Connected storage
  - Async block
  - Thread annotation
  - Device association
  - User
  - Speech synthesis (text-to-speech)
  - Accessibility (closed-captioning, high-contrast)
  - Screen Time

- **Gaming Cloud Services:** These are gaming-centric services whose implementations are hosted in the cloud. Most of these services expose platform-agnostic REST APIs and provide source-code wrapper APIs that can be compiled directly into the game executable.
  - Xbox Service API (XSAPI)
  - Xbox Authentication Library (XAL)
  - Multiplayer networking
  - PlayFab
  - Microsoft Store, including in-app purchases

- **Gaming device extensions:** These extensions expose APIs for device-specific features, such as specialized hardware for accelerating graphics, audio, and video processing.
  - DirectX 12.x
  - Audio.x
  - Pix.x
  - XMemAlloc and related console-specific memory APIs


## Tools
The philosophy we have adopted for the Microsoft Game Development Kit (GDK) tools is to meet developers "where they are":

* Developers who use Win32 development tools and middleware to build Win32 PC games should be able to continue using these tools to build games that take advantage of the Microsoft Game Development Kit (GDK) services.

* Developers who use Xbox One Software Development Kit tools to develop Xbox One ERA should be offered the same or equivalent tools for developing Microsoft Game Development Kit (GDK) games for Xbox console.

In practical terms, a typical developer who's building a Win32 *PC* game can:

* Use tools from the PC ecosystem to iterate, test, and debug locally on the developer's computer.

* Build with Visual Studio and the usual third-party extensions, plus PIX for Windows and third-party utilities for diagnosis, optimization, and more.

* (1) Set up the remote development tools for Visual Studio on a lab machine that has a specific graphics driver required for a repro.  
    (2) Launch the game in Visual Studio debugger that's targeting the remote PC.  
    (3) Use the Remote Desktop Portal to access the remote machine.  
    (4) Follow the repro steps to isolate the bug.  

In contrast, a typical developer who's using the Microsoft Game Development Kit (GDK) to build a Win32 *Xbox* game can:

* Use familiar tools from Xbox One ERA development to iterate, test, and debug remotely, by using an Xbox One dev kit.

* Build with Visual Studio and third-party extensions, plus PIX for Xbox.

* Use the remote development tools such as xb* command line tools, Xbox Manager, PIX for Xbox, Dev Home, and Xbox Device Portal (XDP).

One of the areas where we hope to get feedback on previews of the Microsoft Game Development Kit (GDK) is on having a set of tools for developing on the PC and a separate set of tools for developing on the console. In particular, we’d like to know whether developers feel this would be a productive approach and one appropriate for the Microsoft Game Development Kit (GDK) developer audience.


## Next steps

After installing the required SDKs and tools in this step proceed to [Configuring your development network access for developing Microsoft Game Development Kit titles](../config-dev-kit-software/configure-dev-network.md).

## See also

[Getting started with the Microsoft Game Development Kit (GDK) (NDA topic)](../gc-getstarted-toc.md)  

