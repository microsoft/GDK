---
title: Title Storage overview
description: Describes what Xbox Live Title Storage is, what its features are, and demonstrates how to configure them.
kindex: Title Storage overview
author: joannaleecy
ms.author: migreen
ms.topic: conceptual
ms.assetid: a4182bc8-d232-4e77-93ae-97fe17ac71b1
ms.localizationpriority: medium
ms.date: 04/04/2017
edited: 02/02/2021
security: public
---

# Xbox Live Title Storage overview

This topic describes what Xbox Live Title Storage is, what its features are, and demonstrates how to configure them.
The Xbox Live Title Storage service provides cloud storage for large amounts of per-player  or per-game data. You can use it for storing player statistics and assets. Games running on all Xbox platforms can use Title Storage.

<a name="ID4EW"></a>

## Features of Xbox Live Title Storage

Xbox Live Title Storage includes the following high-level features.

* Can be shared across players, titles, and various platforms

* Supports JSON, binary, and configuration files

<a name="ID4ETB"></a>

## Types of storage

| Storage type | Quota (Managed Partners) | Quota (Creators Program) | Purpose | Platforms | Players  |
|-------------------|-------------------------------------|------------------------------------|-------------|--------------|-----------|
| Trusted Platform | 256 MB per player  | 64 MB per player | Per-player data such as saved games or game state for play/pause/resume. More secure, but with platform restrictions. | Any platform may read, but only Xbox One family (or later), Xbox  360, or Windows  Phone may write. | Configurable to public or owner only. |
| Universal Platform | 64 MB per player | 64 MB per player | Per-player data such as saved games or game state for play/pause/resume. | Any platform may read or write. | Configurable to public or owner only. |
| Global | 256 MB | 256 MB | Data that everyone can read, such as rosters, maps, challenges, or art resources. | Only writeable via the Xbox Developer Portal or Partner Center, any platform may read. | All players may read. |

## Throttle limit

There are no limits to how many reads and writes a title can make per minute, but it generally can't make more than one per minute on average, per one-hour session. For example, a title can make 60 reads or writes at the beginning of a session, but no more for the remainder of the hour. Titles should be hardened against making more calls later, in case Xbox Live services needs to throttle the requests.
> [!NOTE]
> If your title has special partitioning requirements, such as extra reads or writes, contact your Microsoft  representative.

<a name="ID4ECF"></a>

## Types of data

This section describes the three supported types.

* [Binary information](#ID4ENF)
* [JSON information](#ID4EUF)
* [Configuration information](#ID4ECAAC)

<a name="ID4ENF"></a>

#### Binary information

Binary information includes things like images, sounds, and custom data. Because the data must be transmitted over HTTP, binary data must be encoded into characters that HTTP accepts. For example, you can convert the data to hexadecimal strings, or use base64 encoding. Title Storage doesn't process encoded data, so your game must use the same scheme for encoding and decoding data when reading from and writing to Title Storage.

<a name="ID4EUF"></a>

#### JSON information

JSON information includes structured data (key-value pairs). You can use JSON objects in languages that support them, like JavaScript. When you retrieve data from JSON files, the game can supply a `selectQuery` parameter to return specific items within the structure. For example, you could use a JSON file that contains the following information.

```json
{
"difficulty" : 1,
"level" :
    [
        { "number" : "1", "quest" : "swords" },
        { "number" : "2", "quest" : "iron" },
        { "number" : "3", "quest" : "gold" },
        { "number" : "4", "quest" : "queen" }
        ],
"weapon" :
    {
            "name" : "poison",
            "timeleft" : "2mins"
    }
}
```
> [!NOTE]
> For security purposes, the first element of the JSON data must not be an array. JSON data submitted with an array at the root is rejected by the service.

Your game can  select portions of the JSON structure as a `selectQuery` (for example, `weapon.name`), and then it receives the following:

```json
{
    "name" : "poison"
}
```

<a name="ID4ECAAC"></a>

#### Configuration information

Configuration blobs are data structures that are stored in global title storage. The format of a configuration blob is similar to that of a JSON object. Configuration blobs can include virtual nodes that return a setting from a list of possibilities. Virtual nodes are useful for providing settings for specific situations such as for a title or locale. The virtual node includes several possible settings along with values and conditions for selecting from the values. In the following example, the `defaultCardDesign` setting can have one of the values in the virtual node.

```json
{
    "defaultCardDesign":
    {
    "_virtualNode":
    {
        "_selectBy":"titleId",
        "_sourceNodes":
        [
        {"_selector":"123456799", "_data":"RobotUnicornCard.png,binary"},
        {"_selector":"default", "_data":"StandardCard.png,binary"}
        ]
    }
    },
}
```

When a game reads this file, the system selects one of the values from the `\_sourceNodes` array. In this case, the item is selected based on the game's title ID. For example, players playing the game `12456799` would see the following:

```json
{
    "defaultCardDesign":"RobotUnicornCard.png,binary",
    "_sourceNodes":["defaultCardDesign:titleID:1234567899"]
}
```

Players not playing the game would see the following:

```json
{
    "defaultCardDesign":"StandardCard.png,binary",
    "_sourceNodes":["defaultCardDesign:titleID:default"]
}
```

Games can define custom selectors that match a parameter in the request. For example, consider the following JSON object in this configuration blob.

```json
{
    "defaultCardDesign":
    {
        "_virtualNode":
        {
            "_selectBy":"custom:gameMode",
            "_sourceNodes":
            [
                {"_selector":"silly", "_data":"RobotUnicornCard.png,binary"},
                {"_selector":"serious", "_data":"SeriousCard.png,binary"},
                {"_selector":"default", "_data":"StandardCard.png,binary"}
                ]
        }
    },
    "backgroundColor":"green",
    "dealerHitsOnSoft17":true
}
```

Games pass a string in the `customSelector` parameter to select which item to return. For example, to get the second option, a game requests `gameMode.serious` as a `selectQuery`.

<a name="ID4E5EAC"></a>

## To get started using Xbox Live Title Storage

1. Determine which kind of data you want to store. Examples include saved games, game state, daily challenges, game maps, and art resources.

2. Determine what titles and platforms need to access the data. Title Storage supports cloud data access from a single title on a single platform, and from multiple titles on multiple platforms .