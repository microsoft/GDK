---
title: XSAPI C overview
description: XSAPI C API for the Xbox service.
kindex:
- XSAPI C overview
ms.topic: conceptual
ms.localizationpriority: medium
author: joannaleecy
ms.author: joanlee
edited: 00/00/0000
security: public
applies-to: pc-gdk
---

# XSAPI C overview

In June 2018, a C API layer was added to XSAPI. The C API layer solves some issues that occurred with the C++ and WinRT API layers.

> **Note:**  
> The C APIs currently only work with titles that use the GDK and XDK. They do not support UWP games at this time.

## Benefits of the C API for XSAPI

- Allows titles to control the memory allocations when calling XSAPI.
- Allows titles to gain full control of thread handling when calling XSAPI.
- Uses a new HTTP library, libHttpClient, designed for game developers.

You can use the C APIs alongside C++ XSAPI, but you will not gain the previously listed benefits with the C++ APIs.

### Managing memory allocations

With the C API, you can now specify a function callback that XSAPI will call whenever it tries to allocate memory.
If you do not specify function callbacks, XSAPI will use standard memory allocation routines.

To manually specify your memory routines, you can do the following:

- At the start of the game:
  - Call `XblMemSetFunctions(memAllocFunc, memFreeFunc)` to specify the allocation callbacks for assigning and releasing memory.
  - Call `XblInitialize()` to initialize the library instance.
- While the game is running:
  - Calling any of the new C APIs in XSAPI that allocate or free memory will cause XSAPI to call the specified memory handling callbacks.
- When the game exits:
  - Call `XblCleanup()` to reclaim all resources associated with the XSAPI library.
  - Clean up your game's custom memory manager.

### Managing asynchronous threads

The C API introduces a new asynchronous thread calling pattern that allows developers full control over the threading model.
For more information, see [Calling pattern for XSAPI C layer async calls](live-flatc-async-patterns.md).

## Migrating code to use C XSAPI

The XSAPI C APIs can be used alongside the XSAPI C++ APIs in a project, so we recommend that you migrate one feature at a time.

The C APIs and C++ APIs are really just thin wrappers around a common core, just with different entry points, so the functionality should be unchanged.

However, only the C APIs can take advantage of the custom memory and thread management features.

> **Important:**  
> You cannot mix XSAPI WinRT APIs with the C APIs.

## Useful resources

- [Samples using the XSAPI C APIs](https://github.com/Microsoft/xbox-live-samples)
- [libHttpClient GitHub repo](https://github.com/Microsoft/libHttpClient)
- To view the C APIs, see the XSAPI C header files. It is in the Xbox services SDK which is part of the GDK.

## See also

[XSAPI C reference](../../../reference/live/xsapi-c/atoc-xsapi-c.md)

[REST API reference](../../../reference/live/rest/atoc-xboxlivews-reference.md)

[HttpClient reference](../../../reference/live/httpclient/atoc-httpclient.md)
