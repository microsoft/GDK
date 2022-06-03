---
author: joannaleecy
title: Troubleshooting Sign-in and Sandbox Errors
description: Describes how to troubleshoot Xbox Live sign-in errors.
kindex:
- troubleshooting sandbox
- troubleshooting sign-in
ms.author: gershp
ms.topic: conceptual
edited: 6/29/2021
security: public
user-access-banner: true
---
> [!IMPORTANT]
> Starting February 3rd 2022, all user permissions will be managed in Partner Center, any users that do not exist in the Partner Center user store will lose access to forums, secure documentation, and downloads. To maintain access all users should be migrated to Partner Center. <p></p>See this <a href="https://forums.xboxlive.com/articles/132187/breaking-change-user-access-for-forums-secure-docu.html">forum article</a> for more details.

# Troubleshooting Sandbox and Sign-in Errors

This topic help you troubleshoot common sign-in and sandbox-related errors for your game, in your dev sandbox, on PC.  

<a id="correctIds"></a> 
## Ensuring your IDs are correct
You need to ensure the following IDs in your MicrosoftGame.config are correct:
* StoreId
* Identity/Name
* Identity/Publisher
* TitleId 
* SCID
* MSAAppId 

To find the values for your StoreId, Identity/Name, Identity/Publisher:
1. Go to [Partner Center](https://partner.microsoft.com/dashboard/windows/overview).
1. Select your game.
1. Click the **Game Setup** section in the left navigation pane.
1. Go to the **Identity details** section and click the **Show details** link to expand the section.
1. Review the values for:
    1. Package/Identity/Name - This corresponds to the Identity/Name value in your MicrosoftGame.config.
    1. Package/Identity/Publisher - This corresponds to the Identity/Publisher value in your MicrosoftGame.config.
    1. Store ID - this corresponds to the StoreId value in your MicrosoftGame.config.

To find the values for your TitleId, SCID and MSAAppId:
1. Go to [Partner Center](https://partner.microsoft.com/dashboard/windows/overview).
1. Select your game.
1. Click the **Xbox services** > **Xbox Settings** section in the left navigation pane.
1. Review the values for:
    1. Title ID (hexadecimal) - This corresponds to the TitleId value in your MicrosoftGame.config. Note: You want the hexadecimal value, __not__ the decimal value.
    1. MSA App ID - This corresponds to the MSAAppId value in your MicrosoftGame.config. The MSAAppId can be either a GUID or hexadecimal value.
    1. SCID - This value is not specified in the MicrosoftGame.config file. Instead, it is passed as a parameter to the [XblInitialize](../../../reference/live/xsapi-c/xbox_live_global_c/functions/xblinitialize.md) method.  
    
<a id="howToSwitchSandbox"></a> 
## Switching your sandbox
To switch your sandbox, follow these instructions:   
1. Open an GDK command prompt (you can type "GDK" in the start menu and it will find the Microsoft GDK Command Prompts folder).   
1. Type `"XblPCSandbox.exe [sandbox ID]"`, where [sandbox ID] is the name of your sandbox (it is case sensitive).
## Troubleshooting process
There are many possible reasons why sign-in might not be working. That’s why it’s important to narrow down the root cause before investigating further.   

Follow this process to narrow the cause of the error you are seeing:   

1. Make sure the switch sandbox operation was successful by signing into the Xbox app. If you can sign in, then you have successfully switched your sandbox. If not, you may not be in the correct sandbox.
    1. [Download the Xbox App](https://www.xbox.com/en-US/apps/xbox-app-for-windows-10) if you don’t already have it.
    1. [Create a test account](/gaming/xbox-live/test-release/test-accounts/live-test-accounts) that has access to the sandbox if you haven’t already.
    1. Switch your sandbox following the instructions in the [Switching your sandbox](#howToSwitchSandbox) section.
    1. Launch the Xbox App. You can type "Xbox" in the start menu and the icon will come up.
    1. Try to sign into the Xbox app with your test account.
    1. If you cannot sign in, then either the sandbox didn’t switch properly or your test account does not have access to the sandbox. To troubleshoot, look at the [Common Errors](#commonErrors) section below to find information about the error you are hitting.
    1. If you can sign in, that means that you were able to switch sandboxes and your test account has access to the sandbox. You can proceed to the next step.
1. Next, try signing into one of our sample projects.
    1. If you are using Unity, you can use the sign-in scene from the Unity plugin. If you are using another engine, you can use the Social sample available on the secure downloads site: aka.ms/gdkdl.
    1. Replace the IDs in the MicrosoftGame.config in the sample with the IDs for your game. See the [Ensuring your IDs are correct](#correctIds) section for information on how to get the IDs.
    1. If you haven’t switched sandboxes, switch to your sandbox following the instructions in the [Switching your sandbox](#howToSwitchSandbox) section.
    1. Build and run the sample.
    1. Try to sign into the sample.
    1. If you cannot sign in using the sample, then there is likely an issue with your game’s Xbox Live configuration either in Partner Center or in your MicrosoftGame.config. See the Common Errors section below for additional troubleshooting.
    1. If you can sign into the sample, but not your game, then there may be a difference between your game and the sample that is causing the issue. You can start by looking for differences in the MicrosoftGame.config files. You can also look for logic differences between the sample’s sign-in code and your game’s code.


<a id="commonErrors"></a> 
## Common Errors

### The user is not in this sandbox (0x8015DC12)
This error means that the test account either does not have access to the sandbox or the game does not have access to the sandbox. Here is a list of common causes of this error:
* The most common cause of this error is mismatching IDs. See the [Incorrect IDs](#commonErrorsIncorrectIds) section below for troubleshooting that error. 
* It is less likely, but also possible the test account does not have access to the sandbox. When you create a test account, you can assign the account access to sandboxes at the bottom of the new test account form. 
* Another possibility is that you are using an isolated sandbox. See the section on [Isolated sandbox instead of shared sandbox](#commonErrorsIsolatedVsSharedSandbox) for more information.

<a id="commonErrorsIncorrectIds"></a>
 
### Incorrect IDs

A common cause of sign-in errors are that some of the values in the MicrosoftGame.config are incorrect. We recommend using the Store Association Wizard in the [MicrosoftGame.config Editor](../../../system/overviews/microsoft-game-config/MicrosoftGameConfig-Editor.md) to link you game to minimize errors from mistyping. You can also double check your IDs in Partner Center with those in your manifest manually following the instructions in the [Ensuring your IDs are correct](#correctIds) section.

### Can’t sign in on PC, but haven’t added the PC Platform on the Xbox Settings page (0x87dd0005, AM_E_XAST_UNEXPECTED)
If you get the error message: 0x87dd0005 (AM_E_XAST_UNEXPECTED), that often means the PC Platform was not added on the Xbox Live settings page. To fix that:
1. Go to Partner Center.
1. Navigate to your game.
1. In the left hand pane, expand **Xbox services** and select **Xbox Settings**.
1. Verify you have the **Windows 10 PC** checkbox checked.
1. Click **Save**.
1. On the **Gameplay settings** page, publish your Xbox Live settings to your dev sandbox.
1. Wait 30 minutes and try signing in again.

**Important:** Make sure you have published your Xbox Live settings to your dev sandbox after pressing save on the Xbox Settings page. Clicking save will **not** publish the changes. Those settings need to be published to Xbox Live to know about your game and sign in to work.

### Misspelled sandbox ID
The sandbox value is case sensitive. For example: “RETAIL” is not the same as “Retail” or “retail”. Although rare, this can happen. Another case that has come up is getting the sandbox incorrect by missing a letter. A last case is if you have multiple sandboxes and switched to a different one than your game was published to.

### Incorrect SCID
It’s important that you send the correct Service Configuration ID (SCID) when making calls to Xbox Live. The SCID is passed to XblInitialize method. Check that it is the correct value.

<a id="commonErrorsIsolatedVsSharedSandbox"></a>
### Isolated sandbox instead of shared sandbox
Unless you have a reason to use an isolated sandbox, we recommend using shared sandboxes. You can check on which type of sandbox your dev sandbox is in Partner Center.

### Can’t find my game or add-on in the store when I switch sandboxes    
If you can’t find your game or add-on in the store when you switch sandboxes:    

Check availability settings in Partner Center:   
1. You have published the game or add-on to your sandbox in Partner Center.   
1. Make sure the availability is set to **make this product available and discoverable in the Microsoft Store**. Note: You can use other discoverability settings too, just make sure you set those settings on purpose.   
1. Make sure if you have an availability date set, it isn't in the future. If you do, you won't be able to see the game or add-on in the store.   

Use the Xbox app:   
1. Switch your sandbox using the XblPCSandbox.exe tool.
1. Restart Xbox app.
1. Sign into Xbox app using your test account.
1. Open a command prompt.
1. Run this command: `msxbox://game/?productId=<store ID>`

If you are trying to use search to find your game or add-on in the store, you have to type the **exact** name of the game otherwise it won't find it. For example if your game is called "TestGame1" and you type "TestGame" into the search box, the store will say it cannot find the game. Note: This is different than retail where you could even type "TestGa" and it will find the game through a partial string match.   

### Try restarting your PC
Sometimes PCs get into a state where one of the services needed for sign-in to work is in a bad state. Sometimes a restart can fix it.

### Ensure your Gaming Services are up to date
We fix the Gaming Services regularly so it's always worth making sure your Gaming Services are up to date. Note: We also update these services automatically, but there can still be cases where you might have an older version. You can check the version information and when Gaming Services was last updated in Add or Remove Programs in settings. To force an update:
1. Launch powershell as an administrator and enter 1"get-appxpackage Microsoft.GamingServices | remove-AppxPackage -allusers"`
1. In the same powershell window, enter "start ms-windows-store://pdp/?productid=9MWPM2CQNLHN"
1. Install the app on that page, including accepting the UAC prompt when shown.
1. Try installing the game again.

### Ensure the Xbox App is up to date
If your PC has been left in a dev sandbox a long time, the Xbox App may not be up to date. We are constantly updating the Xbox App. To update it, switch to RETAIL. It should update automatically. You can check the version information and when Gaming Services was last updated in Add or Remove Programs in settings. If it is not up to date, you can:
1. Make sure you are in the RETAIL sandbox, otherwise you won't be able to find the Xbox app in the store.
1. Launch powershell as an administrator and enter `"get-appxpackage Microsoft.XboxApp | remove-AppxPackage -allusers"`
1. In the same powershell window, enter "start ms-windows-store://pdp/?productid=9mv0b5hzvk9z"
1. Install the app on that page, including accepting the UAC prompt when shown.

### Can't find the Xbox App
The Xbox app is available in the store, but you **must be in the RETAIL sandbox** otherwise it will not be there. Make sure you are in the RETAIL sandbox and search for "Xbox App" in the store.

### 0x89245106 (E_GAMEUSER_NO_DEFAULT_USER)   
This means that there is no current default user. If you're getting this error, it likely means that you called XUserAddAsync(AddDefaultUsersSilently, ...). To fix the issue, you should call XUserAddAsync again, this time without AddDefaultUserSilently to get a user. You can also use `XUserAddOptions options = XUserAddOptions::AddDefaultUserAllowingUI` option to handle the case of showing the UI if needed and signing in silently if not.    

### Device Portal: Switching Sandbox doesn't work   
If you are getting errors using Windows Device Portal to switch your sandbox, use xblpcsandbox.exe instead. Windows Device Portal is not recommended for switching sandboxes. You can find instructions in the [Switching your sandbox](#howToSwitchSandbox) section.    

### Xbox Live is down
If you are still stuck and not seeing an error covered in this document, you can check if Xbox Live services are experiencing an outage. You can check that on the [Xbox Status](https://support.xbox.com/xbox-live-status) page.

### Xbox Live is not enabled
If you cannot sign in, make sure your game is Xbox Live enabled. You can check if your game is Xbox Live enabled by:
1. Go to [Partner Center](https://partner.microsoft.com/en-us/dashboard/apps-and-games/overview) and click on your game.
1. In the side navigation, look for Xbox Services > Xbox Settings.
1. If you don't see Xbox Services in the left navigation then your game is not Xbox Live enabled.
1. If your game requires concept approval, work with your Microsoft representative to get your game Xbox Live enabled.

## See also

[Sanboxes overview](/gaming/xbox-live/test-release/sandboxes/live-setup-sandbox)   
[Advanced sandboxes conceptual overview](/gaming/xbox-live/test-release/sandboxes/live-advanced-sandboxes)   
[Test accounts](/gaming/xbox-live/test-release/test-accounts/live-test-accounts)   
[Xbox Live Configuration Overview](/gaming/xbox-live/test-release/portal-config/live-portal-config-overview)  
[MicrosoftGame.config overview](../../../system/overviews/microsoft-game-config/MicrosoftGameConfig-Overview.md)   