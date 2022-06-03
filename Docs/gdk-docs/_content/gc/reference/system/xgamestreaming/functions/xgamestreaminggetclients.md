---
author: M-Stahl
title: XGameStreamingGetClients
description: Gets the ID of each currently connected client.
kindex: XGameStreamingGetClients
ms.author: arikc
ms.topic: reference
edited: 00/00/0000
quality: good
security: public
applies-to: pc-gdk
---

# XGameStreamingGetClients  

Gets the ID of each currently connected client.    

## Syntax  
  
```cpp
HRESULT XGameStreamingGetClients(  
         uint32_t clientCount,  
         XGameStreamingClientId* clients,  
         uint32_t* clientsUsed  
)  
```  
  
### Parameters  
  
*clientCount* &nbsp;&nbsp;\_In\_  
Type: uint32_t  
  
Maximum number of clients to return in the clients array    
  
*clients* &nbsp;&nbsp;\_Out\_writes\_to\_(clientCount,*clientsUsed)  
Type: XGameStreamingClientId*  
  
Buffer to store the connected client IDs.     
  
*clientsUsed* &nbsp;&nbsp;\_Out\_  
Type: uint32_t*  
  
The number of clients actually written to the clients array.    
  
  
### Return value
Type: HRESULT

Returns **S_OK** if successful; otherwise, returns an error code.

#### Potential Errors  
  
| Error Code | Error Value | Reason for Error |
| --- | --- | --- | 
| E_GAMESTREAMING_NOT_INITIALIZED | 0x89245400 | The XGameStreaming runtime has not been initialized. Call XGameStreamingInitialize before calling other APIs.
| E_NOT_SUFFICIENT_BUFFER | 0x7A  | If clientCount is smaller than the number of currently connected clients.
  
For a list of error codes, see [Error Codes](../../../errorcodes.md).  

## Remarks  

Used to get the `XGameStreamingClientId` of every streaming client devices that is currently connected.  

If the game is only trying to identify if ANY device is connected and streaming, consider using [XGameStreamingIsStreaming](xgamestreamingisstreaming.md).

If the game wants to get notification when a streaming client connects and/or disconnects, consider using [XGameStreamingRegisterConnectionStateChanged](xgamestreamingregisterconnectionstatechanged.md)

## Requirements  
  
**Header:** xgamestreaming.h
  
**Library:** xgameruntime.lib
  
**Supported platforms:** Windows, Xbox One family consoles and Xbox Series consoles  
  
## See also  
[XGameStreamingIsStreaming](xgamestreamingisstreaming.md)  
[XGameStreamingRegisterConnectionStateChanged](xgamestreamingregisterconnectionstatechanged.md)  
[XGameStreamingGetClientCount](xgamestreaminggetclientcount.md)  
[XGameStreaming](../xgamestreaming_members.md)  