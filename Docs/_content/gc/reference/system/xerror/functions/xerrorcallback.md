---
author: M-Stahl
title: XErrorCallback
description: A callback that is called if an error occurs in the gaming OS or gaming runtime.
kindex: XErrorCallback
ms.author: mstahl
ms.topic: reference
edited: 02/10/2020
security: public
applies-to: pc-gdk
---

# XErrorCallback
  
A callback that is called if an error occurs in the gaming OS or gaming runtime.  
  
## Syntax
  
```cpp
bool XErrorCallback(  
         HRESULT hr,  
         const char* msg,  
         void* context  
)  
```  
  
### Parameters
  
*hr* &nbsp;&nbsp;\_In\_  
Type: HRESULT  
  
The HRESULT code associated with the error.  
  
*msg* &nbsp;&nbsp;\_In\_z\_  
Type: char*  
  
Text description of the error.  
  
*context* &nbsp;&nbsp;\_In\_  
Type: void*  
  
Context pointer for the callback.  
  
### Return value
  
Type: bool  
  
Return `true` to indicate that the system should continue on and do whatever is specified by [XErrorSetOptions](xerrorsetoptions.md); otherwise, return `false` to ignore the error.  
  
## Remarks
  
Use the [XErrorSetCallback](xerrorsetcallback.md) function to specify the `XErrorCallback` callback in your game that the system should call if an error occurs, and the `XErrorSetOptions` function to specify how the game should behave when an error occurs in the gaming OS or gaming runtime.  
  
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
[XErrorSetCallback](xerrorsetcallback.md)  
  