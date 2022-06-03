---
title: Matchmaking URIs
description: " Matchmaking URIs"
ms.date: 10/12/2017
ms.topic: article
keywords: xbox live, xbox, games, uwp, windows 10, xbox one
ms.author: joanlee
security: public
author: joannaleecy
---

# Matchmaking URIs

This section provides detail about the Universal Resource Identifier (URI) addresses and associated Hypertext Transport Protocol (HTTP) methods from Xbox Live Services for the matchmaking service.


<a id="ID4E6"></a>

## Domain

momatch.xboxlive.com  


<a id="ID4EEB"></a>

## Service version
 
Callers of these HTTP/REST URIs must pass the value 103 or later for X-Xbl-Contract-Version, the HTTP header that specifies the service version of Entertainment Discovery Services (EDS).

  
<a id="ID4ELB"></a>

## System objects and properties

Currently, all configuration of the matchmaking service occurs manually, using the service configuration portion of [Partner Center](https://partner.microsoft.com/dashboard). Some matchmaking information is also reflected in the objects defined for the MPSD.

The main JSON objects used for configuring matchmaking are defined in [MatchTicket (JSON)](../../json/json-matchticket.md) and [HopperStatsResults (JSON)](../../json/json-hopperstatsresults.md). Note that all match tickets must define a **ticketSessionRef** object to provide a reference to a multiplayer session containing the player or players who want to be matched with others.
  

<a id="ID4EBC"></a>

## In this section

[/serviceconfigs/{scid}/hoppers/{hoppername}](uri-serviceconfigsscidhoppershoppername.md)

&nbsp;&nbsp;Supports a POST operation to create match tickets. 

[/serviceconfigs/{scid}/hoppers/{name}/stats](uri-serviceconfigsscidhoppershoppernamestats.md)

&nbsp;&nbsp;Supports a GET operation for retrieving statistics for a hopper.

[/serviceconfigs/{scid}/hoppers/{hoppername}/tickets/{ticketid}](uri-scidhoppernameticketid.md)

&nbsp;&nbsp;Supports a DELETE operation for a match ticket.


<a id="ID4ENC"></a>

## See also
 
<a id="ID4EPC"></a>

   [MatchTicket (JSON)](../../json/json-matchticket.md)

 [HopperStatsResults (JSON)](../../json/json-hopperstatsresults.md)

 [Session Directory URIs](../sessiondirectory/atoc-reference-sessiondirectory.md)


<a id="ID4E2C"></a>

##### Parent 

[Universal Resource Identifier (URI) Reference](../atoc-xboxlivews-reference-uris.md)