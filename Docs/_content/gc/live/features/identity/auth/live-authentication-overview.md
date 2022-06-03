---
title: Account authentication and access overview
description: Describes how to authenticate and access accounts, use the Xbox Authentication Library, and use XUser API contents.
kindex:
- Authentication and sign-in overview
- Xbox Live, authentication
author: joannaleecy
ms.author: jeffshi
ms.topic: conceptual
ms.localizationpriority: medium
edited: 02/12/2021
security: public
---

# Account authentication and access overview

Use this topic to authenticate and access accounts, use the Xbox Authentication Library (XAL), and use `XUser` API contents.

The Xbox Live client manages the identity of the users who are interacting with your game by using an `XUserHandle` object. Each `XUserHandle` instance represents a user who's signed into your game.

For more information about how to connect a user to Xbox Live, see the code example in [How to: best practice to sign in a user](../../../../system/overviews/user/xuser_howto_best_practice_signing_in.md).  
  
## Xbox app on Windows PC  
  
For Windows PC development, you can use the Xbox app to access Xbox Live by using a [test account](../../../test-release/test-accounts/live-setup-testaccounts.md) in a development sandbox. Use the following steps to access a test account from a development sandbox.  
  
 1. Download and install the Xbox app [from the Microsoft Store](https://www.microsoft.com/store/productId/9MV0B5HZVK9Z). 
 1. Switch to the development sandbox for your game. You can switch the development sandbox on Windows PC by using the [PC Sandbox Switcher](../../../test-release/tools/live-pc-sandbox-switcher.md) tool.
 1. Open the Xbox app. 
 1. Select the profile icon, and then select **Sign in**.
 1. Follow the instructions to access the account. 

To sign out of the account, open the Xbox app, and then select the profile icon > **Sign out**. 

## XAL and XUser  

XAL and `XUser` are similar APIs. XAL is provided to support cross-platform games.
> [!NOTE]
> If you're targeting cross-platform (mobile and the GDK), use XAL. If you're only targeting the GDK, use `XUserHandle` instead.  
  
## See also

[User identity and XUser](../../../../system/overviews/user/player-identity-xuser.md)