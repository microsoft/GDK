---
author: jeffshi
title: 'Custom engine integration for PC: get started (C/C++)'
description: Describes how to get started with integrating the GDK into a custom C/C++ engine.
kindex:
- Getting started with custom engines for PC development (C/C++)
- Engine, getting started with a custom engine for PC development (C/C++)
- Custom engine, getting started with a custom engine for PC development (C/C++)
ms.author: scotmi
ms.topic: conceptual
edited: '09/13/2021'
security: public
---

# C/C++ Custom engine integration for PC: get started

Use this topic if you are preparing your game for publishing to the Microsoft Store on PC, and your game uses a C/C++ based engine that does not have built in support for the GDK.

* [Creating a product in Partner Center](#CreatingAProductInPartnerCenter)
* [Integrating the GDK into C/C++ games](#IntegratingTheGDK)
* [Testing Xbox Services in your game](#TestingXboxServices)
* [Publishing](#Publishing)

<a id="CreatingAProductInPartnerCenter"></a>

## Creating a product in Partner Center  

Before you can publish a game to the Microsoft Store, you need to create your Xbox Live–enabled product in Partner Center. For more information about Partner Center, see [Setting up an app or game in Partner Center, for Managed Partners](/gaming/xbox-live/get-started/setup-partner-center/live-setup-partner-center-partners).

<a id="IntegratingTheGDK"></a>  

## Integrating the GDK into C/C++ games  

To integrate the GDK into a C/C++ game, the game needs 3 things:

1. The GDK and XSAPI *header(s)* that describe the API signatures and data structures
2. The *import libraries* that tells the linker how to resolve external references to exported GDK and XSAPI DLL functions
3. The *dynamic-link libraries* that actually contains the runtime implementation of the GDK and XSAPI functions

For games to integrate with essential Xbox ecosystem experiences, they need to interact with two components – Gaming Runtime Services (GRTS) and Xbox Services API (XSAPI).  Here are the files needed by an unmanaged game:  

| Component | GRTS | XSAPI |  
| -- | -- | -- |
|Headers | GRTS headers: XUser, XGameSave, XGameUI, etc. (from GDK) | XSAPI headers: profile_c.h, achievements_c.h, etc. (from GDK) |  
| Import library | xgameruntime.lib (from GDK) | Microsoft.Xbox.Services.141.GDK.C.Thunks.lib (from GDK) |  
| Dynamic-link library | xgameruntime.dll and a few other dlls (system32 installed by GRTS) | Microsoft.Xbox.Services.141.GDK.C.Thunks.dll (from GDK, needs to be included in the game package) |  



### Adding requirements for Gaming Runtime Services and Xbox Services API to your project

The following steps outline the changes you need to make to your project to ensure it has all of the requirements for using the Gaming Runtime Services and Xbox Services API.

1.  Make sure x64 is being targeted.  

    In Visual Studio you would go to **Build**->**Configuration Manager** and set **Active solution platform** to x64.

1. Add the following include paths:  

    ```C:\Program Files (x86)\Microsoft GDK\211000\GRDK\GameKit\Include```  

    ```C:\Program Files (x86)\Microsoft GDK\211000\GRDK\ExtensionLibraries\Xbox.Services.API.C\DesignTime\CommonConfiguration\Neutral\Include```  

    In Visual Studio you would add these paths in the project properties page under **Configuration Properties**->**VC++ Directories**->**Include Directories**.

1. Add the following library paths for the import libraries:  

    ```C:\Program Files (x86)\Microsoft GDK\211000\GRDK\GameKit\Lib\amd64```  

    ```C:\Program Files (x86)\Microsoft GDK\211000\GRDK\ExtensionLibraries\Xbox.Services.API.C\DesignTime\CommonConfiguration\Neutral\Lib\Release```  

    In Visual Studio you would add these paths in the project properties page under **Configuration Properties**->**VC++ Directories**->**Library Directories**.  

1.  Add the following libraries to the list of libraries linked into your project:  

    ```C:\Program Files (x86)\Microsoft GDK\211000\GRDK\GameKit\Lib\amd64\xgameruntime.lib```  

    ```C:\Program Files (x86)\Microsoft GDK\211000\GRDK\ExtensionLibraries\Xbox.Services.API.C\DesignTime\CommonConfiguration\Neutral\Lib\Release\Microsoft.Xbox.Services.141.GDK.C.Thunks.lib```  

    In Visual Studio you would add the libraries in the project properties page under **Configuration Properties**->**Linker**->**Input**->**Additional Dependencies**.  

1.  Define *_GAMING_DESKTOP* and *WINAPI_FAMILY=WINAPI_FAMILY_DESKTOP_APP*.  

    In Visual Studio you would add the following line in the project properties page under **C/C++**->**Command Line**->**Additional Options**:  

    ```/D "_GAMING_DESKTOP" /D "WINAPI_FAMILY=WINAPI_FAMILY_DESKTOP_APP"```  

1.  Create a MicrosoftGame.config file and make sure it is copied to the same destination as the .exe during builds.  

    For starting development you can use a config with default values like the following example. Values for Identity Name, Executable Name, and Executable Alias would all be replaced with the name of your executable.

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

1.  Make sure copies of **Microsoft.Xbox.Services.141.GDK.C.Thunks.dll** and **XCurl.dll** are copied to the same destination as the .exe during builds.  

    **Microsoft.Xbox.Services.141.GDK.C.Thunks.dll** can be found in the GDK install in the following directory:  

    ```C:\Program Files (x86)\Microsoft GDK\211000\GRDK\ExtensionLibraries\Xbox.Services.API.C\DesignTime\CommonConfiguration\Neutral\Lib\[Debug|Release]```  

    **XCurl.dll** can be found in the GDK install in the following directory:  

    ```C:\Program Files (x86)\Microsoft GDK\211000\GRDK\ExtensionLibraries\Xbox.XCurl.API\Redist\CommonConfiguration\neutral```  


> [!NOTE]
> Alternatively, if you if you are integrating the GDK into an existing Visual Studio Desktop project you can follow the steps in this topic to convert your project to a GDK project, [Adding the Microsoft Game Development Kit to an existing desktop project](../test-your-installation/gr-add-to-existing-project.md).  


### Update MicrosoftGame.config

The MicrosoftGame.config file created in the previous step has default values that allow early development on PC and Xbox without the need for further configuration until you start to use features in the Gaming Runtime, Microsoft Store, and title identity. In order to use Xbox services functionality you need to update your project's MicrosoftGame.config with your Partner Center project identity details.

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


### Initialize the game runtime and XSAPI

The following steps show how to initialize Gaming Runtime Services and XSAPI in your game.

1. Include the XGameRuntime header and the XSAPI services-c header.  

   ```cpp
   #include <XGameRuntime.h> 
   #include <xsapi-c/services_c.h>
   ```


2. Call [XGameRuntimeInitialize](../../reference/system/xgameruntimeinit/functions/xgameruntimeinitialize.md) to initialize the GDK runtime.  

    ```cpp
    // Initialize the GameRuntime
    HRESULT hr = XGameRuntimeInitialize();
    if (FAILED(hr))
    {
        if (hr == E_GAMERUNTIME_DLL_NOT_FOUND || hr == E_GAMERUNTIME_VERSION_MISMATCH)
        {
            (void)MessageBoxW(nullptr, L"Game Runtime is not installed on this system or needs updating.", g_szAppName, MB_ICONERROR | MB_OK);
        }
        return 1;

    }

    ```

3. Call [XblInitialize](../../reference/live/xsapi-c/xbox_live_global_c/functions/xblinitialize.md) to initialize XSAPI.   

   ```cpp
    XblInitArgs xblArgs = {};
    //xblArgs.queue = queue; // Uncomment this line if you've choosen to create your own XTaskQueue. Otherwise, by default, this line is not needed.
    xblArgs.scid = "00000000-0000-0000-0000-000000000000"; // Add your scid from your Partner Center project here;

    HRESULT hr = XblInitialize(&xblArgs);
    if (FAILED(hr))
    {
        // Handle failure
    }

   ```
   
   
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


