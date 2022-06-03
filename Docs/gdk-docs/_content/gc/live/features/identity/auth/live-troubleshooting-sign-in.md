---
title: Troubleshooting Xbox services sign-in
description: Troubleshooting issues with Xbox services sign-in, such as correct sandbox and configuration IDs.
kindex:
- Troubleshooting Xbox services sign-in
- sign-in
ms.topic: article
ms.assetid: 87b70b4c-c9c1-48ba-bdea-b922b0236da4
ms.author: joanlee
author: joannaleecy
ms.date: 04/04/2017
security: public
applies-to: pc-gdk
---

# Troubleshooting Xbox services sign-in

There are several common issues that can cause difficulty signing-in.

## Sandbox problems

You should familiarize yourself with the concept of sandboxes and how they pertain to Xbox Live.
See [Xbox Live Sandboxes overview](../../../test-release/sandboxes/live-setup-sandbox.md).

Sandboxes enforce content isolation and access control before retail release.
Users without access to your development sandbox cannot perform any read or write operations that pertain to your title.
You can also publish variations of service config to different sandboxes for testing.

Things to watch out for with sandboxes are discussed below.

#### Developer account doesn't have access to the right sandbox for run-time access

To sign-in to a title that is in development, a test account (also known as a *development account*) or an authorized developer account must be used.

* Make sure you are attempting to sign-in with one or the other.
* Test accounts are created at Partner Center.
* You can authorize an Xbox services-associated developer account on Partner Center at [https://partner.microsoft.com/xboxconfig/TestAccounts/](https://partner.microsoft.com/xboxconfig/TestAccounts/).
* Ensure that the account has access to the sandbox your title is published to.
* The test accounts you create in Partner Center inherit the permissions of the Partner Center account that created them.

### Your device is not on the correct sandbox

The device you are developing on must be set to a development sandbox.
On Xbox One (or later), set your sandbox using *Xbox One Manager*.

For Windows 10 Desktop, use the `SwitchSandbox.cmd` script that's located in the `Tools` directory of the Xbox Live SDK installation.

### Your title's service configuration is not published to the correct development sandbox

Ensure your title's service configuration is published in a development sandbox.

You cannot sign-in to Xbox network (Xbox Live) in a given development sandbox for a title, unless that title is published to the same sandbox.

To publish the title to the same sandbox, see the section [Sandbox IDs](../../../test-release/sandboxes/live-setting-up-sandboxes.md#sandbox-ids) in the article "Xbox Live service configuration IDs, for Managed Partners".

To publish your Partner Center configuration to a sandbox, go to the Xbox services configuration page on Partner Center and select the **Test** button.

## IDs configured incorrectly

There are several pieces of ID required to configure your game.

Some things to watch out for are:

* Ensure your App ID is entered into Partner Center correctly.
* Ensure your PFN is entered into Partner Center correctly.
* Ensure that the "Package Identity" in your appxmanifest is correct. This is shown in Partner Center as "Package/Identity/Name" in the App Identity section.

## Title ID or SCID not configured correctly

For XDK and GDK titles, these values are set in your `package.appxmanifest`.

## Debug based on error code

Following are some of the error codes you may see upon sign-in, and steps you can take to debug these errors.
The error codes appear as follows:

![0x8015DC12 Sign-In Error Screenshot](../../../../../../resources/gamecore/secure/images/en-us/live/identity/sign_in_error.png)

### 0x80860003 The application is either disabled or incorrectly configured

1. Try deleting your PFX file.

   ![pfx file in Solution Explorer](../../../../../../resources/gamecore/secure/images/en-us/live/identity/pfx_file.png)

   If you didn't sign-in to Visual Studio with the Microsoft Account used for provisioning the app in Partner Center, Visual Studio will auto generate a signing pfx file based on your personal Microsoft Account or your domain account.
   When building the appx package, Visual Studio will use that auto-generated pfx to sign the package & alter the "publisher" part of the package identity in the `package.appxmanifest`.
   As a result, the produced bits (specifically, the `appxmanifest.xml`) will have a different package identity than what you intend to use.

2. Double-check that your `package.appxmanifest` is set to the same application identity as your title in Partner Center.
   You can either right-click on your project and choose **Store** -> **Associate App With Store...**, as shown in the below screenshot; or, manually edit your `package.appxmanifest`.

   ![Associate with store](../../../../../../resources/gamecore/secure/images/en-us/live/identity/appxmanifest_binding.png)

### 0x8015DC12 Content Isolation Error

This error means that either the device or user doesn't have access to the specified title.

1. This could mean you're not using a test account to attempt sign-in, or your test account doesn't have access to the same sandbox you're signed in as.
   Double-check the instructions on creating test accounts in [Xbox services test accounts](../../../test-release/test-accounts/live-test-accounts.md).
   If necessary, create a new test account with access to the appropriate sandbox.

   You may need to remove your old account from Windows 10, you can do that by going to Settings from the Start Menu, and then going to Accounts.

2. Double-check that your title is published to the sandbox that you are trying to use.
   See the section [Sandbox IDs](../../../test-release/sandboxes/live-setting-up-sandboxes.md#sandbox-ids) in Setting up sandboxes.

### 0x87DD000E Title not authorized

Double-check that your device is set to the proper development sandbox and that the user has access to the sandbox.

Check the Partner Center Binding and App ID setup as described above.

If you are getting an error not described here, see the error list in the `xbox::services::xbox_live_error_code` documentation, to get more information about the error codes.
You can also refer to `errors.h` in the XSAPI includes.

If you are unable to sign in with your title, post a support thread on the [forums](https://forums.xboxlive.com) or reach out to your account manager.
