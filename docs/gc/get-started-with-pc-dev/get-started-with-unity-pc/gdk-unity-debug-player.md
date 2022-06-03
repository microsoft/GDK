---
author: sdgmiller
title: Debug a packaged GDK Game with Unity
description: Provides instructions for debugging a packaged GDK game with Unity.
kindex:
- Unity debugging
- debugging, Unity
ms.author: gershp
ms.topic: conceptual
edited: 00/00/0000
security: public
---

# Debug a packaged GDK game with Unity

This topic will teach you how to debug a GDK game with Unity.


## Overview

Some GDK platform features do not work in the editor, only a [packaged GDK build](features/gdk-unity-build-and-run.md). In order to set breakpoints and debug your code in a packaged version of your GDK game, follow the instructions below.

## How to debug
1. In the Unity Editor's main menu, go to **File** > **Build Settings...** to open the Build Settings dialog.
2. In the Build Settings dialog, make sure you have **PC, Mac & Linux Standalone** as the platform.
3. Make sure the **Development Build**, **Script Debugging** checkboxes are checked. If you are using Unity 2018+, you can also check the **Wait For Managed Debugger** checkbox to debug your games startup code.  
![Screenshot of Build Settings in Unity](../../../../resources/gamecore/secure/images/en-us/gdk_unity_debug_player_settings.png)
4. Close the Build Settings dialog.
5. In the Unity Editor's the main menu, select the GDK > Build and Run menu option.
6. Click the **Build and Run** button to build and launch your game.
7. Once your game has launched, go to Visual Studio and select Attach Unity Debugger.  
![Screenshot of Attach Unity Debugger in Visual Studio](../../../../resources/gamecore/secure/images/en-us/gdk_unity_attach_to_player.png)
8. In the **Select Unity Instance** dialog, select the player.
9. Now you can set breakpoints, inspect variables and other take other debugging actions.

