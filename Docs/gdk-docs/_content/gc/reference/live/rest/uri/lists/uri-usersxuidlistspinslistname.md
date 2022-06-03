---
title: "/users/xuid(xuid)/lists/PINS/{listname}"
description: "/users/xuid(xuid)/lists/PINS/{listname}"
ms.date: 10/12/2017
ms.topic: article
keywords: xbox live, xbox, games, uwp, windows 10, xbox one
ms.author: joanlee
security: public
author: joannaleecy
---

# /users/xuid(xuid)/lists/PINS/{listname}
Accesses items in a list. 
The domain for these URIs is `eplists.xboxlive.com`.
 
  * [URI parameters](#ID4EV)
 
<a id="ID4EV"></a>

 
## URI parameters
 
| Parameter| Type| Description| 
| --- | --- | --- | 
| xuid| string| Xbox User ID (XUID).| 
| listtype| string| Type of the list (how it is used and how it acts). Always "PINS" for these related methods.| 
| listname| string| Name of the list (which list of a given listtype to act on). Always "XBLPins" for items in Pins.| 
  
<a id="ID4EGC"></a>

 
## Valid methods

[DELETE](uri-usersxuidlistspinslistnamedelete.md)

&nbsp;&nbsp;Removes items from a list.

[GET](uri-usersxuidlistspinslistnameget.md)

&nbsp;&nbsp;Returns the contents of a list.

[POST](uri-usersxuidlistspinslistnamepost.md)

&nbsp;&nbsp;Inserts items into the list at the index based on the query string parameter **insertIndex**.

[PUT](uri-usersxuidlistspinslistnameput.md)

&nbsp;&nbsp;Updates the items in a list according to the indexes specified for each item in the request body.
 
<a id="ID4EZC"></a>

 
## See also
 
<a id="ID4E2C"></a>

 
##### Parent 

[Universal Resource Identifier (URI) Reference](../atoc-xboxlivews-reference-uris.md)

   