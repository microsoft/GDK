---
author: M-Stahl
title: XGameStreamingConnectionStateChangedCallback
description: A callback function invoked whenever the state of a connected streaming client changes.
kindex: XGameStreamingConnectionStateChangedCallback
ms.author: arikc
ms.topic: reference
edited: 12/24/2020
security: public
applies-to: pc-gdk
---

# XGameStreamingConnectionStateChangedCallback

A callback function invoked whenever the state of a connected streaming client changes.

<a id="syntaxSection"></a>

## Syntax

```cpp
void XGameStreamingConnectionStateChangedCallback(
         void* context,
         XGameStreamingClientId client,
         XGameStreamingConnectionState state
)
```

<a id="parametersSection"></a>

### Parameters

*context* &nbsp;&nbsp;\_In\_opt\_
Type: void\*

Context which was supplied when the event was subscribed to.

*client* &nbsp;&nbsp;\_In\_
Type: XGameStreamingClientId

Client streaming device which the event references.

*state* &nbsp;&nbsp;\_In\_
Type: [XGameStreamingConnectionState](../enums/xgamestreamingconnectionstate.md)

New connection state of the client.

<a id="retvalSection"></a>

### Return value

Type: void

<a id="remarksSection"></a>

## Remarks

The `XGameStreamingClientChangedCallback` is invoked whenever a streaming device connects or disconnects.

Upon registration, this callback is also invoked for each connected device.

Upon registering via [XGameStreamingRegisterConnectionStateChanged](xgamestreamingregisterconnectionstatechanged.md), the callback is also invoked for devices that are already connected.

<a id="requirementsSection"></a>

## Requirements

**Header:** xgamestreaming.h

**Library:** xgameruntime.lib

**Supported platforms:** Windows, Xbox One family consoles and Xbox Series consoles

<a id="seealsoSection"></a>

## See also

[XGameStreamingConnectionState](../enums/xgamestreamingconnectionstate.md)  
[XGameStreamingUnregisterConnectionStateChanged](xgamestreamingunregisterconnectionstatechanged.md)  
[XGameStreamingRegisterConnectionStateChanged](xgamestreamingregisterconnectionstatechanged.md)  
[XGameStreaming](../xgamestreaming_members.md)  