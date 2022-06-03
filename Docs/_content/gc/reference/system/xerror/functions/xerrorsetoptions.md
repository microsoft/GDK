---
author: M-Stahl
title: XErrorSetOptions
description: Specifies the desired behavior when an error occurs in the gaming OS or gaming runtime.
kindex: XErrorSetOptions
ms.author: mstahl
ms.topic: reference
edited: 02/10/2020
security: public
applies-to: pc-gdk
---

# XErrorSetOptions
  
Specifies the desired behavior when an error occurs in the gaming OS or gaming runtime.  
  
## Syntax
  
```cpp
void XErrorSetOptions(  
         XErrorOptions optionsDebuggerPresent,  
         XErrorOptions optionsDebuggerNotPresent  
)  
```  
  
### Parameters  
  
*optionsDebuggerPresent* &nbsp;&nbsp;\_In\_  
Type: [XErrorOptions](../enums/xerroroptions.md)  
  
Specifies the desired behavior when the debugger is attached.  
  
*optionsDebuggerNotPresent* &nbsp;&nbsp;\_In\_  
Type: [XErrorOptions](../enums/xerroroptions.md)  
  
Specifies the desired behavior when the debugger is not attached.  
  
### Return value
  
Type: void  
  
## Remarks
  > [!NOTE]
> This function isn't safe to call on a time-sensitive thread. For more information, see [Time-sensitive threads](../../../../system/overviews/time-sensitive-threads.md).  
  
Use this function to specify how the game should react when an error occurs in the gaming OS or gaming runtime. By default, the game does nothing if a debugger isn't attached and outputs debug messages to the debugger if it's attached.  
  
If a debugger is attached and *optionsDebuggerPresent* is set to [XErrorOptions::DebugBreakOnError], the system breaks into the debugger and outputs debug messages. You can temporarily disable this behavior through the watch window by setting the value of the global variable, `XErrorDisableDebugBreak`, to `true`.  
  
The following example illustrates how to set error options, define a custom error callback, and set the custom callback to receive error notifications by the system.  
  
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
[XErrorOptions](../enums/xerroroptions.md)  
  