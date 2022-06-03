---
author: M-Stahl
title: XErrorOptions
description: Describes how the game should behave when an error occurs in the gaming OS or gaming runtime.
kindex: XErrorOptions
ms.author: mstahl
ms.topic: reference
edited: 03/11/2020
security: public
applies-to: pc-gdk
---

# XErrorOptions
  
Describes how the game should behave when an error occurs in the gaming OS or gaming runtime.  
  
## Syntax
  
```cpp
enum class XErrorOptions  : uint32_t  
{  
    None = 0x00,  
    OutputDebugStringOnError = 0x01,  
    DebugBreakOnError = 0x02,  
    FailFastOnError = 0x04,  
}  
```  
  
## Constants
  
| Constant | Description |  
| -------- | ----------- |  
| None | On error, do nothing.<br/>This is the default option if a debugger is not present. |  
| OutputDebugStringOnError | On error, output debug messages.<br/>This is the default option if a debugger is present. |  
| DebugBreakOnError | On error, break into the debugger and output debug messages. |  
| FailFastOnError | On error, request a [fast fail](/cpp/intrinsics/fastfail?view=vs-2019) to immediately terminate the calling process. |  
  
## Remarks
  
**XErrorOptions** is used by the [XErrorSetOptions](../functions/xerrorsetoptions.md) function to describe how the game should behave when an error occurs, depending on whether a debugger is present. If `OutputDebugStringOnError` or `DebugBreakOnError` is specified and a debugger is present, a debug string containing the HRESULT error code, current thread ID, and error message is sent to the debugger for display. If `DebugBreakOnError` is specified, the game breaks into the debugger.  
  
## Requirements
  
**Header:** XError.h  
  
**Supported platforms:** Windows, Xbox One family consoles and Xbox Series consoles  
  
## See also
  
[XError members](../xerror_members.md)  
[XErrorSetOptions](../functions/xerrorsetoptions.md)  
  