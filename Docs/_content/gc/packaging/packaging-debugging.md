---
author: M-Stahl
title: 'Streaming installation: debugging'
description: Describes how to pause streaming installation of a title until the debugger is connected to the title.
kindex: Streaming Installation- Debugging
ms.author: brianhud
ms.topic: conceptual
edited: '08/07/2019'
security: public
---

# Streaming installation: debugging


To assist with the debugging of your title, you can temporarily halt its streaming installation and connect the debugger. 

To pause the title's streaming installation until the debugger is connected to the title  

   1. In the application's **main** method, include the following code before any other code:<br/>  
      ```cpp
      while ( !IsDebuggerPresent() )
      {
          Sleep(1000);
      }  
      ```

   1. Build the application package by using makepkg.<br/>  

   1. Register the application, and then copy the application's launch chunk to the Development Kit by using [xbapp install (NDA topic)](../tools-console/xbox-tools-and-apis/commandlinetools/xbapp.md#xbapp_install):  
     `**xbapp** **install** /l *packagepath*<br/>`  
   1. Launch the application by using [xbapp launch (NDA topic)](../tools-console/xbox-tools-and-apis/commandlinetools/xbapp.md):  
     `**xbapp** **launch** *appusermodelid*`  
   1. Add a breakpoint in your Visual Studio project.  
   1. Attach the Visual Studio debugger. <br/>  
   1. Start the installation process by using [xbapp install (NDA topic)](../tools-console/xbox-tools-and-apis/commandlinetools/xbapp.md):  
     `**xbapp** **install** *packagepath*`<br/>  