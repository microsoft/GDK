---
author: M-Stahl
title: XTaskQueueTerminate
description: Terminates a task queue by canceling all pending items and preventning new items from being queued.
kindex: XTaskQueueTerminate
ms.author: mstahl
ms.topic: reference
edited: 07/02/2019
quality: good
security: public
applies-to: pc-gdk
---

# XTaskQueueTerminate  

Terminates a task queue by canceling all pending items and preventning new items from being queued.  

## Syntax  
  
```cpp
HRESULT XTaskQueueTerminate(  
         XTaskQueueHandle queue,  
         bool wait,  
         void* callbackContext,  
         XTaskQueueTerminatedCallback* callback  
)  
```  
  
### Parameters  
  
*queue* &nbsp;&nbsp;\_In\_  
Type: XTaskQueueHandle  

  
The queue to terminate.  


*wait* &nbsp;&nbsp;\_In\_  
Type: bool  

  
True to wait for the termination to complete.  


*callbackContext* &nbsp;&nbsp;\_In\_opt\_  
Type: void*  

  
An optional context pointer to pass to the callback.  


*callback* &nbsp;&nbsp;\_In\_opt\_  
Type: XTaskQueueTerminatedCallback*  

  
An optional callback that will be called when the queue has terminated.  


  
### Return value
Type: HRESULT
  
HRESULT success or error code.  
  
## Remarks  
  > [!NOTE]
> This function isn't safe to call on a time-sensitive thread. For more information, see [Time-sensitive threads](../../../../system/overviews/time-sensitive-threads.md).  
  
[XTaskQueueCloseHandle](xtaskqueueclosehandle.md) simply decrements an internal reference count on the task queue object. If there are callbacks still in the queue, those callbacks hold a reference on the queue object and they may still be called. This can pose a problem for app shutdown. When an app shuts down it will need to ensure no spurious callbacks execute after cleanup. XTaskQueue provides the **XTaskQueueTerminate** API to perform a controlled termination of a queue.  
  
Terminating a task queue performs the following operations:  
1. All callbacks for both ports will be invoked with their *canceled* parameter set to true.  
2. All callbacks pending on the work port will be dispatched. Submitting new callbacks to the work port will fail with E_ABORT.  
3. All callbacks pending on the completion port will be dispatched. Submitting new callbacks to the completion port will fail with E_ABORT.  
  
After this process completes **XTaskQueueTerminate** will return if wait is true. If wait is false, termination happens asynchronously. If you supply a termination callback it will be invoked from the completion thread at the end of termination.  
  
![alert](../../../../../../resources/gamecore/images/en-us/common/note.gif) **NOTE:**  
* **XTaskQueueTerminate** does not close the queue handle. After terminating you still need to call [XTaskQueueCloseHandle](xtaskqueueclosehandle.md).  
* If you call **XTaskQueueTerminate** on a thread that is servicing queue callbacks by calling [XTaskQueueDispatch](xtaskqueuedispatch.md), do not pass true for the wait parameter or your code may deadlock.
  
The following example demonstrates how to terminate a previously created task queue.
  
![alert](../../../../../../resources/gamecore/images/en-us/common/note.gif) **NOTE:** **SubmitCallback** is a helper function that is defined in the code example for the [XTaskQueueSubmitCallback](xtaskqueuesubmitcallback.md) function.  

```cpp
void CreatingTaskQueue()
{
    XTaskQueueHandle queue;
    HRESULT hr = XTaskQueueCreate(XTaskQueueDispatchMode::ThreadPool, XTaskQueueDispatchMode::ThreadPool, &queue);
    if (FAILED(hr))
    {
        printf("Creating queue failed: 0x%x\r\n", hr);
        return;
    }

    SubmitCallbacks(queue);

    // Wait a while for the callbacks to run
    Sleep(1000);

    XTaskQueueTerminate(queue, true, nullptr, nullptr);
}
``` 

A task queue can be integrated with a UI thread. Typically, you would want callbacks queued to the completion port to run on the UI thread. This example uses the thread pool for work but integrates completion port callbacks into a Win32 Window Proc. It also demonstrates correct termination of a task queue when integrating it with another threading model. 

```cpp
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

        // Now take our formatted string and submit it as a completion callback
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
        
        // We will do work on the thread pool, but completion
        // callbacks should be manual so we can integrate them with
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
                // If a new callback was submitted to the completion port, post a message
                // so we dispatch it in our message loop
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

        // Terminate the task queue.  When done, destroy our window.  The termination callback
        // is queued to the completion port, so it will already be on the UI thread.

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
  
## Requirements  
  
**Header:** XTaskQueue.h
  
**Library:** xgameruntime.lib
  
**Supported platforms:** Windows, Xbox One family consoles and Xbox Series consoles  
  
## See also  
[XTaskQueue members](../xtaskqueue_members.md)  
[Asynchronous Programming Model](../../../../system/overviews/async-programming-model.md)  
[Async Task Queue design](../../../../system/overviews/async-task-queue-design.md) 
  
  