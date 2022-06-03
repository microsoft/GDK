---
author: aablackm
title: Utilizing Microsoft Game Development Kit (GDK) tools to install and launch your PC title
description: Describes how to use Microsoft Game Development Kit (GDK) tools to install and launch your PC title.
kindex:
- PC, launch, install
- wdapp, msixvc
ms.author: zhooper
ms.topic: conceptual
edited: 01/22/2021
security: public
---

# Utilizing Microsoft Game Development Kit tools to install and launch your PC title

This topic describes the Microsoft Game Development Kit (GDK) tools for installing and launching your PC title. It explains how to use these tools and provides insights about troubleshooting PC installation and launch issues.

## Tools to install and launch your title on PC
> [!NOTE]
> For more information about the app-launch, and launching with the Gaming Runtime, see [Launching a Win32 game](../system/overviews/microsoft-game-config/MicrosoftGameConfig-Overview.md#MSGC-PCLaunch).

The Microsoft Game Development Kit (GDK) provides the following approaches to installing your title.

* [wdapp.exe install](commandlinetools/gr-wdapp.md#wdapp_install): Used to install an .MSIXVC package of your title. For more information about packaging your PC title, see [Getting started with packaging titles for a PC by using the MSIXVC packaging tools](../packaging/overviews/packaging-getting-started-for-PC.md).

* [wdapp.exe register](commandlinetools/gr-wdapp.md#wdapp_register): Used to register a loose file folder to be able to launch. For more information, see [PC game registration](title-registration-pc.md).

* Selecting F5    in [Visual Studio](visualstudio/gr-visualstudio-toc.md) properly registers and app-launches your PC title.

The Microsoft Game Development Kit (GDK) provides the following approaches to launching your title.

* After you've registered your title, it appears as selectable in the Start menu, and is searchable in the search box.

* [wdapp.exe launch](commandlinetools/gr-wdapp.md#wdapp_launch) is used to launch a title by using either its application user model ID (AUMID) or a path to the executable.

* Selecting    F5 in [Visual Studio](visualstudio/gr-visualstudio-toc.md) properly registers and app-launches your PC title.

* Windows  Device Portal (WDP): go  to **Installed Apps**, and then select **Start**.

### Launching with and without title identity

Depending on the way in which you initiate a title launch, launching your PC executable might require title identity.

#### Launching with title identity

The following list contains alternate ways to launch your title with identity.

* `WdApp Launch <AUMID>` from a GDK command prompt.

* `WdApp Launch <full path to exe>` from a GDK command prompt.

* `<ExecutionAlias>` in a command prompt.

* Selecting    F5 of a *Gaming.Desktop.x64* project with that solution configuration set in Visual Studio.

* Launching through clicking the icon of the registered title in the Windows  Shell.

#### Launching without title identity

The following list contains ways to launch your title without title identity.

* Double- clicking the executable in File  Explorer .

* Providing a full path to the executable in Command Prompt.

* `<ExecutionAlias>` if in the current folder of the executable, or if the current folder is included in `%PATH%` environment variable.

* Using `CreateProcess` to launch your executable.

### Launching with command-line arguments

Use one of the following methods to launch your title with command-line arguments.

* `WdApp Launch [launch args]` from a GDK command prompt.

* `<ExecutionAlias> [launch args]` in a command prompt.

* Command-line arguments in Visual Studio project properties.

For more information about using an Execution Alias, see [ExecutionAlias](../reference/system/microsoftgameconfig/elements/microsoftgameconfig-element-executable.md#MicrosoftGameConfig-Alias).

<a id="PC-Errors"></a>

## Troubleshooting PC installation and launch issues

### Error code  0x80073CFF: Deployment of package failed because no valid license or sideloading policy could be applied. A developer license or enterprise sideloading configuration may be required. 

#### The issue

You experienced an issue when you attempted to install, register, or launch your title.

#### The fix

The fix is to enable Developer Mode    on your PC by using the following steps.

1. Open **Settings**.

2. Enter *Developer* in the search field.

3. From the list of options that are displayed, select **Use developer features**.

4. Select **Developer mode**. A dialog box appears, saying that    the system is adding features. Ensure that you wait for this process to finish    .

### Error code 0x80073cfc: The application cannot be started. Try reinstalling the application to fix the problem.

#### The issue

You experienced an issue with one of the initial steps in the installation process.

#### The workaround

You can uninstall and reinstall the Gaming Runtime Services (GRTS). Follow these steps to do so.

1. Open a PowerShell Admin   command prompt.

2. Execute this command: `get-appxpackage *gamings*`

3. Execute this command: `remove-package <package fullname from step 2 for the gamingservices package>`

4. Open the Xbox app, and then install a game. This triggers the installation of the gamingservices package from the Microsoft Store.

### Error code 0x87e00017: Install source was found but cannot be reached. Likely internet problem.

#### The issue

This error code corresponds to `IM_E_UNREACHABLE_INSTALL_SOURCE`. You experience this error if the deployment system is unable to access your files. However, while that might be the case, it can also mean that the installation directory has become corrupted. The most common cause of this is a partially successful deployment that didn’t properly clean up afterward.

#### The fix

To fix these issues

1. Run the app `wdapp list`.

2. In the resulting list, look for any versions of games that you installed.

3. Uninstall all of the games by using `wdapp uninstall <pfn>`.

4. Try installing your game again.

### Error code 0x80080203: The specified package format is not valid: The file is not a valid app package because it is missing a required footprint file.

#### The issue

This occurs because you have a "nested MSIXVC" (which can easily happen). Let’s say your desktop build is *C:\MyGame*. You decide to create a package by using [makepkg.exe](../packaging/deployment/makepkg.md) in a subfolder under *C:\MyGame* (for example, in *C:\MyGame\Package*). This works the first time because no package is generated, but then you experience this issue after you try to create a package again. In addition to this failure (which is caused by having two *AppxManifest.xml* files in the package), running *makepkg.exe* on *C:\MyGame* would try to package the existing .msixvc  into the new package (unless you excluded it from the genmap).

#### The fix

To fix this issue, ensure that your package directory is outside the directory that contains your *MicrosoftGame.config*.

### Error code 0x80070490: Element not found

#### The issue

This issue occurs if attempting to install an .XVC (the packaging format for an Xbox package) with `wdapp install`.

#### The workaround

Ensure that you use `wdapp install` for .MSIXVC packages (the packaging format for a PC package) only.

### Errors launching via wdapp when the title folder is shared

#### The issue

If you share a folder with Windows  File Sharing, that you've previously registered with [wdapp.exe register](commandlinetools/gr-wdapp.md#wdapp_register), it causes the Gaming Runtime to lose share permissions, and you subsequently experience this error.

```
    'WdApp.exe launch' must be called with an AUMID to activate an application.

    Use 'WdApp.exe list' to get a list of sideloaded packages including AUMID values.

    Alternatively, if your executable specifies an Alias in the *MicrosoftGame.config*,

    typing the alias name at the command prompt will do an application activation.

    Failed with 0x80070057.
```

#### The workaround

The issue is related to the access control list (ACL). Sharing the folder prevents access to the app model. That is, the container loses permission to read files when sharing. To work around is to follow these steps to save and restore the ACL data.

1. Before you share the folder, run 'icacls /save AclFile'  to save the ACLs of the package folder.

2. Share the folder by using Windows  File Sharing.

3. To restore the previous ACLs, run 'icacls /restore AclFile'.

In addition to this workaround, you could also re-register by first running `wdapp.exe unregister`, and then running `wdapp.exe register`. This restores permissions while retaining folder sharing.

### Error code 0x80070005: Access is denied.

#### The issue

You are encounter a "0x8007005: Access is Denied" error when running the wdapp install command.

#### The fix

Make sure you are passing the full path to the .msixvc file. For example:

Correct:

<i>wdapp install "c:\MyGame\GDKBuildFolder\GdkGame_1.0.0.0_x64__pmsdash4d.msixvc"</i>

Incorrect (missing the full path to the .msixvc):

<i>wdapp install "c:\MyGame\GDKBuildFolder"</i>

### Error code 0x000007b: STATUS_INVALID_IMAGE_FORMAT

#### The issue

You are encounter a "0x000007b" error when running the wdapp launch command.

#### The fix

The issue is that the executable being launched is a different platform architecture than what is specified in the MicrosoftGame.config. The DesktopRegistration element in the MicrosoftGame.config has an optional child element called ProcessorArchitecture that can specify either 'x86' or 'x64' as its value. Ensuring that this specification matches the platform architecture of the executable defined in the Executable element will resolve this issue.

### Error code 0x800701B1: A device which does not exist was specified.

#### The issue

You are encounter a "0x800701B1" error when running the wdapp install /drive command.

#### The fix

The issue is that the target drive was not detected by the Windows Store. Ensure that the target drive is present in the "New apps will save to:" drop down list in "Settings -> Storage Settings -> Change where my new content is saved" on your local PC. If the drive is not present, please check the drive's health and ensure the local PC has the latest Windows updates.

### Error code 0x80072F78: WININET_E_INVALID_SERVER_RESPONSE

#### The issue

You are encounter a "0x80072F78" error when running the wdapp install command.

#### The fix

This issue has been associated with firewall proxy configuration settings blocking this address "settings-win.data.microsoft.com". This address is needed for install settings to be properly cached when installing your PC GDK title. Please ensure this address is allowed in your firewall software.

## See also

[Getting started for PC](../get-started-with-pc-dev/overviews/gr-getting-started.md)  

[Getting started with packaging for PC](../packaging/overviews/packaging-getting-started-for-PC.md)  

[Configuring your title to run as a single instance](../get-started-with-pc-dev/overviews/single-instance-application.md)  

[MicrosoftGame.config](../system/overviews/microsoft-game-config/MicrosoftGameConfig-toc.md)  

[Application Management (wdapp.exe)](commandlinetools/gr-wdapp.md)  

[PC game registration](title-registration-pc.md)  

[Flat File Install Overview](../packaging/packaging-flatfileinstall.md)  

[Command-line tools (for PC)](commandlinetools/gr-commandlinetools-toc.md)  

[PC game development (environment and tools)](gc-tools-pc-toc.md)  