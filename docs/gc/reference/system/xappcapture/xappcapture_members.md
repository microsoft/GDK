---
author: M-Stahl
title: XAppCapture (API contents)
description: Reference material for XAppCapture APIs.
kindex: XAppCapture
ms.author: ddobyns
ms.topic: navigation
edited: 00/00/0000
security: public
applies-to: pc-gdk
---

# XAppCapture  
  
Xbox and Desktop include native Broadcasting experiences each with their own rules on which applications can be broadcasted by a user. These APIs will allow the developer to bring up the broadcasting UI as well as detect when the user is broadcasting. The app developer can provide metadata events and states to be saved or broadcasted with the captured video and audio file/stream.  
  
  
## Functions  
  
| Function | Description |  
| --- | --- |  
| [XAppBroadcastGetStatus](functions/xappbroadcastgetstatus.md) | Retrieves the current status for broadcasting for the device and current app. |  
| [XAppBroadcastIsAppBroadcasting](functions/xappbroadcastisappbroadcasting.md) | Determines whether the app is currently broadcasting. |  
| [XAppBroadcastMonitorCallback](functions/xappbroadcastmonitorcallback.md) | Sets the callback function for [XAppBroadcastRegisterIsAppBroadcastingChanged](functions/xappbroadcastregisterisappbroadcastingchanged.md). The function set here will be called each time the broadcast status changes. |  
| [XAppBroadcastRegisterIsAppBroadcastingChanged](functions/xappbroadcastregisterisappbroadcastingchanged.md) | Register an app broadcast status change event handler. |  
| [XAppBroadcastShowUI](functions/xappbroadcastshowui.md) | Show broadcast UI to app user so that they may start broadcasting activity. |  
| [XAppBroadcastUnregisterIsAppBroadcastingChanged](functions/xappbroadcastunregisterisappbroadcastingchanged.md) | Remove an app broadcast status change event handler. |  
| [XAppCaptureCloseScreenshotStream](functions/xappcaptureclosescreenshotstream.md) | Closes a screenshot stream. |  
| [XAppCaptureDisableRecord](functions/xappcapturedisablerecord.md) | Disables video recording for the player. |  
| [XAppCaptureEnableRecord](functions/xappcaptureenablerecord.md) | Enables recording / screenshot for the current user. |  
| [XAppCaptureMetadataAddDoubleEvent](functions/xappcapturemetadataadddoubleevent.md) | Add a metadata event with a double value to your app capture. |  
| [XAppCaptureMetadataAddInt32Event](functions/xappcapturemetadataaddint32event.md) | Add a metadata event with an Int32 value to your app capture. |  
| [XAppCaptureMetadataAddStringEvent](functions/xappcapturemetadataaddstringevent.md) | Add a metadata event with a string value to your app capture. |  
| [XAppCaptureMetadataPurgedCallback](functions/xappcapturemetadatapurgedcallback.md) | Set the callback function to be called when a metadata purge occurs. |  
| [XAppCaptureMetadataRemainingStorageBytesAvailable](functions/xappcapturemetadataremainingstoragebytesavailable.md) | Returns the remaining storage available for app capture metadata. Measured in bytes. |  
| [XAppCaptureMetadataStartDoubleState](functions/xappcapturemetadatastartdoublestate.md) | Add a metadata state with a double value to your app capture. |  
| [XAppCaptureMetadataStartInt32State](functions/xappcapturemetadatastartint32state.md) | Add a metadata state with an Int32 value to your app capture. |  
| [XAppCaptureMetadataStartStringState](functions/xappcapturemetadatastartstringstate.md) | Add a metadata state with a string value to your app capture. |  
| [XAppCaptureMetadataStopAllStates](functions/xappcapturemetadatastopallstates.md) | Stops all state events currently active. |  
| [XAppCaptureMetadataStopState](functions/xappcapturemetadatastopstate.md) | Add a state stop for a particular named state to the app capture metadata. |  
| [XAppCaptureOpenScreenshotStream](functions/xappcaptureopenscreenshotstream.md) | Opens a screenshot stream. |  
| [XAppCaptureReadScreenshotStream](functions/xappcapturereadscreenshotstream.md) | Reads a screenshot stream. |  
| [XAppCaptureRecordDiagnosticClip](functions/xappcapturerecorddiagnosticclip.md) | Records a diagnostic clip from your app. |  
| [XAppCaptureRegisterMetadataPurged](functions/xappcaptureregistermetadatapurged.md) | Register an event handler for meta data purge events. |  
| [XAppCaptureTakeDiagnosticScreenshot](functions/xappcapturetakediagnosticscreenshot.md) | Takes a diagnostic screenshot from your app. |  
| [XAppCaptureTakeScreenshot](functions/xappcapturetakescreenshot.md) | Takes a screenshot. |  
| [XAppCaptureUnRegisterMetadataPurged](functions/xappcaptureunregistermetadatapurged.md) | Remove an event handler for meta data purge events. |  
  
## Structures  
  
| Structure | Description |  
| --- | --- |  
| [XAppBroadcastStatus](structs/xappbroadcaststatus.md) | Describes the state of broadcasting abilities for an app/game. |  
| [XAppCaptureDiagnosticScreenshotResult](structs/xappcapturediagnosticscreenshotresult.md) | App capture screenshot and descriptive information. |  
| [XAppCaptureRecordClipResult](structs/xappcapturerecordclipresult.md) | Captured video clip and descriptive information. |  
| [XAppCaptureScreenshotFile](structs/xappcapturescreenshotfile.md) | Captured screenshot and descriptive information. |  
| [XAppCaptureScreenshotStream](structs/xappcapturescreenshotstream.md) | Represents a screenshot stream. |  
| [XAppCaptureTakeScreenshotResult](structs/xappcapturetakescreenshotresult.md) | Represents the results of taking a screenshot. |  
  
## Enumerations  
  
| Enumeration | Description |  
| --- | --- |  
| [XAppCaptureMetadataPriority](enums/xappcapturemetadatapriority.md) | Levels of priority for app capture meta data. Used to determine what data is most important when storage constraints are implemented and some meta data must be deleted. |  
| [XAppCaptureScreenshotFormatFlag](enums/xappcapturescreenshotformatflag.md) | Determines the definition quality of the screenshot capture. |  
| [XAppCaptureVideoEncoding](enums/xappcapturevideoencoding.md) | Determines the video encoding type video capture. |  


## See also  
[System API reference](../gc-reference-system-toc.md)  