---
author: M-Stahl
title: Asynchronous Programming Overview (contents)
description: Describes the Asynchronous Programming Model that's used with the Microsoft Game Development Kit (GDK).
kindex: Asynchronous Overview
ms.author: jgup
ms.topic: conceptual
edited: '08/08/2019'
security: public
---

# Asynchronous Programming Overview

This section describes the Asynchronous Programming Model that's used with the Microsoft Game Development Kit (GDK).

## In this section

[Asynchronous Programming Design Goals and Improvements](async-whitepaper.md)

Covers how the Microsoft Game Development Kit (GDK)'s new asynchronous programming model was designed and the improvements made as a result of developer feedback regarding the Xbox One ERA async model.

[Asynchronous Programming Model](async-programming-model.md)

Provides information about how the Microsoft Game Development Kit (GDK) implements a new pattern for asynchronous APIs. 
This topic describes this design pattern and offers a proposal for a library that can be used to 
implement asynchronous patterns.

[Async task queue design](async-task-queue-design.md)

Describes the Microsoft Game Development Kit (GDK) task queue that's used in conjunction with the Microsoft Game Development Kit (GDK) 
async design pattern. A task queue is an API for queuing work and completion task callbacks. 
Task queue can be configured in one of several different dispatch modes, including a manual 
dispatching mechanism that you can use when you want to carefully manage gaming workloads. 
Additionally, this section provides how-to examples for common async task queue scenarios.

[XTaskQueue Library Overview](async-libraries/async-library-xtaskqueue.md)

Describes the purpose and usage of the XTaskQueue library and has example topics to walk through the basic usage.

[XAsync Library Overview](async-libraries/async-library-xasync.md)

Describes the purpose and usage of the XAsync library and has example topics to walk through the basic usage.

[XAsyncProvider Library Overview](async-libraries/async-library-xasyncprovider.md)

Describes the purpose and usage of the XAsyncProvider library and has example topics to walk through the basic usage.

[Generic Async Task Wrapper](async-task-function-example.md)

Provides an implementation of a generic async task wrapper function that can be used to simplify the process of running generic user tasks asynchronously using the Microsoft Game Development Kit (GDK) asynchronous programming model.

## See also

[System](../gc-system-toc.md)