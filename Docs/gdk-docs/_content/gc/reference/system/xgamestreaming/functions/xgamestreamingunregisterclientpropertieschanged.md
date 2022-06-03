---
author: M-Stahl
title: XGameStreamingUnregisterClientPropertiesChanged
description: Unregisters a previously registered XGameStreamingClientPropertiesChangedCallback.
kindex: XGameStreamingUnregisterClientPropertiesChanged
ms.author: arikc
ms.topic: reference
edited: 02/10/2020
quality: good
security: public
applies-to: pc-gdk
---

# XGameStreamingUnregisterClientPropertiesChanged  

Unregisters a previously registered XGameStreamingClientPropertiesChangedCallback.    

## Syntax  
  
```cpp
bool XGameStreamingUnregisterClientPropertiesChanged(  
         XGameStreamingClientId client,  
         XTaskQueueRegistrationToken token,  
         bool wait  
)  
```  
  
### Parameters  
  
*client* &nbsp;&nbsp;\_In\_  
Type: XGameStreamingClientId  
TBD    
*token* &nbsp;&nbsp;\_In\_  
Type: XTaskQueueRegistrationToken  
  
The registration token provided by [XGameStreamingRegisterClientPropertiesChanged](xgamestreamingregisterclientpropertieschanged.md) for the callback which should no longer be fired.    
  
*wait* &nbsp;&nbsp;\_In\_  
Type: bool  
  
TBD    
### Return value
Type: bool
  
TBD  
## Remarks  
  > [!NOTE]
> This function isn't safe to call on a time-sensitive thread. For more information, see [Time-sensitive threads](../../../../system/overviews/time-sensitive-threads.md).  
  
This API allows the game to stop receiving their `XGameStreamingClientPropertiesChangedCallback` whenever a [XGameStreamingClientProperty](../enums/xgamestreamingclientproperty.md) like stream physical dimensions changes.

Passing a `XGameStreamingClientPropertiesChangedRegistrationToken` will succeed even if that token was not a valid registration token.

> When the streaming client device disconnects, please use `XGameStreamingUnregisterClientPropertiesChanged` to unregister the callback.
  
## Example

```cpp    
    // On client disconnection remove from list of client and do per client cleanup
    void OnClientDisconnected(XGameStreamingClientId client)
    {       
       // unregister the client property changed handler

        StreamingClient connectedClient;
        GetConnectedClient(client, &connectedClient);
        XGameStreamingUnregisterClientPropertiesChanged(&connectedClient.token);
                
        std::remove(m_streamingClients.begin(), m_streamingClients.end(), connectedClient);
    }

```

## Requirements  
  
**Header:** xgamestreaming.h
  
**Library:** xgameruntime.lib
  
**Supported platforms:** Windows, Xbox One family consoles and Xbox Series consoles  
  
## See also  
[XGameStreamingClientProperty](../enums/xgamestreamingclientproperty.md)  
[XGameStreamingClientPropertiesChangedCallback](xgamestreamingclientpropertieschangedcallback.md)  
[XGameStreamingRegisterClientPropertiesChanged](xgamestreamingregisterclientpropertieschanged.md)  
[XGameStreaming](../xgamestreaming_members.md)  