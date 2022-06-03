---
author: M-Stahl
title: XAppCaptureMetadataAddStringEvent
description: Add a metadata event with a string value to your app capture.
kindex: XAppCaptureMetadataAddStringEvent
ms.author: ddobyns
ms.topic: reference
edited: 01/06/2020
quality: good
security: public
applies-to: pc-gdk
---

# XAppCaptureMetadataAddStringEvent  

Add a metadata event with a string value to your app capture.  

## Syntax  
  
```cpp
HRESULT XAppCaptureMetadataAddStringEvent(  
         const char* name,  
         const char* value,  
         XAppCaptureMetadataPriority priority  
)  
```  
  
### Parameters  
  
*name* &nbsp;&nbsp;\_In\_z\_  
Type: char*  

  
Name of the event being added to the app capture timeline.  


*value* &nbsp;&nbsp;\_In\_z\_  
Type: char*  

  
Value of the event being added to the timeline. Must be a string.  


*priority* &nbsp;&nbsp;\_In\_  
Type: [XAppCaptureMetadataPriority](../enums/xappcapturemetadatapriority.md)  

  
Priority of the metadata. Used to determine what is saved in the case that storage limiters are exceeded. A member of the [XAppCaptureMetaDataPriority](../enums/xappcapturemetadatapriority.md) enumeration.

  
### Return value
Type: HRESULT
  
Function result.  
  
## Remarks  
  > [!NOTE]
> This function isn't safe to call on a time-sensitive thread. For more information, see [Time-sensitive threads](../../../../system/overviews/time-sensitive-threads.md).  
  
The system associates a metadata event with a timestamp when this method is called. This metadata is used to identify events during live streams, and captured playback to categorize and search content. To store a string value that applies to a window of time, use [XAppCaptureMetaDataStartStringState](xappcapturemetadatastartstringstate.md).  
  
> ![alert](../../../../../../resources/gamecore/images/en-us/common/note.gif)
> Metadata may be uploaded to Xbox Live and/or saved to .mp4 files, screenshots or used during broadcast, as such, private user info should never be logged with meta data.
  
## Requirements  
  
**Header:** XAppCapture.h
  
**Library:** xgameruntime.lib
  
**Supported platforms:** Windows, Xbox One family consoles and Xbox Series consoles  
  
## See also  
[GameDVR Overview](../../../../system/overviews/gamedvr-broadcast.md)  
[XAppCapture Members](../xappcapture_members.md)  
[XAppCaptureMetadataAddDoubleEvent](xappcapturemetadataadddoubleevent.md)  
[XAppCaptureMetadataAddInt32Event](xappcapturemetadatastartint32state.md)  
  