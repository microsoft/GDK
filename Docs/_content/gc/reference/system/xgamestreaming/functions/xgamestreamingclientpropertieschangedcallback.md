---
author: M-Stahl
title: XGameStreamingClientPropertiesChangedCallback
description: A callback function which is invoked whenever properties of a connected streaming client change.
kindex: XGameStreamingClientPropertiesChangedCallback
ms.author: arikc
ms.topic: reference
edited: 00/00/0000
quality: good
security: public
applies-to: pc-gdk
---

# XGameStreamingClientPropertiesChangedCallback  

A callback function which is invoked whenever properties of a connected streaming client device change.  Callback is also invoked for all connected devices upon first registration.      

## Syntax  
  
```cpp
void XGameStreamingClientPropertiesChangedCallback(  
         void* context,  
         XGameStreamingClientId client,  
         uint32_t updatedPropertiesCount,  
         XGameStreamingClientProperty* updatedProperties  
)
```  
  
### Parameters  
  
*context* &nbsp;&nbsp;\_In\_  
Type: void*  
  
A pointer to the context provided at event registration time.    
  
*client* &nbsp;&nbsp;\_In\_  
Type: XGameStreamingClientId  
  
The client which has changed properties.    
  
*updatedPropertiesCount* &nbsp;&nbsp;\_In\_  
Type: uint32_t  
  
The number of properties which have changed on the client.    
  
*updatedProperties* &nbsp;&nbsp;\_In\_reads\_(updatedPropertiesCount)  
Type: [XGameStreamingClientProperty*](../enums/xgamestreamingclientproperty.md)  
  
A pointer to the identifiers of the changed client properties.    
  
  
### Return value
Type: void
    
  
## Remarks  
The `XGameStreamingClientPropertiesChangedCallback`  is invoked whenever one or more properties of the streaming client device have changed.  Upon  connection of the device, the callback is invoked for each of the properties that are applicable to that device.

Upon initial registering of the callback function via  [XGameStreamingRegisterClientPropertiesChanged](xgamestreamingregisterclientpropertieschanged.md) the callback will be invoked for each of the properties that are applicable to that device.

To unregister the callback function use [XGameStreamingUnregisterClientPropertiesChanged](xgamestreamingunregisterclientpropertieschanged.md).

  
## Requirements  
  
**Header:** xgamestreaming.h
  
**Library:** xgameruntime.lib
  
**Supported platforms:** Windows, Xbox One family consoles and Xbox Series consoles  
  
## See also  
[XGameStreamingClientProperty](../enums/xgamestreamingclientproperty.md)  
[XGameStreamingRegisterClientPropertiesChanged](xgamestreamingregisterclientpropertieschanged.md)  
[XGameStreamingUnregisterClientPropertiesChanged](xgamestreamingunregisterclientpropertieschanged.md)  
[XGameStreaming](../xgamestreaming_members.md)  