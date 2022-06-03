---
author: M-Stahl
title: XAppCaptureMetadataStartDoubleState
description: Add a metadata state with a double value to your app capture.
kindex: XAppCaptureMetadataStartDoubleState
ms.author: ddobyns
ms.topic: reference
edited: 07/15/2019
quality: good
security: public
applies-to: pc-gdk
---

# XAppCaptureMetadataStartDoubleState  

Add a metadata state with a double value to your app capture.  

## Syntax  
  
```cpp
HRESULT XAppCaptureMetadataStartDoubleState(  
         const char* name,  
         double value,  
         XAppCaptureMetadataPriority priority  
)  
```  
  
### Parameters  
  
*name* &nbsp;&nbsp;\_In\_z\_  
Type: char*  

  
Name of the state being added to the app capture timeline.  


*value* &nbsp;&nbsp;\_In\_  
Type: double  

  
Value of the state being added to the timeline. Must be a double.  


*priority* &nbsp;&nbsp;\_In\_  
Type: [XAppCaptureMetadataPriority](../enums/xappcapturemetadatapriority.md)  

  
Priority of the metadata. Used to determine what is saved in the case that storage limiters are exceeded. A member of the [XAppCaptureMetaDataPriority](../enums/xappcapturemetadatapriority.md) enumeration.  


  
### Return value
  
Type: HRESULT
  
Function result.  
  
## Remarks  
  > [!NOTE]
> This function isn't safe to call on a time-sensitive thread. For more information, see [Time-sensitive threads](../../../../system/overviews/time-sensitive-threads.md).  
  
The system associates a metadata state with the window of time between when the state is started and when it’s value is changed or the state is stopped with a call to [XAppCaptureMetaDataStopAllStates](xappcapturemetadatastopallstates.md). This metadata is used to identify events during live streams, and captured playback to categorize and search content. To store a double value that applies to an instantaneous moment in time, use [XAppCaptureMetadataAddDoubleEvent](xappcapturemetadataadddoubleevent.md).  
  
Double values used with this function must be finite. Non-finite doubles will be converted into 0 and accepted.  
  
> [!CAUTION]
> Metadata may be uploaded to Xbox Live and/or saved to .mp4 files, screenshots or used during broadcast, as such, private user info should never be logged with meta data.  
  
## Requirements  
  
**Header:** XAppCapture.h
  
**Library:** xgameruntime.lib
  
**Supported platforms:** Windows, Xbox One family consoles and Xbox Series consoles  
  
## See also  
[GameDVR Overview](../../../../system/overviews/gamedvr-broadcast.md)  
[XAppCapture Members](../xappcapture_members.md)  
  
  