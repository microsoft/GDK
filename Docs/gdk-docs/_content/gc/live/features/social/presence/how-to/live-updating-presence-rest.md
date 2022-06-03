---
title: Updating a user's Presence via REST
description: Example code for updating Rich Presence strings.
kindex:
- Updating a user's Presence via REST
- Rich Presence
author: joannaleecy
ms.author: migreen
ms.topic: conceptual
ms.localizationpriority: medium
ms.assetid: eb2bb82e-8730-4d74-9b33-95d133360e44
ms.date: 04/04/2017
edited: 00/00/0000
security: public
---

# Updating a user's Presence via REST

To update a Rich Presence string in your title, you can call the `Write Title` URI with the appropriate parameters in a JSON object.

This restful call is also wrapped by Xbox Service APIs.
For information on the related API, see [XblPresenceSetPresenceAsync](../../../../../reference/live/xsapi-c/presence_c/functions/xblpresencesetpresenceasync.md).

The URI looks like this:

```uri
POST /users/xuid({xuid})/devices/current/titles/current
```

Below are only the fields for setting Rich Presence strings.
There are other optional fields related to writing presence for a title, not listed here.


## TitleRequest object

Property | Type | Req'd | Description
---|---|---|---
Activity|ActivityRequest|N|Record that describes in-title information (Rich Presence and media info, if available)


## ActivityRequest object

Property | Type | Req'd | Description
---|---|---|---
richPresence|RichPresenceRequest|N|The friendlyName of the Rich Presence string that should be used.


## RichPresenceRequest object

Property | Type | Req'd | Description
---|---|---|---
Id|String|Y|The friendlyName of the Rich Presence string that should be used
Scid|String|Y|Scid that tells us where the Rich Presence strings are defined.

For example, to update the Rich Presence for the user whose xuid is 12345, the call would look as follows:

```uri
POST /users/xuid(12345)/devices/current/titles/current
```

With the following JSON body:

```json
          {
            activity:
            {
              richPresence:
              {
                id:"playingMap",
                scid:"0000-0000-0000-0000-01010101"
              }
            }
          }
```

Using the wrapper API, this would be a call to [XblPresenceSetPresenceAsync](../../../../../reference/live/xsapi-c/presence_c/functions/xblpresencesetpresenceasync.md).

If you're keeping Xbox Live Player Data up-to-date, then you don't have to reset the Rich Presence String every time the data to fill in the blank changes.
In the example above, we know that you want to use the current map.

Presence will look up the data in Player Data when a user tries to read the string to fill in the current value.
So even if the player is switching from map to map to map, you don't have to reset the Rich Presence string in your game as long as you're sending the appropriate events to Xbox Live Player Data.

It may take a few seconds for the data to find its way through the Xbox Live Player Data system.

Then, when someone attempts to read user 12345's Rich Presence, the service will look at what locale is being requested and format the string appropriately before returning.
In this case, suppose a user wants to read the en-US string.

Reading rich presence would work as follows:

```uri
GET /users/xuid(12345)?level=all
```

For more information about this call, see **GET (/users/xuid({xuid}))**.

The wrapper API for this is [XblPresenceGetPresenceAsync](../../../../../reference/live/xsapi-c/presence_c/functions/xblpresencegetpresenceasync.md) or [XblPresenceGetPresenceForMultipleUsersAsync](../../../../../reference/live/xsapi-c/presence_c/functions/xblpresencegetpresenceformultipleusersasync.md).

What's happening here is that you're asking for the PresenceRecord of the user, whose xuid is 12345.
And you're requesting that the level of detail be "all".

If "all" weren't specified, Rich Presence would not be returned, and it would return the following in the JSON response:

```json
          {
            xuid:"12345",
            state:"online",
            devices:
            [
              {
                type:"D",
                titles:
                [
                  {
                    id:"12345",
                    name:"Buckets are Awesome",
                    lastModified:"2012-09-17T07:15:23.4930000",
                    placement: "full",
                    state:"active",
                    activity:
                    {
                      richPresence:"Playing on map:Mountains"
                    }
                  }
                ]
              }
            ]
          }
```