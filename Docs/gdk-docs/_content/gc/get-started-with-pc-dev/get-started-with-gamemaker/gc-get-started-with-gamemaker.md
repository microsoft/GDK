---
author: sdgmiller
title: 'GameMaker development for PC: get started'
description: Describes how to get started with GameMaker for PC development.
kindex:
- Getting started with GameMaker for PC development
- GameMaker, getting started for PC development
ms.author: scotmi
ms.topic: conceptual
edited: 11/11/2020
security: public
---

# GameMaker development for PC: get started

<a id="summarySection"></a> 
Use this topic to prepare your GameMaker game for publishing to the Microsoft Store.  









* [Creating a product in Partner Center](#CreatingAProductInPartnerCenter)
* [Required software](#RequiredSoftware)
* [GameMaker Studio 2](#GameMakerStudio2)
* [GameMaker Studio 2 - GDK Extension](#GDKExtension)
* [Building the GDK Extension](#BuildingTheExtension)
* [Testing the GDK Extension](#TestingTheGDKExtension)
* [Updating MicrosoftGame.config](#UpdatingTheConfig)
* [Integrating the GDK extension into your own project](#IntegratingTheGDKInYourProject)
* [Testing Xbox services in your game](#TestingXboxServices)
* [Publishing](#Publishing)

<a id="CreatingAProductInPartnerCenter"></a>

## Creating a product in Partner Center  

Before you can publish a game to the Microsoft Store, you need to create your Xbox Live-enabled product in Partner Center. For more information about Partner Center, see [Setting up an app or game in Partner Center, for Managed Partners](/gaming/xbox-live/get-started/setup-partner-center/live-setup-partner-center-partners).

<a id="RequiredSoftware"></a>

## Required software

The following tools and SDKs need to be installed to use GameMaker Studio 2 with the GDK:  

* [VS2019](https://visualstudio.microsoft.com/downloads/)  
* [GDK](https://github.com/microsoft/GDK/releases/tag/October_2021_Republish)  
* [CMAKE](https://cmake.org/download/)
  * Be sure to set the installer to update the system paths or the extension project will not be able to find CMake.

<a id="GameMakerStudio2"></a>

## GameMaker Studio 2

If you don't already have GameMaker Studio 2 installed, download and install it from [https://www.yoyogames.com/](https://www.yoyogames.com/).

<a id="GDKExtension"></a>

## GameMaker Studio 2 - GDK Extension

The GameMaker Studio 2 GDK Extension is required to use the GDK with GameMaker Studio 2.  
The source for the GameMaker Studio 2 GDK Extension and setup instructions for it are available here:  
[https://github.com/YoYoGames/GDKExtension](https://github.com/YoYoGames/GDKExtension)

Follow the steps listed in the README file at the root of the repo. When cloning the GDKExtension repo be sure to use the **--recurse-submodules** switch to include the submodules or required files will be missing when you try to build the solution.

The extension has a building guide and quick start guide under **GDK_Project_GMS2/datafiles/GDK_Extension_Documentation.pdf**. The guide includes documentation of the GDK extension APIs for Game Maker Studio.

<a id="BuildingTheExtension"></a>

## Building the GDK Extension

Once you have all the required software and have cloned the Game Maker Studio 2 GDK Extension repo, you can build the extension using Visual Studio 2019 and the GDKExtension.sln under the **DLL** subdirectory of the extension repo. For detailed building instructions, see the building guide under **GDK_Project_GMS2/datafiles/GDK_Extension_Documentation.pdf**.  



<a id="TestingTheGDKExtension"></a>

## Testing the GDK Extension

The GDK Extension repo has a sample project to demonstrate integration of the GDK plugin with a Game Maker Studio 2 project. The sample project file can be found under **GDK_Project_GMS2/GDK_Project_GMS2.ypp**. When you build the sample project (**Build**->**Create Executable**) you'll need to select the **Package as Zip** option so you have access to the MSIXVC package required for installing the app.  Using **Package as Installer** will not produce an MSIXVC package and the app will not be able to properly access Xbox Services.

When the build finishes, it will open a File Explorer window containing the created .zip file and a subdirectory with the same name as the package which contains the MSIXVC package. Looking in the Game Maker Studio output window you will also see a line with the output path for the MSIXVC package. For example:  

`C:\Users\your-user-name\XboxDeveloperExperienceTe.GamePassSampleGame_1.0.0.0_x64__pmsd8ndztetqc-pkg`

To run the sample project so that it has access to Xbox Services you will need to install the package using `wdapp install` with the name of your package.  For example:  

`wdapp install XboxDeveloperExperienceTe.GamePassSampleGame_1.0.0.0_x64__pmsd8ndztetqc.msixvc`  

Once the package has been installed you can launch it using the Windows button.  

<a id="UpdatingTheConfig"></a>

## Updating MicrosoftGame.config

The sample project uses a default MicrosoftGame.config file. To test the sample or your own GameMaker Studio project with your project's Partner Center configuration information you'll need to update the MicrosoftGame.config file.  

The sample's config file can be found in **GDK_Project_GMS2\datafiles\MicrosoftGame.config**.  

In order to use Xbox services functionality you need to update your project's MicrosoftGame.config with your Partner Center project identity details.

 1. Go to the [Partner Center dashboard](https://partner.microsoft.com/dashboard/windows/overview).
 2. Select your game from the list of products.
 3. Select the **Game setup** tab, and then select **Identity details**.
 4. Select **Show Details** to expand the **Identity details** section.
 5. Use the following values from the table in the **Identity details** section, and then copy those values from Partner Center into the corresponding element and field in MicrosoftGame.config. 
 

| Name in Partner Center | MicrosoftGame.config | 
| --- | --- |
| Xbox Title ID | TitleId |
| Package/Identity/Name | Identity->Name |
| Package/Identity/Publisher | Identity->Publisher | 
| Xbox Services -> Xbox Settings -> MSAAppId | MSAAppId |
  
For example, the following identity details in Partner Center would result in your MicrosoftGame.config looking like the sample bellow:  

| Name in Partner Center | Example value |
| -- | -- |
| Xbox Title ID | 64353034 |  
| Package/Identity/Name | 41336MicrosoftATG.Achievements2017Redux |  
| Package/Identity/Publisher | CN=A4954634-DF4B-47C7-AB70-D3215D246AF1 | 
| Xbox Services -> Xbox Settings -> MSAAppId | 0000000000000000 |


```xml
<?xml version="1.0" encoding="utf-8"?>
<Game configVersion="1">

  <Identity Name='41336MicrosoftATG.Achievements2017Redux' Version="1.1.0.0" Publisher='CN=A4954634-DF4B-47C7-AB70-D3215D246AF1' />


  <TitleId>64353034</TitleId>
  <MSAAppId>0000000000000000</MSAAppId>
  
  <ExecutableList>
    <Executable Name="Achievements2017_desktop.exe"
                TargetDeviceFamily="PC"
                Id="Game"/>
  </ExecutableList>
  
  <ShellVisuals DefaultDisplayName="Achievements2017 Desktop Sample"
                PublisherDisplayName="Xbox Advanced Technology Group"
                StoreLogo="Assets\StoreLogo.png"
                Square150x150Logo="Assets\Logo.png"
                Square44x44Logo="Assets\SmallLogo.png"
                Square480x480Logo="Assets\LargeLogo.png"
                Description="Achievements2017"
                ForegroundText="dark"
                BackgroundColor="#000000"
                SplashScreenImage="Assets\SplashScreen.png"/>
</Game>

```


See [MicrosoftGame.config overview](../../system/overviews/microsoft-game-config/MicrosoftGameConfig-Overview.md) for additional information on the values in MicrosoftGame.config.

<a id="IntegratingTheGDKInYourProject"></a>

## Integrating the GDK extension into your own project

Once you've built the GameMaker Studio GDK extension and successfully tested the sample project you'll be ready to integrate the extension functionality into your own project.  

At a minimum, your project needs to call the following functions to integrate with the GDK:

* **gdk_init** needs to be called to initialize the GDK. The **gdk_init** function needs to be called before any other GDK functionality can be used.
* **gdk_update** needs to be called once each frame while the GDK is active.
* **gdk_quit** needs to be called to clean up once your project is done using the GDK and no other GDK functionality will be used.

In addition, the GDK extension has the following modules providing access to GDK functionality:

* **Base Module** provide functions controlling user/account selection for the player.
* **Storage Module** provides functions controlling loading and saving data associated with a user.
* **Xbox Live Module** provides functions to use features from Xbox services including stats, leaderboards, achievements, and rich presence.
* **In-App Purchases Module** provides functions controlling making user purchases in your project.

The guide included in the extension repo provides documentation for the GDK functions in the GDK Extension APIs section. You can find the guide in **GDK_Project_GMS2/datafiles/GDK_Extension_Documentation.pdf**.

<a id="TestingXboxServices"></a>  

## Testing Xbox services in your game  

In order to test Xbox services functionality in your game such as achievements, you need to use a sandbox and test accounts with access to that sandbox.  

### Creating a test account  

To test any Xbox services features in your game you'll need to create test accounts that have access to your development sandbox.  For information about creating test accounts, see [Creating test accounts](../../live/test-release/test-accounts/live-setup-testaccounts.md).  

<a id="switchSandbox"></a>

### Switching your sandbox  

After you've created a test account, use the account to access your sandbox by using the following steps.  

 1. To find your sandbox ID, go to [Partner Center](https://partner.microsoft.com/dashboard/windows/overview).
 1. Select **Xbox Live**, and then select **Gameplay Settings**.   > [!NOTE]
   > Your sandbox ID is on the first tab, and it's named like "ABCDEF.0".
 1. Open the **Start** menu.
 1. Enter **Microsoft GDK Command Prompts**, and then select **Enter** on your keyboard.
 1. Open the first command prompt.
 1. In the command prompt, enter **XblPCSandbox.exe [your sandbox ID]**.
 1. After the command prompt launches several apps, sign in with your test account to the Xbox App. 

If you're able to sign in successfully, you've created a test account and changed to your sandbox to begin testing.  

For more information on sandboxes see [Xbox Live Sandboxes overview](../../live/test-release/sandboxes/live-setup-sandbox.md).

<a id="Publishing"></a>  


## Publishing  

In order to be ready to publish your game, you need to:  

* Have finished integrating your game with the GDK  
* Updated your MicrosoftGame.config file with the correct values from the project you created in Partner Center  
* Create an MSIXVC package using **Package as Zip** in GameMaker Studio  

After you've completed those two requirements, you're ready to publish. To submit your game, go to [Partner Center](https://partner.microsoft.com/dashboard/windows/overview) and follow the instructions in the UI.  


