---
author: aablackm
title: XtfCaptureRecordedGameClip
description: Captures a video clip from the currently running game.
ms.assetid: M:Windows.Xbox.XtfCaptureRecordedGameClip(PCWSTR,PCWSTR,UINT32)
kindex: XtfCaptureRecordedGameClip
ms.author: stevenpr
ms.topic: reference
edited: 06/13/2019
security: public
---

# XtfCaptureRecordedGameClip
  
Retrieves a video clip from the GameDVR of the currently running game.  
  
<a id="syntaxSection"></a>
  
## Syntax
  
```cpp
HRESULT XtfCaptureRecordedGameClip(
         PCWSTR address,
         PCWSTR fullFileName,
         UINT32 numSeconds
)  
```
  
<a id="parametersSection"></a>
  
### Parameters
  
*address*  
Type: PCWSTR  
  
\[in\] The IP address of the console.  
  
*fullFileName*  
Type: PCWSTR  
  
\[in\] The full path and filename of the file to which the video will be written.  
  
*numSeconds*  
Type: UINT32  
  
\[in\] The number of seconds of video to retrieve. Minimum value is 6 seconds. Maximum value is 300 seconds.  
  
<a id="retvalSection"></a>
  
### Return value
  
Type: HRESULT  
  
Returns `S_OK` if successful; otherwise, returns an error code. Possible error codes include the following:
  
| Error code | Description |  
| ---------- | ----------- |  
| 0x82323001 | The GameDVR service unexpectantly shut down. |  
| 0x82323002 | There is not enough storage space to save another clip. |  
| 0x82323003 | StartRecordAsync did not finish or was not called from this instance of ApplicationClipCapture before calling StopRecordAsync. |  
| 0x82323004 | There are too many concurrent recordings. |  
| 0x82323005 | HTTP Response text is too big. |  
| 0x82323006 | Information about an earlier call to StartRecordingAsync is missing. |  
| 0x82323007 | StopRecordAsync was not called within the allotted time after StartRecordAsync. |  
| 0x82323008 | The asynchronous call failed but did not return an error code. |  
| 0x82323009 | Update attempted on a cloud clip where cloud ID is not available. |  
| 0x8232300A | There was an error writing to the file. |  
| 0x8232300B | Did not find any frames to record. Possible causes include:<ul><li>Game was in the background during the specified time period.</li><li>Recording was requested too soon after the game was activated.</li></ul> |  
| 0x8232300C | Did not find any frames to record. Possible causes include:<ul><li>Game was in the background during the specified time period.</li><li>Game not running during the specified time period.</li></ul> |  
| 0x8232300D | The clip metadata is incorrectly formatted. |  
| 0x8232300E | Start time is too old or too far into future. |  
| 0x8232300F | Duration of recording is too short or too long. (6 - 300 seconds) |  
| 0x82323010 | The user or title does not have access to the specified clip. |  
| 0x82323011 | There is no field to update. |  
| 0x82323012 | Recording was disabled during the time period requested. |  
| 0x82323013 | StartRecordAsync was called while another recording is being made. |  
| 0x82323014 | StopRecordAsync was called but no recording was started. |  
| 0x82323015 | RecordTimespanAsync was called while another recording is being made. |  
| 0x82323016 | There was a delay uploading the clip. Upload will be attempted again later. Games can safely ignore this error, or use it to inform the user that the request is still in the queue but will take more time to complete. |  
| 0x82323017 | Either there is no title running or the title does not have proper credentials. |  
| 0x82323018 | The current title has blocked recording. |  
| 0x82323019 | The clip hasn't been uploaded to the cloud yet. |  
| 0x8232301A | A guest user was specified for an operation that does not allow it. |  
| 0x8232301B | The GameDVR is unavailable because a broadcast is in progress. |  
| 0x8C11040D | Title is not running on target console. |  
  
<a id="remarksSection"></a>
  
## Remarks
  
While a game is running, the console automatically stores up to 300 seconds of video in a FIFO video buffer. `XtfCaptureRecordedGameClip` retrieves the specified amount of previously stored video from the buffer and stores it in the file specified in `fullFileName`. The file is saved in the MP4 video format. For more information about using GameDVR for capturing video clips, see [GameDVR and broadcasting](../../../../../system/overviews/gamedvr-broadcast.md).
  
<a id="requirements"></a>
  
## Requirements
  
**Header:** xtfapi.h  
  
**Library:** XtfApi.lib  
  
**Supported platforms:** Windows (for Xbox console tools)  
  
<a id="seealsoSection"></a>
  
## See also
  
[XtfCaptureScreenshot](../../xtfconsolecontrol/functions/xtfcapturescreenshot.md)  
[XTF Transport Errors (NDA topic)](../../../../../tools-console/xbox-tools-and-apis/commandlinetools/xtf-transport-errors.md)  
[Additional Xtf APIs](../atoc-xtfapi.md)  
  