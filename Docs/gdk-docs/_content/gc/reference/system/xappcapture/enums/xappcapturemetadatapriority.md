---
author: M-Stahl
title: XAppCaptureMetadataPriority
description: Levels of priority for app capture meta data. Used to determine what data is most important when storage constraints are implemented and some meta data must be deleted.
kindex: XAppCaptureMetadataPriority
ms.author: ddobyns
ms.topic: reference
edited: 07/02/2019
quality: good
security: public
applies-to: pc-gdk
---

# XAppCaptureMetadataPriority  

Specifies the relative importance of an app capture metadata item stored using the **AppCaptureMetadataWriter**. When the storage space allotted for accumulated metadata is low, the system will use the priority and age of metadata items to determine the order in which metadata is purged to free storage space.  

## Syntax  
  
```cpp
enum class XAppCaptureMetadataPriority  : uint8_t  
{  
    Informational = 0,  
    Important,  
}  
```  
  
## Constants  
  
| Constant | Description |
| --- | --- |
| Informational | Meta data is informational and may be deleted first in the instance of a storage shortage. |  
| Important | Meta data is important and will be saved from deletion if possible in the case of a storage shortage. |  
  
## Remarks  

Important priority means the metadata will be uploaded to the Xbox Live service. The metadata will be used to help users search clips or annotate broadcasts, among other things. Both Important and Informational metadata are embedded in the generated .mp4 file, so you should not include any private user information in the metadata.  
  
This enumerable is used to give metadata a priority value at the time that is set with the following functions:

- [XAppCaptureMetaDataAddDoubleEvent](../functions/xappcapturemetadataadddoubleevent.md)  
- [XAppCaptureMetaDataAddInt32Event](../functions/xappcapturemetadataaddint32event.md)  
- [XAppCaptureMetaDataAddStringEvent](../functions/xappcapturemetadataaddstringevent.md)  
- [XAppCaptureMetaDataStartDoubleState](../functions/xappcapturemetadatastartdoublestate.md)  
- [XAppCaptureMetaDataStartInt32State](../functions/xappcapturemetadatastartint32state.md)  
- [XAppCaptureMetadataStartStringState](../functions/xappcapturemetadatastartstringstate.md)  

The priority is then taken into account when deciding what data to delete if a purge becomes necessary. The capture platform will impose a limit on the total amount of metadata that an application can add, when this limit is reached new events will still be recorded but other events will be deleted to keep within data contstraints. This deletion will occur based on the priority level given to some metadata. Developers can check the amount of data left by calling [XAppCaptureMetaDataRemainingStorageBytesAvailable](../functions/xappcapturemetadataremainingstoragebytesavailable.md).

## Requirements  
  
**Header:** XAppCapture.h
  
**Supported platforms:** Windows, Xbox One family consoles and Xbox Series consoles  
  
## See also  
[GameDVR Overview](../../../../system/overviews/gamedvr-broadcast.md)  
[XAppCapture Members](../xappcapture_members.md)  
[XAppCaptureMetaDataAddDoubleEvent](../functions/xappcapturemetadataadddoubleevent.md)  
[XAppCaptureMetaDataAddInt32Event](../functions/xappcapturemetadataaddint32event.md)  
[XAppCaptureMetaDataAddStringEvent](../functions/xappcapturemetadataaddstringevent.md)  
[XAppCaptureMetaDataStartDoubleState](../functions/xappcapturemetadatastartdoublestate.md)  
[XAppCaptureMetaDataStartInt32State](../functions/xappcapturemetadatastartint32state.md)  
[XAppCaptureMetadataStartStringState](../functions/xappcapturemetadatastartstringstate.md)  
[XAppCaptureMetaDataRemainingStorageBytesAvailable](../functions/xappcapturemetadataremainingstoragebytesavailable.md)  