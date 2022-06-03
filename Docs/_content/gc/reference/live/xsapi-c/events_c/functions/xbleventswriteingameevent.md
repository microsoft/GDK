---
author: joannaleecy
title: XblEventsWriteInGameEvent
description: Write an in-game event that includes "dimensions" and "measurement" data fields.
kindex: XblEventsWriteInGameEvent
ms.author: migreen
ms.topic: reference
security: public
edited: 00/00/0000
applies-to: pc-gdk
quality: good
---

# XblEventsWriteInGameEvent  

Write an in-game event that includes "dimensions" and "measurement" data fields.  

## Syntax  
  
```cpp
HRESULT XblEventsWriteInGameEvent(  
         XblContextHandle xboxLiveContext,  
         const char* eventName,  
         const char* dimensionsJson,  
         const char* measurementsJson  
)  
```  
  
### Parameters  
  
*xboxLiveContext* &nbsp;&nbsp;\_In\_  
Type: [XblContextHandle](../../types_c/handles/xblcontexthandle.md)  
  
Xbox Live context handle.  
  
*eventName* &nbsp;&nbsp;\_In\_z\_  
Type: char*  
  
Event name. Must be contain only alphanumeric characters.  
  
*dimensionsJson* &nbsp;&nbsp;\_In\_opt\_z\_  
Type: char*  
  
Dimensions data fields.  
  
*measurementsJson* &nbsp;&nbsp;\_In\_opt\_z\_  
Type: char*  
  
Measurement data fields.  
  
  
### Return value  
Type: HRESULT
  
HRESULT return code for this API operation.
  
## Remarks  
  
Dimensions include event fields with a finite number of defined numeric or string values. Examples of dimensions: map id, difficulty level, character or weapon class, game mode, boolean settings, etc. Measurements include event fields that represent scalar numeric metrics. Examples of measurements: score, time, counters, position, etc. Example: for an in-game event that tracks the highest match score for a particular difficulty level: The difficulty level should be included in dimensions, and the score should be included in measurements. The name of the event, and the names of the event fields (both dimensions and measurements), must match the names declared in the title's service configuration. The names are case insensitive. If the API writes an event with a name that does not match a name in the service configuration, the service drops the event with no notification. When using the GDK PC version, a GRTS runtime with the XGameEvent feature must be installed or this will E_NOTIMPL.
  
## Requirements  
  
**Header:** events_c.h
  
**Library:** Microsoft.Xbox.Services.141.GSDK.C.lib
  
## See also  
[events_c](../events_c_members.md)  
  
  