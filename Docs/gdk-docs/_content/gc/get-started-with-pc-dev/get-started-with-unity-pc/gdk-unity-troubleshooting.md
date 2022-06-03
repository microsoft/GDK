---
author: sdgmiller
title: Troubleshooting the GDK Unity package
description: Provides an overview of how to troubleshoot the GDK Unity package.
kindex:
- Troubleshooting the GDK Unity package
- Troubleshooting Guide
- Unity Help
ms.author: zhooper
ms.topic: conceptual
edited: 11/12/2020
security: public
---

# Troubleshooting the GDK Unity package

Use this topic to troubleshoot issues with the GDK Unity package.


## package readme file

A *Readme.docx* file is included in the GDK Unity package. This file includes additional information about how to integrate the package to your project. It’s accessible in the Documentation section of the GDK menu in Unity as **Setting up your project to work with the GDK Unity package** as shown in the following screenshot.

![Screenshot of the GDK Unity package menu](../../../../resources/gamecore/secure/images/en-us/gdk_unity_menu.png)  


## Console output in Unity

The Console output window in Unity provides insights on failures that occur when using the tools that are in the GDK Unity package. You can find the root cause by inspecting the Console output. It also provides more information when it sends feedback to Microsoft (see more information in the following sections).


## Developer Mode in Windows 10

As with the Microsoft Game Development Kit, the GDK Unity package requires that your local PC has [Developer Mode](/windows/uwp/get-started/enable-your-device-for-development) enabled. If this isn't enabled, an error occurs in the Console output upon importing the package.


## Permission errors with Partner Center

To associate your product with the Microsoft Store, the account you use to sign in during the Store Association Wizard needs permissions to read the ID information for your project in Partner Center. If you don't have sufficient permissions, an error occurs as shown in the following screenshot.

![Screenshot of the permissions error in Partner Center](../../../../resources/gamecore/secure/images/en-us/gdk_unity_error.png)


## Using Fiddler to inspect service calls

Fiddler is a web-debugging proxy that's used to inspect web service calls. If you're encountering issues with Xbox Live service calls, use this tool for more insight about the root cause. For more information, see [Using Fiddler to inspect web service calls](../../live/test-release/tools/live-fiddler-inspect-web-calls.md). 


## MSIXVC package installation and launch issues

For more information about troubleshooting tips for PC installation and launch issues, see [Utilizing Microsoft Game Development Kit tools to install and launch your PC title](../../tools-pc/launching-on-pc.md).

## XStoreShowProductPageUI is not exposed

At the present time, the XStoreShowProductPageUI is not exposed to Unity. As a workaround, you can call Application.OpenURL and pass in "ms-windows-store://pdp/?productid=&lt;storeID&gt;" to launch the Store UI.

## GDK APIs don't work when called in Awake

Some GDK APIs don't work when called from the Awake method in a MonoBehavior. We recommend calling GDK methods in the Start method or later.

## Send feedback

If you encounter an issue with the package and can't self-diagnose the issue, use the built-in Send feedback option in the GDK menu to send information to the development team as shown in the following screenshot. In addition to issue reporting, use this tool to send suggestions or feature requests. Feedback is considered for future updates.

![Screenshot of the Send feedback option in the GDK menu in Unity](../../../../resources/gamecore/secure/images/en-us/gdk_unity_feedback.png)


## See also

[Get started with Unity for PC development](gc-get-started-with-unity-pc-toc.md)  
[Troubleshooting sign-in and sandboxes](../../live/test-release/troubleshooting/live-troubleshoot-sandboxes.md)