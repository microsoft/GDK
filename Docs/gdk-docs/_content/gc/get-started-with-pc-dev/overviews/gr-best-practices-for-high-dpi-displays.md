---
author: M-Stahl
title: Supporting high DPI displays on PC
description: Describes supporting high DPI displays on PC.
kindex: Supporting High DPI Displays on PC
ms.author: nivece
ms.topic: conceptual
edited: 03/20/2020
security: public
---

# Supporting high DPI displays on PC

To help Windows 10 applications and shell elements appear with consistent sizes on monitors of varying pixel densities, Windows has built-in scaling settings. For your title to render and handle mouse input properly when these scaling settings have been adjusted, set the default DPI awareness. Failure to do this can cause your title to display incorrectly, rendering it unusable for users with high DPI displays.

## Enabling high DPI awareness

#### To ensure that your title supports high DPI displays

1. Check the assembly manifest XML of your game executable. This could be titleName.exe, a manifest file alongside titleName.exe, or an embedded manifest in the game executable. You can extract an embedded manifest from your game executable via the command line by using [sigcheck](/sysinternals/downloads/sigcheck) (shown as follows).
    ```cpp
    sigcheck -m titleName.exe
    ```
2. If you see only the following `<dpiAware>` tag in the manifest XML, high DPI displays aren't supported.
    ```cpp
    <windowsSettings>
        <dpiAware>
            true
        </dpiAware>
    </windowsSettings>
    ```
3. The embedded manifest takes precedence over the loose manifest. If that exists, go to step 4. If there's no embedded manifest, create a titleName.exe.manifest file with the following contents.
    ```cpp
    <?xml version="1.0" encoding="UTF-8" standlone="yes"?>
    <assembly xmlns="urn:schemas-microsoft-com:asm.v1" manifestVersion="1.0">
    <application xmlns="urn:schemas-microsoft-com:asm.v3">
        <windowsSettings>
            <dpiAwareness xmlns="https://schemas.microsoft.com/SMT/2016/WindowsSettings">
                PerMonitorV2
            </dpiAwareness>
        </windowsSettings>
    </application>
    </assembly>
    ```
4. If there's an embedded manifest, locate it via the command line by using the following [Mt.exe](/windows/win32/sbscs/mt-exe) tool from the Windows SDK.
    ```cpp
    mt -inputresource:<titleExeFilename> -out:<manifestOutputFilename>
    ```
5. Edit the embedded manifest to add the new `<dpiAwareness>` tag (shown as follows).
    ```cpp
    <windowsSettings>
        <dpiAwareness xmlns="https://schemas.microsoft.com/SMT/2016/WindowsSettings">
            PerMonitorV2
        </dpiAwareness>
    </windowsSettings>
    ```
6. Update the embedded manifest via the command line by using the following [Mt.exe](/windows/win32/sbscs/mt-exe) tool from the Windows SDK.
    ```cpp
    mt -updateresource:<titleExeFilename> -manifest <manifestFilename>
    ```

Your title now supports high DPI displays.

## Validating high DPI awareness

#### To confirm that your title supports high DPI displays

1. Using a PC with a high DPI display, such as Surface Studio 2, go to **Settings** > **Display** and set your scaling to **150 percent**.
2. Launch your title.
3. Examine the screens where a cursor is present, and confirm that the title displays as expected. For example, a full-screen title should take up the entire screen.
4. Move the cursor across the screen, and ensure that it can reach the entire surface area of the title window.
5. Hover over interactive UI elements (like buttons), and confirm that visual states and interaction work as expected. For example, a button should change visual states when the cursor is directly over it, not adjacent to it.

## Notes

- Disabling registry virtualization can be suggested as a solution to high DPI awareness issues, but we don't recommend it.
- [Visual Studio](../../tools-pc/visualstudio/gr-visualstudio-toc.md) has a DPI Awareness option in Configuration Properties, but this uses the older `<dpiAware>` tag, which doesn't work for MSIXVC-packaged titles.

## See also

[Setting the default DPI awareness for a process](/previous-versions/windows/desktop/legacy/mt846517(v=vs.85))