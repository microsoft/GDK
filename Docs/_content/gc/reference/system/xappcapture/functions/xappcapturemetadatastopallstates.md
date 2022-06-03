---
author: M-Stahl
title: XAppCaptureMetadataStopAllStates
description: Stops all state events currently active.
kindex: XAppCaptureMetadataStopAllStates
ms.author: ddobyns
ms.topic: reference
edited: 02/10/2020
quality: good
security: public
applies-to: pc-gdk
---

# XAppCaptureMetadataStopAllStates  

Stops all state events currently active.  

## Syntax  
  
```cpp
HRESULT XAppCaptureMetadataStopAllStates(  
)  
```  
  
### Parameters  
  
  
### Return value
Type: HRESULT
  
Function result.  
  
## Remarks  > [!NOTE]
> This function isn't safe to call on a time-sensitive thread. For more information, see [Time-sensitive threads](../../../../system/overviews/time-sensitive-threads.md).  
  
Adding a stop state to the app capture timeline will mark the end of a previously started event. To mark the end of a single state event call [XAppCaptureMetaDataStopState](xappcapturemetadatastopstate.md). Stopping all states is useful for instances like the end of the match where all previous states are assumed to conclude due to the match ending.
  
## Requirements  
  
**Header:** XAppCapture.h
  
**Library:** xgameruntime.lib
  
**Supported platforms:** Windows, Xbox One family consoles and Xbox Series consoles  
  
## See also  
[GameDVR Overview](../../../../system/overviews/gamedvr-broadcast.md)  
[XAppCapture Members](../xappcapture_members.md)  
[XAppCaptureMetaDataStopState](xappcapturemetadatastopstate.md)  
  