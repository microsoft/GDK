---
title: Session Directory URIs
description: " Session Directory URIs"
ms.date: 10/12/2017
ms.topic: article
keywords: xbox live, xbox, games, uwp, windows 10, xbox one
ms.author: joanlee
security: public
author: joannaleecy
---

# Session Directory URIs

This section provides detail about the Universal Resource Identifier (URI) addresses and associated Hypertext Transport Protocol (HTTP) methods from Xbox Live Services for the Multiplayer Session Directory (MPSD).


> **Note:**   
> Only titles for games running on an Xbox 360, on a Windows Phone device, or on Xbox.com can use the session directory URIs.  


  * [Domain](#ID4EUB)
  * [Service version](#ID4EZB)
  * [System objects and properties](#ID4EAC)
  * [Handles](#ID4EBE)

<a id="ID4EUB"></a>


## Domain
sessiondirectory.xboxlive.com  
<a id="ID4EZB"></a>


## Service version

Callers of these REST URIs must pass the value 104/105 or later for X-Xbl-Contract-Version, the HTTP header that specifies the service version of Entertainment Discovery Services (EDS).

<a id="ID4EAC"></a>


## System objects and properties

For configuration of its sessions and templates, the MPSD uses a number of session JSON objects that conform with fixed schemas that the directory enforces and interprets. During calls to the methods supported by the various session directory URIs, these objects are validated and merged, based on the supported schemas. The main JSON objects associated with multiplayer configuration are:

   *  [MultiplayerActivityDetails (JSON)](../../json/json-multiplayeractivitydetails.md)
   *  [MultiplayerSession (JSON)](../../json/json-multiplayersession.md)
   *  [MultiplayerSessionReference (JSON)](../../json/json-multiplayersessionreference.md)
   *  [MultiplayerSessionRequest (JSON)](../../json/json-multiplayersessionrequest.md)


Associated JSON objects that are concerned specifically with games are:

   *  [GameMessage (JSON)](../../json/json-gamemessage.md)
   *  [GameResult (JSON)](../../json/json-gameresult.md)
   *  [GameSession (JSON)](../../json/json-gamesession.md)
   *  [GameSessionSummary (JSON)](../../json/json-gamesessionsummary.md)


<a id="ID4EBE"></a>


## Handles

For 2015 Multiplayer only, sessions can be accessed through session handles. Several URIs have been added to provide functionality to support handles.  
<a id="ID4EFE"></a>


## In this section

[/handles](uri-handles.md)

&nbsp;&nbsp;Supports a POST operation to set the session for the user's current activity to be displayed in Xbox One dashboard user experience, and to invite session members if required.

[/handles/{handleId}](uri-handleshandleid.md)

&nbsp;&nbsp;Supports DELETE and GET operations for session handles specified by identifier.

[/handles/{handleId}/session](uri-handleshandleidsession.md)

&nbsp;&nbsp;Supports PUT and GET operations for a session, using handle dereferencing.

[/handles/query](uri-handlesquery.md)

&nbsp;&nbsp;Supports POST operations to create queries for session handles.

[/serviceconfigs/{scid}/batch](uri-serviceconfigsscidbatch.md)

&nbsp;&nbsp;Supports a POST operation for a batch query at the service configuration identifier level.

[/serviceconfigs/{scid}/sessions](uri-serviceconfigsscidsessions.md)

&nbsp;&nbsp;Supports a GET operation to retrieve a set of session documents.

[/serviceconfigs/{scid}/sessiontemplates](uri-serviceconfigsscidsessiontemplates.md)

&nbsp;&nbsp;Supports a GET operation to retrieve a set of MPSD session templates.

[/serviceconfigs/{scid}/sessiontemplates/{sessionTemplateName}](uri-serviceconfigsscidsessiontemplatessessiontemplatename.md)

&nbsp;&nbsp;Supports a GET operation to retrieve a set of session template names.

[/serviceconfigs/{scid}/sessiontemplates/{sessionTemplateName}/batch](uri-serviceconfigscidsessiontemplatessessiontemplatenamebatch.md)

&nbsp;&nbsp;Supports a POST operation to create a batch query at the session template level.

[/serviceconfigs/{scid}/sessiontemplates/{sessionTemplateName}/sessions](uri-serviceconfigsscidsessiontemplatessessiontemplatenamesessions.md)

&nbsp;&nbsp;Supports a GET operation to retrieve a set of session templates with the specified template names.

[/serviceconfigs/{scid}/sessiontemplates/{sessionTemplateName}/sessions/{sessionName}](uri-serviceconfigsscidsessiontemplatessessiontemplatenamesessionssessionname.md)

&nbsp;&nbsp;Supports PUT and GET operations to create and retrieve sessions.

[/serviceconfigs/{scid}/sessiontemplates/{sessionTemplateName}/sessions/{sessionName}/members/me](uri-serviceconfigsscidsessiontemplatessessiontemplatenamesessionssessionnamemembersme.md)

&nbsp;&nbsp;Supports a DELETE operation to remove session members.

[/serviceconfigs/{scid}/sessiontemplates/{sessionTemplateName}/sessions/{sessionName}/servers/{server-name}](uri-serviceconfigsscidsessiontemplatessessiontemplatenamesessionnamemembersservername.md)

&nbsp;&nbsp;Supports a DELETE operation to remove the specified server of a session.

<a id="ID4ESF"></a>


## See also

<a id="ID4EUF"></a>

   [Matchmaking URIs](../matchtickets/atoc-reference-matchtickets.md)


<a id="ID4E1F"></a>


##### Parent

[Universal Resource Identifier (URI) Reference](../atoc-xboxlivews-reference-uris.md)