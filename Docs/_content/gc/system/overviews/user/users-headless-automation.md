---
author: M-Stahl
title: Headless automation of XUser
description: Describes how games can use automation with `XUser`.
kindex:
- Headless Automation of XUser
- XUser, automation
- automation, XUser
ms.author: jgup
ms.topic: conceptual
edited: 05/13/2020
security: public
---

# Headless automation of XUser

For testing, games might want to automate the addition of users into their game. With the Microsoft Game Development Kit (GDK), 
users are only added when the game calls [XUserAddAsync](../../../reference/system/xuser/functions/xuseraddasync.md). With respect to 
automation, this function has the following two main limitations.

*  If you call `XUserAddAsync` with the `AddDefaultUserSilently`flag, you don't get UI (which 
   helps with the automation). However, you can only get the user who launched the game.
   Calling the API repeatedly with this flag doesn't change the result. You'll just keep
   getting new handles to the same users.
*  If you call `XUserAddAsync` without the `AddDefaultUserSilently` flag, the UI 
   appears and waits for someone to push a button. This breaks automation. 
   
To aid in the automation of adding users in test code, the Microsoft Game Development Kit (GDK) has support for turning on a 
headless option where you can add users without having UI show that requires user input. The 
following steps outline the basic approach.

1.  To add a signed-in user to the console, you can use the [xbuser (NDA topic)](../../../tools-console/xbox-tools-and-apis/commandlinetools/xbuser.md) 
    command-line tool with the `signin` option. Repeat this step for each user.
2.  To suppress the UI that would usually show when adding a user in the game, you 
    can use the [xbconfig (NDA topic)](../../../tools-console/xbox-tools-and-apis/commandlinetools/xbconfig.md) command-line tool with the `HeadlessXuser` option, shown as follows.
    ```
    xbconfig HeadlessXUser=true
    ```
3.  Launch the game.
4.  When in the game, each call to `XUserAddAsync` that doesn't have the 
    `AddDefaultUserSilently` flag returns the first user who signed in to the console and 
    has no outstanding `XUserHandle` objects associated to them by the game. 
5.  If the game keeps calling `XUserAddAsync`, it eventually exhausts the number 
    of users who are signed in to the console. After this happens, `XUserAddAsync` 
    returns `E_ABORT`. This is the exact same error that `XUserAddAsync` would have returned 
    if the user had canceled out of signing in to the console (or otherwise backed out of the 
    UI).
6.  For testing purposes, games might want to know the number of [test accounts](../../../live/test-release/test-accounts/live-setup-testaccounts.md) that are 
    signed in to the console. To facilitate this, games can call `CreateProcess` and launch 
    the `wduser` command-line tool with the `list` option.
    
    