---
author: M-Stahl
title: GameInput introduction
description: Overview of GameInput
kindex: GameInput Overview
ms.author: chrism
ms.topic: conceptual
edited: 06/26/2019
security: public
---

# Overview of GameInput


<a id="introductionSection"></a>

GameInput is a next-generation input API that exposes input devices of all kinds through a single consistent interface. It's designed with a simple programming model that makes it easy to use. GameInput is built from the ground up for the best possible performance. Key features of the GameInput API are as follows.

*  __Availability__

    GameInput is available on all Windows platforms&mdash;PC, Xbox, HoloLens, IoT, and others&mdash;and is callable from GDK, Win32, and Universal Windows Platform (UWP) applications. Most importantly, it's available on earlier versions of Windows all the way back to Windows 7 via a redistributable installer package. This enables a single input codebase to be used across the entire Microsoft ecosystem, with no platform/version special-casing required.
    > [!NOTE]
    > PC support (including earlier versions of Windows) will be available in an upcoming Windows SDK.

*  __Consistency__

    GameInput exposes input from keyboards, mice, gamepads, and other game controllers via a single unified input model, synchronized to a common time base. The code for handling input from these devices is nearly identical, using many of the same functions but with different filters applied. This makes it easy to add support for additional input devices, without major changes to input code.

*  __Functionality__

    GameInput is a functional superset of all legacy input APIs&mdash;XInput, DirectInput, Raw Input, Human Interface Device (HID), and WinRT APIs&mdash;in addition to adding new features of its own. GameInput's functionality ranges from simple fixed-format gamepad state to detailed low-level raw device access. Input can be obtained via polling or callbacks in an event-driven way. Haptics and force feedback are fully supported, and third-party device SDKs can easily be written on top of GameInput to provide access to custom device features.
*  __Performance__

    GameInput is built around an entirely new direct memory access (DMA) architecture for the lowest possible input latency and resource usage. Nearly all API functions are lock-free with strict performance guarantees, while still being 100 percent thread-safe. This makes them safe to call from time-sensitive contexts such as render threads. Advanced applications can take direct control of scheduling GameInput's internal asynchronous work queues, controlling which thread does the work and how often.

*  __Usability__

    GameInput was designed with ease of use as a top priority. Most common input tasks can be implemented with just a few lines of code.


<a id="gettingStartedSection"></a>
## Getting started

GameInput is the recommended API for all new code, regardless of the target platform, because it provides support across all Microsoft platforms (including earlier versions of Windows), and provides superior performance versus legacy APIs.
> [!NOTE]
> For games developed on the Microsoft Game Development Kit (GDK) for Xbox One, GameInput is the only input API available.

To learn more about the GameInput API, start with [GameInput fundamentals](input-fundamentals.md).

If you're porting input code from an existing codebase, see the [GameInput porting guide](../porting/input-porting.md) for API-specific guidance.


<a id="seeAlsoSection"></a>
## See also

[GameInput fundamentals](input-fundamentals.md)

[GameInput porting guide](../porting/input-porting.md)

[GameInput API reference](../../reference/input/gc-reference-input-toc.md)

[Microsoft Game Development Kit](../../GDKIntroduction.md)