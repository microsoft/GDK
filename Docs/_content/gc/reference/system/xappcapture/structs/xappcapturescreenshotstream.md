---
author: M-Stahl
title: XAppCaptureScreenshotStream
description: Represents a screenshot stream.
kindex: XAppCaptureScreenshotStream
ms.author: ddobyns
ms.topic: reference
edited: 11/23/2020
security: public
applies-to: pc-gdk
---

# XAppCaptureScreenshotStream  

Represents a screenshot stream.  

<a id="syntaxSection"></a>

## Syntax  
  
```cpp
typedef struct XAppCaptureScreenshotStream {  
} XAppCaptureScreenshotStream  
```

<a id="membersSection"></a>

### Members  

This structure contains no data members.

<a id="remarksSection"></a>

## Remarks

Use this structure to collect screen captures.

You can take a screenshot of the game by calling [XAppCaptureTakeScreenshot](../functions/xappcapturetakescreenshot.md).

`XAppCaptureTakeScreenshot` returns one or more local IDs, which you can use to retrieve a screen capture by passing it in a call to [XAppCaptureOpenScreenshotStream](../functions/xappcaptureopenscreenshotstream.md). You will get two local IDs if you take a screenshot of an HDR screenk: one for the SDR version, and one for HDR version.

`XAppCaptureOpenScreenshotStream` returns a handle to the `XAppCaptureScreenshotStream` object. You can use this handle to read the content of the stream by passing it in a call to [XAppCaptureReadScreenshotStream](../functions/xappcapturereadscreenshotstream.md).

When you're done, you close the handle by calling [XAppCaptureCloseScreenshotStream](../functions/xappcaptureclosescreenshotstream.md).

<a id="exampleSection"></a>

## Example  

The following code example demonstrates how to write the content of the screenshot stream to a local file.

```cpp
void WriteScreenshotStreamToFile(_In_ const char* screenshotLocalId, _In_ XAppCaptureScreenshotFormatFlag screenshotFormat, _In_ const char* filePath)
{
    const int MAX_DATA = 1024;
    XAppCaptureScreenshotStreamHandle handle = nullptr;
    BYTE buffer[MAX_DATA];
    HANDLE file = INVALID_HANDLE_VALUE;
    UINT64 totalBytesRead = 0;
    UINT64 totalBytesToRead = 0;

    if (FAILED_LOG(XAppCaptureOpenScreenshotStream(screenshotLocalId, screenshotFormat, &handle, &totalBytesToRead)))
    {
        return;
    }

    appLog.AddLog("%I64d bytes returned\n", totalBytesToRead);

    file = CreateFileA(filePath, GENERIC_READ | GENERIC_WRITE, 0, 0, CREATE_ALWAYS, FILE_ATTRIBUTE_NORMAL, 0);
    if (file == INVALID_HANDLE_VALUE)
    {
        appLog.AddLog("Could not create %s\n", filePath);
        goto Cleanup;
    }

    while (totalBytesRead < totalBytesToRead)
    {
        uint32_t bytesRead = 0;
        DWORD bytesWritten = 0;

        if (FAILED_LOG(XAppCaptureReadScreenshotStream(handle, totalBytesRead, sizeof(buffer), buffer, &bytesRead)))
        {
            goto Cleanup;
        }

        BOOL result = WriteFile(file, buffer, bytesRead, &bytesWritten, NULL );
        if (!result)
        {
            appLog.AddLog("Failed to write to %s\n", filePath);
            goto Cleanup;
        }

        totalBytesRead += bytesRead;
    }

Cleanup:
    if (handle != nullptr)
    {
        FAILED_LOG(XAppCaptureCloseScreenshotStream(handle));
    }
    if (file != INVALID_HANDLE_VALUE)
    {
        CloseHandle(file);
    }
    appLog.AddLog("Wrote out %I64d bytes to %s\n", totalBytesRead, filePath);

}

```

<a id="requirementsSection"></a>

## Requirements  
  
**Header:** XAppCapture.h
  
**Supported platforms:** Windows, Xbox One family consoles and Xbox Series consoles  
  
## See also  

[XAppCapture Members](../xappcapture_members.md)  
[XAppCaptureTakeScreenshot](../functions/xappcapturetakescreenshot.md)  
[xappcapturescreenshotformatflag](../enums/xappcapturescreenshotformatflag.md)  