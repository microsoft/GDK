---
author: M-Stahl
title: XAsyncProvider (API contents)
description: Reference material for XAsyncProvider APIs.
kindex: XAsyncProvider
ms.author: mstahl
ms.topic: navigation
edited: 00/00/0000
security: public
applies-to: pc-gdk
---

# XAsyncProvider  
  
Reference material for XAsyncProvider APIs.  
  
  
## Functions  
  
| Function | Description |  
| --- | --- |  
| [XAsyncBegin](functions/xasyncbegin.md) | Initializes an [XAsyncBlock](../xasync/structs/xasyncblock.md) and begins asynchronous work by an asynchronous provider. |  
| [XAsyncComplete](functions/xasynccomplete.md) | Indicates that the callback function an asynchronous provider has completed work and the results can be returned. |  
| [XAsyncGetResult](functions/xasyncgetresult.md) | Returns the results of an asynchronous call from an asynchronous provider. |  
| [XAsyncProvider](functions/xasyncprovider.md) | A callback function that implements the async call. |  
| [XAsyncSchedule](functions/xasyncschedule.md) | Schedules work for the callback function of an asynchronous provider. |  
  
## Structures  
  
| Structure | Description |  
| --- | --- |  
| [XAsyncProviderData](structs/xasyncproviderdata.md) | Represents data passed to the callback function of an asynchronous provider. |  
  
## Enumerations  
  
| Enumeration | Description |  
| --- | --- |  
| [XAsyncOp](enums/xasyncop.md) | Represents an operation code for an asynchronous provider. |  
  
  
## See also  

[System API reference](../gc-reference-system-toc.md)  
[Asynchronous Programming Design Goals and Improvements](../../../system/overviews/async-whitepaper.md)  
[Asynchronous Programming Model](../../../system/overviews/async-programming-model.md)  