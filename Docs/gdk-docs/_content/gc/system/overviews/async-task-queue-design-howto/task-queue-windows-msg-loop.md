---
author: M-Stahl
title: Using a task queue with a Windows message loop
description: Provides an example that uses the thread pool for work but integrates completion port callbacks into a Win32 Window proc. This example also demonstrates the correct termination of a task queue when you integrate it with another threading model.
kindex:
- Async task queue design
- Using a task queue with a Windows message loop
ms.author: jgup
ms.topic: conceptual
edited: '08/11/2020'
security: public
---

# How to: Using a task queue with a Windows message loop

## Example

A task queue can be integrated with a Windows message loop. Typically, you want callbacks queued to the completion port to run on the same thread as the message loop. 

The following example uses the thread pool for work but integrates completion port callbacks into a Win32 Window proc. This example also demonstrates the correct termination of a task queue when you integrate it with another threading model.

```c++
  
// Example of using a task queue and Window proc together.  
  
XTaskQueueHandle g_queue; 
XTaskQueueRegistrationToken g_monitorToken;  
  
// Posted when there's a completion callback.  
#define WM_QUEUE_COMPLETION (WM_USER + 1)  
  
struct WorkData  
{  
    HWND hwnd;  
    WCHAR text[80];  
};  
  
void CALLBACK WorkCompletion(void* context, bool cancel)  
{  
    WorkData* data = (WorkData*)context;  
  
    if (!cancel)  
    {  
        SetWindowText(data->hwnd, data->text);  
    }  
  
    delete data;  
}  
  
void CALLBACK BackgroundWork(void* context, bool cancel)  
{  
    if (!cancel)  
    {  
        WorkData* data = new WorkData;  
        data->hwnd = (HWND)context;  
  
        if (GetTimeFormatEx(  
            LOCALE_NAME_USER_DEFAULT, 0, nullptr,  
            nullptr, data->text, 80) == 0)  
        {  
            swprintf_s(data->text, L"Error : %d", GetLastError());  
        }  
  
        // Now, take our formatted string and submit it as a completion callback. 
        XTaskQueueSubmitCallback(  
            g_queue,  
            XTaskQueuePort::Completion,  
            data,  
            WorkCompletion);  
    }  
}  
  
LRESULT CALLBACK WndProc(HWND hwnd, UINT msg, WPARAM wParam, LPARAM lParam)  
{  
    HRESULT hr;  
  
    switch (msg)  
    {  
    case WM_CREATE:  
  
        // We'll do work on the thread pool, but completion  
        // callbacks should be manual so that we can integrate them with  
        // the message loop.  
  
        hr = XTaskQueueCreate(  
            XTaskQueueDispatchMode::ThreadPool,  
            XTaskQueueDispatchMode::Manual,  
            &g_queue);  
  
        if (SUCCEEDED(hr))  
        {  
            hr = XTaskQueueRegisterMonitor(g_queue, hwnd,  
                [](void* context, XTaskQueueHandle, XTaskQueuePort port)  
            {  
                // If a new callback was submitted to the completion  
                // port, post a message so that we dispatch it in our message loop.  
                if (port == XTaskQueuePort::Completion)  
                {  
                    HWND hwnd = static_cast<HWND>(context);  
                    PostMessage(hwnd, WM_QUEUE_COMPLETION, 0, 0);  
                }  
            }, &g_monitorToken);  
        }  
  
        if (FAILED(hr))  
        {  
            PostQuitMessage(1);  
            return 0;  
        }  
        break;  
  
    case WM_LBUTTONDOWN:  
        hr = XTaskQueueSubmitCallback(  
            g_queue,  
            XTaskQueuePort::Completion,  
            hwnd,  
            BackgroundWork);  
  
        if (FAILED(hr))  
        {  
            MessageBox(hwnd, L"Failed to submit callback.", L"Error", MB_OK);  
        }  
        break;  
  
    case WM_QUEUE_COMPLETION:  
        XTaskQueueDispatch(g_queue, XTaskQueuePort::Completion, 0);  
        break;  
  
    case WM_CLOSE:  
  
        // Terminate the task queue. When this is done, destroy our window.  
        // The termination callback is queued to the completion  
        // port, so it will already be on the UI thread.  
  
        hr = XTaskQueueTerminate(g_queue, false, hwnd, [](void* context)  
        {  
            HWND hwnd = static_cast<HWND>(context);  
            DestroyWindow(hwnd);  
            XTaskQueueUnregisterMonitor(g_queue, g_monitorToken);  
            XTaskQueueCloseHandle(g_queue);  
        });  
  
        if (SUCCEEDED(hr))  
        {  
            // Prevent DefWndProc from destroying our window because  
            // the termination callback will do it.  
            return 0;  
        }  
        break;  
  
    case WM_DESTROY:  
        PostQuitMessage(0);  
        break;  
  
    }  
  
    return DefWindowProc(hwnd, msg, wParam, lParam);  
}  
  
void TestWndProc()  
{  
    WNDCLASS wndClass;  
    ZeroMemory(&wndClass, sizeof(wndClass));  
    wndClass.lpfnWndProc = WndProc;  
    wndClass.lpszClassName = L"TestClass";  
    wndClass.hInstance = GetModuleHandle(nullptr);  
    wndClass.hbrBackground = GetSysColorBrush(COLOR_WINDOW);  
  
    ATOM c = RegisterClass(&wndClass);  
  
    HWND h = CreateWindow(L"TestClass", L"Window",  
        WS_OVERLAPPEDWINDOW | WS_VISIBLE,  
        10, 10, 300, 100, nullptr, nullptr,  
        GetModuleHandle(nullptr), 0);  
  
    if (!h)  
    {  
        return;  
    }  
  
    MSG m;  
  
    while (GetMessage(&m, nullptr, 0, 0))  
    {  
        TranslateMessage(&m);  
        DispatchMessage(&m);  
    }  
}  
```

## See also

[Designing the task queue](../async-task-queue-design.md)