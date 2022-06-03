---
author: M-Stahl
title: XGameRuntimeInitialize
description: Initializes the Gaming Runtime.
kindex: XGameRuntimeInitialize
ms.author: v-denken
ms.topic: reference
edited: 06/10/2019
quality: good
security: public
applies-to: pc-gdk
---

# XGameRuntimeInitialize  

Initializes the Gaming Runtime.  

## Syntax  
  
```cpp
HRESULT XGameRuntimeInitialize(  
)  
```  
  
### Parameters  
None.
  
### Return value
Type: [HRESULT](/openspecs/windows_protocols/ms-erref/0642cb2f-2075-4469-918c-4441e69c548a)  
  
Returns **S_OK** if successful; otherwise, returns an error code. For a list of error codes, see [Error Codes](../../../errorcodes.md). If the function fails because the Gaming Runtime library (xgameruntime.dll) wasn't found, the return value is set to **E_GAMERUNTIME_DLL_NOT_FOUND**.  
  
## Remarks
  
To use the Gaming Runtime features in your game, first initialize the Gaming Runtime by invoking the **XGameRuntimeInitialize** function. Invoke the **XGameRuntimeInitialize** function as early as possible, typically within the entry-point function for your game. Similarly, uninitialize the Gaming Runtime as late as possible but before your game exits, by invoking the [XGameRuntimeUninitialize](xgameruntimeuninitialize.md) function.
  
The following example demonstrates how to use the **XGameRuntimeInitialize** and [XGameRuntimeUninitialize](xgameruntimeuninitialize.md) functions within the entry-point function of a game that is based on the **Direct3D 12 Desktop Game** template in Visual Studio. The **XGameRuntimeInitialize** function is invoked before the **Game** object is instantiated and registered, and the **XGameRuntimeUninitialize** function is invoked after the **Game** object is reset but before the entry-point function returns.
  
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
[XGameRuntimeUninitialize](xgameruntimeuninitialize.md)  
[XGameRuntimeInit](../xgameruntimeinit_members.md)  
[Developing new titles using Gaming Runtime](../../../../get-started-with-pc-dev/overviews/gr-developing-new-titles-on-gamecore.md)  
  