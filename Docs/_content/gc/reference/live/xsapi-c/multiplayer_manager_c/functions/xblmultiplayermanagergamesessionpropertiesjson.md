---
author: joannaleecy
title: XblMultiplayerManagerGameSessionPropertiesJson
description: Retrieves the custom properties for the game session, as a JSON string.
kindex: XblMultiplayerManagerGameSessionPropertiesJson
ms.author: migreen
ms.topic: reference
security: public
edited: 00/00/0000
applies-to: pc-gdk
---

# XblMultiplayerManagerGameSessionPropertiesJson  

Retrieves the custom properties for the game session, as a JSON string.  

## Syntax  
  
```cpp
const char* XblMultiplayerManagerGameSessionPropertiesJson(  
)  
```  
  
### Parameters  
  
  
### Return value  
Type: const char*
  
A JSON string that specifies the custom properties for the game session, or null if a game session doesn't exist. The memory for the returned pointer remains valid until the next call to [XblMultiplayerManagerDoWork](xblmultiplayermanagerdowork.md).
  
## Remarks  
  
This function retrieves the custom properties for the game session, represented as a JSON string. These custom properties can be changed at any time. If custom properties are shared between devices, or may be updated by several devices at the same time, use the [XblMultiplayerManagerGameSessionSetSynchronizedProperties](xblmultiplayermanagergamesessionsetsynchronizedproperties.md) function to change custom properties. Otherwise, you can use the [XblMultiplayerManagerGameSessionSetProperties](xblmultiplayermanagergamesessionsetproperties.md) function to change custom properties.
  
## Requirements  
  
**Header:** multiplayer_manager_c.h
  
**Library:** Microsoft.Xbox.Services.141.GSDK.C.lib
  
## See also  
[multiplayer_manager_c](../multiplayer_manager_c_members.md)  
[XblMultiplayerManagerLobbySessionPropertiesJson](xblmultiplayermanagerlobbysessionpropertiesjson.md)
  
  