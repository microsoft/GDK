---
title: PC Game Pass Quality Standards
description: Describes the quality standards and policies for games in the PC Game Pass subscription.
kindex:
- PC Game Pass Quality Standards
- quality standards
- game pass
ms.topic: conceptual
ms.localizationpriority: medium
author: M-Stahl
ms.author: michfu
ms.date: 07/01/2021
edited: 07/01/2021
security: public
---

# PC Game Pass Quality Standards

This topic describes the quality standards and policies for games in the PC Game Pass subscription.

The PC Game Pass Quality standards are a subset of the Xbox Requirements and modified for PC games.  They are designed to ensure that games are of high integrity, display properly on the most popular PC screen resolutions, and that game saves work initially and after any patches.

Currently the standards are in introductory phase, and we will begin testing PC Game Pass titles against these standards and report on issues found.  However, because we are just introducing them, we will not currently fail a title for these issues.  The test pass results are intended to inform you, the developer of any significant issues found.  At a later date after these standards have been publicized and known, we may begin failing titles for major bugs.

## Title Integrity and Functionality

**Functionally Complete and Testable:** The title submission must include all client code, submission artifacts, and downloadable content. Partner services must be available and properly configured for testing and certification. 

**Title Integrity:** Users must be able to complete all game modes and the title must provide a consistently playable experience for players. A playable experience varies per title, but generally means no severe drops in frame rate, no freezes, impasses, bugs causing major progression hindrances, or graphical corruptions. 

**Options and Settings:** Game Settings, such as options, controls, and languages are applied correctly when updated in game and after terminating and launching the title again.  

**Navigation and Content Availability:** There are no dead ends in content, the game menus can be navigated and all content is available (where appropriate). 

**Multiplayer:** Gameplay functions with the allowed number of local or online multiplayer players: Using supported modes, the gameplay modes function using the supported mix of local or online players 

### Test Cases

#### **Title Integrity**

**Test Steps**
1. Launch the title. 
2. Navigate through all menus and sub-menus, review all types of media and/or features, and enter and complete all game modes.
3. Navigate, interact, and complete all menu UIs, extra content, single player modes, and multiplayer modes, including any additional features. Test in offline, online, and split-screen, if applicable. Test multiplayer game modes with the maximum number of players whenever possible. 

**Expected Result**  
All titles must provide users with a reliable, fair, consistent, and complete entertainment experience. 

**Pass Examples**
1. The title can be completed in all modes. 

**Fail Examples** 
1. The title crashes at the end of a given level. 
2. A particular mode cannot be completed if the user has already completed a different mode. 

#### **Options**

**Test Steps**
1. Launch the title.
2. Set a spread of various options across the test team such that every available value is tested for each option setting. 
3. Check that all settings and options within the title's menus are correctly reflected in the end-user experience (for example difficulty, game controller, keyboard & mouse, audio volume, preset video settings, advanced video settings, and so on).
4. Terminate the title and then ensure that all settings and options persist after re-launching the title. 
5. Have the test team change their option settings in all areas of the title throughout test and verify that these are accurately reflected throughout the title. 

**Expected Result**  
All option settings within a title must work as expected and options and settings values must persist after re-launching the title. 

**Pass Examples**

1. With the in-game language option set to Dutch, the title uses only Dutch subtitles. 

**Fail Examples**
1. If the user inverts the horizontal or vertical camera controls with the pause menu, the camera controls do not change in-game. 
2. Any options values set during gameplay are reset to default after terminating and re-launching the title.

#### **Navigation**
1. Launch the title.
2. Navigate through all menu and option screens (front-end, in-game, and other areas) with keyboard & mouse, and controller when supported, ensuring that all the navigation buttons function as expected. If button labels or command prompts are displayed within any menu UI, verify that each command can be issued correctly.

**Expected Result**  
Navigation commands must function as expected.

**Pass Examples**
1. All areas of the title can be navigated as expected.

**Fail Examples**
1. When entering certain menus, the title displays imagery associated with a button on the controller that has no action when pressed.

## Hardware and Resolution Compatibility

**Hardware Support:** Games must support various configuration (resolution changes, etc.) for minimum supported hardware as declared by the developer (graphics drivers, etc.).  

### Test Cases 

**Test Steps** 
1. Ensure the latest manufacturers GPU drivers are installed.
2. Launch the title and enter game play.
3. Test fully expanded Windowed mode in 1366 x 768, 1440 x 900,1080P, 1440P, & 4K. 
4. Test full-screen mode, if available, in 1366 x 768, 1440 x 900,1080P, 1440P, & 4K.
5. Repeat [1-4] for a variety of CPU and GPU SKUs.
6. Test the game title's listed minimum hardware requirements.  As the hardware is available, repeat testing [1-4] across a variety of low, medium, and high-end CPUs & GPUs.

**Expected Result**  
The game title displays correctly across both Windowed and Full-screen if supported, the five most used screen resolutions above, and a variety of GPU/CPU configs.

**Pass Examples**
1. The title displays correctly across the hardware & resolution matrix and both Windowed & Full-screen. 

**Fail Examples**
1. The game displays correctly in Windowed but is corrupted in Full-screen. 

## Save Game and Update Compatibility

**Save Game Compatibility:** Game saves must correctly save the player's progress.  Saves must continue to function post application of any new patches.  

### Test Cases 

**Test Steps** 
1. Enter gameplay and proceed far enough to manually save game progress or trigger an auto-save in each mode (such as game progress, options and settings, avatar creation, and so on). 
2. Reboot the title and verify that you can load and resume the game-save progress from Step [1]. 
3. Download the content update for the base title. 
4. With the content update applied, verify that you can still load and resume the game-save progress made in Step [1]. 

**Expected Result**  
A content-updated version of a title must be able to successfully load a game save created using the non-content-updated version of the title. 

**Pass Examples**
1. All saves can be loaded successfully by a content-updated version of a title. 

**Fail Examples**
1. The content-updated version of the title is unable to load a previous game save that was made during Step [2]. 
2. Game progress is not restored after restarting the title and loading the save. 

## See also 

[Xbox Network Policies for PC and mobile](/gaming/xbox-live/policies/live-policies-pc) 

[Xbox Requirements](https://developer.microsoft.com/games/xbox/partner/certification-requirements)