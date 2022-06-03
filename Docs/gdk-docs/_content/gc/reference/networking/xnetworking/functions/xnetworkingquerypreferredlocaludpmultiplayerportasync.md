---
author: M-Stahl
title: XNetworkingQueryPreferredLocalUdpMultiplayerPortAsync
description: Gets the preferred local UDP port to use for multiplayer traffic asynchronously.
kindex: XNetworkingQueryPreferredLocalUdpMultiplayerPortAsync
ms.author: v-doglov
ms.topic: reference
edited: 07/15/2020
quality: good
security: public
applies-to: pc-gdk
---

# XNetworkingQueryPreferredLocalUdpMultiplayerPortAsync

Gets the preferred local UDP port to use for multiplayer traffic asynchronously.

## Syntax

```cpp
HRESULT XNetworkingQueryPreferredLocalUdpMultiplayerPortAsync(
         XAsyncBlock* asyncBlock
)
```

### Parameters

*asyncBlock* &nbsp;&nbsp;\_Inout\_  
Type: [XAsyncBlock](../../../system/xasync/structs/xasyncblock.md)\*

A pointer to the [XAsyncBlock](../../../system/xasync/structs/xasyncblock.md) that is passed to [XAsyncRun](../../../system/xasync/functions/xasyncrun.md).

### Return value

Type: HRESULT

HRESULT success or error code.

## Remarks

Use the returned preferred local UDP multiplayer port in subsequent [socket bind](/windows/desktop/api/winsock/nf-winsock-bind) operations. The port is targeted specifically at multiplayer real-time title networking flows and is meaningful for UDP traffic only, not for TCP or HTTP traffic.

To listen for changes in the preferred local UDP multiplayer, call [XNetworkingRegisterPreferredLocalUdpMultiplayerPortChanged](xnetworkingregisterpreferredlocaludpmultiplayerportchanged.md).

For a description of how the local UDP multiplayer port works, see the Remarks section of the synchronous version of [XNetworkingQueryPreferredLocalUdpMultiplayerPort](xnetworkingquerypreferredlocaludpmultiplayerport.md).

This method interrogates the local state within the calling process and returns quickly, so it is safe to call from time-sensitive contexts.

## Requirements

**Header:** XNetworking.h

**Library:** xgameruntime.lib
  
**Supported platforms:** Windows, Xbox One family consoles and Xbox Series consoles  
  
## See also  

[Preferred local UDP multiplayer port](../../../../networking/overviews/game-mesh/preferred-local-udp-multiplayer-port-networking.md)   
[Windows Sockets (Winsock)](/windows/desktop/WinSock/windows-sockets-start-page-2)   
[Microsoft Azure PlayFab Party](../../../../networking/overviews/game-mesh/playfab-party-intro-networking.md)  
[XNetworking](../xnetworking_members.md)  
  