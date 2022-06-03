---
author: joannaleecy
title: XblMultiplayerEvent
description: A multiplayer event that is returned from [XblMultiplayerManagerDoWork](../functions/xblmultiplayermanagerdowork.md).
kindex: XblMultiplayerEvent
ms.author: migreen
ms.topic: reference
security: public
edited: 00/00/0000
applies-to: pc-gdk
---

# XblMultiplayerEvent  

A multiplayer event that is returned from [XblMultiplayerManagerDoWork](../functions/xblmultiplayermanagerdowork.md).  

## Syntax  
  
```cpp
typedef struct XblMultiplayerEvent {  
    Result ;  
    const char* ErrorMessage;  
    void* Context;  
    XblMultiplayerEventType EventType;  
    XblMultiplayerEventArgsHandle EventArgsHandle;  
    XblMultiplayerSessionType SessionType;  
} XblMultiplayerEvent  
```
  
### Members  
  
**  
Type: Result  
  
The error code indicating the result of the operation.
  
*ErrorMessage*  
Type: const char*  
  
Call-specific debug information if the API operation fails. The debug information is not localized; use only for debugging purposes.
  
*Context*  
Type: void*  
  
A pointer to the application-defined data passed into the initiating method.
  
*EventType*  
Type: [XblMultiplayerEventType](../enums/xblmultiplayereventtype.md)  
  
The type of the event triggered.
  
*EventArgsHandle*  
Type: XblMultiplayerEventArgsHandle  
  
A handle to the event arguments for the multiplayer event.
  
*SessionType*  
Type: [XblMultiplayerSessionType](../enums/xblmultiplayersessiontype.md)  
  
The multiplayer session type this event was triggered for. Depending upon the session type, you can then retrieve the latest lobby or game session.
  
## Requirements  
  
**Header:** multiplayer_manager_c.h
  
## See also  
[multiplayer_manager_c](../multiplayer_manager_c_members.md)  
  
  