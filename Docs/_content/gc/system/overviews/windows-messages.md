---
author: M-Stahl
title: Windows and messages
description: Describes how the GDK uses the Win32 programming style, including windows and messages. Although much of this is identical to what you might encounter on Windows PC, this topic describes what's supported on console and the differences from Windows
  PC.
kindex: Windows messages
ms.author: jgup
ms.topic: conceptual
edited: '08/05/2020'
security: public
---

# Windows and messages

The Microsoft Game Development Kit (GDK) uses the Win32 programming style, including windows
and messages. Although much of this is identical to what you might
encounter on Windows PC, this topic describes what's supported on
console and the differences from Windows PC.

## Main window creation

Every game must have a `WinMain` as its entry point function. Within
`WinMain`, the game should do the following.

1. Register a window class.
1. Specify a window procedure.
1. Create a window.
1. Pump the message loop.

On console, the window just acts a target for messages.

## Windows messages supported on console

On console, there's support for basic input from the keyboard and mouse as well as window lifetime. The following system messages are supported.  

- `WM_ACTIVATE`
- `WM_ACTIVATEAPP`
- `WM_CHAR`
- `WM_CREATE`
- `WM_DESTROY`
- `WM_DPICHANGED`
- `WM_KEYDOWN`
- `WM_KEYUP`
- `WM_KILLFOCUS`
- `WM_LBUTTONDOWN`
- `WM_LBUTTONUP`
- `WM_MBUTTONDOWN`
- `WM_MBUTTONUP`
- `WM_MOUSEMOVE`
- `WM_MOUSEWHEEL`
- `WM_QUIT`
- `WM_RBUTTONDOWN`
- `WM_RBUTTONUP`
- `WM_SETFOCUS`
- `WM_SHOWWINDOW`
- `WM_SIZE`
- `WM_SYSKEYDOWN`
- `WM_SYSKEYUP`
- `WM_THEMECHANGED`
- `WM_TIMER`
- `WM_USER`
- `WM_XBUTTONDOWN`
- `WM_XBUTTONUP`

## WinUser functions supported on console

Console supports only a subset of what might be expected from
*winuser.h*. Console supports only the following windows functions.
  
- `AdjustWindowRect`
- `AdjustWindowRectEx`
- `CallWindowProc`
- `CreateWindowEx`
- `DefWindowProc`
- `DestroyCursor`
- `DestroyWindow`
- `DispatchMessage`
- `GetClientRect`
- `GetCursorInfo`
- `GetCursorPos`
- `GetMessage`
- `GetWindowLong`
- `GetWindowLongPtr`
- `KillTimer`
- `LoadCursor`
- `MoveWindow`
- `PeekMessage`
- `PostMessage`
- `PostQuitMessage`
- `PostThreadMessage`
- `RegisterClass`
- `RegisterClassEx`
- `SendMessage`
- `SetCursor`
- `SetTimer`
- `SetWindowLong`
- `SetWindowLongPtr`
- `SetWindowPos`
- `ShowCursor`
- `ShowWindow`
- `TranslateMessage`
- `UnregisterClass`