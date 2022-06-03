---
title: Player Data Reset tool (XblPlayerDataReset.exe)
description: Resets a player's data in test sandboxes.
kindex:
- Player Data Reset tool (XblPlayerDataReset.exe)
- reset tool
ms.topic: conceptual
ms.localizationpriority: medium
author: joannaleecy
ms.author: migreen
ms.date: 03/12/2018
edited: 00/00/0000
security: public
---

# Player Data Reset tool (XblPlayerReset.exe)


The Player Data Reset tool can be used to reset a player's data in test sandboxes.
You can reset data such as; achievements, leaderboards, stats and title history.

This command-line tool is part of the GDK and `XboxLiveTools.zip`; see [Development tools for Xbox Live](live-tools.md).

Custom tools can be created with the [Dev Tools library](https://www.nuget.org/packages/Microsoft.Xbox.Services.DevTools).

XblPlayerReset is used to reset a player's data in test sandboxes.
Data includes achievements, leaderboards, stats and title history.
XblDevAccount.exe signin is required to be called at least once before first use with a developer account that has **Tools access** permissions in Partner Center.

## Tools access permission:
To use the Player Data Reset tool, the developer account used to sign-in (with XblDevAccount.exe) must have proper permission for the specific product.  Note "Tools Access" is not an account level permission, it is a product level permission.  So, you must grant the "Tools Access" permission for every single product you want to reset the player data for.

1. Log in to Partner Center with a developer account that has administrative privileges.
1. Navigate to the Account setting => Users page:  (https://partner.microsoft.com/dashboard/account/usermanagement)
1. Click on the user or group that needs the "Tools Access" permission.
1. If the user or group is currently assigned to a standard role (such as Developer), you need to switch to "Customize permissions".
1. On the next page, move to "Product-level" permissions table, expand the "Xbox Live" table header, and find the "Tools access" column.
1. Explicitly check that box for the products or product groups you want to grant the "Tools Access" permission for.


## Usage:

```
XblPlayerReset.exe –scid xxx --sandbox xxx --xuid xxxx
```


***Success output example:***

```
Player {email} data reset has completed successfully.
```


***Error output example:***

```
Player {email} data reset has completed with errors:
    Leaderboard reset contains error: {errorMessage}
```