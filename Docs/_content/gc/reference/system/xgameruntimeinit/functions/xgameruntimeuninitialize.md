---
author: M-Stahl
title: XGameRuntimeUninitialize
description: Uninitializes the Gaming Runtime.
kindex: XGameRuntimeUninitialize
ms.author: v-denken
ms.topic: reference
edited: 06/10/2019
quality: good
security: public
applies-to: pc-gdk
---

# XGameRuntimeUninitialize  

Uninitializes the Gaming Runtime.  

## Syntax  
  
```cpp
void XGameRuntimeUninitialize(  
)  
```  
  
### Parameters  
None.
  
### Return value
Type: void
  
## Remarks
  
To use the Gaming Runtime features in your game, first initialize the Gaming Runtime by invoking the [XGameRuntimeInitialize](xgameruntimeinitialize.md) function. When your game is done using the Gaming Runtime and is ready to exit, uninitialize the Gaming Runtime by invoking the **XGameRuntimeUninitialize** function. Invoke the **XGameRuntimeUninitialize** function as late as possible but before your game exits, typically within the entry-point function for your game.  
  
The following example demonstrates how to use the [XGameRuntimeInitialize](xgameruntimeinitialize.md) and **XGameRuntimeUninitialize** functions within the entry-point function of a game that is based on the **Direct3D 12 Desktop Game** template in Visual Studio. The **XGameRuntimeInitialize** function is invoked before the **Game** object is instantiated and registered, and the **XGameRuntimeUninitialize** function is invoked after the **Game** object is  reset but before the entry-point function returns.  
  
```cpp
// Entry point
int WINAPI wWinMain(_In_ HINSTANCE hInstance, _In_opt_ HINSTANCE hPrevInstance, _In_ LPWSTR lpCmdLine, _In_ int nCmdShow)
{
    UNREFERENCED_PARAMETER(hPrevInstance);
    UNREFERENCED_PARAMETER(lpCmdLine);

    // Initialize the Gaming Runtime before
    // performing any other activity.
    if (FAILED(XGameRuntimeInitialize()))
        return 1;

    if (!XMVerifyCPUSupport())
        return 1;

    g_game = std::make_unique<Game>();

    // Register class and create window
    {
        // Code omitted for brevity.
        ...
    }

    // Main message loop
    MSG msg = {};
    while (WM_QUIT != msg.message)
    {
        // Code omitted for brevity.
        ...
    }

    g_game.reset();

    // Uninitialize the Gaming Runtime after
    // all other activity has been completed.
    XGameRuntimeUninitialize();

    return (int) msg.wParam;
}
```

  
## Requirements  
  
**Header:** XGameRuntimeInit.h
  
**Library:** xgameruntime.lib
  
**Supported platforms:** Windows, Xbox One family consoles and Xbox Series consoles  
  
## See also  
[XGameRuntimeInitialize](xgameruntimeinitialize.md)
[XGameRuntimeInit](../xgameruntimeinit_members.md)
[Developing new titles using Gaming Runtime](../../../../get-started-with-pc-dev/overviews/gr-developing-new-titles-on-gamecore.md)  
  