---
author: joannaleecy
title: XblMultiplayerManagerGameSessionSetProperties
description: Sets the value of a custom property for the game session.
kindex: XblMultiplayerManagerGameSessionSetProperties
ms.author: migreen
ms.topic: reference
security: public
edited: 00/00/0000
applies-to: pc-gdk
---

# XblMultiplayerManagerGameSessionSetProperties  

Sets the value of a custom property for the game session.  

## Syntax  
  
```cpp
HRESULT XblMultiplayerManagerGameSessionSetProperties(  
         const char* name,  
         const char* valueJson,  
         void* context  
)  
```  
  
### Parameters  
  
*name* &nbsp;&nbsp;\_In\_z\_  
Type: char*  
  
The name of the custom property to set.  
  
*valueJson* &nbsp;&nbsp;\_In\_z\_  
Type: char*  
  
The value to assign to the property, as a JSON string.  
  
*context* &nbsp;&nbsp;\_In\_opt\_  
Type: void*  
  
Optional. The application-defined data to correlate the [XblMultiplayerEvent](../structs/xblmultiplayerevent.md) to the initiating call.  
  
  
### Return value  
Type: HRESULT
  
HRESULT return code for this API operation.
  
## Remarks  
  
This function sets the value, represented as a JSON string, of a custom property for the game session. Custom properties can be changed at any time. Changes are batched and written to the service when [XblMultiplayerManagerDoWork](xblmultiplayermanagerdowork.md) is called. If custom properties are shared between devices, or may be updated by several devices at the same time, use the [XblMultiplayerManagerGameSessionSetSynchronizedProperties](xblmultiplayermanagergamesessionsetsynchronizedproperties.md) function to change custom properties. Otherwise, you can use this function to change custom properties.
  
## Requirements  
  
**Header:** multiplayer_manager_c.h
  
**Library:** Microsoft.Xbox.Services.141.GSDK.C.lib
  
## See also  
[multiplayer_manager_c](../multiplayer_manager_c_members.md)  
[XblMultiplayerManagerGameSessionSetSynchronizedHost](xblmultiplayermanagergamesessionsetsynchronizedhost.md)
  
  