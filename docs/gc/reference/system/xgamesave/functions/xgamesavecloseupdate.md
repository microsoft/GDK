---
author: M-Stahl
title: XGameSaveCloseUpdate
description: Closes a XGameSaveUpdate.
kindex: XGameSaveCloseUpdate
ms.author: kelcon
ms.topic: reference
edited: 02/10/2020
quality: good
security: public
applies-to: pc-gdk
---

# XGameSaveCloseUpdate  

Closes an XGameSaveUpdate.  

## Syntax  
  
```cpp
void XGameSaveCloseUpdate(  
         XGameSaveUpdateHandle context  
)  
```  
  
### Parameters  
  
*context* &nbsp;&nbsp;\_In\_  
Type: XGameSaveUpdateHandle  

  
Handle to the XGameSaveUpdate to be closed.  


  
### Return value
Type: void
  
Function result.  
  
## Remarks  
  > [!NOTE]
> This function isn't safe to call on a time-sensitive thread. For more information, see [Time-sensitive threads](../../../../system/overviews/time-sensitive-threads.md).  
  
Call this function when you have finished using an XGameSaveUpdateHandle. If you do not close the context handle for a game save update you will cause a memory leak. Every call made to [XGameSaveCreateUpdate](xgamesavecreateupdate.md) should have a matching call to **XGameSaveCloseUpdate**.  
  
## Requirements  
  
**Header:** XGameSave.h
  
**Library:** xgameruntime.lib  
  
**Supported platforms:** Windows, Xbox One family consoles and Xbox Series consoles  
  
## See also  
[XGameSave](../xgamesave_members.md)  
[XGameSaveCreateUpdate](xgamesavecreateupdate.md)  
[Game save errors](../../../../system/overviews/game-save/game-saves-errors.md)