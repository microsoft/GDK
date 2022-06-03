---
author: M-Stahl
title: GameInput porting guide (contents)
description: Provides a porting guide for `GameInput`.
kindex: GameInput porting guide
ms.author: chrism
ms.topic: conceptual
edited: 07/29/2020
security: public
---

# GameInput porting guide


<a id="introductionSection"></a>

The functionality of `GameInput` is a superset of all previous input APIs. As a result, porting from a previous input API is, in most cases, a straightforward process. The biggest changes usually derive from `GameInput` being input-centric rather than device-centric. Code that uses previous APIs typically enumerates input devices before reading their input. In `GameInput`, however, this isn't necessary. Adapting to the input-centric model of `GameInput` usually makes up most of any structural changes to previous code that will be ported.

The following topics provide details about the differences between `GameInput` and the previous input APIs. These topics also include code examples that highlight the biggest differences among the APIs.

[Porting from Windows.Xbox.Input to GameInput](input-porting-wxi.md)

Describes porting from `Windows.Xbox.Input` in the original Xbox One Software Development Kit.

[Porting from XInput to GameInput](input-porting-xinput.md)

Describes porting from `XInput` on Xbox&nbsp;360 or a PC.




<a id="seeAlsoSection"></a>

## See also

[GameInput introduction](../overviews/input-overview.md)

[Input API reference](../../reference/input/gc-reference-input-toc.md)

[Microsoft Game Development Kit](../../GDKIntroduction.md)