---
title: Custom installation actions for Win32 games in Microsoft Store
description: Describes new app manifest capability to allow Win32 games to have custom installation actions as Microsoft Store titles.
kindex: custom install action for Microsoft store games
author: M-Stahl
ms.author: brianhud
ms.topic: conceptual
edited: '08/01/2019'
security: public
---

# Custom installation actions

Many games use anti-cheat and other middleware. These components are typically chain-installed when the user installs the game. A user can install one game via the Microsoft Store, and another game via some other distribution channel. The platform ensures that there are no conflicts if both games chain-install the same middleware package. The game can include in its package one or more arbitrary .exe or .msi files and ask for these files to be run as part of completing the installation of the app. The custom installation actions feature is intended for installing games anti-cheat software or some other redistributable middleware. In this way, you can use the exact same chain-installer .exe file in an MSIX submitted to the Microsoft Store as well as in an .msi or .exe file submitted through some other distribution channel.  

In traditional Win32 apps, shared middleware is typically installed via independent redistributable files, which normally take the form of a self-extracting .exe or an .msi that can be bundled with the game itself. Microsoft Store apps model dependencies as framework packages that aren't bundled with the game but are deployed separately via the Microsoft Store. In this model, the consuming app manifest declares a dependency on one or more framework packages. Microsoft Store then takes care of chaining the installation of the dependencies. Although many redistributables are available as framework packages in the Microsoft Store, there will inevitably be some redistributables that aren't available as framework packages. For these packages, the solution is to allow the game to bundle the redistributable within the game package.

To include .exe or .msi redistributables, you need to make updates to your MicrosoftGame.config file. These changes include declaring the type of custom action you want to use, as well as its location within the installation package.  
Any redistributables must be included in the package and declared in MicrosoftGame.config. The declaration includes the path to the executable (relative to the declared Folder path, which in turn is relative to the root path of the package itself). The declaration also includes any command-line arguments to be passed to the executable when it's run. This is done through the inclusion of the **CustomInstallActions** element in the MicrosoftGame.config file.

## CustomInstallActions

The **CustomInstallActions** element contains all the definitions for what custom install actions are to be run and when they are to be run. You can only declare one instance of this extension in your manifest. The extension has one top-level child named **CustomInstall**. It has one required attribute, Folder, which is a string that designates the folder containing all the files required for all custom actions. This folder can contain subfolders. You are responsible for ensuring that the package includes any dependencies of any custom action executables, and that these are in the appropriate load path for each one.  
> [!NOTE]
> You must not put any of the primary game executables or other files into the designated Folder. It's explicitly only for custom install files.  

Within the custom installation extension, the app can declare child elements for **InstallAction**s, **RepairAction**s, and **UninstallAction**s. All these are optional: you may declare any of them or none of them. Within each of these elements, you would specify one or more **InstallAction**, **RepairAction**, or **UninstallAction** child items. The platform runs the actions you specify in the order you specify, with the command-line arguments you specify.

### Action types

The three child nodes of the custom installation extension dictate when certain custom actions are run. There are three types of custom installation actions.

* **Install action:** Actions the platform runs prior to the first startup of the app
* **Repair action:** Actions that are run when the user selects Repair or Reset
* **Uninstall action:** Actions that are run when the user uninstalls the app

Typically, you would specify to chain-install some redistributable as an **InstallAction**, and then specify to uninstall it as an **UninstallAction**. However, in some cases you might choose to install without a matching uninstall. In this scenario, your app installs something that it leaves behind when it's uninstalled&mdash;and this might be appropriate for redistributables that are shared by other apps. Similarly, your **RepairAction** might simply be a redeclaration of the executables you specified for your **InstallAction**, and this is typical. It’s possible that each of the actions you want to perform in install/repair/uninstall requires a different executable. The schema is very flexible: the platform doesn't require any of the actions. You're free to configure the behaviors as appropriate for each game.
> [!IMPORTANT]
> The Uninstall action will only be run if an Install or Repair action has been run. The system uses the Name property to track this state. For this reason, it is important that the Install/Repair/Uninstall actions have the same Name.

