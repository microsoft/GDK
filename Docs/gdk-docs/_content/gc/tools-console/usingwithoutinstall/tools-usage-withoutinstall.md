---
author: aablackm
title: Using tools without installing the Microsoft Game Development Kit (GDK)
description: Describes the process of using tools without installing the Microsoft Game Development Kit (GDK).
kindex:
- Using Tools without installing the Microsoft Game Development Kit (GDK)
- Tools, Command Prompt, XbtpLinkSv
- Without Install
- advanced
ms.author: zhooper
ms.topic: conceptual
edited: 11/11/2019
security: public
---

# Using tools without installing the Microsoft Game Development Kit
   
  
This topic covers the steps that are required to use the Microsoft Game Development Kit (GDK) tools from the extracted location. As noted in the initial extraction document, this is focused on primarily enabling build scenarios. There's no guarantee around support for all actions across all tools.

## Command prompt and command-line builds

Most command prompt actions are expected to work. Using a command prompt configured to run overridden environment variables provides the highest chance of this being the case.

For more details about how to configure build environments and command prompts, see [Configuring the build environment without installing the Microsoft Game Development Kit](build-environment-withoutinstall.md). 

After this is configured, builds via MSBuild execution use overridden environment variables to point to the extracted file locations.

## XbtpLinkSvc setup

XbtpLinkSvc needs to be registered and started to enable the expected deployment behavior from the extracted location. To do this, run the following commands from the Microsoft GDK\bin directory.

**XbtpLinkSvc.exe /register /f**  
**XbtpLinkSvc.exe /routing**  

The **/register** command configures the service for use. The **/routing** command launches the service.

### Firewall setup

You might encounter firewall notifications for XbtpLinkSvc.exe accepting incoming connections on TCP port 4201 from consoles. Allowing XbtpLinkSvc.exe to accept incoming connections provides a much better experience. If network policy restricts incoming connections to XbtpLinkSvc.exe, **xbconnect /data** needs to be executed often for each console to ensure a PC-initiated connection has been made to the console. Allowing these incoming connections enables consoles to initiate on-demand connections to the PC.

A suitable firewall rule named "Xbox Transport Link Service (inbound)" can be added to the Windows Firewall by using the following command from an elevated command prompt:

<code>netsh advfirewall firewall add rule name="Xbox Transport Link Service (inbound)" dir=in action=allow protocol=tcp localport=4201</code>

### Changing the extracted directory

If the Microsoft Game Development Kit (GDK) location changes, XbtpLinkSvc will need to be re-registered, the task killed, and restarted. To do so, run the following commands from the Microsoft GDK\bin directory (of the new Microsoft Game Development Kit (GDK) location).

**XbtpLinkSvc.exe /register /f**  
**taskkill /im XbtpLinkSvc.exe /f**  
**XbtpLinkSvc.exe /routing**  

This will properly restart the service in the new extracted location.

## See also

[Using the Microsoft Game Development Kit without installation](gc-usingwithoutinstall-toc.md)

[Using the Microsoft Game Development Kit to configure, build, and deploy Xbox projects (NDA topic)](../usinggsdk/gc-usinggsdk-toc.md)