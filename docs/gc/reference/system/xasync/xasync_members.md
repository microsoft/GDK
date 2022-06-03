---
author: M-Stahl
title: XAsync (API contents)
description: Reference material for XAsync APIs.
kindex: XAsync
ms.author: mstahl
ms.topic: navigation
edited: 00/00/0000
security: public
applies-to: pc-gdk
---

# XAsync  
  
Reference material for XAsync APIs.  
  
  
## Functions  
  
| Function | Description |  
| --- | --- |  
| [XAsyncCancel](functions/xasynccancel.md) | Attempts to cancel an asynchronous call. |  
| [XAsyncCompletionRoutine](functions/xasynccompletionroutine.md) | Represents the completion callback for an asynchronous call. |  
| [XAsyncGetResultSize](functions/xasyncgetresultsize.md) | Returns the required size of the buffer to pass to [XAsyncGetResult](../xasyncprovider/functions/xasyncgetresult.md). |  
| [XAsyncGetStatus](functions/xasyncgetstatus.md) | Returns the status of the asynchronous call, optionally waiting for it to complete. |  
| [XAsyncRun](functions/xasyncrun.md) | Asynchronously runs the specified callback function. |  
| [XAsyncWork](functions/xasyncwork.md) | Represents the callback function invoked by [XAsyncRun](functions/xasyncrun.md). |  
  
## Structures  
  
| Structure | Description |  
| --- | --- |  
| [XAsyncBlock](structs/xasyncblock.md) | Represents the lifetime of an asynchronous call. |  
  
  
## See also  

[System API reference](../gc-reference-system-toc.md)  
[Asynchronous Programming Design Goals and Improvements](../../../system/overviews/async-whitepaper.md)  
[Asynchronous Programming Model](../../../system/overviews/async-programming-model.md)  