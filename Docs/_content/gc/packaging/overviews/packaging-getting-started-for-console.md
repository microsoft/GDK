---
author: jgup
title: Getting Started Packaging for Xbox Consoles
description: Describes getting started with packaging for Xbox consoles.
kindex: Packaging for Xbox Consoles
ms.author: jgup
ms.topic: conceptual
edited: 07/31/2019
security: public
---

# Getting started packaging titles for Xbox consoles

Use the following steps to create an XVC package that can be sideloaded for testing on your Microsoft Game Development Kit, and then submitted to Partner Center for publishing.

## Obtain your product identity information from Partner Center  

Work with your Microsoft representative to create your product in Partner Center. This is a prerequisite for the next step, which requires that you know your publisher identity and your package name. Details for this are covered outside this topic and may require assistance from your Microsoft representative.

## Create your MicrosoftGame.config file in the root folder along with the rest of your game content.  

A sample MicrosoftGame.config xml file is included [later in this topic](#sample). This can be used as reference alongside using the [MicrosoftGame.config Editor](../../system/overviews/microsoft-game-config/MicrosoftGameConfig-Editor.md) which will streamline creation of your .config file and automatically sync down Id and name values from your Partner Center project.

## Create your icons for display in the shell and Microsoft Store packages  

For each image listed in the following MicrosoftGame.config sample, place a corresponding file in the root folder of your game, scaled to the size specified. Alternately, image assets can be placed in a subdirectory, with the ShellVisuals icon paths adjusted to match. The [MicrosoftGame.config Editor](../../system/overviews/microsoft-game-config/MicrosoftGameConfig-Editor.md) provides the ability to generate these images for you with a single source image as input.

## Install the Microsoft Game Development Kit (GDK) (includes MakePkg.exe packaging tool)

By default, the Microsoft Game Development Kit (GDK) command prompts are in this folder:  
C:\Program Files (x86)\Microsoft GDK\Command Prompts

## Create your packaging layout mapping file

Open a Microsoft Game Development Kit (GDK) command prompt in the folder that contains a single folder with all your game content, and then run the following command.

`MakePkg genmap /f layout.xml /d <Your_game_folder>`

This creates a file called layout.xml, which will be used during the packaging step.> [!NOTE]
> Please also view the Intelligent Delivery guide for information on how to customize your layout.xml to organize your game content into Chunks with specifiers, and Features.  This allows you to customize which content installs on different devices and by different languages, as well as allowing users to choose which parts of your game they want to install. For more information, see see [Overview of Intelligent Delivery](intelligentdelivery.md).

## Create your package 
### How to create your package
Follow these steps to create an /lk encrypted package:
1. One time: Run `makepkg genkey /ekb SECRET_KEY.lekb` to create the SECRET_KEY.lekb file. This is the Local Escrowed Key Blob (LEKB) which
   stores the stable content key that encrypts your package. It should be stored in a secure location with need to know access. In an ideal
   setup only official build machines/accounts should have access to it.
2.  Package creation: Run `makepkg pack /lk SECRET_KEY.lekb`.This will create a package encrypted using the key stored in the SECRET_KEY.lekb file.

### Important notes on package encryption
The Makepkg **/lk** switch encrypts the package with a stable (always the same) key made by the `makepkg genkey` command. In addition to your title package, **MakePkg /lk** emits files named in the format *PackageFullName_licenseName_GUID.EKB* and *PackageFullName_licenseName_GUID.CEKB*. (Note the use of the underscore (_) character.) 

/lk encryption is the recommended encryption mode for development kit testing and submission on console, due to these benefits when compared to test encryption (/lt) and submission encryption (/l): 
1. packageutil compare can generate correct update size estimates (unlike /l).
2. It enables secure delta upload to Partner Center using the same algorithm that consoles and PCs use to download content updates.
3. It can be installed onto devkits (unlike /l).
4. It uses secure encryption key material and can only be decrypted in specific environments (unlike /lt).
   
## Test your package installation  

Use the following command to test your package installation:

`xbapp install <Your_Package>`

If your package uses Intelligent Delivery Features, you can use the /i option to invoke the interactive shell UI for picking which package Features should be installed for testing the retail end user experience.

`xbapp install /i <Your_Package>`

### Important notes on package installation 
**xbapp install**  will automatically install the CEKB file necessary to load the package onto an ERA devkit. If you are testing an install
scenario other than tool-based install (game disc, external storage, console-to-console transfer) then the **xbapp installkey**  command can
be used to install only the CEKB file. See [xbapp.exe (NDA topic)](../../tools-console/xbox-tools-and-apis/commandlinetools/xbapp.md) for more details.

> ![alert](../../../../resources/gamecore/images/en-us/common/note.gif) **DANGER:** The contents of the LEKB file is only lightly obfuscated. It is your responsibility to
ensure the security of your content packages by securing access to the LEKB file.
Anyone possessing the LEKB file and the content package file output by makepkg pack
can decrypt its contents.

> ![alert](../../../../resources/gamecore/images/en-us/common/note.gif) **DANGER:** The contents of the CEKB file allows the package to be loaded on any active ERA devkit. It is your responsibility to
ensure the security of your content packages by securing access to the CEKB file.
Anyone possessing the CEKB file, an active ERA devkit, and the content package file output by makepkg pack
can install the package on their devkit, can start the package, and can xbcp the files out of the package.

> ![alert](../../../../resources/gamecore/images/en-us/common/note.gif) **COMPATIBILITY:** LEKB files generated prior to the April 2021 GDK will not create a CEKB file. To use the new devkit sideloading
feature the LEKB file must be re-created with April 2021 or later GDK tools.

### If you plan to create discs for your package see the following topics:

[Creating test compilation discs (NDA topic)](../creating-test-compilation-discs.md)  
[Creating cross-generation test discs (NDA topic)](../creating-cross-gen-test-discs.md)  

## Submit your package to Microsoft Partner Center 

The package you created by using the previous MakePkg.exe command can be used for both testing and submission since the /lk flag was used to encrypt the package. You will also benefit from delta upload when uploading this package. The XVC and EKB files are uploaded to Partner Center as normal. The LEKB and CEKB files will not be uploaded.

<a id ="sample"></a>

## Sample MicrosoftGame.config

Create a file called MicrosoftGame.config. Use the following content in the root directory of your game content, and then remove any comments for items you don't need. Please refer to the [MicrosoftGame.config reference page](../../reference/system/microsoftgameconfig/microsoftgameconfig-schema.md) for more information.

While you can manually create the MicrosoftGame.config, the best way to create this is leveraging the [MicrosoftGame.config Editor](../../system/overviews/microsoft-game-config/MicrosoftGameConfig-Editor.md).

```xml
<?xml version="1.0" encoding="utf-8"?>
<Game configVersion="1">
    <!-- Publisher should match the exact value provided in the "Package/Identity/Publisher" field of the Game setup -> Identity section of your product's configuration area in Partner Center.
         Name should match the exact value provided in the "Package/Identity/Name" field of the Game setup -> Identity section of your product's configuration area in Partner Center. -->
    <Identity Name="**REPLACE**"
        Publisher="**REPLACE**"
        Version="1.0.1.0"/>
        <!-- The fourth digit of the version number is reserved for Microsoft Store use -->
    <!--  Optional: Use StoreId if your product will offer durable downloadable content (DLC) packages.
    Look up the Store ID (12-character alphanumeric string) of your main application package in the Game setup -> Identity section of your product's configuration area in Partner Center. (Example: 9PNX12345AAA)
    <StoreId>**REPLACE WITH STOREID**</StoreId> -->

    <MSAAppId>**REPLACE WITH MSAAPPID**</MSAAppId> <!-- This value is found in the Xbox services -> Xbox Settings section in your product's configuration area in Partner Center. -->
    <TitleId>**REPLACE WITH TITLEID**</TitleId> <!-- This value is found in the Game Setup -> Identity section of your product's configuration area in Partner Center. -->

     <!-- Use OverrideDisplayName if you want to display a different title in the shell than the DefaultDisplayName from the ShellVisuals section, or if you need to localize it. 
          Use TargetDeviceFamily to specify what platform your executable is built for (NOTE: Packaging will only allow one TargetDeviceFamily type to be specified to properly build a package. For more information, see the above reference page.) -->
    <ExecutableList>
      <Executable Name="**REPLACE**"
                  Id="Game"
                  OverrideDisplayName="**REPLACE**"
                  TargetDeviceFamily="XboxOne"
                  />
    </ExecutableList>

    <!-- DefaultDisplayName should match the exact value provided in the "Package/Identity/Name" field of the Game setup -> Identity section of your product's configuration area in Partner Center.
         PublisherDisplayName should use the exact value provided in the "Package/Properties/PublisherDisplayName" field of the Game setup -> Identity section of your product's configuration area in Partner Center.-->

    <!-- The following asset sizes apply
         StoreLogo - 100x100
         Square150x150Logo - 150x150
         Square44x44Logo - 44x44
         SplashScreenImage - 1920x1080
    -->
    <ShellVisuals DefaultDisplayName="**REPLACE**" 
                  PublisherDisplayName="**REPLACE**"
                  StoreLogo="StoreLogo.png"
                  Square150x150Logo="Logo.png"
                  Square44x44Logo="SmallLogo.png"
                  Description="**REPLACE**"
                  BackgroundColor="#000040"
                  SplashScreenImage="SplashScreen.png"/>
</Game>
```


## See also

[Getting started with packaging titles for a PC](packaging-getting-started-for-PC.md)  
[MicrosoftGame.Config](../../system/overviews/microsoft-game-config/MicrosoftGameConfig-toc.md)  
[Deploying your title to your Xbox dev kit (NDA topic)](../../tools-console/usinggsdk/deployment/deployment.md)  