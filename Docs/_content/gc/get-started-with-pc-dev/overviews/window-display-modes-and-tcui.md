---
author: M-Stahl
title: Window display modes and title-callable UI dialogs
description: Describes the special considerations that are needed for dealing with window display modes on PC and showing title-callable UI (TCUI) dialogs.
kindex:
- Window Display Modes and TCUI
- Unity, considerations with TCUI dialogs
ms.author: hbrodie
ms.topic: conceptual
edited: 03/19/2020
security: public
---

# Window display modes and title-callable UI dialogs  

This topic covers the special considerations that are needed for dealing with window 
display modes on PC and successfully showing title-callable UI (TCUI) dialogs. 

It is recommended for games to ensure that the game window is visible before invoking any
APIs that may show TCUI.  Further, the game window should use Full Screen Windowed/Borderless or 
Windowed/Non-Maximized mode rather than Full Screen Exclusive.

Games should run at the native display resolution rather than a custom 
app/game resolution.  Some technologies (such as DirectX 9) do not gracefully handle 
the change in resolution when the TCUI dialog is shown.

Beyond this, some middleware engines and wrappers, as well as DirectX 9, will
automatically minimize a full-screen game window when foreground focus is lost
to the TCUI dialog being shown. To work around this undesirable behavior for users, 
window-minimizing is explicitly denied when showing TCUI dialogs. For more details, 
see the Preventing game window minimization section later in this topic.

For game titles that use non-DirectX graphic technologies, our recommended best practices vary, shown as follows.

If the game title uses OpenGL or Vulkan, a "windowed" mode that shows a desktop-owned window border 
is needed to allow the TCUI dialogs to render over the game. This is because, based on 
the video card driver implementation, a game running in any kind of full-screen mode will potentially 
be rendered without Desktop Window Manager involvement. This prevents the TCUI dialog from showing 
over the game window.

For other graphics technologies, please contact your Xbox support representative.

## Preventing game window minimization  

Some middleware engines and layering systems (for example, Unity and Simple DirectMedia Layer (SDL)) automatically 
minimize the game's full-screen window when foreground focus is lost to the TCUI dialog.

To prevent this behavior, the Gaming Runtime uses 
[CBTProc](/previous-versions/windows/desktop/legacy/ms644977(v=vs.85))
to deny any requests to minimize the game window. The Gaming Runtime only applies 
this pattern when it detects that overlays can render over the full-screen DirectX game 
window and the TCUI dialog is visible.

In addition, the Gaming Runtime intercepts and modifies any style-change window messages prior to 
showing TCUI dialogs to prevent the game window from rendering a border or a title bar. Any styles in the 
[WS_OVERLAPPEDWINDOW](/windows/win32/winmsg/window-styles) group 
aren't applied on a style change unless they previously existed in the old style. This modification is only 
implemented during the lifetime of the TCUI dialog.

## DirectX 9 considerations with TCUI dialogs

Although DirectX 9 games are prevented from minimizing as described in 
Preventing game window minimization (earlier in this topic), they still lose foreground focus when a TCUI dialog is displayed. Games should 
be prepared to handle this focus loss gracefully in the exact same way that they would respond to a 
user who is minimizing the game window while running full screen.

## Unity considerations with TCUI dialogs

It is recommended that "Application.runInBackground" is set to true for any game that expects to display a TCUI dialog.