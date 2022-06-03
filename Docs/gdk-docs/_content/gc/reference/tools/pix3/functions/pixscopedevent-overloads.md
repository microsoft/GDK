---
author: aablackm
title: PIXScopedEvent
description: Creates a user-defined event for a timing capture of CPU activity, to be displayed in the **Timing Capture** feature of Performance Investigator for Xbox (PIX).
kindex:
- PIXScopedEvent
- PIX, PIXScopedEvent
ms.author: jerry.zhou
ms.topic: conceptual
ms.date: 10/05/2020
edited: 10/16/2020
quality: good
security: public
---

# PIXScopedEvent
  
These functions create a user-defined event for a timing capture of CPU activity, to be displayed in the **Timing Capture** feature of Performance Investigator for Xbox (PIX). Events defined by calling `PIXScopedEvent` begin when the API is called and end when the enclosing scope exits.  
  
<a id="overloadsSection"></a>
  
## Overload list
  
| Name| Description |  
| --- | --- |  
| [PIXScopedEvent(UINT64, PCSTR, ...)](pixscopedevent.md) | Creates a user-defined event for a timing capture of CPU activity, to be displayed in the **Timing Capture** feature of Performance Investigator for Xbox (PIX). |  
| [PIXScopedEvent(UINT64, PCWSTR, ...)](pixscopedevent.md) | Creates a user-defined event for a timing capture of CPU activity, to be displayed in the **Timing Capture** feature of Performance Investigator for Xbox (PIX). |  
| [PIXScopedEvent(void\*, UINT64, PCSTR, ...)](pixscopedevent.md) | Creates a user-defined event for a context-specific timing capture of CPU activity or, for Xbox only, GPU activity, to be displayed in the **Timing Capture** feature of Performance Investigator for Xbox (PIX). |  
| [PIXScopedEvent(void\*, UINT64, PCWSTR, ...)](pixscopedevent.md) | Creates a user-defined event for a context-specific timing capture of CPU activity or, for Xbox only, GPU activity, to be displayed in the **Timing Capture** feature of Performance Investigator for Xbox (PIX). |  
  
<a id="seealsoSection"></a>
  
## See also
  
[PIX (NDA topic)](../../../../tools-console/xbox-tools-and-apis/pix/pix.md)  
[PIX3](../pix3_members.md)  
  