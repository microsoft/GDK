---
title: "/serviceconfigs/{scid}/sessiontemplates/{sessionTemplateName}/sessions/{sessionName}"
description: " /serviceconfigs/{scid}/sessiontemplates/{sessionTemplateName}/sessions/{sessionName}"
ms.date: 10/12/2017
ms.topic: article
keywords: xbox live, xbox, games, uwp, windows 10, xbox one
ms.author: joanlee
security: public
author: joannaleecy
---

# /serviceconfigs/{scid}/sessiontemplates/{sessionTemplateName}/sessions/{sessionName}
Supports PUT and GET operations to create and retrieve sessions.
<a id="ID4EO"></a>


## Domain
sessiondirectory.xboxlive.com  
<a id="ID4ET"></a>


## URI parameters

| Parameter| Type| Description|
| --- | --- | --- |
| scid| GUID| Service configuration identifier (SCID). Part 1 of the session identifier.|
| sessionTemplateName| string| Name of the current instance of the session template. Part 2 of the session identifier.|
| sessionName| GUID| Unique ID of the session. Part 3 of the session identifier.| 

<a id="ID4EBC"></a>


## Valid methods

[GET (/serviceconfigs/{scid}/sessiontemplates/{sessionTemplateName}/sessions/{sessionName})](uri-serviceconfigsscidsessiontemplatessessiontemplatenamesessionssessionnameget.md)

&nbsp;&nbsp;Gets a session object.

[PUT (/serviceconfigs/{scid}/sessiontemplates/{sessionTemplateName}/sessions/{sessionName})](uri-serviceconfigsscidsessiontemplatessessiontemplatenamesessionssessionnameput.md)

&nbsp;&nbsp;Creates, updates, or joins a session.

<a id="ID4EOC"></a>


## See also

<a id="ID4EQC"></a>


##### Parent

[Session Directory URIs](atoc-reference-sessiondirectory.md)