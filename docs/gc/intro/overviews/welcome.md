---
author: M-Stahl
title: Welcome to the Microsoft Game Development Kit
description: Provides an introduction to the Microsoft Game Development Kit.
kindex: Welcome to the Microsoft Game Development Kit
ms.author: jgup
ms.topic: conceptual
edited: 00/00/0000
security: public
---

# Welcome to the Microsoft Game Development Kit

The Microsoft Game Development Kit (GDK) is a complete set of tools, APIs, extensions, and programing models that can be used across current and future Microsoft Gaming platforms and initiatives. This document is an introduction to the Microsoft Game Development Kit (GDK) and our goals for it. Please send us your feedback in the [Microsoft Game Development Kit (GDK) developer forum](https://aka.ms/gdkforum) so we may continue enabling you to bring amazing games and experiences to our platforms!


## Why the Microsoft Game Development Kit (GDK)?

### Introduction

Before creating the Microsoft Game Development Kit (GDK), the Gaming team at Microsoft asked you, our game development partners, about how we could do better, how we could empower you to do more, and how we could help you delight the gamers of today and tomorrow. We embarked on a listening tour, met with many of you in person, and heard your thoughts on what we do well and what we need to improve. We're incredibly thankful for the time, energy, and knowledge you've shared with us, and we're proud to say that the Microsoft Game Development Kit (GDK) is the direct result of the feedback you've given us.

Please remember: We realize that our journey is not over, and this very document is just the next step on that journey. We want to show you what we've made and encourage you to continue giving feedback about what we get right, what we get wrong, and what we're missing.

### What we've heard

During our listening tour, we heard some very consistent themes:

"The ERA App Model and WinRT APIs mean I can't build games the way I want to. I need to have two people dedicated to that work, and that work is essentially useless on every other platform I want to target."

"While the code reusability might have been useful, UWP was otherwise awful for game development. You're making me rewrite my entire Windows game to run on, uhm, Windows."

"Trying to do iterative development on an Xbox is a race to see what breaks first: my devkit or my development PC!"

### What we've done about it

Our primary goal for the Microsoft Game Development Kit (GDK) was to address your feedback directly and to ensure that you can:

* Continue developing games exactly as you do today

* Easily share as much code as possible, across every Microsoft Gaming initiative and program: our consoles and PCs of today, and our consoles and Xbox Game Streaming of tomorrow

* Trust our development tools and platforms to provide a fast, reliable, developer-focused environment

* Take advantage of new multi-platform services and experiences as quickly and easily as possible

We want to help you develop your game on whatever platform you want to develop it on, by using whatever programming paradigms you already use. We want to help you bring your games to all of our gaming platforms that exist today and to all the platforms that we're working on and that will delight the gamers of tomorrow.

The "Xbox One ERA" programming model and Microsoft-specific C++ language extensions made it harder than necessary to build your Xbox games, maintain code, and test it on your development PC. With the Microsoft Game Development Kit (GDK), we fixed that by taking advantage of the existing Windows APIs you use in your PC games today, and by extending the APIs by using C-style programing models and extensions better aligned with how you've been developing games all along. We also removed "C++ with hats", APIs that throw exceptions, and the WinRT-based Async model&mdash;all in favor of giving you control over writing code and interacting with our platform the way you interact with it today.

To align with those changes, we rewrote a number of our game-centric services&mdash;including Xbox Live, Connected Storage, and our packaging tools&mdash;to be identical on all our platforms. This will greatly increase code testability and reusability, especially for developers who want to bring their gaming content not only to Xbox but also to the Microsoft Store, where they can be part of initiatives like PC GamePass.

The Microsoft Game Development Kit (GDK) does not provide a new programming model but a way for you to continue writing your games as you've done for years: by using Windows APIs and using Microsoft Gaming extensions such as DirectX 12x. The main goal of the Microsoft Game Development Kit (GDK) is to continue helping you bring your games to the Microsoft platforms and participate in the initiatives of your choosing.

Welcome to Microsoft Game Development Kit!
