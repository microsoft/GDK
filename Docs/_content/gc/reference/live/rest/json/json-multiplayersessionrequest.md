---
title: MultiplayerSessionRequest (JSON)
description: " MultiplayerSessionRequest (JSON)"
ms.date: 10/12/2017
ms.topic: article
keywords: xbox live, xbox, games, uwp, windows 10, xbox one
ms.author: joanlee
security: public
author: joannaleecy
---

# MultiplayerSessionRequest (JSON)
The request JSON object passed for an operation on a **MultiplayerSession** object. 
<a id="ID4EQ"></a>

  
 
The MultiplayerSessionRequest JSON object has the following specification.
 
| Member| Type| Description| 
| --- | --- | --- | 
| constants| object| Read-only settings that are merged with the session template to produce the constants for the session. | 
| properties | object | Changes to be merged into the session properties.| 
| members.me | object| Constants and properties that work much like their top-level counterparts. Any PUT method requires the user to be a member of the session, and adds the user if necessary. If "me" is specified as null, the member making the request is removed from the session. | 
| members | object| Other objects that represent users to add to the session, keyed by a zero-based index. The number of members in a request always starts with 0, even if the session already contains members. Members are added to the session in the order in which they appear in the request. Member properties can only be set by the user to whom they belong. | 
| servers | object| Values indicating updates and additions to the session's set of associated server participants. If a server is specified as null, that server entry is removed from the session. | 
  
<a id="ID4EZ"></a>

 
## Request Structure
 

```json
{
  "constants": { /* Property Bag */ },
  "properties": { /* Property Bag */ },
  "members": {
    // Requires a service principal. Existing members can be deleted by index.
    // Not available on large sessions.
    "5": null,

    // Reservation requests must start with zero. New users will get added in order to the end of the session's member list.
    // Large sessions don't support reservations.
    "reserve_0": {
      "constants": { /* Property Bag */ }
    },
    "reserve_1": {
      "constants": { /* Property Bag */ }
    },

    // Requires a user principal with a xuid claim. Can be 'null' to remove myself from the session.
    "me": {
      "constants": { /* Property Bag */ },
      "properties": { /* Property Bag */ },
    }
  },

  // Requires a server principal.
  "servers": {
    // Can be any name. The value can be 'null' to remove the server from the session.
    "name": {
      "constants": {  /* Property Bag */ },
      "properties": {  /* Property Bag */ }
    }
  }
}
```

  
<a id="ID4EAB"></a>

 
## See also
 
<a id="ID4ECB"></a>

 
##### Parent 

[JavaScript Object Notation (JSON) Object Reference](atoc-xboxlivews-reference-json.md)

  
<a id="ID4EMB"></a>

 
##### Reference 

[MultiplayerSession (JSON)](json-multiplayersession.md)

 [PUT (/serviceconfigs/{scid}/sessiontemplates/{sessionTemplateName}/sessions/{sessionName})](../uri/sessiondirectory/uri-serviceconfigsscidsessiontemplatessessiontemplatenamesessionssessionnameput.md)

   