---
author: M-Stahl
title: xcurl_global_init_mem
description: Initializes XCurl with custom memory allocators.
kindex: xcurl_global_init_mem
ms.author: jameslen
ms.topic: reference
edited: 12/01/2020
security: public
---

# xcurl_global_init_mem

Initializes XCurl with custom memory allocators.

<a id="syntaxSection"></a>

## Syntax

```cpp
CURL_EXTERN CURLcode xcurl_global_init_mem(long flags,
    xcurl_alloc_memory_callback m,
    xcurl_free_memory_callback f,
    xcurl_realloc_memory_callback r,
    curl_strdup_callback s,
    xcurl_calloc_memory_callback c
)
```

<a id="parametersSection"></a>

### Parameters

*flags* &nbsp;&nbsp;\_In\_  
Type: long

This parameter is ignored by XCurl.

*m* &nbsp;&nbsp;\_In\_  
Type: xcurl_alloc_memory_callback*

malloc() replacement

*f* &nbsp;&nbsp;\_In\_  
Type: xcurl_free_memory_callback*

free() replacement

*r* &nbsp;&nbsp;\_In\_  
Type: xcurl_realloc_memory_callback*

realloc() replacement

*s* &nbsp;&nbsp;\_In\_  
Type: curl_strdup_callback*

strdup() replacement

*c* &nbsp;&nbsp;\_In\_  
Type: xcurl_calloc_memory_callback*

calloc() replacement

<a id="retvalSection"></a>

### Return value

If this function returns a non-zero value, then something went wrong and you cannot use the other curl functions.

<a id="remarksSection"></a>

## Remarks

This function is identical to [curl_global_init_mem](https://curl.haxx.se/libcurl/c/curl_global_init_mem.html), except that this version initializes XCurl with custom memory allocators.

XCurl relies on the Gaming Runtime, and therefore cannot be initialized until after you run [XGameRuntimeInitialize](../../../system/xgameruntimeinit/functions/xgameruntimeuninitialize.md).

Wherever you would have included `curl.h` in your game code, you must replace it with `xcurl.h`.

<a id="requirementsSection"></a>

## Requirements

**Header:** XCurl.h

**Library:** xcurl.lib
  
**Supported platforms:** Windows, Xbox One family consoles and Xbox Series consoles  

<a id="seealsoSection"></a>

## See also

[XCurl Overview](../../../../networking/overviews/web-requests/intro-xcurl.md)  
[HTTP and Web Sockets](../../../../networking/overviews/web-requests/http-networking.md)  
[curl](https://curl.se/)  
[xcurl_global_suspend](xcurl_global_suspend.md)  
[xcurl_global_resume](xcurl_global_resume.md)  