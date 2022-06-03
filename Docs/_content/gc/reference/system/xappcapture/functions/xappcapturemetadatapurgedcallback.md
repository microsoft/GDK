---
author: M-Stahl
title: XAppCaptureMetadataPurgedCallback
description: Set the callback function to be called when a metadata purge occurs.
kindex: XAppCaptureMetadataPurgedCallback
ms.author: ddobyns
ms.topic: reference
edited: 00/00/0000
quality: good
security: public
applies-to: pc-gdk
---

# XAppCaptureMetadataPurgedCallback  

Defines the callback function to be called when a metadata purge occurs.  

## Syntax  
  
```cpp
void XAppCaptureMetadataPurgedCallback(  
         void* context  
)  
```  
  
### Parameters  
  
*context* &nbsp;&nbsp;\_In\_  
Type: void*  
  
Object which provides necessary information for the execution of the callback function. Usually the calling object.  
  
### Return value

Type: void
  
## Remarks  

Register the callback function defined here with [XAppCaptureRegisterMetadataPurged](xappcaptureregistermetadatapurged.md) so that it can be called when metadata is purged. This will allow you to reassess the amount of metadata the tile is adding to the capture. You should primarily use this function during development and testing to make sure that your title is not adding more than the allowed amount of metadata to a capture. It was not intended to be used to change game behavior while the title is running.  
  
## Requirements    
  
**Header:** XAppCapture.h
  
**Library:** xgameruntime.lib
  
**Supported platforms:** Windows, Xbox One family consoles and Xbox Series consoles  
  
## See also  
[GameDVR Overview](../../../../system/overviews/gamedvr-broadcast.md)  
[XAppCapture Members](../xappcapture_members.md)  
[XAppCaptureRegisterMetadataPurged](xappcaptureregistermetadatapurged.md)  
  