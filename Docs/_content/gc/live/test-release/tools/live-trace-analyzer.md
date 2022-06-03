---
title: Trace Analyzer (XblTraceAnalyzer.exe)
description: Reviews the service calls made by a title.
kindex:
- Trace Analyzer (XblTraceAnalyzer.exe)
- trace analyzer
- service calls, testing
ms.topic: conceptual
ms.assetid: b4490fae-d554-403d-bbbc-601af38af0ef
ms.localizationpriority: medium
author: joannaleecy
ms.author: migreen
ms.date: 04/04/2017
edited: 00/00/0000
security: public
---

# Xbox Live Trace Analyzer (XblTraceAnalyzer.exe)

The Xbox Live Trace Analyzer reviews the service calls made by a title.

The *Xbox Live Trace Analyzer* is an offline analysis tool, to find any violations in calling patterns.

The Trace Analyzer (**XblTraceAnalyzer.exe**) can be found as part of the GDK and `XboxLiveTools.zip`; see [Development tools for Xbox Live](live-tools.md).

This is a command-line tool.  There is a readme file about this tool in the .zip file.


## Gather logs and analyze the service calls

The following steps are required to gather the logs that contain the record of your service calls and analyze them using Xbox Live Trace Analyzer.

1.  Build your title.
2.  Modify your title to enable tracing as described below.
3.  Deploy your title.
4.  Launch the title and make at least one call to Xbox Live Services in order to initialize the Xbox Live Services API.
5.  Start tracing at the point in your title you'd like to analyze.
6.  Stop tracing.
7.  Run the Xbox Live Trace Analyzer tool on your development PC and view the output.


## Starting and stopping tracing


On GDK titles, it is currently recommended to use Fiddler to capture the trace file of the target device.
Then save the Fiddler results as a Fiddler Session file (.saz) which the Xbox Live Trace Analyzer tool can read.
See [Using Fiddler to inspect web service calls](live-fiddler-inspect-web-calls.md).



## Analyze the trace file

To analyze your title's use of Xbox Live Services, after the trace file has been copied back to your PC, you can use the Xbox Live Trace Analyzer tool on GDN.

For a description of how to invoke the tool and interpret its output, see the documentation included with the Xbox Live Trace Analyzer tool on Game Developer Network.

To view command line help, you can also run **XblTraceAnalyzer.exe** with the command line option of -? or -h.