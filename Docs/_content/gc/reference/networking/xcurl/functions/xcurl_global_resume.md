---
author: M-Stahl
title: xcurl_global_resume
description: Resets the internal state of XCurl to allow HTTP requests when the game resumes.
kindex: xcurl_global_resume
ms.author: jameslen
ms.topic: reference
edited: 12/01/2020
security: public
---

# xcurl_global_resume

Resets the internal state of XCurl to allow HTTP requests when the game resumes.

<a id="syntaxSection"></a>

## Syntax

```cpp
void xcurl_global_resume(
)
```

<a id="parametersSection"></a>

### Parameters

None.

<a id="retvalSection"></a>

### Return value

None.

<a id="remarksSection"></a>

## Remarks

Use this function after you have suspended sending HTTP requests by calling [xcurl_global_suspend](xcurl_global_suspend.md).

When the game resumes, call this function to reset XCurl and to enable sending HTTP requests.

Just as with WinHttp, you must clean up networking and HTTP handles upon receiving a suspend event.

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