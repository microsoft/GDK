---
title: "/handles/{handleId}"
description: " /handles/{handleId}"
ms.date: 10/12/2017
ms.topic: article
keywords: xbox live, xbox, games, uwp, windows 10, xbox one
ms.author: joanlee
security: public
author: joannaleecy
---

# /handles/{handleId}
Supports DELETE and GET operations for session handles specified by identifier. 

> **Note:**   
> This URI is used by 2015 Multiplayer and applies only to that multiplayer version and later. It is intended for use with template contract 104/105 or later.  

 
<a id="ID4EQ"></a>

 
## Domain
sessiondirectory.xboxlive.com  
<a id="ID4EV"></a>

 
## URI parameters
 
| Parameter| Type| Description| 
| --- | --- | --- | --- | 
| handleId| GUID| The unique ID of the handle for the session.| 
  
<a id="ID4ERB"></a>

 
## Valid methods

[DELETE (/handles/{handleId})](uri-handleshandleiddelete.md)

&nbsp;&nbsp;Deletes handles specified by handle ID.

[GET (/handles/{handle-id})](uri-handleshandleidget.md)

&nbsp;&nbsp;Retrieves handles specified by handle ID.
 
<a id="ID4E4B"></a>

 
## See also
 
<a id="ID4E6B"></a>

 
##### Parent 

[Session Directory URIs](atoc-reference-sessiondirectory.md)

   