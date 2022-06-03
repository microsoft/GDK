---
title: "/users/xuid(xuid)/lists/PINS/{listname}/index({index})?insertIndex={insertIndex}"
description: "/users/xuid(xuid)/lists/PINS/{listname}/index({index})?insertIndex={insertIndex}"
ms.date: 10/12/2017
ms.topic: article
keywords: xbox live, xbox, games, uwp, windows 10, xbox one
ms.author: joanlee
security: public
author: joannaleecy
---

# /users/xuid(xuid)/lists/PINS/{listname}/index({index})?insertIndex={insertIndex}

Moves an item within a list. 
The domain for these URIs is `eplists.xboxlive.com`.
 
  * [URI parameters](#ID4EV)
 
<a id="ID4EV"></a>

 
## URI parameters 
 
| Parameter| Type| Description| 
| --- | --- | --- | 
| XUID| string| XUID of the user.| 
| listname| string| Name of the list to manipulate.| 
| index| string| Specifies the current index of the item to be moved. If the index value is zero or a positive integer, this refers to the current index of the item, and the request body of the call should be empty. However, if the index value is "-1", the item to be moved must be specified by ItemId or Provider/ProviderID in the request body of the call. | 
  
<a id="ID4EHC"></a>

 
## Valid methods

[POST](uri-usersxuidlistspinslistnameindexpost.md)

&nbsp;&nbsp;Moves an item in a list to a different position within the list.
 
<a id="ID4ERC"></a>

 
## See also
 
<a id="ID4ETC"></a>

 
##### Parent 

[Universal Resource Identifier (URI) Reference](../atoc-xboxlivews-reference-uris.md)

   