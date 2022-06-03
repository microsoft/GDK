---
author: M-Stahl
title: Fiddler on Xbox devkits
description: Describes how to use Fiddler with an Xbox devkit.
kindex: Fiddler on Xbox devkits
ms.author: orr
ms.topic: conceptual
edited: 11/20/2020
security: public
---

# Fiddler on Xbox devkits

Use this topic to understand how to use Fiddler with an Xbox devkit. *Fiddler* is a web-debugging proxy that logs all HTTP and HTTPS traffic 
between an Xbox devkit and the internet. To understand and debug web service calls, use Fiddler to log and inspect traffic to and from the 
Xbox services and Relying Party web services. Fiddler is available in several versions. *Fiddler Classic* is freeware. To download it, see 
the [Fiddler website](https://www.fiddler2.com/fiddler2/). The following sections refer only to Fiddler Classic.

In normal operation, a devkit that communicates through a proxy is at risk of having its communications modified by the proxy. This might 
allow users to cheat. As a result, retail devkits are designed to not allow communication through a proxy. Using Fiddler with your Xbox 
devkit requires that you perform some special configuration steps on the dev kit so that it can use the Fiddler proxy.


Fiddler can affect the network status that's reported by the console. If an upstream connection is disabled from the development PC that's 
running Fiddler, the console might not detect this disconnection until the authentication of the console has expired. If you're using Fiddler, 
don't use it to simulate a disconnect. Instead, break the connection between the console and the development PC that's running Fiddler. Better 
still, use the [network stress](netstress-networking.md) tools to simulate disconnection for testing purposes.


## Install and enable Fiddler on the development PC

To install and enable Fiddler to monitor traffic from your dev kit

1. Install Fiddler Classic on your development PC by following the directions on the [Fiddler website](https://www.fiddler2.com/fiddler2/).

1. Open Fiddler. On the **Tools** menu, select **Fiddler Options**.

1. Select the **Connections** tab, and then ensure that the **Allow remote computers to connect** check box is selected.

1. Select **OK** to accept the change that you made in the settings. A dialog box appears, saying that Fiddler must be restarted for the change 
   to take effect, and that you might have to configure your firewall manually. Select **OK**, but don't restart Fiddler yet.

1. Configure the necessary firewall rule to allow remote computers to connect.

   a. In Control Panel, select **Windows Firewall**.

   b. Select **Advanced Settings** > **Inbound Rule**.

   c. Go to the **FiddlerProxy** rule, and then scroll to the right. Verify that the values match those in the following table.

     <table>
     <tr><th>
     Setting</th><th>
     Preferred value</th></tr>
     <tr><td><b>Name</b></td><td><b>FiddlerProxy</b></td></tr>
     <tr><td><b>Group</b></td><td><b>Do not set a value for Group</b></td></tr>
     <tr><td><b>Profile</b></td><td><b>All</b></td></tr>
     <tr><td><b>Enabled</b></td><td><b>Yes</b></td></tr>
     <tr><td><b>Action</b></td><td><b>Allow</b></td></tr>
     <tr><td><b>Override</b></td><td><b>No</b></td></tr>
     <tr><td><b>Program</b></td><td><b>Path to fiddler.exe</b></td></tr>
     <tr><td><b>LocalAddress</b></td><td><b>Any</b></td></tr>
     <tr><td><b>RemoteAddress</b></td><td><b>Any</b></td></tr>
     <tr><td><b>Protocol</b></td><td><b>TCP</b></td></tr>
     <tr><td><b>LocalPort</b></td><td><b>Any</b></td>
     <tr></tr>
     <td><b>RemotePort</b></td><td><b>Any</b></td></tr>
     <tr><td><b>AllowedUsers</b></td><td><b>Any</b></td></tr>
     <tr><td><b>AllowedComputers</b></td><td><b>Any</b></td></tr>
     </table>

1. Configure Fiddler to capture and decrypt HTTPS traffic.

    a. To enable the best performance, set Fiddler to use Streaming Mode by selecting the **Stream** button on the button bar.

    b. In Fiddler, select **Tools** > **Fiddler Options** > **HTTPS**.

    c. Select the **Decrypt HTTPS traffic** check box. If a dialog box appears, asking whether to configure Windows to trust the CA 
	   certificate, select **No**.

    d. Select the **Export Root Certificate to Desktop** button.

1. Close Fiddler, and then restart it.


## Configure an Xbox devkit to use Fiddler as its proxy to the internet

Fiddler can be enabled or disabled for Microsoft Game Development Kit (GDK) titles. 

To configure a dev kit to use Fiddler as its proxy to the internet  

1. Go to the **Network** tool in the Xbox Device Portal UI.  

    a. Using a browser, go to your console's system IP address on port 11443 (for example, https://<*your console's system IP address*>:11443/).

    b. Ignore any security certificate failures. Continue to the web page.

    c. On the left menu, select the **Network** tab.

1. Go to the Fiddler root certificate that you exported to the desktop.
1. Enter the IP address or host name of the development PC that's running Fiddler. If you're using the development PC's host name, it must be the 
   fully qualified domain name, including any domain name suffix that you've configured.
1. Enter the port number where Fiddler is listening. By default, Fiddler uses port 8888.
1. Select **Enable**. This restarts your dev kit.

To stop using Fiddler as a proxy to the internet (and to stop Fiddler from tracing all the dev kit's network traffic)

1. Go to the **Network** tool in the Xbox Device Portal UI.
1. Select **Disable**. This restarts your dev kit.

Ensure that Fiddler can capture your title traffic by using some additional steps. For more information, see 
[Debugging WinHTTP](../web-requests/intro-winhttp.md#ID4ETAB).


#### Exclude Microsoft Store endpoints from Fiddler

Microsoft Store downloads detect Secure Sockets Layer (SSL) interception and fails when Fiddler is used to decrypt HTTPS traffic. These endpoints 
aren't needed for title analysis and can be excluded from Fiddler as follows.

   1. In Fiddler, select **Tools** > **Fiddler Options** > **Connections**.
   1. Add the following hosts to the **Bypass Fiddler for URLs that start with** list: 
     `assets1.xboxlive.com;fe3.delivery.mp.microsoft.com;sls.update.microsoft.com`
   1. Confirm this change, and then restart Fiddler.


## See also

 [Fiddler website](https://www.fiddler2.com/fiddler2/)