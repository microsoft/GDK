---
title: "/serviceconfigs/{scid}/sessiontemplates/{sessionTemplateName}/batch"
description: " /serviceconfigs/{scid}/sessiontemplates/{sessionTemplateName}/batch"
ms.date: 10/12/2017
ms.topic: article
keywords: xbox live, xbox, games, uwp, windows 10, xbox one
ms.author: joanlee
security: public
author: joannaleecy
---

# /serviceconfigs/{scid}/sessiontemplates/{sessionTemplateName}/batch
Supports a POST operation to create a batch query at the session template level.

> **Important:**  
> This method is used by the 2015 Multiplayer and applies only to that multiplayer version and later. It is intended for use with template contract 104/105 or later, and requires a header element of X-Xbl-Contract-Version: 104/105 or later on every request.

<a id="ID4ER"></a>


## Domain
sessiondirectory.xboxlive.com  
<a id="ID4EW"></a>


## URI parameters

| Parameter| Type| Description|
| --- | --- | --- | --- |
| scid| GUID| Service configuration identifier (SCID). Part 1 of the session identifier.|
| sessionTemplateName| string| Name of the current instance of the session template. Part 2 of the session identifier.|

<a id="ID4E2B"></a>


## Valid methods

[POST (/serviceconfigs/{scid}/sessiontemplates/{sessionTemplateName}/batch)](uri-serviceconfigscidsessiontemplatessessiontemplatenamebatchpost.md)

&nbsp;&nbsp;Creates a batch query on multiple Xbox user IDs.

<a id="ID4EFC"></a>


## See also

<a id="ID4EHC"></a>


##### Parent

[Session Directory URIs](atoc-reference-sessiondirectory.md)