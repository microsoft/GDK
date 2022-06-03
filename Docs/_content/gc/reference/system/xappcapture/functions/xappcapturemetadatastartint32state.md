---
author: M-Stahl
title: XAppCaptureMetadataStartInt32State
description: Add a metadata state with an Int32 value to your app capture.
kindex: XAppCaptureMetadataStartInt32State
ms.author: ddobyns
ms.topic: reference
edited: 02/10/2020
quality: good
security: public
applies-to: pc-gdk
---

# XAppCaptureMetadataStartInt32State  

Add a metadata state with an Int32 value to your app capture.  

## Syntax  
  
```cpp
HRESULT XAppCaptureMetadataStartInt32State(  
         const char* name,  
         int32_t value,  
         XAppCaptureMetadataPriority priority  
)  
```  
  
### Parameters  
  
*name* &nbsp;&nbsp;\_In\_z\_  
Type: char*  

  
Name of the state being added to the app capture timeline.  


*value* &nbsp;&nbsp;\_In\_  
Type: int32_t  

  
Value of the state being added to the timeline. Must be an Int32.  


*priority* &nbsp;&nbsp;\_In\_  
Type: [XAppCaptureMetadataPriority](../enums/xappcapturemetadatapriority.md)  

  
Priority of the metadata. Used to determine what is saved in the case that storage limiters are exceeded. A member of the [XAppCaptureMetaDataPriority](../enums/xappcapturemetadatapriority.md) enumeration.  


  
### Return value
Type: HRESULT
  
Function result.  
  
## Remarks  
  > [!NOTE]
> This function isn't safe to call on a time-sensitive thread. For more information, see [Time-sensitive threads](../../../../system/overviews/time-sensitive-threads.md).  
  
The system associates a metadata state with the window of time between when the state is started and when it’s value is changed or the state is stopped with a call to [XAppCaptureMetaDataStopAllStates](xappcapturemetadatastopallstates.md). This metadata is used to identify events during live streams, and captured playback to categorize and search content. To store an integer value that applies to an instantaneous moment in time, use [XAppCaptureMetaDataAddInt32Event](xappcapturemetadataaddint32event.md).  
  
> [!CAUTION]
> Metadata may be uploaded to Xbox Live and/or saved to .mp4 files, screenshots or used during broadcast, as such, private user info should never be logged with meta data.  
  
## Requirements  
  
**Header:** XAppCapture.h
  
**Library:** xgameruntime.lib
  
**Supported platforms:** Windows, Xbox One family consoles and Xbox Series consoles  
  
## See also  
[GameDVR Overview](../../../../system/overviews/gamedvr-broadcast.md)  
[XAppCapture Members](../xappcapture_members.md)  
  
  