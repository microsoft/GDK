---
author: jeffshi
title: 'Unreal development for PC: get started (earlier versions)'
description: Describes how to get started with Unreal for PC development.
kindex:
- Getting started with Unreal for PC development (earlier versions)
- Unreal, getting started for PC development (earlier versions)
ms.author: jeffshi
ms.topic: conceptual
edited: '09/13/2021'
security: public
---

# Unreal development for PC: get started (prior to version 4.26)

Use this topic if you are preparing your game for publishing to the Microsoft Store on PC, and your game uses a version of Unreal Engine earlier than 4.26.

## Using an earlier version of Unreal Engine (prior to version 4.26)

If you are using Unreal Engine version 4.26 or later, please refer to [Get started with Unreal on PC](gc-get-started-with-unreal-pc.md)

If you are using Unreal Engine version 4.25 or earlier, and you cannot upgrade to version 4.26 or later, you can still integrate with key Xbox ecosystem experiences using the import libraries of the Gaming Runtime and the Xbox Services API (XSAPI).

These import libraries allow games to call into Gaming Runtime APIs and Xbox Services APIs directly, without having to add a GDK platform target to the game project.

### Add headers and import libraries for Gaming Runtime and Xbox Services API

1. Find the build file for your Unreal project: /Source/(ProjectName)/(ProjectName).Build.cs

1. Add the line below to define the **_GAMING_DESKTOP** macro

    ```csharp
        PublicDefinitions.Add("_GAMING_DESKTOP");  // For Unreal 4.12 or earlier, use "Definitions.Add()" instead
    ```

1. Add the following include paths

    ```csharp
        // Add the include path for Gaming Runtime
        PublicIncludePaths.Add(@"C:\Program Files (x86)\Microsoft GDK\211000\GRDK\GameKit\Include");
        // Add the include path for Xbox Services API (XSAPI)
        PublicIncludePaths.Add(@"C:\Program Files (x86)\Microsoft GDK\211000\GRDK\ExtensionLibraries\Xbox.Services.API.C\DesignTime\CommonConfiguration\Neutral\Include");
    ```

1. Add the following library paths for the import libraries

    ```csharp
        // Add the import library for Gaming Runtime
        PublicAdditionalLibraries.Add(@"C:\Program Files (x86)\Microsoft GDK\211000\GRDK\GameKit\Lib\amd64\xgameruntime.lib");
        // Add the import library for Xbox Services API (XSAPI)
        PublicAdditionalLibraries.Add(@"C:\Program Files (x86)\Microsoft GDK\211000\GRDK\ExtensionLibraries\Xbox.Services.API.C\DesignTime\CommonConfiguration\Neutral\Lib\Release\Microsoft.Xbox.Services.141.GDK.C.Thunks.lib");
    ```

![alert](../../../../resources/gamecore/images/en-us/common/note.gif) **NOTE:** Include paths and library paths might be different on your machine depending on GDK version and install location.

### Access Gaming Runtime and Xbox Live APIs from C++ code files

1. Determine where you would like to add the integration for things like sign-in and unlocking achievements

1. Add headers for Gaming Runtime and Xbox Services API

    ```cpp
        // When using Unreal Engine 4.15 or later
        THIRD_PARTY_INCLUDES_START
        
        #include "XGameRuntimeInit.h" // For Gaming Runtime 
        #include "xsapi-c\services_c.h"  // For Xbox Services API

        // When using Unreal Engine 4.15 or later
        THIRD_PARTY_INCLUDES_END
    ```

1. Integrate with service calls.  See examples below:

* [Sign-in to Xbox Live](../../system/overviews/user/xuser_howto_best_practice_signing_in.md)
* [Update Xbox Live achievements](../../live/features/player-data/achievements/title-managed/how-to/live-how-to-update-achievements.md)

### Create a MicrosoftGame.config file for your game

For the game to sign-in to Xbox Live, you need to include a **MicrosoftGame.config** file in the game package and fill in the "MSAAppId" and "TitleId" fields.\
The easiest way to create the config file is to use the [MicrosoftGame.config Editor](../../system/overviews/microsoft-game-config/MicrosoftGameConfig-Editor.md)\
For more information about the MicrosoftGame.config file, please refer to [MicrosoftGame.config overview](../../system/overviews/microsoft-game-config/MicrosoftGameConfig-Overview.md)

![alert](../../../../resources/gamecore/images/en-us/common/note.gif) **NOTE:** Make sure that the MicrosoftGame.config file is placed in the same directory containing your game's primary executable file.

### Create and register your game package

To sign-in to Xbox Live from your game and test the service integration, you need to create a package and register it.

1. Access the packaging dialog box by selecting **File** > **Package Project** > **Windows** > **Windows (64-bit)**.

1. Choose a folder for the build output from the **File Explorer** dialog box, and then select **Select Folder**.

1. Launch your game with wdapp.

    ```cpp
        wdapp launch {full path to the game's executable in the same directory containing the MicrosoftGame.Config file}
    ```

1. Alternatively, you can register the package with wdapp and then launch the game from Start menu.

    ```cpp
        wdapp register {full path to the directory containing the MicrosoftGame.Config file}
    ```

![alert](../../../../resources/gamecore/images/en-us/common/note.gif) **NOTE:** Double clicking the executable directly will not work for the purpose of signing into Xbox Live.

## See also

[Unreal development forums](https://forums.unrealengine.com/development-discussion/xbox-one-development)\
[Troubleshooting sign-in and sandboxes](../../live/test-release/troubleshooting/live-troubleshoot-sandboxes.md)
