---
title: Xbox Network integration test cases
description: Recommended policy tests for adding Xbox network features to a PC, mobile or Creators Program game.
kindex: Xbox Network Integration Test Cases For PC
ms.topic: conceptual
ms.localizationpriority: high
author: M-Stahl
ms.author: lukecr
security: public
---

# Recommended Xbox Network Test Cases for PC, Mobile, and Creators Program

Version 2.5 - 4/1/2022

## Introduction
The following test cases are the recommended steps to validate a title when Xbox network services are integrated into a mobile, PC or console device other than Xbox One.

* To view the page offline, use your browser to <a class="printlink">save as PDF/Print</a>.
  
* View the [top ten failing test cases](live-TopFailingTestcases-pc.md) on PC.

<br />

## Base Requirements

#### XR-022: Official Naming Standards \*

Titles must use the naming standards defined in the latest release of the terminology list for the their target device platforms:

* [Xbox Console (NDA topic)](../Console/console-certification-terminology.md) 
* [PC or Mobile](live-terminology-pc.md)

On Xbox consoles, titles must not refer to components of the console system or components of peripherals using terms that are not specifically included in the terminology list.

**Test cases**

>**022-01 Official Naming Standards**
>
>**Test Steps**
>1. Launch the title.
>2. Visit all areas of the title.
>3. Navigate all menus and sub-menus.
>4. Change all available settings and options.
>5. If the title supports saves, save and load all possible game types.
>6. Watch all cinematics.
>7. Note all text shown.  
>
>**Expected Result**  
>All text adheres to the most recent terminology list.  
>
>**Pass Examples**  
>None  
>
>**Fail Examples**
>1. The title uses a proprietary term from a competitive platform.
>2. Title refers to a component of the device or component of a peripheral using any term that is not included in the terminology list.

<br />

#### [XR-074: Loss of Connectivity to Xbox and Partner Services ](../XR/XR074.md) \*

Titles must resolve errors with Xbox network and partner services connectivity. Titles must honor the retry policies set by Xbox network when attempting to retry a request to the Xbox service after a failure has occurred.  Titles must appropriately manage messaging the user when services are unavailable. For example, if a partner service other than the Xbox network is not available, the game should not indicate that there is an issue with the Xbox network.

**Test cases**

>**074-01 WAN Disconnection to Xbox Services**
>
>**Test Steps**  
>1. Sign into an Xbox profile.
>2. While performing the following actions, disconnect the WAN network (if using an Ethernet switch/hub disconnect the uplink cable from the network device. If the device is connected via Wifi, disconnect the uplink cable from the wireless access point) connection:
>* Creating a new save point.
>* Loading a save point.
>* Reaching an auto-save point.
>* Enumerating a list of saved games.
>* Searching for and joining an online session.
>* Attempting to create an online session.
>* Viewing a leaderboard (if applicable).
>* Playing offline.
>
>**Expected Result**  
In the event that the device is unable to reach Xbox services, the title should respond with a user-friendly error message.
>
>**Pass Examples**  
>1. Title displays error message indicating loss of network connection to Xbox services.
>2. Title does not display an error message while playing a local game mode that does not require Xbox services.
>
>**Fail Examples**  
>1. User is unable to complete a non-online Xbox game session.
>2. Title goes into an unresponsive or unstable state.

<br />

>**074-02 Direct Disconnection**
>
>**Test Steps**  
>1. Sign into an Xbox profile.
>2. While performing the following actions in the title, pull the network cable from the device or power off the WAP or wireless router:
>* Creating a new save point.
>* Loading a save point.
>* Reaching an auto-save point.
>* Enumerating a list of saved games.
>* Searching for and joining an online session.
>* Attempting to create an online session.
>* Viewing a leaderboard (if applicable).
>* Playing offline.
>
>**Expected Result**  
In the event the device loses connection to Xbox services, the title should respond with a user-friendly error message.
>
>**Pass Examples**  
>1. The title displays a user-friendly message while in online game mode.
>2. The title does not interrupt game-play during offline game mode.
>
>**Fail Examples**  
>1. An error message is displayed during offline game mode.
>2. The user is able to view online menus or view buffered media after the network goes offline.

<br />

>**074-07 Dynamic Connectivity Loss**
>
>**Tools Needed**
>* Fiddler
>
>**Test Steps**
>1. Sign into an Xbox profile and launch the title.
>2. Access non-Microsoft online feature.
>3. Use Fiddler to emulate downtime.
>
>**Expected Results**  
Title should gracefully handle disconnections to non-Microsoft service.
>
>**Pass Examples**
>1. Title does not hang or crash upon loss of connectivity to the partner-hosted service.
>
>**Fail Examples**
>1. Error displayed implies issues with Microsoft service.
>2. Non-descriptive error message is displayed.
>3. Title crashes or becomes unstable.

<br />

>**074-08 Pre-launch Downtime**
>
>**Tools Needed**
>* Fiddler
>
>**Test Steps**
>1. Use Fiddler to emulate downtime. 
>2. Sign into an Xbox profile and launch the title.
>3. Access non-Microsoft online feature.
>
>**Expected Results**  
Titles should provide a user-friendly error message indicating that there is a problem reaching the non-Microsoft service and should allow an opportunity to retry connection.
>
>**Pass Examples**
>1. Title does not hang or crash upon loss of connectivity to the partner-hosted service.
>
>**Fail Examples**
>1. Error displayed implies issues with Microsoft service.
>2. Non-descriptive error message is displayed.
>3. Title crashes or becomes unstable.