### Parts of an action

#### File

For each action, you must specify the file to run, and this file must be in your package. If you specify a path, it will be implicitly relative to your **CustomInstallActions** **Folder** path. You can't specify an absolute path. Your path must not start with a backslash (\\).  

#### Name

You must specify a *Name* for the action. This *Name* must be unique within the parent *Actions* node, but can be shared across different Actions nodes. For example, you might specify File="MySetup.exe" and *Name*="abc123" as both an **InstallAction** and a **RepairAction**. On the other hand, if you have two **InstallAction** elements, they each must have a different *Name*. You should use the same *Name* for the same executable across package versions so long as that executable doesn't change. The *Name* is used as the identity of the action, and allows the platform to track which actions have been successfully run, and whether they need to be run for an updated package. If an updated package specifies a custom action with a *Name* that has already been successfully run, the platform skips this action on update.  
> [!IMPORTANT]
>  A difference in the arguments list doesn't constitute a difference in identity. If you want to run the same executable with different arguments in an *updated* package, you must supply a different *Name*. It's your responsibility to configure your declared *Names* appropriately, and to track them across versions.

#### Arguments

Each custom installation action has a third element *argument*, which allows you to include any arguments you need included to run the redistributable command.

## Custom action usage

Installing anti-cheat software typically requires the user to have admin privileges, and in general&mdash;because custom actions is an extremely powerful feature&mdash;the platform requires admin privileges for any package that has custom actions. For operations that run with admin privileges, Windows requires a User Account Control (UAC) prompt to be shown on first run of the app. The user workflow is as follows.  

* The Microsoft Store page for the game includes a description of the requirements, including whether installation requires elevated privileges, whether the installation runs a custom action, and what this might mean to the user. This information is provided so that the user can make an informed decision about purchasing the game.  
* Assuming the user is happy with the constraints and implications, they select Install.  
* The platform detects that the package includes a custom action, and records the fact that the custom action needs to be run. However, it doesn't run the custom action during the initial installation phase. Instead, any custom action is run the first time the user launches the game.  
* On first launch of the game, at the point when the platform is about to run custom actions, it displays a UAC prompt. The user then needs to provide admin credentials and accept elevation. Even if a package contains multiple custom actions, the user is given only one UAC prompt. There's no further UAC prompt for updates unless one or more of the custom actions has changed. There's a UAC prompt when the game is uninstalled.  

All custom actions must return zero for success. If any custom action fails, the platform continues to run any remaining custom actions, and continues to attempt to launch the app. On each subsequent app launch, the platform continues to retry any failed/incomplete installation custom action until that action succeeds. If the app doesn't function correctly in the face of a custom action failure, the user can always go to the Settings page for the app and select Repair or Reset. A Repair/Reset doesn't redownload the game files&mdash;it merely reregisters the package. Any failed or unexecuted custom actions are reregistered to be run. If you have a custom installer that returns some nonzero value for success, one option is to wrap this installer in another executable that you create, which does return zero on success.  

Microsoft Store policy includes guidelines around what kinds of middleware/redistributable software is allowed to be chain-installed. At a high level, chain installations are intended for shared software that's required for running the game. It's not intended to install unrelated apps or other software.  
> [!NOTE]
> Custom install actions are only supported within the main MSIXVC package. They're not supported in framework packages, optional packages, modification packages, or any other type of package.  

## Running MSI as a custom installation action

In the case of an MSI, you provide the name of the MSI, and the platform runs msiexec.exe on that file. Don't provide the **/i**, **/f** or **/x** arguments, because these are inferred from the type of the action (install, repair or uninstall) where it's declared. You can't provide any options to the **/f** switch. You can, however, provide any other optional arguments that would normally be provided to msiexec.exe. This is the only scenario where command-line arguments are constrained: for non-MSI actions, you may supply whatever arguments you want. For non-MSI actions, the platform doesn't parse or validate the arguments. The platform merely passes them on to the executable. It's your responsibility to ensure that the arguments are correct.  

