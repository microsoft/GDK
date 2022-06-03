---
title: Achievement (JSON)
description: " Achievement (JSON)"
ms.date: 10/12/2017
ms.topic: article
keywords: xbox live, xbox, games, uwp, windows 10, xbox one
ms.author: joanlee
security: public
author: joannaleecy
---

# Achievement (JSON)
An Achievement object (version 2).
<a id="ID4EN"></a>


## Achievement

The Achievement object has the following specification. All members are required.

| Member| Type| Description|
| --- | --- | --- |
| id| string| Resource identifier.|
| serviceConfigId| string| SCID for this resource. Identifies the title(s) this achievement is related to. |
| name| string| The localized Achievement name.|
| titleAssociations| array of [TitleAssociation](json-titleassociation.md)| An array of TitleAssociation.|
| progressState| **ProgressState** enumeration| The state of progression: <ul><li>invalid (0): The achievement progression is in an unknown state.</li><li>achieved (1): The achievement has been unlocked.</li><li>inProgress (2): The achievement is locked but the user has made progress toward unlocking it.</li><li>notStarted (3): The achievement is locked and the user has not made any progress toward unlocking it.</li></ul> | 
| progression| [Progression](json-progression.md)| The user's progression within the achievement.|
| mediaAssets| array of [MediaAsset](json-mediaasset.md)| The media assets associated with the achievement, such as image IDs. |
| platform| string| The platform the achievement was earned on.|
| isSecret| Boolean value| Whether or not the achievement is secret.|
| description| string| The description of the achievement when unlocked.|
| lockedDescription| string| The description of the achievement before it is unlocked.|
| productId| string| The ProductId the achievement was released with.|
| achievementType| **AchievementType** enumeration| The type of achievement (not the same as the previous type on legacy achievements): <ul><li>invalid (0): An unknown and unsupported achievement type.</li><li>persistent (1): An achievement that has no end-date and can be unlocked at any time.</li><li>challenge (2): An achievement that has a specific time window during which it can be unlocked.</li></ul> |
| participationType| **ParticipationType** enumeration| The participation type for the achievement. Valid values are Individual or Group.|
| timeWindow| TimeWindow| The time window during which the achievement may be unlocked. Only supported for Challenges.|
| rewards| array of [Reward](json-reward.md)| The collection of rewards earned when unlocked.|
| estimatedTime| TimeSpan| The estimated time the achievement will take to earn.|
| deeplink| string| A deeplink into the title.|
| isRevoked| Boolean value| Whether or not the achievement is revoked by enforcement.|

<a id="ID4EIAAC"></a>


## Sample JSON syntax


```json
{
        "id":"3",
        "serviceConfigId":"b5dd9daf-0000-0000-0000-000000000000",
        "name":"Default NameString for Microsoft Achievements Sample Achievement 3",
        "titleAssociations":
        [{
                "name":"Microsoft Achievements Sample",
                "id":3051199919,
                "version":"abc"
        }],
        "progressState":"Achieved",
        "progression":
        {
          "requirements":
          [{
            "id":"12345678-1234-1234-1234-123456789012",
            "current":null,
            "target":"100"
          }],
          "timeUnlocked":"2013-01-17T03:19:00.3087016Z",
        },
        "mediaAssets":
        [{
                "name":"Icon Name",
                "type":"Icon",
                "url":"http://www.xbox.com"
        }],
        "platform":"D",
        "isSecret":true,
        "description":"Default DescriptionString for Microsoft Achievements Sample Achievement 3",
        "lockedDescription":"Default UnachievedString for Microsoft Achievements Sample Achievement 3",
        "productId":"12345678-1234-1234-1234-123456789012",
        "achievementType":"Challenge",
        "participationType":"Individual",
        "timeWindow":
        {
                "startDate":"2013-02-01T00:00:00Z",
                "endDate":"2100-07-01T00:00:00Z"
        },
        "rewards":
        [{
                "name":null,
                "description":null,
                "value":"10",
                "type":"Gamerscore",
                "valueType":"Int"
        },
        {
                "name":"Default Name for InAppReward for Microsoft Achievements Sample Achievement 3",
                "description":"Default Description for InAppReward for Microsoft Achievements Sample Achievement 3",
                "value":"1",
                "type":"InApp",
                "valueType":"String"
        }],
        "estimatedTime":"06:12:14",
        "deeplink":"aWFtYWRlZXBsaW5r",
        "isRevoked":false
    }

```


<a id="ID4ERAAC"></a>


## See also

<a id="ID4ETAAC"></a>


##### Parent

[JavaScript Object Notation (JSON) Object Reference](atoc-xboxlivews-reference-json.md)