---
author: M-Stahl
title: XGameSaveCreateContainer
description: Creates a XGameSaveContainer handle.
kindex: XGameSaveCreateContainer
ms.author: kelcon
ms.topic: reference
edited: 01/06/2020
quality: good
security: public
applies-to: pc-gdk
---

# XGameSaveCreateContainer  

Creates a XGameSaveContainer handle.

## Syntax  
  
```cpp
HRESULT XGameSaveCreateContainer(  
         XGameSaveProviderHandle provider,  
         const char* containerName,  
         XGameSaveContainerHandle* containerContext  
)  
```  
  
### Parameters  
  
*provider* &nbsp;&nbsp;\_In\_  
Type: XGameSaveProviderHandle  

  
Handle to the XGameSaveProvider which will create the container.  


*containerName* &nbsp;&nbsp;\_In\_z\_  
Type: char*  

  
Name of the container to be created.  

Valid characters for the path portion of the container name (up to and including the final forward slash) includes 
uppercase letters (A-Z), lowercase letters (a-z), numbers (0-9), underscore (_), and forward slash (/). The path 
portion may be empty.

Valid characters for the file name portion (everything after the final forward slash) include uppercase letters (A-Z), 
lowercase letters (a-z), numbers (0-9), underscore (_), period (.), and hyphen (-). The file name may not be empty, 
end in a period or contain two consecutive periods.

The maximum length for the container name is 256 characters.


*containerContext* &nbsp;&nbsp;\_Outptr\_result\_nullonfailure\_  
Type: XGameSaveContainerHandle*  

  
Handle to the XGameSaveContainer to be returned by this function call.  


  
### Return value
Type: HRESULT
  
Function result. If the containerName is invalid, the function will return E_GS_INVALID_CONTAINER_NAME (0x80830001).
  
## Remarks  
  > [!NOTE]
> This function isn't safe to call on a time-sensitive thread. For more information, see [Time-sensitive threads](../../../../system/overviews/time-sensitive-threads.md).  
  
![alert](../../../../../../resources/gamecore/images/en-us/common/note.gif) **NOTE:** The XGameSave API requires your title to have its title ID and service configuration ID (SCID) 
properly configured in order to work. For more information about these required IDs, see [Setting Up Sandboxes for Xbox 
Live Development](../../../../live/test-release/sandboxes/live-setting-up-sandboxes.md). Your game must be enabled for Xbox Live in Partner Center.

If you do not configure your SCID and Title ID properly, your XSaveGame API calls will fail with the following error code:

E_GS_NO_ACCESS - 0x80830002 - The operation failed because the title does not have access to the container storage spaces.

XGameSaveCreateContainer is used to both create a new container and access a previously made container by using the name 
as an identifier. A gamesave container holds information about a player in the form of [XGameSaveBlobs](../structs/xgamesaveblob.md). 
Blobs are specific data associated with a player, that data includes a name and value along with other information to help 
read the blob data. You can find the make up of an **XGameSaveContainer** in the 
[XGameSaveContainerInfo](../structs/xgamesavecontainerinfo.md) struct.

![alert](../../../../../../resources/gamecore/images/en-us/common/note.gif) **NOTE:** A container is not finalized until either [XGameSaveSubmitUpdate](xgamesavesubmitupdate.md) or 
[XGameSaveSubmitUpdateAsync](xgamesavesubmitupdateasync.md) has been called for the container. Until the update API has 
been called, the container will not ship in the results of 
[XGameSaveEnumerateContainerInfoByName](xgamesaveenumeratecontainerinfobyname.md).
  
## Requirements  
  
**Header:** XGameSave.h
  
**Library:** xgameruntime.lib  
  
**Supported platforms:** Windows, Xbox One family consoles and Xbox Series consoles  
  
## See also  
[XGameSave](../xgamesave_members.md)  
[XGameSaveContainerInfo](../structs/xgamesavecontainerinfo.md)  
[XGameSaveBlob](../structs/xgamesaveblob.md)  
[Game save errors](../../../../system/overviews/game-save/game-saves-errors.md)