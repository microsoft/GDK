---
title: Types of error handling
description: Handling errors when calling an Xbox Live service through XSAPI.
kindex:
- Types of error handling
- error handling
- service call
author: joannaleecy
ms.author: kevinasg
ms.topic: conceptual
ms.assetid: e433dfbd-488b-44ff-8333-1dcf0329cd60
ms.date: 04/04/2017
ms.localizationpriority: medium
edited: 00/00/0000
security: public
---

# Types of error handling

Take special care when making a service call.
Your title should always handle errors when making network calls.

Even for service calls that have been working consistently during development, service calls can fail in real-world environments for a number of different reasons.
For example, your call may fail because:
* The network is not available.
* The service is too busy, returning a 503 HTTP status code.
* The request is not valid, returning a 400 HTTP status code.
* The user does not have the right permissions, returning a 403 HTTP status code.
* The user has been banned, returning a 401 HTTP status code.
* The HTTP stack is unable to send the request (ERROR_TIMEOUT, RPC_S_CALL_FAILED_DNE, etc.)

Most of these issues will result in an exception being thrown from the Services API layer.
Your title should capture these exceptions and handle them appropriately.