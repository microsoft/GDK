---
title: Multiplayer session status codes
description: Provides the status codes that are returned from the Xbox Live service when a multiplayer session is requested.
kindex:
- Multiplayer session status codes
- multiplayer 2015
- status codes, session
author: joannaleecy
ms.author: migreen
ms.topic: conceptual
ms.assetid: 4ab320d6-8050-41a9-9f00-faaad3b128fd
ms.localizationpriority: medium
ms.date: 04/04/2017
edited: 00/00/0000
security: public
---

# Multiplayer session status codes

This topic provides the status codes that are returned from the Xbox Live service when a multiplayer session is requested.
> [!NOTE]
> The 4*xx* status codes returning the session always return the entire session, even if the URI points to a session element.

| Status code | String              | Content-Type     | Body    | Description |
|----|
| 200         | OK                  | application/json | Session | Successfully read (GET) or updated (PUT).                                                                                                                                                                                                                                                                                                             |
| 201         | Created             | application/json | Session | Successfully created.                                                                                                                                                                                                                                                                                                                                 |
| 202         | Accepted            | text/plain       | None    | The request was accepted but hasn't yet been completed.                                                                                                                                                                                                                                                                                             |
| 204         | No content          |                  |         | On a GET for a session, the session doesn't exist. On a GET of a session element, the session exists but the element doesn't. On a PUT for a session, the session was deleted as a result of the PUT operation. On a PUT or DELETE for a session element, the session existed when the operation began, but neither the session nor the element exists. |
| 304         | Not modified        |                  |         | On a GET with the If-None-Match header, the session hasn't changed.                                                                                                                                                                                                                                                                                        |
| 400         | Bad request         | text/plain       | Message | The request is assumed to be invalid on first examination. It's missing a required field or the JSON file is malformed. The body includes additional details.                                                                                                                                                                                        |
| 403         | Forbidden           | text/plain       | Message | The request might be valid in some contexts, but it's invalid for its context. Authorization has failed.                                                                                                                                                                                                                                                |
|             |                     | application/json | Session | The session can't be updated by the user, but it can be read.                                                                                                                                                                                                                                                                                           |
| 404         | Not found           | text/plain       | Message | The session can't be accessed because the URI is invalid; the handle, service configuration identifier (SCID), or session template can't be found; a hopper can't be found; a session element can't be accessed because the session doesn't exit; or the element lookup is invalid for the session.                                                                                 |
| 405         | Method not allowed  | text/plain       | Message | The request URI is plausible, but the verb is wrong. For example, the request is for a POST operation when a PUT operation is needed.                                                                                                                                                                                                                 |
| 409         | Conflict            | text/plain       | Message | The session couldn't be updated because the request is incompatible with the session. For example, constants in the request conflict with constants in the session or session template, or members other than the caller have been added to or removed from a large session.                                                                         |
| 412         | Precondition failed |                  |         | The If-Match header, or the If-None-Match header (for an operation other than a GET), couldn't be satisfied.                                                                                                                                                                                                                                           |
|             |                     | application/json | Session | The If-Match header couldn't be satisfied on a PUT or DELETE operation for an existing session. The current state of the session is returned along with the current ETag value.                                                                                                                                                                      |
| 429 | Too many requests | application/json | Message | The service call was throttled because of exceeding the Fine-Grained Rate Limiting (FGRL) restrictions. For more information, see [Fine-Grained Rate Limiting](../../../../test-release/best-practices/live-fine-grained-rate-limiting.md). |
| 503         | Service unavailable | text/plain       | None    | The service is overloaded, and the request should be retried later. This code includes a Retry-After header that the client should honor.                                                                                                                                                                                                              |