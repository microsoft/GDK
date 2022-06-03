---
author: scotmi
title: 'Custom engine integration for PC: get started (C#)'
description: Describes how to get started with integrating the GDK into a custom C# engine.
kindex:
- Getting started with custom engines for PC development (C#)
- Engine, getting started with a custom engine for PC development (C#)
- Custom engine, getting started with a custom engine for PC development (C#)
ms.author: scotmi
ms.topic: conceptual
edited: '09/13/2021'
security: public
---

# C# custom engine integration for PC: get started

Use this topic if you are preparing your game for publishing to the Microsoft Store on PC, and your game uses a C# based engine that does not have built in support for the GDK.

* [Creating a product in Partner Center](#CreatingAProductInPartnerCenter)
* [Integrating the GDK into C# games](#IntegratingTheGDK)
* [Testing Xbox Services in your game](#TestingXboxServices)
* [Publishing](#Publishing)

<a id="CreatingAProductInPartnerCenter"></a>

## Creating a product in Partner Center  

Before you can publish a game to the Microsoft Store, you need to create your Xbox Live–enabled product in Partner Center. For more information about Partner Center, see [Setting up an app or game in Partner Center, for Managed Partners](/gaming/xbox-live/get-started/setup-partner-center/live-setup-partner-center-partners).

<a id="IntegratingTheGDK"></a>  

## Integrating the GDK into C# games  

To integrate the GDK into C# game, the game needs 3 things:

1. An "API layer" that provides C# friendly functions for the native implementation.  
2. An "Interop layer" that handles the interop between the managed layer (C# engine such as Unity) and the unmanaged layer (GRTS/XSAPI runtime dll).  
3. The *dynamic-link library* that actually contains the runtime implementation of the functions.  



### Adding requirements for Gaming Runtime Services and Xbox Services API to your project

The following steps outline the changes you need to make to your project to ensure it has all of the requirements for using the Gaming Runtime Services and Xbox Services API.

1. Clone or download a .zip of the Unity GDK plugin git repo from [https://github.com/microsoft/gdk-unity-package](https://github.com/microsoft/gdk-unity-package).

1. Open the **XGamingRuntimeSDK.sln** which is found in **gdk-unity-package/Tools/XGamingRuntimeSDK/**.  

   Note that the solution file is for Visual Studio 2017 and the required C# version is 6 or later.  

1. In the **XGamingRuntime** project open **XBL\Social\XblSocialRelationshipFilter.cs** and comment out the ```using UnityEngine;``` line at the top of the file and save.

1. Build the **XGamingRuntimeThunks** project and the **XGamingRuntime** project.

1. Open your C# game project.  

1. Set your project to target x64.

1. Add a reference to the **XGamingRuntime.dll** that you built with the **XGamingRuntime** project.  
   You can find the DLL under **gdk-unity-package-main\Tools\XGamingRuntimeSDK\Gaming.Desktop.x64\Debug\|Release**.  

1. Make sure **XGamingRuntime.dll**, **XGamingRuntimeThunks.dll**, and **XCurl.dll** are copied to the same directy your .exe is built in.  
   You can find the DLLs under **gdk-unity-package-main\Tools\XGamingRuntimeSDK\Gaming.Desktop.x64\Debug\|Release**.  

1. Make sure **Microsoft_Xbox_Services_141_GDK_C_Thunks.dll** is copied to the same directory your .exe is built in.  
   You can find the DLL in the GDK install path under **C:\Program Files (x86)\Microsoft GDK\220300\GRDK\ExtensionLibraries\Xbox.Services.API.C\DesignTime\CommonConfiguration\Neutral\Lib\Debug\|Release**.  
   Note that the DLL name uses periods instead of underscores in the GDK and must be renamed to use underscores instead of periods. 

1.  Create a **MicrosoftGame.config** file and make sure it is copied to the same destination as the .exe during builds.  

    For starting development you can use a config with default values like the following example. Values for **Identity->Name**, **Executable->Name**, and **Executable->Alias** would all be replaced with the name of your executable.  

    ```xml
    <?xml version="1.0" encoding="utf-8"?>
    <Game configVersion="1">

    <Identity Name="Direct3DGame1_test"
                Publisher="CN=Publisher"
                Version="1.0.0.0"/>

    <ExecutableList>
        <Executable Name="Direct3DGame1_test.exe"
                    Id="Game"
                    Alias="Direct3DGame1_test.exe"/>
    </ExecutableList>

    <ShellVisuals DefaultDisplayName="Direct3DGame1_test"
                    PublisherDisplayName="PublisherName"
                    Square480x480Logo="LargeLogo.png"
                    Square150x150Logo="GraphicsLogo.png"
                    Square44x44Logo="SmallLogo.png"
                    Description="Direct3DGame1_test"
                    ForegroundText="light"
                    BackgroundColor="#000040"
                    SplashScreenImage="SplashScreen.png"
                    StoreLogo="StoreLogo.png"/>
    </Game>
    ```

### Update MicrosoftGame.config

The **MicrosoftGame.config** file created in the previous step has default values that allow early development on PC and Xbox without the need for further configuration until you start to use features in the Gaming Runtime, Microsoft Store, and title identity. In order to use Xbox services functionality you need to update your project's **MicrosoftGame.config** with your Partner Center project identity details.  
You'll also need to list VC14 as a known dependency which is required by Microsoft_Xbox_Services_141_GDK_C_Thunks.dll.  

 1. Go to the [Partner Center dashboard](https://partner.microsoft.com/dashboard/windows/overview).
 2. Select your game from the list of products.
 3. Select the **Game setup** tab, and then select **Identity details**.
 4. Select **Show Details** to expand the **Identity details** section.
 5. Use the following values from the table in the **Identity details** section, and then copy those values from Partner Center into the corresponding element and field in MicrosoftGame.config. 
 6. Add a **KnownDependency** element for VC14 in **DesktopRegistrarion**->**DependencyList**.
 

| Name in Partner Center | MicrosoftGame.config | 
| --- | --- |
| Xbox Title ID | TitleId |
| Package/Identity/Name | Identity->Name |
| Package/Identity/Publisher | Identity->Publisher | 
| Xbox services -> Xbox Settings -> MSAAppId | MSAAppId | 
  
For example, the following identity details in Partner Center would result in your MicrosoftGame.config looking like the sample bellow:  

| Name in Partner Center | Example value |
| -- | -- |
| Xbox Title ID | 64353034 |  
| Package/Identity/Name | 41336MicrosoftATG.Achievements2017Redux |  
| Package/Identity/Publisher | CN=A4954634-DF4B-47C7-AB70-D3215D246AF1 | 
| Xbox services -> Xbox Settings -> MSAAppId | 0000000000000000 | 


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

  <DesktopRegistration>
    <DependencyList>
      <KnownDependency Name="VC14"/>
    </DependencyList>
  </DesktopRegistration>

</Game>



```


See [MicrosoftGame.config overview](../../system/overviews/microsoft-game-config/MicrosoftGameConfig-Overview.md) for additional information on the values in MicrosoftGame.config.


### Initialize the game runtime and XSAPI

The following steps show how to initialize Gaming Runtime Services and XSAPI in your game.

1. Add ```using XGamingRuntime;``` to your project's .cs file.
1. Add ```using XGamingRuntime.Interop;``` to your project's .cs file.
1. Add a call to initialize the Gaming Runtime:  
   ```
   Int32 hr = SDK.XGameRuntimeInitialize();
   ```
1. Add a call to initialize Xbox services:  
   ```
   Int32 hresult = SDK.XBL.XblInitialize(SCID);
   ```  
   Replace SCID with a string containing your Partner Center project's SCID.


   
   
See [Getting started with Xbox Live APIs](../../live/get-started/live-gs-xbl-apis.md) for a detailed overview of using XSAPI in your game.  
See [Overviews and how-tos](../../overviews/overviews-and-how-tos.md) for overviews of implementing GDK features.

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
* Created a game package by following the steps in [Getting started with packaging titles for a PC by using the MSIXVC packaging tools](../../packaging/overviews/packaging-getting-started-for-PC.md)

After you've completed those two requirements, you're ready to publish. To submit your game, go to [Partner Center](https://partner.microsoft.com/dashboard/windows/overview) and follow the instructions in the UI.  

