---
author: bkellam
title: XGameStreamingGetSessionId
description: Gets the session id of the streaming client.
kindex: XGameStreamingGetSessionId
ms.author: bkellam
ms.topic: reference
security: public
applies-to: pc-gdk
edited: 00/00/0000
---

# XGameStreamingGetSessionId

This API returns a null-terminated opaque string that uniquely identifies the streaming session of the specified client.

## Syntax  
  
```cpp
HRESULT XGameStreamingGetSessionId(
        XGameStreamingClientId client,
        size_t sessionIdSize,
        char* sessionId,
        size_t* sessionIdUsed
)
```  

### Parameters  
  
*client* &nbsp;&nbsp;\_In\_  
Type: XGameStreamingClientId  
  
The streaming client that is being queried.
  
*sessionIdSize* &nbsp;&nbsp;\_In\_  
Type: size_t  
  
The size of the `sessionId` buffer.

*sessionId* &nbsp;&nbsp;\_Out\_writes\_bytes\_to\_(sessionIdSize, \*sessionIdUsed)  
Type: char* 
  
The buffer that will populated with the session id of the specified client.

*sessionIdUsed* &nbsp;&nbsp;\_Out\_opt\_  
Type: size_t*

The number of bytes (including null terminator) used of the `sessionId` buffer.

### Return value
Type: HRESULT
  
Returns **S_OK** if successful; otherwise, returns an error code.

#### Potential Errors

| Error Code | Error Value | Reason for Error |
| --- | --- | --- | 
| E_GAMESTREAMING_NOT_INITIALIZED | 0x89245400 | The XGameStreaming runtime has not been initialized. Call XGameStreamingInitialize before calling other APIs. |
| E_GAMESTREAMING_CLIENT_NOT_CONNECTED | 0x89245401 | The specified client is not connected. |
| E_GAMESTREAMING_NO_DATA | 0x89245402 | The requested data is not available. The data may be available later. |
| E_NOT_SUFFICIENT_BUFFER | 0x7A  | *sessionId* is not large enough to hold the session id and null terminating character. |

For a list of error codes, see [Error Codes](../../../errorcodes.md).  

## Remarks

The string written to `sessionId` will never be larger than `SessionIdMaxBytes`, thus it can be pre-allocated. The layout/contents of a `sessionId` may change at a later date, and thus should only be interpreted as an opaque string. As with other client property APIs, it's recommended to use `XGameStreamingRegisterClientPropertiesChanged` to register a callback for changes to the `sessionId`.

## Example

```C++
// Register for client properties changed notifications 
void GameStreamingClientManager::OnClientConnected(XGameStreamingClientId client)
{
    XGameStreamingClientPropertiesChangedRegistrationToken token = {0};
    XGameStreamingRegisterClientPropertiesChanged(
            client, m_taskQueue, this, &OnClientPropertiesChanged, &token);
}

void GameStreamingClientManager::OnClientPropertiesChanged(
    void* context,
    XGameStreamingClientId client,
    uint32_t updatedPropertiesCount,
    XGameStreamingClientProperty* updatedProperties)
{
    for (uint32_t i = 0; i < updatedPropertiesCount; ++i)
    {
        switch (updatedProperties[i])
        {
        case XGameStreamingClientProperty::SessionId:
        {
            // allocate memory for sessionId
            char sessionId[SessionIdMaxBytes];

            // get session id of the client
            size_t bytesUsed = 0;
            HRESULT hr = XGameStreamingGetSessionId(client, _countof(sessionId), sessionId, &bytesUsed);

            if (SUCCEEDED(hr)) {
                // Game logic to use session id
            }
            else if (hr == E_GAMESTREAMING_NO_DATA) {
                // Game logic to handle no data for client
            }
            else
            {
                // Default error case
                LogFormat(L"XGameStreamingGetSessionId failed %x", hr);
            }

            break;
        }

        default:
            // A characteristic we are not tracking - do nothing
            break;
        }
    }
}

```

## Requirements  
  
**Header:** xgamestreaming.h  
**Library:** xgameruntime.lib  
**Supported platforms:** Windows, Xbox One family consoles and Xbox Series consoles  
  
## See also  
[XGameStreaming](../xgamestreaming_members.md)
[XGameStreamingRegisterClientPropertiesChanged](xgamestreamingregisterclientpropertieschanged.md)
  
