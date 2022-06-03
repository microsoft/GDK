---
author: aablackm
title: WebSocket /ext/frontpanel
description: Remotely controls a front panel for an Xbox One X Devkit.
ms.assetid: AE05E08F-A763-4197-8F21-C363CE4091F7
kindex: WebSocket, /ext/frontpanel
ms.author: jaswill
ms.topic: conceptual
edited: 00/00/0000
security: public
---

# WebSocket (/ext/frontpanel)
Remotely controls a front panel for an Xbox One X Devkit.
   *  [Send messages](#ID4ET)  
   *  [Receive messages](#ID4E1)    

 
<a id="ID4ET"></a>

   

## Send messages
   
Strings can be send indicating that front panel buttons should be pressed. The strings should be from the following set:

Up, Down, Left, Right, or Select to control navigation
One, Two, Three, Four, Five to press one of the five buttons
Switch to simulate a long press of the Select button (toggling between Title and System mode).  
  
<a id="ID4E1"></a>

   
## Receive messages

The websocket will return an image buffer which an be processed to show the contents of the front panel display. The buffer is send in 4bpp.

## See also  
 
<a id="ID4EEB"></a>

   

##### Parent   
 [/ext/frontpanel](uri-extfrontpanel.md)

   