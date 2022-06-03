---
author: joannaleecy
title: PC port behavior
description: Describes PC port behavior.
kindex: winsock
ms.author: joanlee
ms.topic: conceptual
edited: 00/00/0000
security: public
---

# PC port behavior

This topic describes PC port behaviors.

## Port rules

* PC ports allow all outbound Transmission Control Protocol (TCP) and User Datagram Protocol (UDP) traffic while blocking unsolicited inbound TCP and UDP packets, when users are using the built-in default Windows firewall. 

* The preferred local UDP multiplayer port behaves the same way as the other ports but allows unsolicited inbound UDP packets. TCP can't be used.

* Outbound flows will always work and you don't have to declare any attributes for this. When users send the first packet to the remote server/device, subsequent incoming packets from that device will be delivered regardless.

* For peer-to-peer in Microsoft Game Development Kit (GDK) titles, you should use UDP on the preferred multiplayer port. Additionally, you must perform firewall and NAT punching. Unsolicited inbound TCP packets are blocked unless the user exempts game. Unsolicited inbound UDP packets are also blocked by default and require either exemptions from the user or some form of firewall punching to unblock UDP peer-to-peer flows. 

* Exemptions for the title can either be added by the user through the firewall settings or when you declare specific attributes during the packaging process. Both users' firewall settings and game package attributes determine the actual unsolicited inbound packet behavior.

* It is important to note that PC users are able to use third-party firewalls. These settings will impact the overall behavior of the ports. More details below.

**Tip**: [PlayFab Party](playfab-party-intro-networking.md) provides a peer-to-peer network topology that automatically handles this functionality. Alternatively, see the RFCs for [STUN](https://tools.ietf.org/html/rfc5389) and [ICE](https://tools.ietf.org/html/rfc8445) as a starting point for your own implementation.

## Unsolicited inbound traffic management

PC titles created using GDK are published as MSIXVC packages.

When titles are shipped as MSIXVC packages, you have the option to declare how unsolicited inbound traffic is handled by declaring attributes like [privateNetworkClientServer](/uwp/schemas/appxpackage/uapmanifestschema/element-capability) or [internetClientServer](/uwp/schemas/appxpackage/uapmanifestschema/element-capability) in the __MicrosoftGame.config__ file.

**Important:** Due to users' firewalls and settings, these attributes may have no actual effect. To learn more, see [Firewall and how it affects traffic](#firewall-and-how-it-affects-traffic).

Table below lists how attributes affect unsolicited inbound traffic access and the expected customer experience.

| MicrosoftGame.config | Access | Expected customer experience |
|---------------------|-------------------------|------------------------------|
| __privateNetworkClientServer__ specified | Allow unsolicited inbound LAN traffic | Exemptions for game are added during the executable image installation as specified in the game package. |
| __privateNetworkClientServer__ NOT specified | Maintains default behavior where all unsolicited inbound LAN traffic is blocked | No notification is shown. Unsolicited inbound UDP/TCP packets are silently dropped. |
|__internetClientServer__ specified | Allow unsolicited inbound peer-to-peer internet traffic | Exemptions for game are added during the executable image installation as specified in the game package. |
|__internetClientServer__ NOT specified | Maintains default behavior where all unsolicited inbound peer-to-peer internet traffic is blocked | No notification is shown. Unsolicited inbound UDP/TCP packets are silently dropped. |

### How to edit MicrosoftGame.config for GDK titles

* Go to your title's source code.
* Open __MicrosoftGame.config__.
* Add the code snippet below and save the file. 

Note that when you build the MXIXVC package, it'll generate a warning in the __SubmissionValidator__ log file.

```xml
<ExtendedAttributeList>
  <ExtendedAttribute Name="Capability" Value="privateNetworkClientServer"/>
  <ExtendedAttribute Name="Capability" Value="internetClientServer"/>
</ExtendedAttributeList>
```
When properties are added to the game's __MicrosoftGame.config__ file, they're applied to the generated __AppXManifest.xml__. To learn more about the generation process, see [MicrosoftGame.config overview](../../../system/overviews/microsoft-game-config/MicrosoftGameConfig-Overview.md).

<a id="firewall-and-how-it-affects-traffic"></a>

## Firewall and how it affects traffic

Users' firewall and settings affect your game's networking capabilities. This section describes how firewalls affect traffic for GDK titles and this will help you tighten your networking design.

To provide a better understanding of this topic, port access affected by firewall for Win32 games is also included as a reference.

In general, you need to be prepared that __privateNetworkClientServer__ and __internetClientServer__ attributes have no effect on users who have third-party firewalls. This is expected to be 30-40% of total users. 

### GDK executable games

**Users with the default Windows 10 firewall**

* __privateNetworkClientServer__ and __internetClientServer__ attributes function as described earlier
* Outbound based flows will always work with or without __privateNetworkClientServer__ and __internetClientServer__ attributes defined. As long as users send the first packet to the remote server/device, subsequent incoming packets from that device will be delivered.

**Users with third-party firewalls**

* __privateNetworkClientServer__ and __internetClientServer__ attributes have no effect. These users will drop unsolicited inbound packets silently. Note: This is **regardless** whether you've declared access capabilities in the __MicrosoftGame.config__ or not during packaging.
* All ports&mdash;including the preferred local UDP multiplayer port&mdash;are subject to the policies that are specified by those firewalls.
* Outbound based flows will typically work. It's up to the user to exempt your title's network access appropriately through the third-party firewall settings.

### Win32 executable games

**Note:** This section is added as a comparison. GDK titles are not Win32 titles. We recommend PC titles to use GDK for development.

**Users with the default Windows firewall**

* On first launch, a notification is displayed to let the user deny or allow the application's network access to the game server.
* Outbound based flows will always work though without UI notifications.

## See also

* [Windows Sockets 2 (Winsock)](/windows/desktop/WinSock/windows-sockets-start-page-2)

* [Xbox console port behavior (NDA topic)](xbox-console-port-behavior.md)

* [Preferred UDP multiplayer port](preferred-local-udp-multiplayer-port-networking.md)

* [PlayFab Party](playfab-party-intro-networking.md)

