---
title: "/json/users/batch/scids/{scid}/data/{pathAndFileName},json"
description: " /json/users/batch/scids/{scid}/data/{pathAndFileName},json"
ms.date: 10/12/2017
ms.topic: article
keywords: xbox live, xbox, games, uwp, windows 10, xbox one
ms.author: joanlee
security: public
author: joannaleecy
---

# /json/users/batch/scids/{scid}/data/{pathAndFileName},json
Downloads multiple files from multiple users with the same filename. 
The domain for these URIs is `titlestorage.xboxlive.com`.
 
  * [URI parameters](#ID4EV)
 
<a id="ID4EV"></a>

 
## URI parameters
 
| Parameter| Type| Description| 
| --- | --- | --- | 
| scid| guid| the ID of the service config to look up.| 
| pathAndFileName| string| Path and file name for the item to be accessed. Valid characters for the path portion (up to and including the final forward slash) include uppercase letters (A-Z), lowercase letters (a-z), numbers (0-9), underscore (_), and forward slash (/). The path portion may be empty. Valid characters for the file name portion (everything after the final forward slash) include uppercase letters (A-Z), lowercase letters (a-z), numbers (0-9), underscore (_), period (.), and hyphen (-). The file name may not be empty, end in a period or contain two consecutive periods.| 
  
<a id="ID4E3B"></a>

 
## Valid methods

[POST](uri-jsonusersbatchscidssciddatapathandfilenametype-post.md)

&nbsp;&nbsp;Downloads multiple files from multiple users with the same filename. The file to be downloaded is determined by the URI of the request. The body of the request contains the list of XUIDs of the users whose files to download. The body of the response will be a multi-part MIME message, with each part representing a file for a particular user with its own set of headers. It's possible for the parts of the response to be a mix of successes and failures.
 
<a id="ID4EGC"></a>

 
## See also
 
<a id="ID4EIC"></a>

 
##### Parent 

[Title Storage URIs](atoc-reference-storagev2.md)

   