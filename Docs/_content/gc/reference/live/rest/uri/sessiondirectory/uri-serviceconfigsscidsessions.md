---
title: "/serviceconfigs/{scid}/sessions"
description: " /serviceconfigs/{scid}/sessions"
ms.date: 10/12/2017
ms.topic: article
keywords: xbox live, xbox, games, uwp, windows 10, xbox one
ms.author: joanlee
security: public
author: joannaleecy
---

# /serviceconfigs/{scid}/sessions
Supports a GET operation to retrieve a set of session documents. 
<a id="ID4EO"></a>

 
## Domain
sessiondirectory.xboxlive.com  
<a id="ID4ET"></a>

 
## URI parameters
 
| Parameter| Type| Description| 
| --- | --- | --- | 
| scid| GUID| Service configuration identifier (SCID). Part 1 of the session ID.| 
| keyword| string| A keyword used to filter results to just sessions identified with that string.| 
| xuid| GUID| Xbox user IDs for the users for whom to retrieve sessions. The users must be active in the sessions.| 
| reservations| string| Value indicating if the list of sessions includes those that the users have not accepted. This parameter can only be set to true. This setting requires the caller to have server-level access to the session, or the caller's XUID claim to match the Xbox user ID filter. | 
| inactive| string| Value indicating if the list of sessions includes those that the users have accepted but are not actively playing. This parameter can only be set to true.| 
| private| string| Value indicating if the list of sessions includes private sessions. This parameter can only be set to true. It is valid only when querying your own sessions, or when querying server-to-server. Setting this parameter to true requires the caller to have server-level access to the session, or the caller's XUID claim to match the Xbox user ID filter. | 
| visibility| string| An enumeration value indicating visibility status used in filtering results. Currently this parameter can only be set to Open to include open sessions. See <b>MultiplayerSessionVisibility</b>.| 
| version| string| A positive integer indicating the major session version or lower of the sessions to include. The value must be less than or equal to the request's contract version modulo 100.| 
| take| string| A positive integer indicating the maximum number of sessions to retrieve.| 
  
<a id="ID4E1D"></a>

 
## Valid methods

[GET (/serviceconfigs/{scid}/sessions)](uri-serviceconfigsscidsessionsget.md)

&nbsp;&nbsp;Retrieves specified session information.
 
<a id="ID4EEE"></a>

 
## See also
 
<a id="ID4EGE"></a>

 
##### Parent 

[Session Directory URIs](atoc-reference-sessiondirectory.md)

   