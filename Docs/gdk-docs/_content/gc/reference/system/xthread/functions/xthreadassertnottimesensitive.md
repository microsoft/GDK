---
author: M-Stahl
title: XThreadAssertNotTimeSensitive
description: Asserts whether the calling thread is marked as time sensitive.
kindex: XThreadAssertNotTimeSensitive
ms.author: mstahl
ms.topic: reference
edited: 05/23/2019
security: public
applies-to: pc-gdk
---

# XThreadAssertNotTimeSensitive
  
Breaks into the debugger if the calling thread is marked as time sensitive.  
  
## Syntax  
  
```cpp
void XThreadAssertNotTimeSensitive(  
)  
```  
  
### Parameters  
  
None.  
  
### Return value
  
Type: void  
  
None.
  
## Remarks
  
This function breaks into the debugger if the calling thread is marked as a *time-sensitive thread*, on which blocking or long-running operations should not be performed. Only Gaming Runtime Services (GRTS) APIs that are time-sensitive&ndash;safe can be called on a time-sensitive thread. For more information, see [Time-sensitive threads](../../../../system/overviews/time-sensitive-threads.md).
  
If this function is called from a time-sensitive thread and no debugger is attached, then the call does nothing. If a debugger is attached, it will break into the debugger and output a debug string similar to the following example.  
  
```dos
***
*** Time Sensitive Thread Violation ***
***
*** This thread is marked as Time Sensitive and is calling an API that is
*** not time-sensitive-safe.
***
*** To disable these breakpoints globally, set byte at
*** enable_time_sensitive_asserts (0x00000000) to 0.
***
```
  
Use the [XThreadSetTimeSensitive](xthreadsettimesensitive.md) function to set or clear a thread as time-sensitive. This function sets or clears a bit in thread local storage that can be queried by Gaming Runtime Services (GRTS) APIs.  
  
Use the [XThreadIsTimeSensitive](xthreadistimesensitive.md) function to test at runtime, as needed, whether the calling thread is time-sensitive.  
  
## Requirements
  
**Header:** XThread.h  
  
**Library:** xgameruntime.lib  
  
**Supported platforms:** Windows, Xbox One family consoles and Xbox Series consoles  
  
## See also
  
[XThread](../xthread_members.md)  
[Time-sensitive threads](../../../../system/overviews/time-sensitive-threads.md)  
  