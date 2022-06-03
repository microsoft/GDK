---
author: M-Stahl
title: Fiddler on Windows PC
description: Describes how to use Fiddler with the Microsoft Game Development Kit (GDK) on Windows PC.
kindex:
- How to use Fiddler with the Microsoft Game Development Kit (GDK) on Windows desktop
- How to use Fiddler with the Microsoft Game Development Kit (GDK) on Windows PC
ms.author: douggal
ms.topic: conceptual
edited: 11/17/2020
security: public
---

# Fiddler on Windows PC

Use this topic to understand how to use Fiddler with the Microsoft Game Development Kit (GDK) on Windows PC. *Fiddler* is a web-debugging proxy that logs all HTTP and HTTPS traffic between a Windows PC and the internet. To understand and debug web service calls, use Fiddler to log and inspect traffic. Fiddler is available in several versions. *Fiddler Classic* is freeware. To download it, see the [Fiddler website](https://www.fiddler2.com/fiddler2/). The following section refers to only to Fiddler Classic.


## Configuring Fiddler for use with the Microsoft Game Development Kit (GDK) on Windows PC

Configure Fiddler for use with the Microsoft Game Development Kit (GDK) on Windows PC by using its standard configuration process. For more information about this process, see the [Fiddler documentation](https://docs.telerik.com/fiddler/configure-fiddler/tasks/configurefiddler).

To capture all Xbox Live and title traffic correctly, also ensure the following:

* Fiddler should be run in Administrative mode.
* Enable traffic capture from Xbox Game Bar, Xbox Game Bar Plugin, Xbox Console Companion, Xbox Game UI, and Xbox title-callable UI (TCUI) containers.
* Enable traffic capture from a title-executable container.


## See also

 [Fiddler website](https://www.fiddler2.com/fiddler2/)