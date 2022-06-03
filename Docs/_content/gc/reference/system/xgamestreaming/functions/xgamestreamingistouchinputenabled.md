---
author: M-Stahl
title: XGameStreamingIsTouchInputEnabled
description: Check if a client will send touch inputs to the game.
kindex: XGameStreamingIsTouchInputEnabled
ms.author: arikc
ms.topic: reference
edited: 00/00/0000
quality: good
security: public
applies-to: pc-gdk
---

# XGameStreamingIsTouchInputEnabled  

Check if a specified streaming client device will send touch inputs to the game.    

## Syntax  
  
```cpp
HRESULT XGameStreamingIsTouchInputEnabled(  
         XGameStreamingClientId client,  
         bool* touchInputEnabled  
)  
```  
  
### Parameters  
  
*client* &nbsp;&nbsp;\_In\_  
Type: XGameStreamingClientId  
  
The client to query for touch properties.    
  
*touchInputEnabled* &nbsp;&nbsp;\_Out\_  
Type: bool*  
  
Returns true if the streaming client device is both capable of receiving touch input **AND** is currently configured to pass the touch input to the game.
  
### Return value
Type: HRESULT  

Returns **S_OK** if successful; otherwise, returns an error code.

#### Potential Errors

| Error Code | Error Value | Reason for Error |
| --- | --- | --- | 
| E_GAMESTREAMING_NOT_INITIALIZED | 0x89245400 | The XGameStreaming runtime has not been initialized. Call XGameStreamingInitialize before calling other APIs.
| E_GAMESTREAMING_NO_DATA | 0x89245402 | The requested data is not available. The data may be available later.

For a list of error codes, see [Error Codes](../../../errorcodes.md).  
  
## Remarks  
  
By default, only when streaming via Content Test Application on a touch capable device will `XGameStreamingIsTouchInputEnabled` return `true`.   Until your game has been configured to enable touch input, no production players will have touch input enabled on their client streaming.

If the game wants to respond to changes in touch input being enabled or disabled, it should register a callback via [XGameStreamingRegisterClientPropertiesChanged](xgamestreamingregisterclientpropertieschanged.md).

  
## Requirements  
  
**Header:** xgamestreaming.h
  
**Library:** xgameruntime.lib
  
**Supported platforms:** Windows, Xbox One family consoles and Xbox Series consoles  
  
## See also  
[XGameStreamingClientPropertiesChangedCallback](xgamestreamingclientpropertieschangedcallback.md)  
[XGameStreamingRegisterClientPropertiesChanged](xgamestreamingregisterclientpropertieschanged.md)   
[XGameStreaming](../xgamestreaming_members.md)  