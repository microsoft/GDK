---
author: M-Stahl
title: XAppCaptureMetadataStopState
description: Add a state stop for a particular named state to the app capture metadata.
kindex: XAppCaptureMetadataStopState
ms.author: ddobyns
ms.topic: reference
edited: 02/10/2020
quality: good
security: public
applies-to: pc-gdk
---

# XAppCaptureMetadataStopState  

Add a state stop for a particular named state to the app capture metadata.  

## Syntax  
  
```cpp
HRESULT XAppCaptureMetadataStopState(  
         const char* name  
)  
```  
  
### Parameters  
  
*name* &nbsp;&nbsp;\_In\_z\_  
Type: char*  

Name of the state to be stopped.
  
### Return value
Type: HRESULT
  
Function result.  
  
## Remarks  
  > [!NOTE]
> This function isn't safe to call on a time-sensitive thread. For more information, see [Time-sensitive threads](../../../../system/overviews/time-sensitive-threads.md).  
  
Adding a stop state to the app capture timeline will mark the end of a previously started event. Events are started by one of the XappCaptureMetaDataStart*Event functions: [XAppCaptureMetadataStartInt32State](xappcapturemetadatastartint32state.md), [XAppCaptureMetadataStartDoubleState](xappcapturemetadatastartdoublestate.md), or [XAppCaptureMetadataStartStringState](xappcapturemetadatastartstringstate.md). Stop state will only stop one state at a time, If you wish to stop all metadata states at once call [XAppCaptureMetadataStopAllStates](xappcapturemetadatastopallstates.md).
  
## Requirements  
  
**Header:** XAppCapture.h
  
**Library:** xgameruntime.lib
  
**Supported platforms:** Windows, Xbox One family consoles and Xbox Series consoles  
  
## See also  
[GameDVR Overview](../../../../system/overviews/gamedvr-broadcast.md)  
[XAppCapture Members](../xappcapture_members.md)  
[XAppCaptureMetadataStopAllStates](xappcapturemetadatastopallstates.md)  
[XAppCaptureMetadataStartInt32State](xappcapturemetadatastartint32state.md)  
[XAppCaptureMetadataStartDoubleState](xappcapturemetadatastartdoublestate.md)  
[XAppCaptureMetadataStopAllStates](xappcapturemetadatastopallstates.md)  