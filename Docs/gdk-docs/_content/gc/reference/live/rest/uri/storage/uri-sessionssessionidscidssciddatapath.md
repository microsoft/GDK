---
title: "/sessions/{sessionId}/scids/{scid}/data/{path}"
description: " /sessions/{sessionId}/scids/{scid}/data/{path}"
ms.date: 10/12/2017
ms.topic: article
keywords: xbox live, xbox, games, uwp, windows 10, xbox one
ms.author: joanlee
security: public
author: joannaleecy
---

# /sessions/{sessionId}/scids/{scid}/data/{path}
Lists file information at a specified path. 
The domain for these URIs is `titlestorage.xboxlive.com`.
 
  * [URI parameters](#ID4EV)
 
<a id="ID4EV"></a>

 
## URI parameters
 
| Parameter| Type| Description| 
| --- | --- | --- | 
| sessionId| string| the ID of the session to look up.| 
| scid| guid| The ID of the service config to look up.| 
| path| string| The path to the data items to return. All matching directories and subdirectories get returned. Valid characters include uppercase letters (A-Z), lowercase letters (a-z), numbers (0-9), underscore (_), and forward slash (/). May be empty. Max length of 256.| 
  
<a id="ID4EFC"></a>

 
## Valid methods

[GET](uri-sessionssessionidscidssciddatapath-get.md)

&nbsp;&nbsp;Lists file information at a specified path.
 
<a id="ID4EPC"></a>

 
## See also
 
<a id="ID4ERC"></a>

 
##### Parent 

[Title Storage URIs](atoc-reference-storagev2.md)

   