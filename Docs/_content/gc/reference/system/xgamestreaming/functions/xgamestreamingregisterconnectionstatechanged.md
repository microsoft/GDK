---
author: M-Stahl
title: XGameStreamingRegisterConnectionStateChanged
description: Registers a callback to be invoked when a streaming client device's connection state changes.
kindex: XGameStreamingRegisterConnectionStateChanged
ms.author: arikc
ms.topic: reference
edited: 02/10/2020
security: public
applies-to: pc-gdk
---

# XGameStreamingRegisterConnectionStateChanged  

Registers a callback to be invoked when a streaming client device's connection state changes.  Upon registration, the callback will be invoked for all streaming client devices that are already connected.


## Syntax  
  
```cpp
HRESULT XGameStreamingRegisterConnectionStateChanged(  
         XTaskQueueHandle queue,  
         void* context,  
         XGameStreamingConnectionStateChangedCallback* callback,  
         XTaskQueueRegistrationToken* token  
)  
```  
  
### Parameters  
  
*queue* &nbsp;&nbsp;\_In\_opt\_  
Type: XTaskQueueHandle  

Handle to the asynchronous queue to put the change callback on.    

*context* &nbsp;&nbsp;\_In\_opt\_  
Type: void*  
  
An optional pointer to the context passed to the callback function.
  
*callback* &nbsp;&nbsp;\_In\_  
Type: XGameStreamingConnectionStateChangedCallback*  

The callback function that will be invoked when any streaming client device's connection state changes.    

  
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


For a list of error codes, see [Error Codes](../../../errorcodes.md).    

  
## Remarks  
  > [!NOTE]
> This function isn't safe to call on a time-sensitive thread. For more information, see [Time-sensitive threads](../../../../system/overviews/time-sensitive-threads.md).  
  
This API is the recommended way to have the game do per streaming client device customization and maintain state that allows the game to optimize the experience based on whether there are any devices connected.
> [!NOTE]
>  Upon registration, the callback will be invoked for all streaming client devices that are currently connected.
  
## Example
```cpp
    // Called during game startup to hook into any game streaming start/stop events
    void SetupStreamAware()
    {
        // Register a callback for client connections and disconnections. Note that the connection callback
        // will fire for any already connected clients, so do all of our per-client setup in that callback.      
        XGameStreamingConnectionStateChangedRegistrationToken stateChangeToken = {0};
        XGameStreamingRegisterConnectionStateChanged(
            m_taskQueue, this, ConnectionStateChangedCallback, &stateChangeToken);
    }

    static void ConnectionStateChangedCallback(void* context, XGameStreamingClientId client, XGameStreamingConnectionState state)
    {
        static_cast<Game*>(context)->OnConnectionStateChanged(client, state);
    }

    void OnConnectionStateChanged(XGameStreamingClientId client, XGameStreamingConnectionState state)
    {
        switch (state)
        {
        case XGameStreamingConnectionState::Connected: 
            OnClientConnected(client); 
            break;
        case XGameStreamingConnectionState::Disconnected: 
            OnClientDisconnected(client); 
            break;
        default: 
            break;
        }
    }


    void OnClientConnected(XGameStreamingClientId client)
    {
        // Update list of connected clients
        m_streamingClients.push_back(client);

        // Do per-client initialization
        // ...
    }

    void OnClientDisconnected(XGameStreamingClientId client)
    {
        // Release our reference on the client that is no longer streaming the game
        std::remove(m_streamingClients.begin(), m_streamingClients.end(), client);

        // Do per-client cleanup
        // ...
    }



```

## Requirements  
  
**Header:** xgamestreaming.h
  
**Library:** xgameruntime.lib
  
**Supported platforms:** Windows, Xbox One family consoles and Xbox Series consoles  
  
## See also  
[XGameStreamingConnectionState](../enums/xgamestreamingconnectionstate.md)  
[XGameStreamingConnectionStateChangedCallback](xgamestreamingconnectionstatechangedcallback.md)  
[XGameStreamingUnregisterConnectionStateChanged](xgamestreamingunregisterconnectionstatechanged.md)  
[XGameStreaming](../xgamestreaming_members.md)  