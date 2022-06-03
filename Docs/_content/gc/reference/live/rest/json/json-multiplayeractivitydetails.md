---
title: MultiplayerActivityDetails (JSON)
description: " MultiplayerActivityDetails (JSON)"
ms.date: 10/12/2017
ms.topic: article
keywords: xbox live, xbox, games, uwp, windows 10, xbox one
ms.author: joanlee
security: public
author: joannaleecy
---

# MultiplayerActivityDetails (JSON)
A JSON object representing the **Microsoft.Xbox.Services.Multiplayer.MultiplayerActivityDetails**. 

> **Note:**   
> This object is implemented by the 2015 Multiplayer and applies only to that multiplayer version and later. It is intended for use with template contract 104/105 or later.  

 
<a id="ID4ES"></a>

  
 
The MultiplayerActivityDetails JSON object has the following specification.
 
| Member| Type| Description| 
| --- | --- | --- | --- | 
| SessionReference| MultiplayerSessionReference| A <b>Microsoft.Xbox.Services.Multiplayer.MultiplayerSessionReference</b> object representing identifying information for the session.| 
| HandleId| 64-bit unsigned integer| The handle ID corresponding to the activity.| 
| TitleId| 32-bit unsigned integer| The title ID that should be launched in order to join the activity.| 
| Visibility| MultiplayerSessionVisibility| A <b>Microsoft.Xbox.Services.Multiplayer.MultiplayerSessionVisibility</b> value indicating the visibility state of the session.| 
| JoinRestriction| MultiplayerSessionJoinRestriction| A <b>Microsoft.Xbox.Services.Multiplayer.MultiplayerSessionJoinRestriction</b> value indicating the join restriction for the session. This restriction applies if the visiblity field is set to "open".| 
| Closed| Boolean value| True if the session is temporarily closed for joining, and false otherwise.| 
| OwnerXboxUserId| 64-bit unsigned integer| Xbox user ID of the member who owns the activity.| 
| MaxMembersCount| 32-bit unsigned integer| Number of total slots.| 
| MembersCount| 32-bit unsigned integer| Number of slots occupied.| 
  
<a id="ID4E3D"></a>

 
## Sample JSON syntax
 

```json
{
  "results": [{
    "id": "11111111-ebe0-42da-885f-033860a818f6",
    "type": "activity",
    "version": 1,
    "sessionRef": {
      "scid": "8dfb0100-ebe0-42da-885f-033860a818f6",
      "templateName": "party",
      "name": "e3a836aeac6f4cbe9bcab985494d3175"
    },
    "titleId": "1234567",
    "ownerXuid": "3212",

    // Only if ?include=relatedInfo
    "relatedInfo": {
      "visibility": "open",
      "joinRestriction": "followed",
      "closed": true,
      "maxMembersCount": 8,
      "membersCount": 4,
    }
  },
  {
    "id": "11111111-ebe0-42da-885f-033860a818f7",
    "type": "activity",
    "version": 1,
    "sessionRef": {
      "scid": "8dfb0100-ebe0-42da-885f-033860a818f6",
      "templateName": "TitleStorageTestDefault",
      "name": "795fcaa7-8377-4281-bd7e-e86c12843632"
    },
    "titleId": "1234567",
    "ownerXuid": "3212",

    // Only if ?include=relatedInfo
    "relatedInfo": {
      "visibility": "open",
      "joinRestriction": "followed",
      "closed": false,
      "maxMembersCount": 8,
      "membersCount": 4,
    }
  }]
}
    
```

  
<a id="ID4EFE"></a>

 
## See also
 
<a id="ID4EHE"></a>

 
##### Parent 

[JavaScript Object Notation (JSON) Object Reference](atoc-xboxlivews-reference-json.md)

   