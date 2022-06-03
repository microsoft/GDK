---
title: Xbox services API overview
description: Xbox services API overview.
kindex: XSAPI overview
ms.topic: article
author: joannaleecy
ms.author: joanlee
ms.localizationpriority: medium
edited: 00/00/0000
security: public
applies-to: pc-gdk
---

# Xbox services API overview

There are two ways to get information from Xbox services.

1. Use a client-side API called **Xbox services API** or XSAPI. It is also known as Xbox Live API.
2. Call the **Xbox services REST endpoints** directly. It is also known as Xbox Live REST endpoints.

### Advantages using XSAPI

The advantages using the Xbox services API (XSAPI) include:

- Details of authentication, encoding, and HTTP sending and receiving are taken care of for you.
- Arguments to, and data returned from, the wrapper API is handled in native data types. So you don't need to perform JSON encoding and decoding.
- Calling web services directly involves multiple asynchronous steps, which the wrapper API encapsulates. This makes title code easier to read and write.
- Some functionality, such as writing game events, is only available in XSAPI.

### Advantages using Xbox services REST endpoints

The advantages using the Xbox services REST endpoints directly include:

- The ability to call Xbox services endpoints from a web service
- The ability to call endpoints which aren't included in XSAPI. XSAPI only includes APIs that we believe games will use, so if there's anything missing let us know via the forums.
- Some functionality available via the REST endpoints may not have a corresponding XSAPI wrapper.

Your games and apps are not limited to using just one of these methods. You can use the XSAPI wrapper and still call the REST endpoints directly if needed. For more information, see [Xbox services REST API reference](../../../reference/live/rest/atoc-xboxlivews-reference.md).

## Client side API set

The Xbox services API (XSAPI) exposes client side APIs that support a wide range of customer scenarios.

**Important**: For GDK development, you should only use XSAPI C based API. XSAPI WinRT and C+11 APIs are included here for your information only.

- [XSAPI C based API](#xsapi-c-based-api) (GDK) - New as of June 2018
- XSAPI WinRT API (XDK and Xbox Creators program only)
- XSAPI C++11 based API (XDK and Xbox Creators program only)

### XSAPI C-based API

- Supports PC and Xbox console GDK titles.
- Allows titles to control the memory allocations when calling XSAPI.
- Allows titles to gain full control of thread handling when calling XSAPI.
- Uses a new HTTP library, [libHttpClient](../../../reference/live/httpclient/atoc-httpclient.md), designed for game developers.

To learn more, see [Introduction to the Xbox Live C APIs](live-xsapi-flat-c.md).

For API reference, see [XSAPI C reference](../../../reference/live/xsapi-c/atoc-xsapi-c.md).

## See also

[Introduction to the XSAPI C APIs](live-xsapi-flat-c.md)

[XSAPI reference](../../../reference/live/xsapi-c/atoc-xsapi-c.md)

[REST API reference](../../../reference/live/rest/atoc-xboxlivews-reference.md)

[libHttpClient](../../../reference/live/httpclient/atoc-httpclient.md)