---
title: "/sessions/{sessionId}/scids/{scid}/data/{pathAndFileName},{type}"
description: " /sessions/{sessionId}/scids/{scid}/data/{pathAndFileName},{type}"
ms.date: 10/12/2017
ms.topic: article
keywords: xbox live, xbox, games, uwp, windows 10, xbox one
ms.author: joanlee
security: public
author: joannaleecy
---

# /sessions/{sessionId}/scids/{scid}/data/{pathAndFileName},{type}
Downloads a file. 
The domain for these URIs is `titlestorage.xboxlive.com`.
 
  * [URI parameters](#ID4EV)
 
<a id="ID4EV"></a>

 
## URI parameters
 
| Parameter| Type| Description| 
| --- | --- | --- | 
| sessionId| string| the ID of the session to look up.| 
| scid| guid| the ID of the service config to look up.| 
| pathAndFileName| string| Path and file name for the item to be accessed. Valid characters for the path portion (up to and including the final forward slash) include uppercase letters (A-Z), lowercase letters (a-z), numbers (0-9), underscore (_), and forward slash (/). The path portion may be empty. Valid characters for the file name portion (everything after the final forward slash) include uppercase letters (A-Z), lowercase letters (a-z), numbers (0-9), underscore (_), period (.), and hyphen (-). The file name may not be empty, end in a period or contain two consecutive periods.| 
| type| string| The format of the data. Possible values are binary or json.| 
  
<a id="ID4EOC"></a>

 
## Valid methods

[DELETE (/sessions/{sessionId}/scids/{scid}/data/{pathAndFileName},{type})](uri-sessionssessionidscidssciddatapathandfilenametype-delete.md)

&nbsp;&nbsp;Deletes a file. 

[GET (/sessions/{sessionId}/scids/{scid}/data/{pathAndFileName},{type})](uri-sessionssessionidscidssciddatapathandfilenametype-get.md)

&nbsp;&nbsp;Downloads a file.

[PUT (/sessions/{sessionId}/scids/{scid}/data/{pathAndFileName},{type})](uri-sessionssessionidscidssciddatapathandfilenametype-put.md)

&nbsp;&nbsp;Uploads a file. The data can be uploaded in a full upload in which the data and metadata are sent in a single message, or as a multi-block upload in which the data and metadata are sent in a series of smaller blocks. Only files that are smaller than four megabytes can be sent as a single message. Multi-block upload is not supported for data of type json. 
 
<a id="ID4E5C"></a>

 
## See also
 
<a id="ID4EAD"></a>

 
##### Parent 

[Title Storage URIs](atoc-reference-storagev2.md)

   