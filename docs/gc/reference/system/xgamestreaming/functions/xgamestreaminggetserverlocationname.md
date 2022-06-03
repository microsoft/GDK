---
author: M-Stahl
title: XGameStreamingGetServerLocationName
description: Gets the name of the location of the streaming server's data center.
kindex: XGameStreamingGetServerLocationName
ms.author: arikc
ms.topic: reference
edited: 12/24/2020
security: public
applies-to: pc-gdk
---

# XGameStreamingGetServerLocationName

Gets the name of the location of the streaming server's data center.

<a id="syntaxSection"></a>

## Syntax

```cpp
HRESULT XGameStreamingGetServerLocationName(
         size_t serverLocationNameSize,
         char* serverLocationName
)
```

<a id="parametersSection"></a>

### Parameters

*serverLocationNameSize* &nbsp;&nbsp;\_In\_
Type: size_t

The maximum size of the data center location name to return.
The `serverLocationNameSize` should be retrieved by calling [XGameStreamingGetServerLocationNameSize](xgamestreaminggetserverlocationnamesize.md).

*serverLocationName* &nbsp;&nbsp;\_Out\_writes\_z\_(serverLocationNameSize)
Type: char\*

The name of the Azure Region with the data center hosting the streaming Xbox server.

<a id="retvalSection"></a>

### Return value

Type: HRESULT
  
Returns **S_OK** if successful; otherwise, returns an error code.

**Potential Errors**

| Error Code | Error Value | Reason for Error |
| ---------- | ----------- | ---------------- |
| E_GAMESTREAMING_NOT_INITIALIZED | 0x89245400 | The XGameStreaming runtime has not been initialized. Call `XGameStreamingInitialize` before calling other APIs. |
| E_NOT_SUFFICIENT_BUFFER | 0x7A  | *serverLocationSize* is not large enough to hold the full name of the server location (and its terminating null character). |
| E_GAMESTREAMING_NO_DATACENTER | 0x89245403 | The current machine is not running in a datacenter. |

For a list of error codes, see [Error Codes](../../../errorcodes.md).

<a id="remarksSection"></a>

## Remarks

Before you call this function, you can call [XGameStreamingGetServerLocationNameSize](xgamestreaminggetserverlocationnamesize.md) to get the size of the server location name so that you can allocate a buffer.

You can utilize the Azure Region if the game wants to connect to a game server that is hosted on Azure PlayFab Multiplayer Servers, and wants a minimium latency with its game server.

The error of `E_GAMESTREAMING_NO_DATACENTER` can occur when a player is using Console Streaming to stream the game from their home Xbox.  This error can also occur on an Xbox Developer Kit if you have not set an override value.

On an Xbox Developer Kit, you can set the `serverLocationName` that should be returned during testing, in the **Streaming** tab of the **Developer Home**.

<a id="requirementsSection"></a>

## Requirements

**Header:** xgamestreaming.h

**Library:** xgameruntime.lib

**Supported platforms:** Windows, Xbox One family consoles and Xbox Series consoles

<a id="seealsoSection"></a>

## See also

[XGameStreaming](../xgamestreaming_members.md)  
[XGameStreamingGetServerLocationNameSize](xgamestreaminggetserverlocationnamesize.md)  