---
author: M-Stahl
title: XThreadIsTimeSensitive
description: Indicates whether the calling thread is marked as time-sensitive.
kindex: XThreadIsTimeSensitive
ms.author: mstahl
ms.topic: reference
edited: 05/23/2019
security: public
applies-to: pc-gdk
---

# XThreadIsTimeSensitive
  
Indicates whether the calling thread is marked as time-sensitive.  
  
## Syntax
  
```cpp
bool XThreadIsTimeSensitive(  
)  
```  
  
### Parameters
  
None.
  
### Return value
  
Type: bool
  
Returns `true` if the calling thread is marked as time-sensitive; otherwise, `false`.  
  
## Remarks  
  
This function indicates if the calling thread is set as a *time-sensitive thread*, on which blocking or long-running operations should not be performed. Only Gaming Runtime Services (GRTS) APIs that are time-sensitive&ndash;safe can be called on a time-sensitive thread. For more information, see [Time-sensitive threads](../../../../system/overviews/time-sensitive-threads.md).
  
Use the [XThreadSetTimeSensitive](xthreadsettimesensitive.md) function to set or clear a thread as time-sensitive. This function sets or clears a bit in thread local storage that can be queried by Gaming Runtime Services (GRTS) APIs.  
  
Use the [XThreadAssertNotTimeSensitive](xthreadassertnottimesensitive.md) function at the beginning of methods that aren't time-sensitive, to break into the debugger if the method is called on a thread that's time-sensitive.  
  
## Requirements
  
**Header:** XThread.h  
  
**Library:** xgameruntime.lib  
  
**Supported platforms:** Windows, Xbox One family consoles and Xbox Series consoles  
  
## See also
  
[XThread](../xthread_members.md)  
[Time-sensitive threads](../../../../system/overviews/time-sensitive-threads.md)  
  