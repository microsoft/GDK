---
title: Social Manager memory and performance
description: Memory and performance considerations when using the Social Manager API.
kindex:
- Social Manager memory and performance
- memory and performance, Social Manager
author: joannaleecy
ms.author: migreen
ms.topic: conceptual
ms.assetid: 2540145e-b8e2-4ab5-9390-65e2c9b19792
ms.localizationpriority: medium
ms.date: 04/04/2017
edited: 00/00/0000
security: public
---

# Social Manager memory and performance





## Additional user limits

Social Manager currently has a restriction of 100 added users to the graph.
This is due to two constraints:
1. The maximum number of RTA subscriptions that a user can have is 1100. If a local user has 1000 friends, that only leaves 100 for additional subscriptions.
2. The maximum batch size of users that can be sent to PeopleHub is currently around 100.

Social Manager communicates this by not allowing a social user group from list to contain more than 100 users.
There is a global limit of 100 total additional users that can be in the system at any time via [XblSocialManagerCreateSocialUserGroupFromList](../../../../../reference/live/xsapi-c/social_manager_c/functions/xblsocialmanagercreatesocialusergroupfromlist.md).


## Processing time

Social Manager will have at worst case 1100 users.
The performance characteristics of Social Manager on a Xbox One has a worst case of 0.3 ms to 0.5 ms for [XblSocialManagerDoWork](../../../../../reference/live/xsapi-c/social_manager_c/functions/xblsocialmanagerdowork.md), depending on the number of social graphs created.

The typical case is 0.01 ms for with no groups created and up to 0.2 ms for a group with 1000 users in it.