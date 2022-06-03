---
author: aablackm
title: XtfCaptureScreenshot
description: Captures the current screen display of the specified development console as a bitmap.
ms.assetid: M:Windows.Xbox.xtfconsolecontrol.XtfCaptureScreenshot(LPCWSTR,HBITMAP*)
kindex: XtfCaptureScreenshot
ms.author: stevenpr
ms.topic: reference
edited: 06/29/2020
security: public
---

# XtfCaptureScreenshot
  
Captures the current screen display of the specified development console as a bitmap.  
  
<a id="syntaxSection"></a>
  
## Syntax
  
```cpp
HRESULT XtfCaptureScreenshot(
         LPCWSTR address,
         HBITMAP* phBitmap
)  
```
  
<a id="parametersSection"></a>
  
### Parameters
  
*address* &nbsp;&nbsp;  
Type: LPCWSTR  
  
A pointer to the tools IP address or hostname of the development console.  
  
*phBitmap* &nbsp;&nbsp;  
Type: HBITMAP\*  
  
A pointer to the HBITMAP of the bitmap for the captured screen display, if successful. When you have finished using this bitmap, call `DeleteObject` to free the resources associated with the HBITMAP.  
  
<a id="retvalSection"></a>
  
### Return value
  
Type: HRESULT  
  
Returns `S_OK` if successful; otherwise, it returns an HRESULT error code.  
  
<a id="remarksSection"></a>
  
## Remarks
  
This function captures a bitmap of what is currently displayed on the screen of the specified development console. The bitmap includes anything that is currently displayed on the console output, including exclusive apps, shared apps, snapped apps, system UI such as Home or notification pop-ups, and so on. The bitmap uses the currently selected display resolution for the console.  
  
Using **XtfCaptureScreenshot** takes momentary control of the video output stream. This causes a momentary framerate glitch on the display, and can cause a black-screen segment in video recorded by GameDVR at the time of the capture.  
  
Your code should follow recommended programming practice and use the embedded information in the bitmap returned in `phBitmap` to determine the resolution of the resulting bitmap. The expected resolution of the resulting bitmap matches the current screen resolution of the development console.  
  
For more information about capturing a screenshot, see [Screen-capture tool (xbcapture.exe) (NDA topic)](../../../../../tools-console/xbox-tools-and-apis/commandlinetools/xbcapture.md).  
  
<a id="requirementsSection"></a>
  
## Requirements
  
**Header:** xtfconsolecontrol.h  
  
**Library:** xtfconsolecontrol.lib  
  
**Supported platforms:** Windows (for Xbox console tools)  
  
<a id="seealsoSection"></a>
  
## See also
  
[XtfConsoleControl](../xtfconsolecontrol_members.md)  
[Xbox Tools Framework native API reference](../../atoc-xtf-native.md)  
  