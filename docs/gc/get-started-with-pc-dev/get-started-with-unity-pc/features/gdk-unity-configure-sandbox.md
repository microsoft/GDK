---
author: sdgmiller
title: Configuring your PC sandbox environment
description: Describes how to configure your PC sandbox environment.
kindex:
- Configuring your PC sandbox environment
- PC Sandbox
- Unity Sandbox
ms.author: zhooper
ms.topic: conceptual
edited: 11/11/2020
security: public
---

# Configuring your PC sandbox environment in Unity

Use this topic to understand how to use the Switch Sandbox tool to manage your PC sandbox environment.

## Sandbox overview

You can edit your title in an isolated environment by using [Xbox Live sandboxes](../../../live/test-release/sandboxes/live-setup-sandbox.md).
> [!NOTE]
> Before validating the Xbox Live services in your game, configure the information about your title in [Partner Center](https://partner.microsoft.com/dashboard).

## Requirements for using Switch Sandbox

Partner Center provides the sandbox IDs for your title. These values are made available during the Store Association Wizard process. Ensure that you've updated your Unity project for publishing in the Microsoft Store before you use the Switch Sandbox tool.

## Switch Sandbox tool

The Switch Sandbox tool is in the GDK menu as Switch Sandbox. After opening the Switch Sandbox tool, it enumerates the list of development sandboxes that you can switch your local PC to as shown in the following screenshot. After switching to the sandbox you want, select **Launch Apps** to see how your title loads in the Microsoft Store apps on Windows PC and an Xbox console.

![Screenshot of the Switch Sandbox tool in the GDK Unity package](../../../../../resources/gamecore/secure/images/en-us/gdk_unity_sandbox.png)

## See also

[Get started with Unity for PC development](../gc-get-started-with-unity-pc-toc.md) 