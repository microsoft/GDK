---
title: "/serviceconfigs/{scid}/sessiontemplates/{sessionTemplateName}/sessions/{sessionName}/members/me"
description: " /serviceconfigs/{scid}/sessiontemplates/{sessionTemplateName}/sessions/{sessionName}/members/me"
ms.date: 10/12/2017
ms.topic: article
keywords: xbox live, xbox, games, uwp, windows 10, xbox one
ms.author: joanlee
security: public
author: joannaleecy
---

# /serviceconfigs/{scid}/sessiontemplates/{sessionTemplateName}/sessions/{sessionName}/members/me
Supports a DELETE operation to remove session members.
<a id="ID4EO"></a>


## Domain
sessiondirectory.xboxlive.com  
<a id="ID4ET"></a>

 
## Remarks

All session member resource operations require an Xbox User ID (XUID) user claim authorization.

<a id="ID4EAB"></a>


## URI parameters

| Parameter| Type| Description|
| --- | --- | --- |
| scid| GUID| Service configuration identifier (SCID). Part 1 of the session identifier.|
| sessionTemplateName| string| Name of the current instance of the session template. Part 2 of the session identifier.|
| sessionName| GUID| Unique ID of the session. Part 3 of the session identifier.|

<a id="ID4EOC"></a>


## Valid methods

[DELETE (/serviceconfigs/{scid}/sessiontemplates/{sessionTemplateName}/sessions/{sessionName}/members/me)](uri-serviceconfigsscidsessiontemplatessessiontemplatenamesessionssessionnamemembersmedelete.md)

&nbsp;&nbsp;Removes a member from a session.

<a id="ID4EYC"></a>


## See also

<a id="ID4E1C"></a>


##### Parent

[Session Directory URIs](atoc-reference-sessiondirectory.md)