---
author: M-Stahl
title: Configuring your title to run as a single instance
description: Describes how to configure your title to run as a single instance.
kindex:
- single instance
- mutex
- single-instance
ms.author: zhooper
ms.topic: conceptual
edited: 03/19/2020
security: public
---

# Configuring your title to run as a single instance

This topic provides our recommendations to help you ensure that your PC title is only allowed to run a single instance at a time. By default, your title is allowed to run multiple instances at the same time. This can be easy to do by accident and can result in a suboptimal experience for the end user. We recommend that you check for the existence of a running instance and stop further instances from executing.

The following example code provides details about how to create a mutex object to limit your title to a single instance and how to bring the running instance window to the foreground when a second instance attempts to execute.

```c++
UINT g_uShowMessage;

LRESULT CALLBACK WndProc(HWND, UINT, WPARAM, LPARAM);

// Returns a window message that should be used to bring the game to the front.
UINT EnsureSingleInstance(HWND hwnd, LPCWSTR name)
{
    UINT msg = RegisterWindowMessageW(name);

    HANDLE hEvent = CreateMutexW(NULL, TRUE, name);
    if (hEvent != NULL && GetLastError() == 0)
    {
        // First instance.
        return msg;
    }

    CloseHandle(hEvent);
    if (GetLastError() == ERROR_ALREADY_EXISTS)
    {
        PostMessage(HWND_BROADCAST, msg, 0, 0);
        ExitProcess(0);
    }

    return msg;
}
```

The following code example should be after the create window call to ensure that the windows handle is valid. When setting your mutex value, ensure that the value is hard to guess and unique to your title. A malicious user can create a mutex name before you create it and prevent your title from starting. We recommend that you create a randomly generated GUID and store the mutex name so that it can only be obtained by an authorized user.


```c++
        // The argument here should be a hard-to-guess, unique-to-your-title value.
        // IMPORTANT: Don't ship with this GUID. Replace it with your own value (for example, use Visual Studio and select Tools, Create GUID).
        g_uShowMessage = EnsureSingleInstance(hwnd, L"A1798E71-DF69-490E-8FD8-F6D82A75144C");
```

Optionally, the following code example, when added to your window message function, allows the running instance window to be brought to the foreground (including windows that are maximized from a minimized state) when a second instance of your title's executable is run.

```c++
    if (g_uShowMessage !=0 && message == g_uShowMessage)
    {
        ShowWindow(hWnd, SW_NORMAL);
        SetForegroundWindow(hWnd);
        return 0;
    }
```
 

## Referenced Windows APIs

For more information about the Windows API functions that were referenced in the previous code examples, see the following:

* [RegisterWindowMessageW](/windows/win32/api/winuser/nf-winuser-registerwindowmessagew)  
* [CreateMutexW](/windows/win32/api/synchapi/nf-synchapi-createmutexw)  
* [GetLastError](/windows/win32/api/errhandlingapi/nf-errhandlingapi-getlasterror)
* [ShowWindow](/windows/win32/api/winuser/nf-winuser-showwindow)  
* [SetForegroundWindow](/windows/win32/api/winuser/nf-winuser-setforegroundwindow)  