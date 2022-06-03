---
author: M-Stahl
title: XGameStreamingRegisterClientPropertiesChanged
description: Registers a callback to be invoked when any of the streaming client device's properties change.
kindex: XGameStreamingRegisterClientPropertiesChanged
ms.author: arikc
ms.topic: reference
edited: 02/10/2020
quality: good
security: public
applies-to: pc-gdk
---

# XGameStreamingRegisterClientPropertiesChanged  

Registers a callback to be invoked when any of the streaming client device's properties change.  
> [!NOTE]
> Upon registration, the callback will be invoked for the client device's current client properties.

## Syntax  
  
```cpp
HRESULT XGameStreamingRegisterClientPropertiesChanged(  
         XGameStreamingClientId client,  
         XTaskQueueHandle queue,  
         void* context,  
         XGameStreamingClientPropertiesChangedCallback* callback,  
         XTaskQueueRegistrationToken* token  
)  
```  
  
### Parameters  
  
*client* &nbsp;&nbsp;\_In\_  
Type: XGameStreamingClientId  

ID of the game streaming client.    

*queue* &nbsp;&nbsp;\_In\_opt\_  
Type: XTaskQueueHandle  

Handle to the asynchronous queue to put the change callback on.    

*context* &nbsp;&nbsp;\_In\_opt\_  
Type: void*  
  
An optional pointer to the context passed to the callback function.    
  
*callback* &nbsp;&nbsp;\_In\_  
Type: [XGameStreamingClientPropertiesChangedCallback*](xgamestreamingclientpropertieschangedcallback.md)
  
The callback function that will be invoked when the properties of the client change.    
  
*token* &nbsp;&nbsp;\_Out\_  
Type: XTaskQueueRegistrationToken*  
  
A pointer to the registration token which can be used to unregister from the event.    
  
  
### Return value
Type: HRESULT
  
Returns **S_OK** if successful; otherwise, returns an error code.

#### Potential Errors

| Error Code | Error Value | Reason for Error |
| --- | --- | --- | 
| E_GAMESTREAMING_NOT_INITIALIZED | 0x89245400 | The XGameStreaming runtime has not been initialized. Call XGameStreamingInitialize before calling other APIs.
| E_GAMESTREAMING_CLIENT_NOT_CONNECTED | 0x89245401 | The specified client is not connected.

For a list of error codes, see [Error Codes](../../../errorcodes.md).    
  
## Remarks  
  > [!NOTE]
> This function isn't safe to call on a time-sensitive thread. For more information, see [Time-sensitive threads](../../../../system/overviews/time-sensitive-threads.md).  
  
This API allows the game to receive a `XGameStreamingClientPropertiesChangedCallback` whenever a [XGameStreamingClientProperty](../enums/xgamestreamingclientproperty.md) like stream physical dimensions changes.

Registration **WILL** cause the callback to invoked with all applicable `XGameStreamingClientProperty` so that querying for current property details can be done.

When the streaming client device disconnects, please use [XGameStreamingUnregisterClientPropertiesChanged](xgamestreamingunregisterclientpropertieschanged.md) to unregister the callback.
  
## Example

```cpp    
    // On client connection maintain a list of clients and do per client initialization
    void GameStreamingClientManager::OnClientConnected(XGameStreamingClientId client)
    {
        StreamingClient connectedClient;
        connectedClient.clientId = client;
        connectedClient.propertiesChangedToken = token;

        // Do per-client initialization
        XGameStreamingClientPropertiesChangedRegistrationToken token = {0};
        XGameStreamingRegisterClientPropertiesChanged(
            client, m_taskQueue, this, &OnClientPropertiesChanged, &token);        

        connectedClient.propertiesChangedToken = token;
        m_streamingClients.push_back(connectedClient);
    }

    // Some of the properties of our streaming client have changed, react to any of the changes which apply to our game
    void GameStreamingClientManager::OnClientPropertiesChanged(
        void* context,
        XGameStreamingClientId client,
        uint32_t updatedPropertiesCount,
        XGameStreamingClientProperty* updatedProperties)
    {
        GameStreamingClientManager* gsClientManager = reinterpret_cast<GameStreamingClientManager*>(context);

        for (uint32_t i = 0; i < updatedPropertiesCount; ++i)
        {
            switch (updatedProperties[i])
            {
                // The client now has a new physical size of the game stream - update our list of stream
                // sizes to reflect this.
            case XGameStreamingClientProperty::StreamPhysicalDimensions:
                gsClientManager->UpdateClientPhysicalDimensions(client); 
                break;

            case XGameStreamingClientProperty::TouchInputEnabled: 
                gsClientManager->UpdateClientTouchEnabled(client); 
                break;

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
[XGameStreamingClientProperty](../enums/xgamestreamingclientproperty.md)  
[XGameStreamingClientPropertiesChangedCallback](xgamestreamingclientpropertieschangedcallback.md)  
[XGameStreamingUnregisterClientPropertiesChanged](xgamestreamingunregisterclientpropertieschanged.md)  
[XGameStreaming](../xgamestreaming_members.md)  