<br />

#### [XR-132: Service Access Limitations](../XR/XR132.md) \*

Titles which exceed [title and user based limits ](/en-us/windows/uwp/xbox-live/using-xbox-live/best-practices/fine-grained-rate-limiting)when calling Xbox network services or do not adhere to Xbox network service retry policies may be subjected to rate limiting, which may result in service interruption or deprecation. Failure to adhere to the specified limits may block a title from release, and in-production issues with released titles may result in Xbox network services suspension up to and including title removal.

**Test cases**

>**132-01 Service Access Limitations**
>
>**Tools Needed**
>1. Fiddler
>2. [Xbox Live Trace Analyzer](https://aka.ms/xboxlivetoolspackage) to parse the output files from Fiddler
>
>**Test Steps**  
>1. With the title running, start a fiddler trace and proceed to move through all areas of the title, including (if supported), but not limited to, the following: 
>* Create a game save, reboot the device and load the game save
>* Change rich presence states in quick succession (if possible)
>* Unlock and view achievements
>* Post to all leaderboards and view all leaderboards using all filters
>* View in-game Friends List (including a friend with presence blocked) and move between pages rapidly
>* Earn and view a Hero Stat
>* Match-make into all online modes, including being unable to find an available session (if possible) and generate voice traffic
>* Create, save and share a game clip
>* Access the in-game store (if applicable)
>2. Once test has concluded, stop the fiddler trace.
>3. In the XDK command prompt, run _xboxlivetraceanalyzer -data filepath -outputdir filepath_
>4. Open the output directory from step 4 and open the 'index' file (select 'Allow blocked content' if prompted).
>
>**Expected Result**  
Games must not display any serious warnings in their Live Trace Analyzer output results. Titles must ensure they keep their service calls to Xbox  endpoints below the specified burst and sustain limits.
>
>**Pass Examples**  
>1. The title does not exceed the sustain limit when calling Xbox services.  
>
>**Fail Examples**  
>1. The title exceeds the sustain limit (limit at which rate limiting takes effect) by 10x. For example, if the sustained limit at which Fine Grain Rate Limiting takes effect is set to 300 calls in 300 seconds, titles at or above 3000 calls in 300 seconds will fail.

<br />

## User profiles

#### [XR-045: Xbox User and Account Privileges ](../XR/XR045.md)\*

The Xbox network provides users with an expected level of privacy and online safety for themselves and their children. In order to deliver on that promise, titles must check the Xbox network service for privileges to complete certain actions on the Xbox network service or in a title experience.

| **Activity**|**ID**|**Privilege Name**|**Notes**|
|-|--|--- |---|
|Playing in a multiplayer game session|254|XPRIVILEGE_MULTIPLAYER_SESSIONS|Allows a user to join online multiplayer gameplay sessions with real-world users (not bots) in scenarios such as: Synchronous player-vs-player gameplay in the same session, asynchronous turn-based gameplay, Team-based gameplay, User-initiated matchmaking, Sending or accepting invitations, Join-in-progress sessions. Note this privilege does not pertain to local multiplayer games run on the same device.
|Playing in a cross network game play session|185|AuthPrivileges.CrossNetworkPlay|Allows a user to participate in a gameplay session with other real-world players who are not signed into Xbox network in scenarios such as: Synchronous player-vs-player gameplay in the same session, asynchronous turn-based gameplay, Team-based gameplay, User-initiated matchmaking, Sending or accepting invitations, Join-in-progress sessions.|
|Communication with anyone |252|XPRIVILEGE_COMMUNICATIONS|Allows a user to communicate with any other Xbox network users through voice or text. |
|Shared gaming sessions|189|XPRIVILEGE_SESSIONS|Allows a user to participate in connected single-player experiences in shared environments or in scenarios where a title is a hybrid free to play and paid multiplayer title and uses this privilege to gate those experiences Xbox consoles. Single player experiences must not have any features covered under privilege 252 or 254 (Communications and Multiplayer, respectively). Use of this privilege is a title capability that requires platform approval.|
|User-generated content (UGC)|247|XPRIVILEGE_USER_CREATED_CONTENT|Allows a user to see other users' UGC online, download other users' UGC, or share their own UGC online. This does not restrict usage of previously downloaded UGC. |
|Sharing to a social network|220|XPRIVILEGE_SOCIAL_NETWORK_SHARING|Xbox consoles Only: Allows a user to share information, including game progress, Kinect-generated content, game clips, and so on outside of the Xbox network.|

Free to play titles, demos, or betas can be configured to allow multiplayer gameplay (ID 254) for players who are not Xbox network Gold subscribers.  This is done via a service side configuration and can be initiated by contacting your Microsoft representative.  These titles must continue to check for the multiplayer game privilege to ensure that parental controls and player choices are respected.

**Test cases**

>**045-01 Respect User Privileges**   
>
>**Test Steps**  
>1. Sign in to a Xbox profile and launch the title.
>2. For each of the privileges identified in the XR, identify if the title supports the associated activity.
>3. For each possible setting of each applicable privilege identified in step [2], perform the following:
>* Exit the title and change the user's settings for the privilege.
>* Restart the device.
>* Sign into the same profile and launch the title.
>* Visit all relevant areas of the title, use all title features relevant to the privilege and verify that the title respects the user's current privilege setting.  
>
>**Expected Result**  
Titles must honor the user's privilege settings.  
>
>**Pass Examples**  
>1. The title respects the user's privilege settings.
>2. The title treats a partial-allow privilege setting as if the privilege is disabled / disallowed (e.g. when the User-generated content (UGC) privilege is set to Friends Only, the title behaves as if the privilege is set to Blocked).
>3. For titles using the Xbox One XDK, the title invokes the system UI to alert the user of any privilege conflicts (titles must use the Store::Product::CheckPrivilegeAsync API).
>4. For titles using XSAPI, the title shows an informative message to let the user know they cannot participate. 
>
>**Fail Examples**  
>1. The title persists a user's privilege settings and does not reflect the user's actual privileges after they have been changed.
>2. The title treats a partial-allow privilege setting as if the privilege is set to its least restrictive setting (e.g. when the User-generated content (UGC) privilege is set to Friends Only, the title behaves as if the privilege is set to Allowed).
>3. For titles using the Xbox One XDK, the title uses in-game messaging to alert the user of any privilege conflicts and does not display the System UI.
>4. For titles using XSAPI, the title does not show an informative message to let the user know they cannot participate.  

<br />

#### [XR-046: Display Name and Gamerpic](../XR/XR046.md) \*

On Xbox consoles, titles must use the Gamertag as their primary display name.
Based on development architecture and design choice titles can choose between the player's modern gamertag (GDK) or their classic gamertag (ERA or GDK)

On non console platforms, while not required, we recommend you use the Xbox network player's gamertag in the appropriate locations within the game title's experience.

The gamertag used must be displayed correctly in the title based on the gamertag type used:

* **Modern Gamertag:**  Display all 16 characters of the unique modern gamertag, which includes up to 12 characters of the modern gamertag, followed by # and the suffix number (if present). For example: Major Nelson (no suffix present) or Major Nelson#881. If modern gamertags are used, all Unicode character ranges available for modern gamertags must be supported. For more modern gamertag information and best practices visit the GDK development documentation article 'Overview of modern gamertags'
* **Classic Gamertag:**  Correctly display all 15 characters of the classic gamertag. Classic gamertags include only ASCII characters a-z, A-Z, 0-9, comma (,), and space (ASCII character 0x20). For example: Major Nelson

In the GDK these items are returned using the **XUserGetGamertag** API.  In ERA the gamertag is obtained using the **GetUserProfileAsync** API.

**Test cases**

>**046-01 Display Name and Gamerpic**  
>
>**Preparation**
>1. To change a gamertag, go to http://social.xbox.com/changegamertag and sign in with the account to change. Note that for all non-retail accounts the URI must be manually modified to indicate the sandbox that the test account resides in or sign-in will result in an error. For example, if the test account exists in the "XXXX.1" sandbox then manually construct the change gamertag URI to http://social.xbox.com/changegamertag?sbx=XXXX.1 to change the gamertag of that account.
>2. Create four test accounts for each of the four following names and change the gamertags on each test account to the following:  
>* **สริฐ众云网ень컴퓨터**  
>* **आचुथाΓώঅহঙぁゖァヺ**  
>* **нøÜsêþåЯЂў**  
>* **Ion**  
>
>**Test Steps**   
>1. Locate and view where gamertags are displayed within the title.
>2. Check to see how the user's gamertag is displayed in all areas identified in Step [1].
>3. If the title displays users' pictures, verify that the correct Microsoft account picture or gamerpic appears for each account.
>
>**Expected Result**  
>The user's gamertag must be displayed correctly.
> 
>**Pass Examples**  
>1. The gamertag correctly shows the Unicode characters (including the auto-generated suffix) when using Modern Gamertag.
>2. The gamertag is correctly shown when using Classic Gamertag.
>
>**Fail Examples**
>1.	The gamertag does not show all Unicode characters correctly (including the auto-generated suffix) when using Modern Gamertag.
>2.	The gamertag is not correctly shown when using Classic Gamertag.

<br />

#### [XR-048: Profile Settings Usage](XR048.md) \*

The Xbox network service is the source for Xbox network user profile information. Games must not store user information sourced from the Xbox network, such as profile data, preferences, or display names, beyond a locally stored cache used to support loss of network connectivity. Any such caches must be updated on the next available connection to the service. 

**Test cases**

>**048-01 Profile Settings Usage**
>
>**Test Steps**  
>1. Select a profile and create a save.
>2. Change user profile data, including updating a gamertag or account name.
>3. Boot the title and load the save made in Step [2].
>4. Verify that the user-profile data visible during gameplay have changed and are not stored in the save game. 
>5. Verify that any reference to the gamertag (created automatically by the title) has been updated. This includes any reference on server-hosted functionality as well as any reference within the title.  
>
>**Expected Result**  
User-profile data must not be stored. For example, if the title uses the gamertag in-game (such as in a welcome message) or on a non-Xbox server (such as naming data that is uploaded), it should not persist if the user changes his or her gamertag. This does not apply if the user has entered the gamertag manually.  
>
>**Pass Examples**  
>1. User-profile data and preference settings are updated in all displays after they have been changed.  
>
>**Fail Examples**  
>1. The title does not display the user's updated gamertag or Microsoft account name within the title for locally stored save data such as replays, saves, options, maps, and teams. 
>2. The title does not update a user's gamertag for persistent posts, such as game clips, replays, leaderboards, or other custom posts, such as messages, bulletin posts, user challenges, costumes, themes, livery, tournaments, and league.
Note: This applies to both new and previously created posts.
>3. The title stores the user's gamertag for the user's saved data, such as replays, saves, options, maps, and teams, resulting in the save data becoming unusable if the user changes his or her gamertag or account name.  

<br />

## Online safety and privacy 

#### [XR-013: Linking Microsoft Accounts with Publisher Accounts \* ](../XR/XR013.md)

On Xbox consoles, titles that use partner-hosted services or accounts that require credentials must link that account with the user's Microsoft account.  

Outside of Xbox consoles, titles can choose to allow account linking to support their game experience.  

If account linking is enabled within the title, the following rules apply: 
* Users must be notified of the account linking and given the choice to opt-out.
* If any account linking or access to partner hosted services is enabled, it must be made available to all users/account types. 
* Linked accounts must be authenticated prior to linking. 
* Users must be provided all applicable terms of use, privacy and other policies within the title (or a notice with a link to such information) both during the linking process and for as long as the accounts are linked.
* Users must have the ability to de-link accounts.

**Test cases**

>**013-01 Linking Microsoft Accounts with Publisher Accounts**
>
>**Test Steps**  
>1. Verify that the title supports or requires non-Xbox accounts or login for services or functionality.
>2. Using a newly created Xbox profile, use the publisher provided service account or login to enter non-Xbox account credentials during initial setup.
>3. Verify the title allows the user to view the terms of use in the app, or informs the user how to view the terms of use, prior to completing the account linking process.
>4. Verify that the user is not prompted to reenter his or her non-Xbox account credentials in any location.
>5. Sign out and sign back in while the title is running.
>6. Repeat Step [4].
>7. Terminate and reactivate the title using the same profile.
>8. Repeat Step [4].
>9. Terminate the title.
>10. Verify that the title does not store non-Xbox account credentials locally by deleting any saved files that may have been created by the title.
>11. Reactivate the title and repeat Step [4].
>12. On a different console, launch the title using the same profile and repeat Step [4].
>13. Verify the title provides a method to view the terms of use while the accounts are linked.
>14. Verify the user is able to unlink their Xbox profile from the non-Xbox account.  
>
>**Expected Result**  
The user should only have to provide his or her credentials once and allows the user to view the terms of use, or informs the user how to view the terms of use, prior to completing the account linking process. Users are provided with a mechanism to unlink their Xbox profile from their non-Xbox account.  
>
>**Pass Examples**  
>1. The title never asks the user to reenter his or her non-Xbox account or login credentials at any point after he or she has initially entered them and the title provides a notification of the terms of use both during the linking process and for as long as the accounts are linked.  
>
>**Fail Examples**  
>1. The title requires the user to enter his or her non-Xbox account or login credentials every time the title is launched.
>2. The title requires the user to enter his or her non-Xbox account or login credentials when running the title from another console.
>3. The title does not provide a method for viewing the terms of use during the account linking process.
>4. The title does not provide a method for viewing the terms of use after the accounts are linked.
>5. The title does not provide a method for unlinking their Xbox profile from their non-Xbox account.  

<br />

#### [XR-015: Managing Player Communication](../XR/XR015.md) \* 

Titles must not transmit user data or allow communication over Xbox network when the user's privacy & online safety settings do not allow it.

Titles meet this XR by retrieving data from Xbox network services. If the title uses its own services, it must check the user's privacy permissions at the beginning of a session or when a new user joins the session. For user-initiated scenarios outside of sessions, titles meet this requirement by checking privacy prior to displaying the user's data and before performing the action. The following list of privacy settings is available for titles to check:

| Permission name |Description |
|-----------------|------------|
|CommunicateUsingText | Check whether or not the user can send a message with text content to the target user. |
|CommunicateUsingVoice |Check whether or not the user can communicate using voice with the target user. |

During the gameplay session, titles which offer communication between Xbox network and non-Xbox network players must offer the ability to mute any non-Xbox network players for the duration of the session.

**Test cases**

>**015-01 User Communication**   
> 
>**Configuration:** 
>* Create a set of profiles with "Others can communicate with voice, text or invites" to Everyone, Friends and Blocked.
>* For titles that support communication outside of Xbox, create a set of profiles with "You can communicate outside of Xbox with voice & text" to Allow, In-game friends and Blocked.
>* Note:  The difference between the "Allow" and "In-game friends" friends options are that "Allow" means you can talk to everyone cross network (including players you meet in random matchmaking). "In-game friends" are people you've explicitly chosen to play with by adding them to an in-game friends list.
>
>**Test Steps**  
>1. On Device 1, sign in to a profile that has been configured with the specific set of permissions per the Configuration.
>2. On Device 2, sign in to a profile that has no communication restrictions.
>3. On both devices, launch the title and attempt to communicate using text, voice (both via Kinect and via the headset), and video in every location supported and attempt to send game invites.
>4. Repeat Steps [1] - [3] for all profiles from the Configuration step.
>
>**Expected Result**  
>Titles must check the Xbox service for a user's permissions regarding privacy and online safety-related actions and must not transmit user data or allow communication over Xbox when the user's privacy & online safety settings do not allow it. 
>
>**Pass Examples**  
>1. The title prevents the user from communicating via voice and text over Xbox when that specific method of communication is configured to be blocked.
>2. The title prevents the user from communicating via voice and text outside of Xbox when that specific method of communication is configured to be blocked.
>3. The title prevents the user from receiving invites on Xbox when that is blocked.
>
>**Fail Examples**  
>1. The user is able to communicate via voice and text over Xbox when that specific method of communication is configured to be blocked.
>2. The user is able to communicate via voice and text outside of Xbox when that specific method of communication is configured to be blocked.
>3. The title allows the user to receive invites on Xbox when that is blocked.  

<br />

>**015-02 Muting Support**   
>
>**Test Steps**  
>1. As user A, mute user B.
>2. Have both users join an Xbox multiplayer session.
>3. Attempt to send voice communication from user B to user A.
>4. Ensure that user A is unable to receive any voice communication from user B.
>
>**Expected Result**  
>User A must not be able to hear communication from user B.  
>
>**Pass Examples**  
>1. Voice communication from the muted user cannot be heard by the user who initiated the mute.
>
>**Fail Examples**  
>1. Voice communication from the muted user can be heard by the user who initiated the mute. 

<br />

>**015-03 Blocked Users**   
>
>**Test Steps**  
>1. As user A, block user B.
>2. Have both users join an Xbox multiplayer session.
>3. Attempt to send voice and written communication from user B to user A.
>4. Locate any title-provided invitation mechanisms (any invitation mechanism that does not utilize the Xbox Shell).
>5. Using each of the mechanisms located in step [4], attempt to send a game invite from user B to user A.
>6. Ensure that user A is unable to receive any communication or invites from user B.
>
>**Expected Result**  
User A must not be able to hear or see communication from user B. User A must not be able to receive game invitations from User B.  
>
>**Pass Examples**  
> 1. Communication from the blocked user cannot be seen or heard by the user who initiated the block.  
> 2. Game invitations from the blocked user are not received by the user who initiated the block.
>
>**Fail Examples**  
> 1. Communication from the blocked user can be seen or heard by the user who initiated the block.
> 2. Game invitations from the blocked user are received by the user who initiated the block. 

<br />

#### [XR-018: User-Generated Content](../XR/XR018.md) \* 

User generated content is content that users contribute to an app or product and can be viewed or accessed by other users in an online state. If your product contains UGC, you must: 

* Publish and make available to users a product terms of service and/or content guidelines for User Generated Content either in game or on a title's website 
* Provide a means for users to report inappropriate or harmful content within the product to the developer for review and removal/disablement if in violation of content guidelines and/or implement a method for proactive detection of inappropriate or harmful UGC (for example, text filtering) 
* Titles must remove/disable UGC when requested by Microsoft 
* Gracefully handle scenarios in which a user does not have access to UGC in game 
* Titles integrated with 3rd party mod platforms must integrate with the product's report / complaint API if available and must moderate content if required by respective 3rd party contracts 
* Titles integrated with 3rd party mod platforms must present a disclaimer, dialog, or visual cue to users if the content is not sourced from the developer

**Test cases**

>**018-01 Reporting Inappropriate Content and UGC Text-String Verification**   
> 
>**Test Steps**  
>1. Identify any areas of the title where text can be entered between non Xbox friends and is then viewable by users on another device.
>2. Verify the title provides a way to report other users' inappropriate content to the title or Microsoft.
>3. If there is no way to report inappropriate content, in each area, enter a string, sub string, etc. that is in the published list of banned words.
>* Enter the banned word directly (i.e. "BannedWord").
>* Enter a banned word with another non-banned word separated by a space i.e. ("Good BannedWord").
>4. If the title allows UGC to be created in an offline state, e.g. character names, disconnect the device from the network, enter banned word combinations and reconnect to the network. 
>5. Verify that the inappropriate string is not visible to any other user on another device.
>5. Repeat Steps [3-5] in each language supported by the title and using banned words from the matching locale.  
>
>**Expected Result**  
>The title must provide a way for users to report other users' inappropriate content; or inappropriate language must either be blocked with an error message, or have the offending words replaced/masked with an inoffensive substitute.  
>
>**Pass Examples**  
> 1. User entered text messaging which is shared real time in game, such as a lobby or in game text overlay, or only between friends is not filtered.  
>2. The title provides a way for users to report other users' inappropriate content to the title or Microsoft.
>3. The title prevents posting of inappropriate language and notifies the user of the reason the posting failed.
>4. The title replaces any inappropriate terms with alternative words or characters (such as [BLOCKED] or [!$%and£$]).
>5. Offensive strings are visible to users on the local console but are not transmitted to other non-Xbox friends beyond the local console.  
>
>**Fail Examples**  
>1. The title does not provide a way for users to report other users' inappropriate content and allows inappropriate strings to be visible to non-Xbox friends on another console.
>2. The title allows the user to circumvent the title's inappropriate content filter by creating UGC in an offline state.  

<br />

## Achievements and awards
The following requirements apply to titles that offer achievements, and awards on the Xbox network.  

#### XR-055: Achievements and Gamerscore \*

Titles must provide the required number (minimum and maximum) of achievements and their associated gamerscore at launch. Titles are permitted to add achievements or gamerscore at any time after launch, with or without corresponding new content, but they cannot exceed title-based or calendar-based limits.

A single achievement cannot exceed 200 gamerscore and all achievements in the title must be achievable.

Item | Launch |Semi-annual additions| Lifetime limit
-----|----|-----|-----
Minimum achievements | 10 | 0 | 10
Maximum achievements | 100 | 100 | 500
Gamerscore | 1000 | 1000 | 5000

Note: "Semi-annual" means January-June, July-December. Base game achievements and Gamerscore do not count towards the semi-annual limits.

**Test cases**

>**055-01 Achievements**
>
>**Test Steps**
>1. Review the amount of Gamerscore and total number of Achievements supported by the title.
>2. Play through the title and attempt to gain as many achievements as possible.
>3. Repeat step [2] after resuming from connected-standby.
>
>**Expected Result**  
All achievements unlock according to their criteria and the maximum possible Gamerscore for the base game's launch is 1000G spread between 10-100 achievements.
>
>**Pass Examples**
>1. All achievements can be gained.
>2. Achievements unlock as per their criteria.
>3. The launch version of the game has 1000 gamerscore spread across 10-100 achievements.
>
>**Fail Examples**
>1. An achievement doesn't unlock when the criteria has been met.
>2. An achievement unlocks before the criteria has been met.
>3. The launch version of the game does not have 1000G.
>4. The launch version of the game has more or fewer than 10-100 achievements.
>5. Achievements do not unlock after resuming from connected-standby.
>6. A single achievement exceeds 200 gamerscore.

<br />

#### [XR-057: Unlocking Achievements](../XR/XR057.md) \*

Users should earn all achievements that are defined by the base game without being required to purchase additional in-game content. Titles can't allow users to earn achievements by simply making purchases. For titles that have achievements that unlock based on a real-money purchase, that achievement should be unlockable through in-game activity or in-game currency that was earned through in-game activity. 

**Test cases**

>**057-01 No Additional Purchases Required for Base Achievements**   
> 
>**Test Steps**  
>1. Review the achievement descriptions on the base title.
>2. Verify that they do not require additional purchases or content.
>3. Gain all achievements.  
>
>**Expected Result**  
All achievements can be gained without being required to purchase additional in-title content.  
>
>**Pass Examples**  
>1. All achievements can be gained without being required to purchase additional in-title content.
>2. No achievements require additional in-title content.  
>
>**Fail Examples**  
>1. The user is required to purchase additional in-title content to unlock an achievement defined by the base title.

<br />

## Multiplayer sessions

The requirements in this category pertain to game titles that provide multiplayer sessions on Xbox. Xbox offers a consistent and simple way to find multiplayer sessions and to fine-tune the parameters used to find those sessions.

#### [XR-064: Joinable Game Sessions and Online Play](../XR/XR064.md)\*

On Xbox consoles, titles that offer joinable game sessions must enable joinability through the Xbox shell interface. 

Titles that offer cross platform multiplayer with Xbox consoles from PC devices using Xbox sign in must also enable joins through the Game Bar experience.

**Test cases**

>**064-01 Joining a Game Session from Outside the Game**
>
>**Configuration: 2 Xbox Profiles**
>* Device 1 Profile A - Friends with Profile B
>* Device 2 Profile B - Friends with Profile A
>
>**Test Steps**
>1. Using Profile A, create a joinable game session.
>2. Using Profile B not running the title, access the Friends List via Game Bar and verify that the Profile A is listed as joinable.
>* It is possible that some games may only support private multiplayer sessions and therefore not appear as joinable for Profile B, in which case please jump to step [5].
>3. Profile B join Profile A's game.
>4. Confirm that both profiles are placed into the game experience together.
>5. Repeat steps [1] - [4] but this time, instead of Profile B joining through Game Bar, have Profile A send a game invite via Game Bar to Profile B and make sure Profile B can receive, accept, and join Profile A.
>
>**Expected Result**  
>User B must be able to join user A's game and progress into the game experience together. For games that only support private multiplayer sessions and therefore do not appear as joinable for Profile B, it is acceptable for invites to be the only mechanism to join Profile A. For multiplayer game sessions that only support joining the session via matchmaking (e.g. ranked matches), it is acceptable to not support joining via Game Bar.  Titles which offer cross platform multiplayer with Xbox consoles must enable joins through the Game Bar experience.
>
>**Pass Examples**
>1. Both profiles are placed into the game experience together.
>2. User B is able to join user A's game and progress into the game experience together.
>3. User A does not appear as joinable in the Friends List via Game Bar because the game only supports private multiplayer sessions, however user A can send user B a game invitation via Game Bar.
>4. User A does not appear as joinable and is unable to send game invites via Game Bar while participating in a session that only supports joining via matchmaking (e.g. ranked matches).
>
>**Fail Examples**
>1. User B is not able to successfully join User A's game and is not placed in the game experience.
>2. User A does not appear as joinable in Game Bar because the game only supports private multiplayer sessions, and user A cannot send user B a game invitation via Game Bar.

<br />

>**064-02 Joining a Game Session from the Same Game**
>
>**Configuration: 2 Xbox Profiles**
>* Device 1 Profile A - Friends with Profile B
>* Device 2 Profile B - Friends with Profile A
>
>**Test Steps**
>1. Using Profile A, launch the title and create a joinable game session within the title.
>2. Using Profile B, launch the same title and enter some experience within the title.
>3. Using Profile B, join Profile A's game via Game Bar.
>* It is possible that some games may only support private multiplayer sessions and therefore do not appear as joinable for Profile B, in which case please jump to step [5].
>4. Confirm that both profiles are placed into the game experience together.
>5. Repeat steps [1] - [4] but this time instead of Profile B joining through Game Bar, have Profile A send a game invite via Game Bar to Profile B and make sure Profile B can receive, accept, and join Profile A.
>
>**Expected Result**  
>User B must be able to join user A's game and progress into the game experience together. For games that only support private multiplayer sessions and therefore do not appear as joinable for Profile B, it is acceptable for invites to be the only mechanism to join Profile A. For multiplayer game sessions that only support joining the session via matchmaking (e.g. ranked matches), it is acceptable to not support joining via Game Bar. Titles which offer cross platform multiplayer with Xbox consoles must enable joins through the Game Bar experience.
>
>**Pass Examples**
>1. Both profiles are placed into the game experience together.
>2. User B is able to join user A's game and progress into the game experience together.
>3. User A does not appear as joinable in Game Bar because the game only supports private multiplayer sessions, however user A can send user B a game invitation via Game Bar.
>4. User A does not appear as joinable and is unable to send game invites via Game Bar while participating in a session that only supports joining via matchmaking (e.g. ranked matches).
>
>**Fail Examples**
>1. User B is not able to successfully join User A's game and is not placed in the game experience.
>2. User A does not appear as joinable in Game Bar because the game only supports private multiplayer sessions, and user A cannot send user B a game invitation via Game Bar.

<br />

>**064-05 Non-Joinable Game**
>
>**Configuration: 3 Xbox Profiles each signed into a different devices**
>* Device 1 Profile A - Friends with Profiles B & C
>* Device 2 Profile B - Friends with Profile A
>* Device 3 Profile C - Friends with Profile A
>
>**Test Steps**
>1. Using Profile A, launch the title and create a joinable game session.
>2. Using Profile A, invite profiles B and C to the game.
>3. Using Profile A, enter a game session so there is only one remaining slot after A joins.
>4. Using Profile B, accept the invite.
>5. Confirm Profiles A & B are playing together.
>6. Using Profile C, accept the invite and attempt to join the game session.
>
>**Expected Result**  
>Profile C is asked to wait until the next opportunity to jump in or Profile C is messaged the reason for the failure to join the game session.
>
>**Pass Examples**
>1. Profile C is asked to wait until the next opportunity to jump in.
>2. Profile C is messaged the reason for the failure to join the game session.
>
>**Fail Examples**
>1. Profile C is not asked to wait until the next opportunity to jump in and Profile C is not messaged for the failure to join.

<br />

#### [XR-067: Maintaining Multiplayer Session State](../XR/XR067.md) \*

On Xbox consoles, titles with online multiplayer functionality must maintain session-state information on the Xbox network.  Titles do this through the Xbox Multiplayer Session Directory (MPSD) or if a title has their own multiplayer session state functionality, they may choose to instead record player interactions using the Multiplayer Activity Recent Player feature.

On devices other than Xbox consoles, titles which offer cross platform multiplayer with Xbox consoles must maintain session-state information in the Xbox Multiplayer Session Directory (MPSD).   If they have their own session state functionality,  they may choose to instead record player interactions using the Multiplayer Activity Recent Player feature.

**Test cases**

>**067-01 Maintaining Session State**
>
>**Test Steps**
>1. Sign into an Xbox profile and launch the title on multiple devices.
>2. Complete an Xbox game session with all players.
>3. Using the Xbox App for Windows PCs (or Game Bar), view the recent players to verify that all players from the game session are included 
>4. Repeat steps [1] - [3] several more times but this time using new accounts each time.
>5. Repeat steps [1] - [4] but this time have one or more player(s) leave during gameplay and ensure their profile(s) still appear in the Recent Players list during step [2].
>
>**Expected Result**  
>Users must be able to review all players from each and every recently played game session.
>
>**Pass Examples**
>1. All profiles are included in the device's Recent Players list.
>
>**Fail Examples**
>1. Not all the profiles are included in the device's Recent Players list.
>2. Users who quit during multiplayer gameplay do not appear in Recent Players.

<br />

-------

## Pre-certification testing of the build

The following tests (BVTs) are used to check a title's readiness for Xbox Certification testing.

**Certification BVT Test Cases**

>**BVT-01 Build Stability**   
>
>**Test Steps**  
>1. Launch the title, navigate all menus and enter gameplay.
>2. Attempt to reproduce stability issues found while performing other BVTs.
>
>**Expected Result**  
>The title must not have stability issues or long load times that would block full XR testing of the title.

<br />

>**BVT-02 Device and Xbox network sign-in**  
>**Preparation:**  
>* PC in the appropriate sandbox
>* A new Xbox profile
>* Xbox App
>
>**Test Steps:**  
>1. Sign into an Xbox profile, launch the Xbox app and ensure the profile has no previous achievement data for the title.
>* For titles that don't support integration with the Xbox Network, ensure the profile does not have an existing license for the title.
>2. Launch the title and verify if the title supports the Xbox Network. 
>* If there is no visual indication of successful sign in launch the title without an Xbox profile signed into the Xbox app and check if the user is prompted to sign in.
>3. Ensure that the user is prompted to accept the explicit consent dialog prompt.
>4.	Verify the user can enter gameplay.
>
>**Expected Results:**  
The device sandbox is set correctly for the submission type, and a profile that has not seen the title before can sign in and successfully launch the title.

<br />

>**BVT-03 Dependencies**  
>**Preparation:**  
>* PC with clean installation of windows 
>* A new Xbox profile
>* Xbox App
>
>**Test Steps:**  
>1. Verify the title is built using the GDK.
>2.	Remove all package dependencies from the device, except anything listed under vclibs.140.
>3.	Sign into an Xbox profile and begin installing the title.
>4.	Verify if the title pulls additional packages during installation.
>5.	Once installation completes, launch the title and verify the title functions as expected with only those packages installed during installation.
>
>**Expected Result:**  
The title is fully functional using only the packages downloaded.

<br />

>**BVT-04 Matchmaking**   
>
>**Test Steps**   
>1.	Device 1: Select the most basic Xbox game mode and host an Xbox game session.
>2.	Device 2: Join Device 1's Xbox game session using quick match. (Repeat this step until the minimum number of devices has joined in-order-to start the game session.)
>3.	Device 1 and 2: Start and complete the Xbox game session.
>4.	Verify matchmaking works and users can enter gameplay in all other supported game modes.  
>
>**Expected Result**  
Device 2 should always be able to locate and join Device 1's game session. Both devices should be able to complete the Xbox game session without being disconnected or encountering stability issues.

<br />

>**BVT-05 DLC**     
>
>**Test Steps**  
>1. Verify that the downloadable content submitted with the game is downloadable using the Xbox Store or an in-game mechanic.
>2. Once downloaded, verify that the content can be easily identified in the game. (A detailed downloadable content description provided with the submission materials helps the certification team to find the downloadable content.)  
>
>**Expected Result**  
>The downloadable content submitted with the title must be downloadable using Xbox Store or an in-game UI and once downloaded, should be easily identifiable in the game.

<br />

>**BVT-06 Languages**     
>
>**Test Steps**  
>1. Ensure that the devices 'Windows display language' setting is set to English.
>2. Progress into the title.
>3. Verify that the title
>* Does not crash or enter an unresponsive state
>* Does not output any debug on screen.
>* Implements localization in all intended areas.
>4. Repeat steps 1 - 4 for all languages supported by the title.  
>
>**Expected Result**  
>The title contains all supported languages. The title should also not contain stability issues or debug that are language specific.

<br />

>**BVT-07 Basic Configuration**   
>
>**Test Steps**  
>1. Launch the title and ensure all BVT feature checks do not require changes to the PC settings such as Time/Date to work.
>2. Verify that a workaround is not required to reach the main menu of the title.  
>
>**Expected Result**  
>Basic functionality is expected to be working when a title is entering Certification.

<br />

>**BVT-08 Xbox Store Availability**   
>**Tools Needed:**  
>* Submission ingested into Certification debug and retail sandboxes  
>
>**Test Steps**  
>1. Sign in and attempt to install the title via the Store.
>2. Upon completion of installation, attempt to launch title and reach the IIS.
>
>**Expected Result**  
>Titles must be able to be installed and launched while in the Certification debug and retail sandboxes.

<br />

>**BVT-09 Conditions for Resubmission**   
>
>**Test Steps**  
>1. Attempt to reproduce all issues flagged as CFRs in the most recent report for the title.
>2. Verify that any of the issues that reproduce have been granted exceptions.  
>
>**Expected Result**  
>Issues marked as CFR in the previous report have been fixed unless an exception has been granted through the established exception process.  

<br />

>**BVT-10 Version Check**     
>
>**Test Steps**  
>1. Install the title.
>2. Navigate to _C:/Program Files/Windowsapps_ and compare the installed folder name with the version listed in the submission form.
>3. Compare the name of the installed MSIXVC with the name listed in the submission form.  
>
>**Expected Result**  
>The name of the installed MSIXVC matches exactly with that called out in the submission documents.  
  
<br />

>**BVT-11 Service Config Validation**     
>
>**Test Steps**
>1. Sign into an Xbox profile that has not previously accessed the title.
>2. Launch the title.
>3. Ensure that the user is prompted to accept the Xbox network account permissions.
>4. Check the title for a service config:
>* For non-MSIXVC submissions, verify the installed package includes an _xboxservices.config_ file, and that the file is greater than 0 KB.
>* For MSIXVC submissions, verify the installed package includes a _Microsoft.gameconfig_ file.
>
>**Expected Result**  
The title's service config must be configured for test.
