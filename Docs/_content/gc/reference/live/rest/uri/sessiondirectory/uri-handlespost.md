---
title: POST (/handles)
description: " POST (/handles)"
ms.date: 10/12/2017
ms.topic: article
keywords: xbox live, xbox, games, uwp, windows 10, xbox one
ms.author: joanlee
security: public
author: joannaleecy
---

# POST (/handles)
Sets the multiplayer session for the user's current activity, and invites session members if required.

> **Important:**  
> This method is used by the 2015 Multiplayer and applies only to that multiplayer version and later. It is intended for use with template contract 104/105 or later, and requires a header element of X-Xbl-Contract-Version: 104/105 or later on every request.

  * [Remarks](#ID4ET)
  * [URI parameters](#ID4EHB)
  * [HTTP status codes](#ID4EPB)
  * [Request body](#ID4EVB)
  * [Response body](#ID4EJC)

<a id="ID4ET"></a>


## Remarks

This HTTP/REST method can be used to set the session for current activity. In this case, the method can be wrapped by **Microsoft.Xbox.Services.Multiplayer.MultiplayerService.SetActivityAsync**. The request body must define the session reference, using the **sessionRef** object in the JSON file, with the type field to "activity". No response body is retrieved. For definitions of the items specified in a session reference, see **Microsoft.Xbox.Services.Multiplayer.MultiplayerSessionReference**.

This POST method can also be used to invite users specified by the handles to a session. In this case, the method can be wrapped by **Microsoft.Xbox.Services.Multiplayer.MultiplayerService.SendInvitesAsync**. This use of the POST method requires your request body to define the session reference, but with the type field set to "invite". The response body is an invite handle.

<a id="ID4EHB"></a>


## URI parameters

None

<a id="ID4EPB"></a>


## HTTP status codes
The service returns an HTTP status code as it applies to MPSD.  
<a id="ID4EVB"></a>


## Request body

<a id="ID4E1B"></a>


### Request body for setting activity


```cpp
{
  "version": 1,
  "type": "activity",
  "sessionRef": {
    "scid": "bd6c41c3-01c3-468a-a3b5-3e0fe8133862",
    "templateName": "deathmatch",
    // The session name is optional in a POST; if not specified, MPSD fills in a GUID.//
    "name": "session-49"
  },
}

```


<a id="ID4EBC"></a>


### Request body for sending invites


```cpp
{
  // Common handle fields
  "id: "47ca0049-a5ba-4bc1-aa22-fcf834ce4c13",
  "version": 1,
  "type": "invite",
  "sessionRef": {
    "scid": "bd6c41c3-01c3-468a-a3b5-3e0fe8133862",
    "templateName": "deathmatch",
    "name": "session-49"
   },
   "inviteAttributes": {
     "titleId" : {titleId}, // The title being invited to, in decimal uint32. This value is used to find the title name and/or image.
     "context" : {context}, // The title defined context token. Must be 256 characters or less when URI-encoded.
     "contextString" : {contextstring}, // The string name of a custom invite string to display in the invite notification.
     "senderString" : {sender} // The string name of the sender when the sender is a service.
   },
   "invitedXuid": "3210",
}

```


<a id="ID4EJC"></a>


## Response body

<a id="ID4EOC"></a>


### Response body for setting activity
None.  
<a id="ID4ESC"></a>


### Response body for sending invites
An invite handle.   
<a id="ID4EXC"></a>


## See also

<a id="ID4EZC"></a>


##### Parent

[/handles](uri-handles.md)