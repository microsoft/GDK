---
author: M-Stahl
title: Introduction to Microsoft Game Development Kit (GDK) networking
description: Provides an introduction to the network stack in the Microsoft Game Development Kit (GDK).
kindex:
- Introduction to the network stack
- networking
ms.author: fschober
ms.topic: conceptual
edited: 07/28/2021
security: public
---

# Introduction to Microsoft Game Development Kit networking

This topic provides an introduction to the network stack in the Microsoft Game Development Kit (GDK). The networking stack and available APIs for Microsoft Game Development Kit (GDK) titles are similar to Win32 network APIs. This simplifies porting from existing Win32 titles and allows more unified network implementations.

## Available APIs

The following table summarizes the API space for the Microsoft Game Development Kit (GDK). For more information about each API for the Microsoft Game Development Kit (GDK), see its associated links.

| Feature | Microsoft Game Development Kit (GDK) |
| --- | :---: |
| All-in-one solution<br>(network game data and in-game chat) | [PlayFab Party](game-mesh/playfab-party-intro-networking.md) |
| Secure client/server network game data transport | [MsQuic](game-mesh/msquic-intro-networking.md) |
| REST | [XSAPI](https://developer.microsoft.com/games/xbox/docs/gdk/atoc-xsapi-c)|
| HTTP** | [xCurl](web-requests/intro-xcurl.md)  (recommended) or [WinHTTP](web-requests/intro-winhttp.md) |
| WebSocket** | [libHttpClient](web-requests/http-networking.md#libhttpclient) (recommended) or [WinHTTP](web-requests/intro-winhttp.md) |
| Sockets | [Winsock](game-mesh/winsock-intro-networking.md) |
| Socket security | OpenSSL Datagram Transport Layer Security (DTLS) or Bcrypt DTLS [(Secure Game Communication) (NDA topic)](../../security/communication-security/communication-security-impl/gc-secure-communication-impl.md) |
| Network connectivity | [XNetworkingGetConnectivityHint](initialization-connectivity-networking.md) |
| Port behavior | [Identical to Win32 Windows PC](game-mesh/winsock-intro-networking.md#ID4EICAC) |
| In-game chat | [PlayFab Party](game-mesh/playfab-party-intro-networking.md) or [Game Chat 2](../../chat/overviews/game-chat2/game-chat-2-intro.md) |

**: To learn how to select which API to use, see [Web requests](web-requests/http-networking.md).

## New and important concepts

There are two new concepts that apply to almost every single one of the Microsoft Game Development Kit (GDK) networking APIs.

### Network initialization

All networking APIs only function properly once the network is initialized.  Your title should be waiting for network initialization before calling into any networking API or middleware that relies upon a networking API.  For more information on network initialization, see [Network initialization and connectivity](initialization-connectivity-networking.md).

<a id="SuspendResume"></a>
### Suspend and resume

Almost all network handles and objects created from networking APIs need to be cleaned up during your title's suspend notification.  Each API overview describes how to do this for that particular area; both your title and any middleware consuming these APIs should follow this guidance.  For more information on suspend and resume generally, see the [Xbox game life cycle (NDA topic)](../../system/overviews/xbox-game-life-cycle.md#responding-to-suspend-and-resume) overview.

Suspend and resume handling documentation:
 - [PlayFab Party](game-mesh/playfab-party-intro-networking.md#SuspendResume)
 - [MsQuic](game-mesh/msquic-intro-networking.md#SuspendResume)
 - [XCurl](web-requests/intro-xcurl.md#SuspendResume)
 - [WinHTTP](web-requests/intro-winhttp.md#SuspendResume)
 - [WinSock](game-mesh/winsock-intro-networking.md#SuspendResume)
 - [Preferred Local UDP Multiplayer Port](game-mesh/preferred-local-udp-multiplayer-port-networking.md#SuspendResume)
 - [Network Initialization](initialization-connectivity-networking.md#SuspendResume)
 - [Game Chat 2](../../chat/overviews/game-chat2/game-chat-2-intro.md#SuspendResume)

## Xbox One Software Development Kit migration

For details about titles that are migrating from the previous Xbox One Software Development Kit documentation, see [Xbox One Software Development Kit migration overview (NDA topic)](xdk-migration/xdk-migration-overview-networking.md). This topic includes guidance for titles that enable communication between the Xbox One Software Development Kit and the GDK title versions.


## See also

[Network initialization and connectivity](initialization-connectivity-networking.md)

[Web requests: HTTP and WebSocket](web-requests/http-networking.md)

[Windows Sockets](game-mesh/winsock-intro-networking.md)

[Game Chat 2](../../chat/overviews/game-chat2/game-chat-2-intro.md)

[PlayFab Party](game-mesh/playfab-party-intro-networking.md)

[PlayFab Party Online Subsystem for Unreal](game-mesh/party-unreal-online-subsystem.md)

[PlayFab Party SDK for Unity](game-mesh/party-unity-plugin.md)

[MsQuic](game-mesh/msquic-intro-networking.md)

[Getting Started with Xbox Live APIs](../../live/get-started/live-gs-xbl-apis.md)

[Preferred UDP multiplayer port](game-mesh/preferred-local-udp-multiplayer-port-networking.md)

[Secure Game Communication for Microsoft Game Development Kit Titles (NDA topic)](../../security/communication-security/communication-security-impl/gc-secure-communication-impl.md)
