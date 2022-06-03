---
author: M-Stahl
title: Xbox network stress
description: Describes how to simulate a reduced-capacity network on an Xbox One Dev Kit.
kindex: Xbox One Network Stress
ms.author: orr
ms.topic: conceptual
edited: 11/25/2020
security: public
---

# Network stress tests on Xbox Dev Kits

Use this topic to understand how to simulate a reduced-capacity network on an Xbox One Dev Kit. User network environments can be imperfect and chaotic. Available bandwidth and transmission reliability for users might be considerably less than what your development space has.  

To provide the best possible experience for a diverse user base, test your game in realistic customer environments. Use your Xbox One Dev Kits to run network simulations for limited bandwidth, packet loss, and latency. Network simulations are an opportunity to gain insight into your game's behavior in variable conditions.


## Set up a test network

Network simulation is controlled with *xbstress.exe*, the command-line stress tool in the Microsoft Game Development Kit (GDK). Use this tool to configure various console stressors, including network simulation. For complete details, see [xbstress (NDA topic)](../../../tools-console/xbox-tools-and-apis/commandlinetools/xbstress.md). For networking purposes, `xbstress` controls a specialized driver on Xbox One. This driver drops packets, injects latency, and limits throughput.

When you use network simulation, provide a *clean* network environment to ensure that the only network issues are those caused by `xbstress`. A clean network environment should meet the following criteria.

*  Higher available bandwidth than that of the simulation target.
*  Reliable connectivity with negligible packet loss.
*  The smallest possible latency. Put all the nodes on the same link to minimize the effect of external sources of latency.


## Run a basic simulation of a network

[xbstress (NDA topic)](../../../tools-console/xbox-tools-and-apis/commandlinetools/xbstress.md) has four preconfigured simulation profiles to easily simulate important network scenarios: minimum, average, excellent, and broken. These profiles are based on figures from various sources that monitor the ongoing quality of internet connections.

Like other command-line tools, `xbstress` interprets the `/X:` command-line flag as the IP address or host name of the console. The simulation command executes the following:

   *  To simulate poor connectivity, run `xbstress simulate network=min`.
   *  To simulate average connectivity, run `xbstress simulate network=avg`.
   *  To simulate excellent connectivity, run `xbstress simulate network=exc`.
   *  To simulate broken connectivity, run `xbstress simulate network=broken`.
   *  To simulate a physical ethernet disconnect, run `xbstress simulate network=disconnect`.
   *  To stop network simulation, run `xbstress stop`.

The following table shows the details of the simulation profiles.

 | Profile| Description| Bandwidth| Packet loss| Total injected latency|
 | --- | --- | --- | --- | --- |
 | Broken| Simulates loss of connectivity. Even when this value is specified, development tools (for example, the debugger, remote command-line tools, and PIX) continue to work properly. | No data is transmitted.| 100%| No data is transmitted.|
 | Minimum (min)| Represents the minimum operating requirements of Xbox One. Titles must be able to support this environment without stopping their response or crashing to fulfill Xbox certification requirements. | Outbound: 192 Kbps<br/>Inbound: 192 Kbps| 1%| 75 ms|
 | Average (avg)| Represents reasonable DSL connectivity. Focus on this profile when testing your title's network performance.| Outbound: 700 Kbps<br/>Inbound: 1 Mbps| 1%| 50 ms|
 | Excellent (exc)| Represents excellent broadband connectivity.| Outbound: 10 Mbps<br/>Inbound: 35 Mbps| 0.5%| 30 ms|

Latency is injected in both directions of the console's network flows. To simulate the average profile, we implement an effective latency of 50 ms by injecting a 25-ms delay on inbound and outbound packets. If you simulate the average profile on two consoles on the same link, their effective peer-to-peer latency would be 50 ms in both directions.


## Run a simulation of complex network conditions

To verify that your network code is robust and ready for certification, test it when it's confronted with complex network conditions. In addition, test it in situations where a console can reach some of the endpoints that it uses but where other endpoints are unavailable or connection bandwidth is limited. You can simulate such complex network conditions by using the `channel` feature of [xbstress (NDA topic)](../../../tools-console/xbox-tools-and-apis/commandlinetools/xbstress.md).


For example, you would use channels to simulate conditions such as the following:

*  The user can't access Xbox Live, but all other network resources are available.
*  The user can’t access one of the servers that a studio uses to host custom services.
*  Access to Xbox Live seems fine, in general, but access to a particular service (such as Achievements) is very slow.
*  The user has set up a multiplayer session, but now they can't access another user's console.

To specify how access to a particular address or range of addresses should be simulated

1. Specify a channel for the address or range and the connection profile to be simulated over the channel. 
1. Define a separate channel for each address or address range where you want to specify a different connection profile.
1. Specify all the channels that apply to a simulation scenario. 
1. Use the `xbstress simulate network=channels` command to begin simulating the network conditions that have been specified by your channels.

Each channel specification has the following three values.

