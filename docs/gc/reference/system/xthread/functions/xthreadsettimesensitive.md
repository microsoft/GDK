---
author: M-Stahl
title: XThreadSetTimeSensitive
description: Sets or clears a thread as time-sensitive.
kindex: XThreadSetTimeSensitive
ms.author: mstahl
ms.topic: reference
edited: 05/23/2019
quality: good
security: public
applies-to: pc-gdk
---

# XThreadSetTimeSensitive  
  
Sets or clears a thread as time-sensitive.  
  
## Syntax
  
```cpp
HRESULT XThreadSetTimeSensitive(  
         bool isTimeSensitiveThread  
)  
```  
  
### Parameters
  
*isTimeSensitiveThread* &nbsp;&nbsp;\_In\_  
Type: bool  
  
Set to `true` to set the calling thread as time-sensitive; otherwise, `false`.  
  
### Return value
  
Type: [HRESULT](/openspecs/windows_protocols/ms-erref/0642cb2f-2075-4469-918c-4441e69c548a)  
  
Returns `S_OK` if successful; otherwise, returns an error code. For a list of error codes, see [Error Codes](../../../errorcodes.md).  
  
## Remarks
  
This function sets or clears the calling thread as a *time-sensitive thread*, on which blocking or long-running operations should not be performed. This function sets or clears a bit in thread local storage that can be queried by Gaming Runtime Services (GRTS) APIs. Only GRTS APIs that are time-sensitive&ndash;safe can be called on a time-sensitive thread. For more information, see [Time-sensitive threads](../../../../system/overviews/time-sensitive-threads.md).  
  
Use the [XThreadAssertNotTimeSensitive](xthreadassertnottimesensitive.md) function at the beginning of methods that aren't time-sensitive, to break into the debugger if the method is called on a thread that's time-sensitive.  
  
Use the [XThreadIsTimeSensitive](xthreadistimesensitive.md) function to test at runtime, as needed, whether the calling thread is time-sensitive.  
  
## Requirements  
  
**Header:** XThread.h  
  
**Library:** xgameruntime.lib  
  
**Supported platforms:** Windows, Xbox One family consoles and Xbox Series consoles  
  
## See also

[XThread](../xthread_members.md)  
[Time sensitive threads](../../../../system/overviews/time-sensitive-threads.md)  
  