---
title: EDS Common Headers
description: " EDS Common Headers"
ms.date: 10/12/2017
ms.topic: article
keywords: xbox live, xbox, games, uwp, windows 10, xbox one
ms.author: joanlee
security: public
author: joannaleecy
---

# EDS Common Headers

<a id="ID4EO"></a>



## Entertainment Discovery Services (EDS) Common Request Headers

| Header Name| Description| Required?| Notes|
| --- | --- | --- | --- |
| <b>x-xbl-contract-version</b>| EDS Service version| yes| 3.2|
| <b>x-xbl-client-type</b>| Client Type header| yes| Speak to team to get your own Client Type .|
| <b>x-xbl-client-version</b>| Client Version| yes| Any non-empty string.|
| <b>x-xbl-parent-ig</b>| Impression guid| yes| Used to track request in logs and across other service calls.|
| <b>x-xbl-device-type</b>| Device Type| yes| Device that the client is representing .|
| <b>Accept</b>| Accept type| yes| XML or JSON.|
| <b>Authorization</b>| Auth Header| yes|  |
| <b>x-xbl-autoSuggest-seed-text</b>| Auto suggest seed text| no| Used For BI and relevance|
| <b>x-xbl-search-term</b>| Search Term| no|  |
| <b>x-xbl-input-method</b>| Input method used by user| no| Controller, Speech, Kinect .|
| <b>x-xbl-kinect-enabled</b>| Kinect enabled| no| Yes/no.|
| <b>x-xbl-speech-session-id</b>| Speech session ID| no| Whether session was initiated using speech.|
| <b>x-xbl-client-id</b>| Anonymous Client Id| no| Used for BI reporting and relevance.|
| <b>x-xbl-device-id</b>| Device ID| no| Used for BI reporting and relevance.|
| <b>x-xbl-user-agent</b>| Client user agent| no| Used for BI. "&lt;name>/&lt;version> (&lt;OS version>; &lt;platform>; &lt;capability>; &lt;manufacture>; &lt;model>)".|
| <b>x-xbl-parent-ig</b>| Previous Impression Guid for "Chained" calls| no (but highly recommended)| Important for BI relevance. For example, a Browse call's IG is the parent IG for a following up detail call.|
| <b>delid</b>| Delegate Identity| no| Used by internal services to work on behalf of a user.|

## Common Response Headers

| Header Name| Description| Required?| Notes|
| --- | --- | --- | --- | --- | --- | --- | --- |
| <b>Cache</b>| Cache Headers| yes| See <a href="https://www.w3.org/Protocols/rfc2616/rfc2616-sec14.html#sec14.9">https://www.w3.org/Protocols/rfc2616/rfc2616-sec14.html#sec14.9</a>.|
| <b>x-xbl-errors</b>| Errors| no| List of errors from various data providers.|
| <b>x-xbl-traceid</b>| Trace Id from logs| yes| Used to trace back the request specific logs.|
| <b>x-server-name</b>| Obfuscated name of the server that handles the request.| yes| Used for internal debugging.|

<a id="ID4EECAC"></a>


## See also

<a id="ID4EGCAC"></a>


##### Parent  

[Additional Reference](atoc-xboxlivews-reference-additional.md)


<a id="ID4ESCAC"></a>


##### Further Information

[Marketplace URIs](../uri/marketplace/atoc-reference-marketplace.md)