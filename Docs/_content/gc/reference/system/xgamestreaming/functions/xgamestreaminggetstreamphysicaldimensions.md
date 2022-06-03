---
author: M-Stahl
title: XGameStreamingGetStreamPhysicalDimensions
description: Gets the physical dimensions of the video stream as it renders on the streaming client.
kindex: XGameStreamingGetStreamPhysicalDimensions
ms.author: arikc
ms.topic: reference
edited: 12/24/2020
security: public
applies-to: pc-gdk
---

# XGameStreamingGetStreamPhysicalDimensions

Get the physical dimensions of the video stream as it renders on the streaming client.

<a id="syntaxSection"></a>

## Syntax

```cpp
HRESULT XGameStreamingGetStreamPhysicalDimensions(
         XGameStreamingClientId client,
         uint32_t* horizontalMm,
         uint32_t* verticalMm
)
```

<a id="parametersSection"></a>

### Parameters

*client* &nbsp;&nbsp;\_In\_
Type: XGameStreamingClientId

The client to query the physical size of.

*horizontalMm* &nbsp;&nbsp;\_Out\_
Type: uint32_t\*

The size in millimeters of the horizontal axis of the video stream.

*verticalMm* &nbsp;&nbsp;\_Out\_
Type: uint32_t\*

The size in millimeters of the vertical axis of the video stream.

<a id="retvalSection"></a>

### Return value

Type: HRESULT

Returns **S_OK** if successful; otherwise, returns an error code.

**Potential Errors**

| Error Code | Error Value | Reason for Error |
| --- | --- | --- | 
| E_GAMESTREAMING_NOT_INITIALIZED | 0x89245400 | The XGameStreaming runtime has not been initialized. Call `XGameStreamingInitialize` before calling other APIs. |
| E_GAMESTREAMING_NO_DATA | 0x89245402 | The requested data is not available. The data may be available later. |

For a list of error codes, see [Error Codes](../../../errorcodes.md).

<a id="remarksSection"></a>

## Remarks

You can use this method to determine whether the stream will be sent to a smaller device (for example, a smartphone).

You would do this so you could then present a more player friendly, device&ndash;appropriate experience (for example, by using a larger font size).

If you want the game to respond to changes in the physical dimensions of the stream, then you should register a callback via [XGameStreamingRegisterClientPropertiesChanged](xgamestreamingregisterclientpropertieschanged.md).

<a id="exampleSection"></a>

## Example

The following code example demonstrates how to use the `XGameStreamingGetStreamPhysicalDimensions` function to find the smallest dimensions for a streaming client.

```cpp
void GetSmallestStreamingClient(uint32_t& widthMm, uint32_t& heightMm)
    {
        // If we don't know what the smallest client is, then search through them to find it
        if (m_smallestClient == XGameStreamingNullClientId)
        {
            for (const auto client : m_streamingClients)
            {
                if (client.clientId != XGameStreamingNullClientId)
                {
                    uint32_t clientWidthMm = 0;
                    uint32_t clientHeightMm = 0;
                    if (SUCCEEDED(XGameStreamingGetStreamPhysicalDimensions(client.clientId, &clientWidthMm, &clientHeightMm)))
                    {
                        if (clientWidthMm < m_smallestClientWidthMm)
                        {
                            m_smallestClientWidthMm = clientWidthMm;
                            m_smallestClientHeightMm = clientHeightMm;
                        }
                    }
                }
            }
        }

        widthMm = m_smallestClientWidthMm;
        heightMm = m_smallestClientHeightMm;
    }
```

<a id="requirementsSection"></a>

## Requirements

**Header:** xgamestreaming.h

**Library:** xgameruntimelib

**Supported platforms:** Windows, Xbox One family consoles and Xbox Series consoles

<a id="seealsoSection"></a>

## See also

[XGameStreaming](../xgamestreaming_members.md)  
[XGameStreamingRegisterClientPropertiesChanged](xgamestreamingregisterclientpropertieschanged.md)  
[XGameStreaming](../xgamestreaming_members.md#ClientProperties)  