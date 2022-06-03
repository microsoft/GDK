---
author: joannaleecy
title: XblRealTimeActivityConnectionState
description: Enumeration for the possible connection states of the connection to the real-time activity service.
kindex: XblRealTimeActivityConnectionState
ms.author: migreen
ms.topic: reference
security: public
edited: 00/00/0000
quality: good
applies-to: pc-gdk
---

# XblRealTimeActivityConnectionState  

Enumeration for the possible connection states of the connection to the real-time activity service.    

## Syntax  
  
```cpp
enum class XblRealTimeActivityConnectionState  : uint32_t  
{  
    Connected,  
    Connecting,  
    Disconnected  
}  
```  
  
## Constants  
  
| Constant | Description |
| --- | --- |
| Connected | Currently connected to the real-time activity service. |  
| Connecting | Currently connecting to the real-time activity service. |  
| Disconnected | Currently disconnected from the real-time activity service. |  
  
## Requirements  
  
**Header:** real_time_activity_c.h
  
## See also  
[real_time_activity_c](../real_time_activity_c_members.md)  
  
  