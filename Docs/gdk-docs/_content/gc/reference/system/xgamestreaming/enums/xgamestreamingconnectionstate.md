---
author: M-Stahl
title: XGameStreamingConnectionState
description: Contains the connection states for a streaming client device.
kindex: XGameStreamingConnectionState
ms.author: arikc
ms.topic: reference
edited: 12/24/2020
security: public
applies-to: pc-gdk
---

# XGameStreamingConnectionState

Contains the connection states for a streaming client device.

<a id="syntaxSection"></a>

## Syntax

```cpp
enum class XGameStreamingConnectionState  : uint32_t
{
    Disconnected = 0,
       Connected = 1
}
```

<a id="constantsSection"></a>

## Constants

| Constant | Description |
| --- | --- |
| Disconnected | The client device is currently disconnected. |
| Connected | The client device is currently connected. |

<a id="remarksSection"></a>

## Remarks

A device can be in either a `Connected` or a `Disconnected` state.

The [XGameStreamingClientChangedCallback](../functions/xgamestreamingconnectionstatechangedcallback.md) is invoked whenever a streaming device connects or disconnects.

Upon registering via [XGameStreamingRegisterConnectionStateChanged](../functions/xgamestreamingregisterconnectionstatechanged.md), the callback is invoked for any device that is already connected.

<a id="requirementsSection"></a>

## Requirements

**Header:** xgamestreaming.h

**Supported platforms:** Windows, Xbox One family consoles and Xbox Series consoles

<a id="seealsoSection"></a>

## See also

[XGameStreaming](../xgamestreaming_members.md)  
[XGameStreamingClientChangedCallback](../functions/xgamestreamingconnectionstatechangedcallback.md)  
[XGameStreamingUnregisterConnectionStateChanged](../functions/xgamestreamingunregisterconnectionstatechanged.md)  
[XGameStreamingRegisterConnectionStateChanged](../functions/xgamestreamingregisterconnectionstatechanged.md)  