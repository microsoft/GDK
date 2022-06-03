---
author: M-Stahl
title: Xbox One network capture
description: Describes how to use network packet capture on an Xbox One Dev Kit.
kindex: Xbox One Network Capture
ms.author: orr
ms.topic: conceptual
edited: 11/20/2020
security: public
---

# Capturing network traffic on Xbox One Dev Kits

Use this topic to understand how to use network packet capture on an Xbox One Dev Kit. While debugging your Microsoft Game Development Kit (GDK) title, you might want to analyze the network traffic coming to and from your Xbox One Dev Kit. [Fiddler](fiddler-setup-networking.md) is a popular tool for monitoring HTTP, HTTPS, and WebSocket traffic. However, Fiddler doesn't capture other kinds of network traffic. To capture a trace of *all* network packet traffic to and from an Xbox One Dev Kit, you can first use the network-trace-capture functionality that's described in this topic and then analyze that traffic by using powerful tools.

Captured content is in the "on-the-wire" state. This includes Transport Layer Security (TLS) encryption for HTTPS traffic and any encryption that you're using for sockets. This makes direct analysis based on message content impossible. Keep in mind that any unexpected traffic, the size or frequency of the packets, and the endpoints of unexpected communication flows are often enough to find an issue with networking code. To debug a networking issue, it's not always necessary to inspect the packet content.

To see the message content while you're debugging, temporarily disable your encryption for the traffic whose content you want to inspect.


## Capturing network packets

To activate and deactivate network traffic captures, use the [Trace (xbtrace.exe) (NDA topic)](../../../tools-console/xbox-tools-and-apis/commandlinetools/xbtrace.md) tool.


### Start a network capture

To start a network capture, use the `xbtrace start netcap` command. This initiates a network capture on the default console.

To start tracing on a console other than the default console, use the `/X:` argument.


### Stop a network capture

To stop a network capture, use `xbtrace stop`. By default, the capture is saved as *xbtrace.etl* in the current directory. To save to a different location or file name, provide the path and file name after `stop`. For example, `xbtrace stop c:\temp\sample.etl` saves the trace file as *c:\temp\sample.etl*. If you specify an existing file name, `xbtrace` provides an informative message and the trace continues to run.
> [!NOTE]
> On-console trace data isn't lost when you specify an existing file name. There's currently no way to overwrite an existing trace file. You must delete the existing file or specify a different file name for the new trace.

To stop capturing on a console that isn't the default console, use the `/X` argument to specify a console address.


## Using network capture data

The following tools can open a network capture file. Choose a tool according to your preferences and the features that you want to use.

* Use [Microsoft Message Analyzer (MMA)](https://msdn.microsoft.com/library/jj649776.aspx) to open network captures and view packets. Analyze the captured file directly in MMA. You can also use MMA to save the captured packet data as a PCAP file, which you can then open for analysis in other tools, such as Fiddler or Wireshark.  
  > [!NOTE]
  > Microsoft Message Analyzer is no longer available for download.

* Use [Network Monitor (netmon)](https://social.technet.microsoft.com/Forums/705469fd-50df-42ce-b99e-e8040adc6cdd/network-monitor-forum-faq?forum=netmon) to open network captures and view packets. Analyze the captured file directly in netmon. Download netmon from [Microsoft Download Center](https://www.microsoft.com/download/details.aspx?id=4865). 


## See also
 [Trace (xbtrace.exe) (NDA topic)](../../../tools-console/xbox-tools-and-apis/commandlinetools/xbtrace.md)

 [Microsoft Message Analyzer Operating Guide](https://msdn.microsoft.com/library/jj649776.aspx)