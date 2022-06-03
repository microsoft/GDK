---
author: M-Stahl
title: Quality of Service measurements
description: Describes how to measure Quality of Service (QoS) in a GDK title.
kindex:
- Quality of Service Measurements
- qos
ms.author: fschober
ms.topic: conceptual
edited: 07/28/2021
security: public
---

# Quality of Service measurements in the Microsoft Game Development Kit

Use this topic to understand how to measure Quality of Service (QoS) in a GDK title. For multiplayer titles, measuring QoS latency is important. For peer-to-peer connections, QoS latency measurements can be used to determine if gameplay with another client is feasible. For client/server connections, QoS latency measurements can be used to determine the best datacenter location for gameplay.

For Xbox One ERA titles, secure sockets included QoS APIs for latency and bandwidth measurements. GDK titles can achieve the same functionality as described in the following sections.

## Peer-to-peer

Titles that use peer-to-peer communication can use a custom QoS implementation in the title code, game engine, or middleware.

For all implementations, titles should ensure that the following guidelines are met.

* Secure Communication Best Practices.
  Titles should follow the best practice to secure all network communication, regardless of content. This should also apply for peer-to-peer UDP QoS probes. These probes should be performed through a secure protocol connection. For more information on secure protocol best practices, see [Secure Game Mesh Communication for Microsoft Game Development Kit Titles (NDA topic)](../../../security/communication-security/communication-security-impl/gc-secure-game-mesh-impl.md).
* User Datagram Protocol (UDP) packet size.
  For UDP communication, titles should ensure to not exceed the maximum platform Maximum Transmission Unit (MTU). The default maximum UDP payload per packet is 1,384 bytes for Microsoft Game Development Kit (GDK) titles on Xbox consoles and Windows 10. Packets exceeding the MTU are likely to be fragmented, which can lead to additional latency or dropped packets.
* Matching protocol and communication channel.
  Peer-to-peer QoS should always be performed through the same communication channel and protocol that's used for gameplay traffic. This ensures that all measurements reflect the behavior of gameplay traffic, including delays and bandwidth.
* Session browse QoS behavior.
  Titles that use QoS as part of session browse lists can accidentally create QoS flooding of popular hosts. This occurs when the session browse list is identical across all users and includes automatic QoS testing. In this scenario, all users who view a session browse list will perform QoS tests against the top hosts in the list. This can lead to a heavy load and potentially flood a host or server. Titles are encouraged to partially randomize session browse lists to reduce this issue.
* Other title bandwidth usage.
  Any QoS measurement is affected by other local or remote network behavior. Titles can't affect other platform or subnet traffic behavior. However, control of internal title traffic is still possible. Titles should ensure this, and title downloads or other network use is minimized when performing QoS measurements. The same applies for multiple parallel QoS measurements.


## Client/Server

Titles that use client/server communication can use custom QoS implementation in the title code, game engine, or middleware. Unlike peer-to-peer QoS measurements, the typical goal of client/server QoS measurements is to determine the latency to a specific datacenter. Titles in this scenario should ensure that they adhere to the same guidelines as for peer-to-peer QoS measurements.

Titles that are using Azure PlayFab multiplayer servers should always use the provided APIs for QoS measurements. For more information, see [Using Quality-of-Service (QoS) beacons to measure player latency to Azure](/gaming/playfab/features/multiplayer/servers/using-qos-beacons-to-measure-player-latency-to-azure).


## QoS metric considerations

The two most common QoS metrics that determine connection quality are packet *latency* and available link *bandwidth*.

* Latency testing.
  Latency is typically tested on a per-packet basis between two endpoints. The best practice is to send a small number of packets below the local MTU size to a remote endpoint where the packet is echoed back to the local device. This determines the round-trip time of a packet. For measurement, multiple packets should be averaged. Latency measurement can be performed quickly.

* Bandwidth testing.
  Bandwidth is typically tested by sending large data volumes with increasing frequency to another endpoint to saturate the local link. Link bandwidth can be inferred based on the state of the local send and/or receive buffer. Increasing buffer usage indicates that the link is saturated. Bandwidth measurements require longer test duration and can affect local link quality.

Latency and bandwidth are generally strongly linked. Limited bandwidth leads to higher packet latency because packets are held locally when the network is congested. Low latency indicates more available bandwidth because it indicates that packets aren't held locally. As a result, titles should only perform latency measurements for the purpose of gameplay traffic QoS. Bandwidth tests are generally not needed for gameplay traffic.


## QoS testing

The Xbox One Dev Kits can run network simulations to simulate limited bandwidth, packet loss, and latency. We strongly recommend this functionality for testing custom QoS implementations and end-to-end testing of all QoS functionality. For more information, see [Xbox One network stress](../tools/netstress-networking.md).

## See also

 [Windows Sockets 2 (Winsock)](/windows/desktop/WinSock/windows-sockets-start-page-2)

 [PlayFab Party](playfab-party-intro-networking.md)

 [Using Quality-of-Service (QoS) beacons to measure player latency to Azure](/gaming/playfab/features/multiplayer/servers/using-qos-beacons-to-measure-player-latency-to-azure)