---
author: M-Stahl
title: Configuring development network access
description: Describes how to configure your network access so that your development PC and your target PC or Development Kit can establish a connection through your local area network (LAN).
kindex: Configuring development network access
ms.author: orr
ms.topic: conceptual
edited: 07/27/2020
security: public
---
> [!NOTE]
> When migrating from the XDK to the GDK, ensure that any folder-specific restriction or firewall rules are updated to the new installation folder path at "C:\Program Files (x86)\Microsoft GDK".

# Configuring your development network access for developing Microsoft Game Development Kit titles


1. You might have to configure your development network access. Work with your network administrators to verify that the following ports are on the allowed list of your administrator’s network and computers.

2. You might have to create exceptions for the local computer's firewalls for the [ports](#ports-required-dev-comp) listed later in this topic.

3. Before you can begin developing with your target device, you have to establish a connection between the development PC and the target device through your local area network (LAN). The following information provides the basic requirements for a network environment and for Gaming Runtime development for PC and Xbox.

<a id="ID4E2"></a>

## Required domains for Xbox services  

```
https://*.xboxlive.com  
```

```
https://*.xbox.com  
```

```
https://*.bing.com  
```

```
https://*.microsoft.com  
```

```
https://*.akamai.net  
```
<a id="ID4EKB"></a>

## Required port to enable communications with Xbox services  

The required port to enable communications with Xbox services is TCP 443.


<a id="ID4EUB"></a>

<a id="ports-required-dev-comp"></a>  

## Required ports to enable communication with the development PC  

   *  2303  
   *  3076  
   *  4016
   *  11442
   *  11443
   *  49152  
   *  49157  
   *  49160  


<a id="ID4EIC"></a>

## Required ports to enable communications with multiplayer/Teredo  

   *  UDP 500 outbound and inbound  
   *  UDP 3544 outbound  
   *  UDP 4500 outbound and inbound  



To run tests between devices that aren't on the same network, turn off all filtering of inbound packets.  


<a id="ID4ECD"></a>  

## Required server-to-server Xbox Live network configuration  
   
If your title makes server-to-server Xbox Live calls, update the routing configurations and/or access control lists (ACLs). This ensures that you can connect to the Xbox Live datacenter from your services. 

The following CIDR blocks need to be routable for all Xbox sandboxes (for example, RETAIL, CERT, *.1, and *.99).  

   *  134.170.28.0/23  

   *  191.232.80.128/25  

   *  191.232.82.128/25  

   *  191.234.78.0/23  

   *  131.253.28.0/23  

   *  134.170.176.0/22  

   *  157.56.70.0/23  

   *  65.55.42.0/23  

   *  131.253.22.0/23  

   *  191.234.240.0/21  

Failure to account for the new CIDR blocks could prevent your services from interacting with Xbox Live services.

## Additional development network access configuration for developing Microsoft Game Development Kit (GDK) titles on Xbox One

<a id="ID4EYC"></a>

  * 22 (Secure Shell (SSH) Protocol)
  * 445 (Xbox Manager, Server Message Block (SMB) Protocol)
  * 4016 (Visual Studio 2012 Remote Debugger)
  * 4020 (Visual Studio 2015 Remote Debugger)
  * 4022 (Visual Studio 2017 Remote Debugger)
  * 4024 (Visual Studio 2019 Remote Debugger)
  * 4201 (Xbox Manager, PIX, Xtf, XbtpLinkSvc)
  * 4211 (Xbox Manager, PIX, Xtf)
  * 4221 (Xbox Manager, PIX, Xtf)
  * 4224 (PIX)
  * 4600 (PIX)
  * 4601 (PIX)
  * 9002 (Xbox Game Streaming)
  * 9269 (Touch Adaptation Kit Tools)
  * 11442 (Xbox Manager)
  * 11443 (Xbox Manager, Windows Device Portal)
  * 8116 (Visual Studio Integration)
  * 8117 (Visual Studio Integration)
> [!NOTE]
> It is recommended that the above list of ports be open for both TCP and UDP. Most UI tools only require TCP ports to be opened to work appropriately. Xbox Game Streaming requires UDP to be opened to work properly.

### Port required for using the Submission Validator tool

The required port for using the Submission Validator tool is 80.  

<a id="wol_support"></a>  

### Required ports for Wake on LAN support for Xbox dev kits  

Some functionality requires the ability to send *Wake on LAN* magic packets to your dev kit. This includes the [Reboot (xbreboot.exe) (NDA topic)](../../tools-console/xbox-tools-and-apis/commandlinetools/xbreboot.md) command-line tool and some functionality of [Xbox Manager (NDA topic)](../../tools-console/xbox-tools-and-apis/xbom/xbom.md). Wake on LAN is sent on the following UDP ports.

   *  UDP 7
   *  UDP 9  

 If you need help with configuring your Xbox development network access, contact your developer account manager (DAM) or post a question on the [Xbox Developer Forums](https://forums.xboxlive.com/index.html).

### IPv6-only networks

Most Xbox Live services (including sign-in and authentication) currently only provide IPv4 endpoints. As a result development and testing should only be performed on networks with IPv4 (and optionally IPv6) connectivity. Pure IPv6 networks are currently not supported. Development tools and console socket APIs support IPv6 connectivity. 


## Next steps

After configuring the network access for you development PC you should create a new project to verify your GDK installation by proceeding to [Developing a new title with the GDK](../overviews/developing-new-titles-on-gamecore.md).  