* **Channel:** Identified through an arbitrary number from 0 to 100. Channel descriptions are processed in numerical order, from lowest to highest. As a result, if you specify two rules that apply to a particular address, the higher-numbered channel is applied to that address.

* **Network:** The profile name to be applied to an address or address range.

* **Addresses:** Can be specified individually, in a semicolon-delimited list, or as a range by using subnet masks. 

To use [xbstress (NDA topic)](../../../tools-console/xbox-tools-and-apis/commandlinetools/xbstress.md) to block all access to Xbox Live, use the IP addresses for the Xbox Live servers as follows.

```
      xbstress set channel=0 network=broken addresses=134.170.28.0/255.255.254.0
      xbstress set channel=1 network=broken addresses=191.232.80.128/255.255.255.128
      xbstress set channel=2 network=broken addresses=191.232.82.128/255.255.255.128
      xbstress set channel=3 network=broken addresses=191.234.78.0/255.255.254.0
      xbstress set channel=4 network=broken addresses=131.253.28.0/255.255.254.0
      xbstress set channel=5 network=broken addresses=134.170.176.0/255.255.252.0
      xbstress set channel=6 network=broken addresses=157.56.70.0/255.255.254.0
      xbstress set channel=7 network=broken addresses=65.55.42.0/255.255.254.0
      xbstress set channel=8 network=broken addresses=131.253.22.0/255.255.254.0
      xbstress set channel=9 network=broken addresses=191.234.240.0/255.255.248.0
      xbstress simulate network=channels
```


For more information about the addresses of the Xbox Live servers, see [Configuring your development network access for developing Microsoft Game Development Kit titles](../../../getstarted/config-dev-kit-software/configure-dev-network.md).

To block access to an individual Xbox Live service, use its host name as listed on its reference page. For example, the [reference page](/gaming/xbox-live/api-ref/xbox-live-rest/uri/achievements/uri-achievementsusersxuidachievementsv2) for the Achievements service indicates that the service is hosted at `achievements.xboxlive.com`. To simulate a reduced bandwidth from the Achievements service, use the following command.

```
      xbstress set channel=0 network=min addresses=achievements.xboxlive.com
      xbstress simulate network=channel
```

## Run a fine-grained simulation of a network

Use `xbstress`to individually control inbound bandwidth, outbound bandwidth, packet loss, and latency. Use these controls when you want more fine-grained control of the simulation parameters. For details, see [xbstress (NDA topic)](../../../tools-console/xbox-tools-and-apis/commandlinetools/xbstress.md).


## Exempt network traffic

Network simulation doesn't affect all traffic that's coming from Xbox One. Traffic that's associated with tools is exempted from network simulation. This ensures that the tools work properly while you're debugging the issues that arise when you're challenging your network code with a simulated connection.

If network simulation causes a console to become unusable, despite these exemptions, you can deactivate network simulation. Unplug the console's power supply, wait ten seconds, plug the console in, and then turn the console on.


### Default port exemptions

The following kinds of traffic aren't affected by network stress limitations. This list isn't exhaustive. In some circumstances, other traffic that's used for system functionality might also be allowed to evade network stress limitations.

   *  IPv4 network configuration:
      *  Address Resolution Protocol (ARP)
      *  Dynamic Host Configuration Protocol (DHCP): User Datagram Protocol (UDP) ports 67 and 68


   *  IPv6 network configuration:
      *  SLAAC: ICMPv6
      *  DHCPv6: UDP port 546


   *  XTF and PIX: Transmission Control Protocol (TCP), ports 4201 and 4221-4223
   *  Telnet: TCP, ports 23, 24, 2302, and 2303
   *  XStudio: TCP, port 2375
   *  Server Message Block (SMB): TCP 445


### Custom exemptions for ports

To exempt additional ports from network simulation and use them for your own custom tools, use `xbstress` to set up custom exemptions. Your tools can then use those ports to communicate across the network.


To set up an exemption, use the `tcpportexemptions` or `udpportexemptions` arguments in `xbstress`. Both arguments are followed by a semicolon-separated list of the ports to be exempted. The following examples demonstrate the use of these commands.

*  The `xbstress set tcpportexemptions 49152;49153` command creates exemptions for TCP ports 49152 and 49153.
*  The `xbstress set udpportexemptions 49153;49154` command creates exemptions for UDP ports 49153 and 49154.


## Interactions between network simulation and network capture

Using [xbtrace (NDA topic)](../../../tools-console/xbox-tools-and-apis/commandlinetools/xbtrace.md) to perform on-console network captures while also performing network simulation can result in misleading network captures. Simulation effects (such as packet drops) are implemented after the capture procedure. For example, a capture could indicate that a packet was transmitted, even though it was subsequently dropped by the simulation driver before actually being transmitted over the network.


## See also

 [Stress (xbstress.exe) (NDA topic)](../../../tools-console/xbox-tools-and-apis/commandlinetools/xbstress.md)