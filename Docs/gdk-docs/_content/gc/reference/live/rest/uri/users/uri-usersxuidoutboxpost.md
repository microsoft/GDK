---
title: POST (/users/xuid({xuid})/outbox)
description: " POST (/users/xuid({xuid})/outbox)"
ms.date: 10/12/2017
ms.topic: article
keywords: xbox live, xbox, games, uwp, windows 10, xbox one
ms.author: joanlee
security: public
author: joannaleecy
---

# POST (/users/xuid({xuid})/outbox)
Sends a specified message to a list of recipients.
The domain for these URIs is `msg.xboxlive.com`.

  * [Remarks](#ID4EV)
  * [URI parameters](#ID4EAB)
  * [Authorization](#ID4ENB)
  * [Effect of privacy settings on resource](#ID4EYB)
  * [Request body](#ID4E3F)
  * [HTTP status codes](#ID4ETCAC)
  * [Response body](#ID4E1EAC)

<a id="ID4EV"></a>


## Remarks

The only content type this API supports is "application/json", which is required in the HTTP headers of each call.

<a id="ID4EAB"></a>


## URI parameters

| Parameter| Type| Description|
| --- | --- | --- |
| xuid | unsigned 64-bit integer | The Xbox User ID (XUID) of the player who is making the request. |

<a id="ID4ENB"></a>


## Authorization

You must have your own user claim and a valid gold subscription to send a user message.

<a id="ID4EYB"></a>


## Effect of privacy settings on resource

Successfully sending a user message to a player, whether that player is a friend or not, results in a result code of 200. However, if you send a message to someone who has blocked you, the recipient will not receive the message, and you will not receive any indication that your message wasn't successful.

There are also limits on how many messages can be sent per day and to how many friends and non-friends, as follows.

   * 20 strangers per message
   * 200 strangers per 24 hours
   * 250 total messages per 24 hours
   * 2500 total recipients per 24 hours

| Requesting User| Target User's Privacy Setting| Behavior|
| --- | --- | --- | --- | --- | --- |
| me| -| As described.|
| friend| everyone| 200 OK|
| friend| friends only| 200 OK|
| friend| blocked| 200 OK|
| non-friend user| everyone| 200 OK|
| non-friend user| friends only| 200 OK|
| non-friend user| blocked| 200 OK|
| third-party site| everyone| 200 OK|
| third-party site| friends only| 200 OK|
| third-party site| blocked| 200 OK|

<a id="ID4E3F"></a>


## Request body

| Property| Type| Maximum Length| Consumers| Remarks|
| --- | --- | --- | --- | --- |
| header| Header|  | All| User message header|
| messageText| string| 250| All platforms except Windows 8| User message text (UTF-8)|

#### Header

| Property| Type| Maximum Length| Consumers| Remarks|
| --- | --- | --- | --- | --- |
| recipients| User[]| 20| All| List of message recipients|

#### User

| Property| Type| Maximum Length| Consumers| Remarks|
| --- | --- | --- | --- | --- |
| xuid| ulong|  | All| Recipient's XUID. Not used if gamertag is sent.|
| gamertag| string| 15| All| Recipient's gamertag. Not used if XUID is sent.|

#### Sample Request Body 

```cpp
{
          "header":
          {
            "recipients":
            [{"gamertag":"GoTeamEmily"},
            {"gamertag":"Longstreet360"}]
          },
          "messageText":"random user text"
        }

```


<a id="ID4ETCAC"></a>


## HTTP status codes

The service returns one of the status codes in this section in response to a request made with this method on this resource. For a complete list of standard HTTP status codes used with Xbox Live Services, see [Standard HTTP status codes](../../additional/httpstatuscodes.md).

| Code| Description|
| --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- |
| 200| Success.|
| 400| List of recipients is empty or exceeds maximum length; or both gamertag and XUID were specified; or messageText is too long.|
| 403| XUID cannot be converted.|
| 404| Gamertag is invalid or user cannot be found.|
| 409| User has reached daily limit imposed by the system.|
| 500| General server-side error.|

<a id="ID4E1EAC"></a>


## Response body

No objects are sent in the body of the response.

<a id="ID4EJFAC"></a>


## See also

<a id="ID4ELFAC"></a>


##### Parent  

[/users/xuid({xuid})/outbox](uri-usersxuidoutbox.md)


<a id="ID4EZFAC"></a>


##### Reference  [Standard HTTP status codes](../../additional/httpstatuscodes.md)