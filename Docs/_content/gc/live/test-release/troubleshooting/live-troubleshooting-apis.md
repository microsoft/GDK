---
title: Troubleshooting Xbox Live Services APIs
description: Hooking up the response logger and enabling debug tracing.
kindex:
- errors, Xbox Live
- logging errors, Xbox Live
author: joannaleecy
ms.author: migreen
ms.topic: conceptual
ms.assetid: 3827bba1-902f-4f2d-ad51-af09bd9354c4
ms.localizationpriority: medium
ms.date: 04/04/2017
edited: 00/00/0000
security: public
---

# Troubleshooting Xbox Live Services APIs

It is difficult to diagnose a failure using only the error from the Xbox Live Services API layer.
Additional, helpful error information — such as logging of all RESTful calls — can be made available to the server.

To listen to this additional data, hook up the response logger and enable debug tracing.
Response logging allows you to see HTTP traffic and web service response codes, which is often as useful as a Fiddler trace.


## Code example

The following code example enables response logging, and sets the debug error level to **Verbose**.
(You can also set the debug error level to **Error**, to show only trace failed calls; or to **Off**, to disable tracing.)

The resulting debug output is sent to the Output pane when running your project in Visual Studio.


**C API**

```cpp
HCSettingsSetTraceLevel(HCTraceLevel::Verbose); // See HCTraceLevel enum for various levels
HCTraceSetTraceToDebugger(true);
```

```cpp
void CALLBACK TraceCallback(
    _In_z_ char const* areaName,
    enum HCTraceLevel level,
    uint64_t threadId,
    uint64_t timestamp,
    _In_z_ char const* message
)
{
    // Log info
}

HCTraceSetClientCallback(TraceCallback);
```


