---
author: M-Stahl
title: XErrorSetCallback
description: Specifies the callback that is called when an error occurs in the gaming OS or gaming runtime.
kindex: XErrorSetCallback
ms.author: mstahl
ms.topic: reference
edited: 07/02/2019
security: public
applies-to: pc-gdk
---

# XErrorSetCallback  
  
Specifies the callback that is called when an error occurs in the gaming OS or gaming runtime.  
  
## Syntax
  
```cpp
void XErrorSetCallback(  
         XErrorCallback* callback,  
         void* context  
)  
```  
  
### Parameters
  
*callback* &nbsp;&nbsp;\_In\_  
Type: XErrorCallback*  
  
Pointer to the game-defined callback to call. Passing in `nullptr` clears the callback.  
  
*context* &nbsp;&nbsp;\_In\_  
Type: void*  
  
Context pointer for the callback.  
  
### Return value
  
Type: void  
  
## Remarks  
  > [!NOTE]
> This function isn't safe to call on a time-sensitive thread. For more information, see [Time-sensitive threads](../../../../system/overviews/time-sensitive-threads.md).  
  
Use this function to specify the [XErrorCallback](xerrorcallback.md) callback in your game that the system should call if an error occurs, and the [XErrorSetOptions](xerrorsetoptions.md) function to specify how the game should behave when an error occurs in the gaming OS or gaming runtime.  
  
The following example illustrates how to set error options, define a custom error callback, and set the custom error callback to receive error notifications by the system.  
  
```cpp
bool CustomGameXErrorCallback(_In_ HRESULT hr, _In_ const char* msg, _In_ void* context)  
{  
   // Capture the error to the game's custom logger  
   CustomGameLogger* logger = (CustomGameLogger*)context;  
   logger->ReportGameRuntimeIssue(hr, msg);  
  
   // Don't ignore the error. For example, continue on and do whatever  
   // is specified by XErrorSetOptions().  
   return true;  
}  
  
void SomeGameFunction()  
{  
   // Previously initialize the game's custom logger  
   // CustomGameLogger* m_logger = InitializeLogger();  
   // ...  
  
   // Setup how you want to handle XErrors  
   XErrorSetOptions(DebugBreakOnError, FailFastOnError, m_logger);  
   XErrorSetCallback(CustomGameXErrorCallback);  
}  
```
  
## Requirements
  
**Header:** XError.h  
  
**Library:** xgameruntime.lib  
  
**Supported platforms:** Windows, Xbox One family consoles and Xbox Series consoles  
  
## See also
  
[XError members](../xerror_members.md)  
[XErrorCallback](xerrorcallback.md)  
  