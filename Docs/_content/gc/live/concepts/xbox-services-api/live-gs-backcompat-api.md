---
title: Backwards compatibility with XDK Xbox services API
description: Enable backwards compatibility with XDK Xbox services API (XSAPI).
kindex:
- Getting started with Xbox services APIs
- xbox live, getting started
ms.topic: conceptual
author: joannaleecy
ms.author: jeffshi
ms.localizationpriority: medium
edited: 00/00/0000
security: public
---

# Backwards compatibility with XDK XSAPI

## Accessing the XDK XSAPI Compatibility Header

While the XSAPI (Xbox Service API) is offered as a C library, the GDK also includes headers for a C++ version of the [XSAPI that shipped with the XDK](https://github.com/microsoft/xbox-live-api).

If access to this API is required simply include the following header:

```cpp
#include <xsapi-cpp\services.h>
```

## See also

[Introduction to the XSAPI C APIs](live-xsapi-flat-c.md)

[XSAPI reference](../../../reference/live/xsapi-c/atoc-xsapi-c.md)
