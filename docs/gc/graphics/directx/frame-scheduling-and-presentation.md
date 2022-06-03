---
author: sdgmiller
title: Frame scheduling and presentation on Xbox One
description: >-
  Swap chains are not supported in the Microsoft GDK Game OS.  Direct3D resources capable of display output are instead directly presented through a command queue.  The frames associated with presented resources must additionally be explicitly scheduled by Game OS developers to minimize latency from input sampling to display.
kindex:
- Frame scheduling and presentation on Xbox One
- Swap chain
- Swap resource
- Frame scheduling
- Frame interval
- Frame event
ms.author: mattbron
ms.topic: conceptual
edited: 10/10/2019
security: secure
---

# Frame scheduling and presentation on Xbox One
> [!IMPORTANT]
> Starting February 3rd 2022, all user permissions will be managed in Partner Center, any users that do not exist in the Partner Center user store will lose access to forums, secure documentation, and downloads. To maintain access all users should be migrated to Partner Center. <p></p>See this <a href="https://forums.xboxlive.com/articles/132187/breaking-change-user-access-for-forums-secure-docu.html">forum article</a> for more details.  

 Access to this topic requires membership in an NDA developer program. Contact your publisher or your Xbox program representative if you need direct access. Not in the program? Read about joining the <a href="https://www.xbox.com/Developers/id">ID@Xbox</a> program to gain access today!  <br/><br/>If you are already part of the developer program you can access the secure version of this page here: <a target="_blank" href="https://developer.microsoft.com/en-us/games/xbox/docs/gdk/frame-scheduling-and-presentation">https://developer.microsoft.com/en-us/games/xbox/docs/gdk/frame-scheduling-and-presentation</a>