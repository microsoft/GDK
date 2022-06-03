---
title: GET (/users/xuid({xuid})/inbox)
description: " GET (/users/xuid({xuid})/inbox)"
ms.date: 10/12/2017
ms.topic: article
keywords: xbox live, xbox, games, uwp, windows 10, xbox one
ms.author: joanlee
security: public
author: joannaleecy
---

# GET (/users/xuid({xuid})/inbox)
Retrieves a specified number of user message summaries from the service.
The domain for these URIs is `msg.xboxlive.com`.

  * [Remarks](#ID4EV)
  * [URI parameters](#ID4EEB)
  * [Query string parameters](#ID4EIC)
  * [Authorization](#ID4EGE)
  * [Effect of privacy settings on resource](#ID4ETE)
  * [HTTP status codes](#ID4E5E)
  * [JavaScript Object Notation (JSON) Response](#ID4EMH)

<a id="ID4EV"></a>


## Remarks

A user message summary contains only the message subject. For user-generated messages, this is currently the first 20 characters of the message text. System messages may provide an alternate subject, such as "LIVE System".

Messages are returned in the reverse of the order they were sent; that is, newer messages are returned first.

The only content type this API supports is "application/json", which is required in the HTTP headers of each call.

<a id="ID4EEB"></a>


## URI parameters

| Parameter| Type| Description|
| --- | --- | --- |
| xuid| unsigned 64-bit integer| The Xbox User ID (XUID) of the player who is making the request.|

<a id="ID4EIC"></a>


## Query string parameters

| Property| Type| Maximum Length| Remarks|
| --- | --- | --- | --- | --- | --- | --- |
| maxItems| int| 100| Maximum number of messages returned.|
| continuationToken| string|  | String returned in a previous enumeration call; used to continue enumeration.|
| skipItems| int| 100| Number of messages to skip; ignored if continuationToken is present.|

<a id="ID4EGE"></a>


## Authorization

You must have your own user claim to retrieve a user message summary.

<a id="ID4ETE"></a>


## Effect of privacy settings on resource

Only you can enumerate your own user messages.

<a id="ID4E5E"></a>


## HTTP status codes

The service returns one of the status codes in this section in response to a request made with this method on this resource. For a complete list of standard HTTP status codes used with Xbox Live Services, see [Standard HTTP status codes](../../additional/httpstatuscodes.md).

| Code| Description|
| --- | --- | --- | --- | --- | --- | --- | --- | --- |
| 200| The request was successful.|
| 400| Service could not understand malformed request. Typically an invalid parameter.|
| 403| The request is not allowed for the user or service.|
| 404| A valid XUID is missing in the URI.|
| 409| The underlying collection changed based on the continuation token that was passed.|
| 416| The number of items to skip is larger than the number of available items.|
| 500| General server-side error.|

<a id="ID4EMH"></a>


## JavaScript Object Notation (JSON) Response

If called successfully, the service returns the results data in a JSON format.

| Property| Type| Maximum Length| Remarks|
| --- | --- | --- | --- |
| results| Message[]| 100| Array of user messages|
| pagingInfo| PagingInfo|  | Paging information for the current set of results|

#### Message

| Property| Type| Maximum Length| Remarks|
| --- | --- | --- | --- |
| header| Header|  | User message header|
| messageSummary| string| 20| UTF-8; usually first 20 characters of message|

#### Header

| Property| Type| Maximum Length| Remarks|
| --- | --- | --- | --- |
| id| string| 50| Message identifier, used for retrieving message details or deleting messages.|
| isRead| bool|  | Flag indicating that the user has already read the message details.|
| sent| DateTime|  | UTC date and time the message was sent. (Provided by the service.)|
| expiration| DateTime|  | UTC date and time the message expires. (All messages have a maximum lifetime, to be determined in the future.)|
| messageType| string| 50| Message types: User, System, FriendRequest, Video, QuickChat, VideoChat, PartyChat, Title, GameInvite.|
| senderXuid| ulong|  | XUID of sender.|
| sender| string| 15| Gamertag of sender.|
| hasAudio| bool|  | Whether the message has an audio (voice) attachment.|
| hasPhoto| bool|  | Whether the message has a photo attachment.|
| hasText| bool|  | Whether the message contains text.|

#### Paging Info

| Property| Type| Maximum Length| Remarks|
| --- | --- | --- | --- |
| continuationToken| string| 100| Optionally returned by server. Allows later calls to continue enumeration.|
| totalItems| int|  | Total number of messages in inbox.|

#### Sample response

```cpp
{
          "results":
          [
            {
              "header":
              {
                "expiration":"2011-10-11T23:59:59.9999999",
                "id":"opaqueBlobOfText",
                "messageType":"User",
                "isRead":false,
                "senderXuid":"123456789",
                "sender":"Striker",
                "sent":"2011-05-08T17:30:00Z",
                "hasAudio":false,
                "hasPhoto":false,
                "hasText":true
              },
            "messageSummary":"first 20 chars"
          },
          ...
        ],
        "pagingInfo":
          {
          "continuationToken":"opaqueBlobOfText"
          "totalItems":5,
          }
        }

```

#### Error Response

In case of error, the service may return an errorResponse object, which may contain values from the environment of the service.

| Property| Type| Description|
| --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- |
| errorSource| string| An indication of where the error originated.|
| errorCode| int| Numeric code associated with the error (can be null).|
| errorMessage| string| Details of the error if configured to show details.|

<a id="ID4EIKAC"></a>


## See also

<a id="ID4EKKAC"></a>


##### Parent  

[/users/xuid({xuid})/inbox](uri-usersxuidinbox.md)


<a id="ID4EWKAC"></a>


##### Reference  [Standard HTTP status codes](../../additional/httpstatuscodes.md)