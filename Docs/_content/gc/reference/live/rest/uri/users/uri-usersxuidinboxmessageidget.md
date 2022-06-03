---
title: GET (/users/xuid({xuid})/inbox/{messageId})
description: " GET (/users/xuid({xuid})/inbox/{messageId})"
ms.date: 10/12/2017
ms.topic: article
keywords: xbox live, xbox, games, uwp, windows 10, xbox one
ms.author: joanlee
security: public
author: joannaleecy
---

# GET (/users/xuid({xuid})/inbox/{messageId})
Retrieves the detailed message text for a particular user message, marking it as read on the service.
The domain for these URIs is `msg.xboxlive.com`.

  * [Remarks](#ID4EV)
  * [URI parameters](#ID4EEB)
  * [Authorization](#ID4ERB)
  * [Request body](#ID4E3B)
  * [Effect of privacy settings on resource](#ID4EJC)
  * [HTTP status codes](#ID4EUC)
  * [JavaScript Object Notation (JSON) Response](#ID4EUE)

<a id="ID4EV"></a>


## Remarks

The get operation can only be performed on the User, System, and FriendRequest message types.

This URI requires a refresh on Xbox.com. Currently, the Xbox 360 will not update the read/unread state until a user signs out and back in.

The only content type this API supports is "application/json", which is required in the HTTP headers of each call.

<a id="ID4EEB"></a>


## URI parameters

| Parameter| Type| Description|
| --- | --- | --- |
| xuid | unsigned 64-bit integer | The Xbox User ID (XUID) of the player who is making the request. |
| messageId | string[50] | ID of the message being retrieved or deleted. |

<a id="ID4ERB"></a>


## Authorization

You must have your own user claim to retrieve a user message.

<a id="ID4E3B"></a>


## Request body

No objects are sent in the body of this request.

<a id="ID4EJC"></a>


## Effect of privacy settings on resource

Only you can retrieve your own user messages.

<a id="ID4EUC"></a>


## HTTP status codes

The service returns one of the status codes in this section in response to a request made with this method on this resource. For a complete list of standard HTTP status codes used with Xbox Live Services, see [Standard HTTP status codes](../../additional/httpstatuscodes.md).

| Code| Description|
| --- | --- | --- | --- | --- |
| 200| Success.|
| 400| The XUID cannot be converted properly.|
| 403| The XUID cannot be converted or a valid XUID claim cannot be found.|
| 404| A valid XUID is missing, or the message ID cannot be found or is parsed incorrectly.|
| 500| General server-side error, or the message type is not valid for GET.|

<a id="ID4EUE"></a>


## JavaScript Object Notation (JSON) Response

If called successfully, the service returns the results data in a JSON format. The root object is a UserMessageHeader object.

#### UserMessageHeader

| Property| Type| Maximum Length| Remarks|
| --- | --- | --- | --- |
| header| Header|  | JSON object|
| messageText| string| 256| UTF-8|

#### Header

| Property| Type| Maximum Length| Remarks|
| --- | --- | --- | --- |
| sent| DateTime|  | Date and time the message was sent. (Provided by the service.)|
| expiration| DateTime|  | Date and time the message expires. (All messages have a maximum lifetime, to be determined in the future.)|
| messageType| string| 13| Message types: User, System, FriendRequest.|
| senderXuid| ulong|  | XUID of sender.|
| sender| string| 15| Gamertag of sender.|
| hasAudio| bool|  | Whether the message has an audio (voice) attachment.|
| hasPhoto| bool|  | Whether the message has a photo attachment.|
| hasText| bool|  | Whether the message contains text.|

#### Sample response

```cpp
{
          "header":
          {
            "expiration":"2011-10-11T23:59:59.9999999",
            "messageType":"User",
            "senderXuid":"123456789",
            "sender":"Striker",
            "sent":"2011-05-08T17:30:00Z",
            "hasAudio":false,
            "hasPhoto":false,
            "hasText":true
          },
        "messageText":"random user text up to 256 characters"
        }

```

#### Error Response

In case of error, the service may return an errorResponse object, which may contain values from the environment of the service.

| Property| Type| Description|
| --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- |
| errorSource| string| An indication of where the error originated.|
| errorCode| int| Numeric code associated with the error (can be null).|
| errorMessage| string| Details of the error if configured to show details.|

<a id="ID4E3DAC"></a>


## See also

<a id="ID4E5DAC"></a>


##### Parent  

[/users/xuid({xuid})/inbox](uri-usersxuidinbox.md)


<a id="ID4EMEAC"></a>


##### Reference  [Standard HTTP status codes](../../additional/httpstatuscodes.md)