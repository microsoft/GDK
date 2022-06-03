---
author: M-Stahl
title: XGameStreamingGetServerLocationNameSize
description: Gets the size of the name of the location of the streaming server's datacenter.
kindex: XGameStreamingGetServerLocationNameSize
ms.author: arikc
ms.topic: reference
edited: 12/24/2020
security: public
applies-to: pc-gdk
---

# XGameStreamingGetServerLocationNameSize

Gets the size of the name of the location of the streaming server's datacenter.

<a id="syntaxSection"></a>

## Syntax

```cpp
size_t XGameStreamingGetServerLocationNameSize()
```

<a id="parametersSection"></a>

### Parameters

None.

<a id="retvalSection"></a>

### Return value

Type: size_t

The size of the name of the location of the Data Server.

<a id="remarksSection"></a>

## Remarks

Use this function to allocate buffer space for the [XGameStreamingGetServerLocationName](xgamestreaminggetserverlocationname.md).

The return value will be zero if the Xbox is not connected to an Azure datacenter.

This can occur if the game is not streaming. It can also happen if the player is using Xbox Console Streaming to stream the game, or stream via an Xbox Developer Kit if no override value has been set.

<a id="requirementsSection"></a>

## Requirements

**Header:** xgamestreaming.h

**Library:** xgameruntime.lib

**Supported platforms:** Windows, Xbox One family consoles and Xbox Series consoles

<a id="seealsoSection"></a>

## See also

[XGameStreaming](../xgamestreaming_members.md)  
[XGameStreamingGetServerLocationName](xgamestreaminggetserverlocationname.md)  