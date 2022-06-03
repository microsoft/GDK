---
title: Test Account tool (XblTestAccountGui.exe)
description: Sets up existing test accounts for testing game scenarios.
kindex:
- Test Account tool (XblTestAccountGui.exe)
- account tool
- XblTestAccountGui.exe
ms.topic: conceptual
ms.localizationpriority: medium
author: joannaleecy
ms.author: migreen
ms.date: 03/12/2018
edited: 00/00/0000
security: public
---

# Xbox Live Test Account tool (XblTestAccountGui.exe)





The Xbox Live Test Account tool  (XBLAT) helps title developers set up existing dev accounts for testing game scenarios.
For example, you can use the Xbox Live Test Account tool  to change a dev account's gamertag, or to add 1000 followers to an account's friends list.
For more details, see the May 4, 2016 forum post [Xbox Live Developer Tools for Xbox One developers are now available in their own tools package](https://www.aka.ms/XboxLiveAccountTool) at forums.xboxlive.com.  




## What can I do with the Xbox Live Test Account tool?

You can:
*  View a user's profile settings, XUID, and active privileges.
*  Follow, block, or mute a list of xuids for a user, either from a text file or a Partner Center csv.
*  Manage a user's friends list: unfollow, favorite, unfavorite, block, unblock, mute, and unmute users you follow, and see if they follow you back.
*  Change your dev user's reputation (and see the raw reputation stat values immediately).
*  Change a user's gamertag.
*  Change a user's privacy settings and privileges.
*  Lookup gamertags by xuid.
*  Make Xbox Live authenticated http calls.


## Where can I find the Xbox Live Test Account tool?

This command-line tool is part of the GDK and `XboxLiveTools.zip`; see [Development tools for Xbox Live](live-tools.md).


## How do I log in?

You'll need the credentials of the user you want to manage and specify the correct sandbox.
Make sure that the dev account has access to the sandbox, otherwise the login might fail.

The tool was designed with dev accounts using a sandbox in mind.


## How do I change a dev user's gamertag?

Navigate to the **Gamertag** tab and enter a gamertag.
Gamertags must only contain numbers, letters, and spaces and can be only 15 characters long.

Dev account gamertags must start with a 2.

Only one change is currently supported.


## How do I see my block list?

Navigate to the **People** tab and select the **Blocked** column header to sort by users who are currently blocked.


## How do I follow a large group of users?

1. If you have a list of XUIDs you want to follow, copy them into a text file.

2. Navigate to the **Follow** tab, select **Import list**, and choose your file.

   The XUIDs populate in the list view.

3. Click **Commit Changes** to follow the users.

The following throttle limits apply to adding followers:

 - 100 follows per 30 seconds per player account
 - 500 follows per 12 hours per player account

Calls exceeding these limits will result in failure responses from the service.


## How do I block someone?

1. Navigate to the **People** tab, then select the user or users you want to block.

2. Click the **block** button.

   The users will get blocked in batches.

If you notice an error, retry again later.


## How do I change my dev account's reputation?

Navigate to the **Reputation** tab.
Select the defaults you'd like, and press the **Commit changes** button to submit the request.

If the request is successful, you'll see the reputation stat values change.


## What do the values in the Reputation tab mean?

Overall reputation is computed from three sub-reputations: Fairplay (multiplayer conduct), user-generated content (video clips and the like), and communications (messages and voice).
The raw values for each category can range from 0 to 75, where higher means the user's reputation is better.

`OverallStatIsBad` tells you if the user has "Avoid Me" reputation.


## What's the black area at the bottom?

To keep you informed, we thought that it would be useful if debug output printed in the UI.
That area will tell you what the tool is up to and print any errors it runs into.


## Where's my gamerpic?

We're aware of a bug that some dev accounts do not get a gamerpic auto-generated at account creation time.


## Why are things happening so slowly?

For the batch operations (like adding followers), the tool automatically performs batches to prevent huge request sizes.


## How do I run the Xbox Live Test Account tool?

Extract Xbox Live SDK to a folder, and double-click the `Tools\XblTestAccountGui.exe` file to run it.


## I have a feature request! How do I get my feature incorporated?

Talk to your Microsoft representative with any feature requests and we'll see what we can do.


### See also

* [Creating test accounts](../test-accounts/live-setup-testaccounts.md)