There’s no direct support for MSTs (MSI transforms). If you have a requirement for an MSI/MST, one possible workaround might be to build an independent .exe that wraps msiexec in order to run your MSI and apply your MST.

## Game config file changes

The following XML examples demonstrate the appropriate additions to a MicrosoftGame.config file to allow custom installation actions.  

```xml
  <!-- Include CustomInstallActions element. Declare InstallActions, 
  RepairActions and/or UninstallActions as appropriate for your app. --> 
  <DesktopRegistration>
    <!-- ... --> 
    <!-- Other entries omitted for brevity. --> 
    <!-- ... --> 
	  <CustomInstallActions>
      <Folder>MyInstallers</Folder>
        <InstallActionList>
          <InstallAction File="CustomInstaller.exe" Name="TaskName" Arguments="/silent /example" />
        </InstallActionList>
        <RepairActionList>
          <RepairAction File="CustomInstaller.exe" Name="TaskName" Arguments="/silent /repair" />
        </RepairActionList>
        <UninstallActionList>
          <UninstallAction File="CustomInstaller.exe" Name="TaskName" Arguments="/silent /remove" />
        </UninstallActionList>
      </CustomInstallActions>
    </DesktopRegistration>
```

In the previous example, all executables and any dependencies must be placed in the MyInstallers folder that you specified at the root of the package. Within that folder, you can create any subfolder structure appropriate to your app. In this example, the path to MySetup.exe would be <package root>\MyInstallers\Banana\MySetup.exe. If that executable has any dependencies, they must also be placed in the appropriate folder or subfolder.  

The following sequence shows how you would author the manifest over multiple versions.

```xml
<!-- v1 of the game. --> 
	  <CustomInstallActions>
      <Folder>MyInstallers</Folder>
        <InstallActionList>
          <InstallAction File="CustomInstaller.exe" Name="TaskName_1" Arguments="/silent /example" />
          <!-- The platform records the successful install of TaskName_1. --> 
        </InstallActionList>
        <RepairActionList>
          <RepairAction File="CustomInstaller.exe" Name="TaskName_1" Arguments="/silent /repair" />
        </RepairActionList>
        <UninstallActionList>
          <UninstallAction File="CustomInstaller.exe" Name="TaskName_1" Arguments="/silent /remove" />
          <!-- The platform records the successful uninstall of TaskName_1. --> 
        </UninstallActionList>
      </CustomInstallActions>
      
<!-- v2 of the game, where the redist is NOT updated. --> 
    <CustomInstallActions>
      <Folder>MyInstallers</Folder>
        <InstallActionList>
          <InstallAction File="CustomInstaller.exe" Name="TaskName_1" Arguments="/silent /example" />
          <!-- The platform detects that we've already installed TaskName_1, so we don't  
          run it again. Therefore, there's no UAC prompt. --> 
        </InstallActionList>
        <RepairActionList>
          <RepairAction File="CustomInstaller.exe" Name="TaskName_1" Arguments="/silent /repair" />
        </RepairActionList>
        <UninstallActionList>
          <UninstallAction File="CustomInstaller.exe" Name="TaskName_1" Arguments="/silent /remove" />
        </UninstallActionList>
      </CustomInstallActions>
 
<!-- v2 of the game, where a redist IS updated. --> 
    <CustomInstallActions>
      <Folder>MyInstallers</Folder>
        <InstallActionList>
          <InstallAction File="CustomInstaller.exe" Name="TaskName_2" Arguments="/silent /example" />
          <!-- The platform detects that we haven't previously run TaskName_2, so we need 
          to run it this time and show a UAC prompt. -->  
        </InstallActionList>
        <RepairActionList>
          <RepairAction File="CustomInstaller.exe" Name="TaskName_1" Arguments="/silent /repair" />
        </RepairActionList>
        <UninstallActionList>
          <UninstallAction File="CustomInstaller.exe" Name="TaskName_1" Arguments="/silent /remove" />
        </UninstallActionList>
      </CustomInstallActions>
```