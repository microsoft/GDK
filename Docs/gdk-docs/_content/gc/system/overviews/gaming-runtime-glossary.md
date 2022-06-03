---
author: M-Stahl
title: Gaming Runtime glossary
description: A glossary of Gaming Runtime terms.
kindex:
- Gaming Runtime glossary
- glossary, Gaming Runtime
ms.author: nivece
ms.topic: conceptual
edited: 10/16/2019
security: public
---

# Gaming Runtime glossary

* __Gaming platform:__ All the gaming components that are in the OS layer like WINAPI_FAMILY_GAMES, the Microsoft Game Development Kit (GDK) game OS, or features exposed through OneCore. This ships as xgameplatform.lib, and is part of the Windows SDK.
* __xgameruntime.lib and XGameRuntime.h:__ The static lib and header used by the game to access the Gaming Runtime features. These components are compiled into the game.
* __Gaming Runtime:__ The suite of components that are required for using Gaming Runtime features on PC. This suite of components is installed and serviced as a single unit and includes:
    * __Gaming Runtime Services (GRTS):__ The services that are used for Gaming Runtime features that require out-of-game title execution. The store package used to deliver these services is Microsoft.GamingServices.
    * __xgameruntime.dll:__ The DLL that's loaded into the game process. It's referenced by the xgameruntime.lib and manages all communication with GRTS. It also invokes GameRuntimeUIApp.exe when appropriate. The store package used to deliver these services is Microsoft.GamingRuntime.
    * __Game Runtime UI App:__ The app that's invoked by the xgameruntime.dll or GRTS to show user experience (UX) on behalf of the game. A common usage scenario is title-callable UI (TCUI). This app is delivered through the store package Microsoft.GamingServices.
* __Gaming Cloud Services:__ The cloud-hosted gaming-specific services like Xbox Live, PlayFab, and Microsoft Store that are generally exposed as REST APIs.
* __Gaming Runtime Packages:__ The suite of packages that games declare as dependencies to ensure the Gaming Runtime system is installed before the game is installed.
* __Xbox Authentication Library (XAL):__ For games that take a dependency on the Gaming Runtime, XAL ships as a set of .h files that compile into the game and call directly into the GameRuntime.lib.

* __Xbox Service API (XSAPI):__ Delivered as static libs or DLLs for consumption by the game. Servicing of these components requires a game recompile and update. XSAPI may call into the Gaming Runtime (if it's installed) but doesn't ship as part of it.
* __Social Data Cache Service:__ The local service that runs on console and allows all UX apps access to the same Xbox Live social data through a shared component. This service doesn't ship as part of the Gaming Runtime.