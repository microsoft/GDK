---
author: M-Stahl
title: GameInput work queues
description: Provides details about internal asynchronous event handlers in `GameInput` and how to manually schedule them.
kindex: GameInput work queues
ms.author: chrism
ms.topic: conceptual
edited: 07/29/2020
security: public
---

# GameInput work queues


<a id="introductionSection"></a>

The `GameInput` API occasionally needs to handle internal asynchronous events, such as input devices being connected or disconnected. These events occur infrequently. However, applications can also register callbacks that might need to be dispatched more often. By default, `GameInput` creates a worker thread that runs at a slightly elevated priority (`THREAD_PRIORITY_ABOVE_NORMAL`) to service these events.

Applications that want more control over when this work takes place and on which thread/processor can manually control processing these events via the [IGameInputDispatcher](../../reference/input/gameinput/interfaces/IGameInputDispatcher/igameinputdispatcher.md) interface. This interface is obtained by calling the [CreateDispatcher](../../reference/input/gameinput/interfaces/igameinput/methods/igameinput_createdispatcher.md) method on the [IGameInput](../../reference/input/gameinput/interfaces/igameinput/igameinput.md) interface. This interface exposes two methods that you can use to manually dispatch work from the `GameInput` internal work queues. Use the [Dispatch](../../reference/input/gameinput/interfaces/IGameInputDispatcher/methods/igameinputdispatcher_dispatch.md) method to dispatch pending work (if any exists) from the `GameInput` work queues. Applications can call this method periodically. Alternatively, they can wait on the handle that's returned from the dispatcher's [OpenWaitHandle](../../reference/input/gameinput/interfaces/IGameInputDispatcher/methods/igameinputdispatcher_openwaithandle.md) method to detect when work has been queued that needs to be dispatched.

While the application holds a reference to the dispatcher interface, it remains in control of dispatching the work. After all the references to the dispatcher interface have been released, `GameInput` then returns to using an internal worker thread to service the events.


<a id="seeAlsoSection"></a>

## See also

[GameInput fundamentals](../overviews/input-fundamentals.md)

[Advanced GameInput topics](input-advanced-topics.md)

[Input API reference](../../reference/input/gc-reference-input-toc.md)

