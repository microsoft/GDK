---
title: "/handles/query"
description: " /handles/query"
ms.date: 10/12/2017
ms.topic: article
keywords: xbox live, xbox, games, uwp, windows 10, xbox one
ms.author: joanlee
security: public
author: joannaleecy
---

# /handles/query
Supports POST operations to create queries for session handles. 

> **Note:**   
> This URI is used by 2015 Multiplayer and applies only to that multiplayer version and later. It is intended for use with template contract 104/105 or later.  

 
<a id="ID4EQ"></a>

 
## Domain
sessiondirectory.xboxlive.com  
<a id="ID4EV"></a>

 
## Remarks
This URI supports queries for handles. Unlike session queries, which are string and batch queries, handle queries use a query-processor style. Up to 100 handles are supported.  
<a id="ID4E2"></a>

 
## URI parameters
 
None   
<a id="ID4EEB"></a>

 
## Valid methods

[POST (/handles/query)](uri-handlesquerypost.md)

&nbsp;&nbsp;Creates queries for session handles.

[POST (/handles/query?include=relatedInfo)](uri-handlesqueryincludepost.md)

&nbsp;&nbsp;Creates queries for session handles that include related session information.
 
<a id="ID4EQB"></a>

 
## See also
 
<a id="ID4ESB"></a>

 
##### Parent 

[Session Directory URIs](atoc-reference-sessiondirectory.md)

   