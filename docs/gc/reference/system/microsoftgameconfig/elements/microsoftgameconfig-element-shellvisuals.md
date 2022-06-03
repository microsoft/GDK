---
author: M-Stahl
title: ShellVisuals Element (MicrosoftGame.config)
description: MicrosoftGame.config Reference for ShellVisuals Element.
kindex: ShellVisuals
ms.author: zhooper
ms.topic: conceptual
edited: 01/06/2020
security: public
---

# MicrosoftGame.config Element - ShellVisuals

Defines the title’s Shell presence. For example, Images and Names. Used during registration to surface the title in the Shell.

## Parent
This element's parent is the Game element.

## Requirement
This element is optional and is not required to be set. 

## Platform
This element pertains to PC and Console.

## Behavior
* Attributes are:
  * DefaultDisplayName
  * PublisherDisplayName
  * StoreLogo
  * Square150x150Logo
  * Square44x44Logo
  * Description
  * ForegroundText
  * BackgroundColor
  * SplashScreenImage
* ForegroundText attribute default value is 'light'. BackgroundColor attribute default value is 'transparent'. All other attributes do not have default values.
* Allowed values for:
  * DefaultDisplayName attribute is a string that is up to 256 characters long.
  * PublisherDisplayName attribute is a string that is up to 256 characters long.
  * StoreLogo attribute is a valid filepath to a .PNG file under the root of the package.
  * Square150x150Logo attribute is a valid filepath to a .PNG file under the root of the package.
  * Square44x44Logo attribute is a valid filepath to a .PNG file under the root of the package.
  * Square480x480Logo is a valid filepath to a .PNG file under the root of the package.
  * Description is a string
  * ForegroundText attribute is light and dark.
  * BackgroundText attribute is a color value using common name or hex code (#RRGGBB) format.
  * SplashScreenImage attribute is a valid filepath to a .PNG file under the root of the package.

## Remarks
* StoreLogo, Square150x150Logo, Square44x44Logo, Square480x480Logo and SplashScreenImage attributes are all required for packaging.
* SplashScreenImage attribute is not required for PC titles.
* All other attributes are optional.
* See ST_Color section in the MicrosoftGame.config Schema for a full list of common names for color values.

### Logos within ShellVisuals & Executable
The relationship between OverrideLogo element within Executable is associated with the Logo element in ShellVisuals. If OverrideLogo is defined it this will take priority, for that executable, over what is defined in Logo. Logo within ShellVisuals is intended to be defined at a package layer. For a single executable package, only the Logo element is needed. The Logo size should be 150x150 pixels for Square150x150Logo attribute.

The OverrideLogo attribute will override the Square150x150Logo designated .png file in ShellVisuals for that specific Executable. In addition to OverrideLogo attribute, there's also an attribute for OverrideSquare480x480Logo and Square44x44Logo, which can be specified to override the designated Square480x480Logo and Square44x44Logo .png files, respectively, in ShellVisuals for that specific Executable.

The following example details the element and attribute configuration specifically for Logo/DisplayName overrides.

```xml
<ShellVisuals DefaultDisplayName="MyGame"
                Square150x150Logo="GraphicsLogo.png"
                Square44x44Logo="SmallLogo.png"
                Square480x480Logo="LargeLogo.png"
                SplashScreenImage="SplashScreen.png"
                StoreLogo="StoreLogo.png"/>

<ExecutableList>
    <Executable Name="MyGame.exe"
                OverrideDisplayName="MyGameOverride"
                OverrideLogo="GraphicsLogoOverride.png"
                OverrideSquare44x44Logo="SmallLogoOverride.png"
                OverrideSquare480x480Logo="LargeLogoOverride.png"
                OverrideSplashScreenImage="SplashScreenOverride.png"/>
</ExecutableList>
```

`OverrideDisplayName` and `OverrideSplashScreenImage` functions similarly to OverrideLogo.

#### Image requirements

Square150x150Logo, Square44x44Logo, and StoreLogo are required for a non-DLC package on both PC and Console. SplashScreenImage is required for Console but is now, as of the February 2021 GDK, optional for PC. Square480x480Logo is optional but is highly recommended. For DLC packages, only StoreLogo is required.

#### Image resolution and format
The logo format required is .png, and it has requirements around pixel format (24-bpp RGB or 32-bpp ARGB/PARGB). These are enforced via SubmissionValidator.

Each image has a required image resolution. They are as follows:
* Square150x150Logo: 150x150
* Square44x44Logo: 44x44
* Square480x480Logo: 480x480
* StoreLogo: 100x100
* SplashScreenImage: 1920x1080

#### SplashScreenImage

The SplashScreenImage is the image used when your title is launching.

The OverrideSplashScreenImage attribute, of the Executable element, is used to override the Splash Screen image that shows up when launching your title. This override now allows for executable specific splash screen images during development.
> [!NOTE]
> While the SplashScreenImage attribute is not platform specific, it currently is required for Xbox console development and optional for PC development.

#### BackgroundColor

BackgroundColor is an attribute of the ShellVisuals element. This uses HTML color code to define the background for the title on PC. This will show up as a border around the logo in the Taskbar and Start Menu.

## See Also
[MicrosoftGame.config Reference - Table of Contents](gc-microsoftgameconfig-toc.md)  