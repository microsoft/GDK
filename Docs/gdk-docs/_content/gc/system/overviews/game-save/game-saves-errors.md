---
author: M-Stahl
title: Game saves errors overview
description: Describes the most common XGameSave API errors and how to respond to them.
kindex:
- Save games errors
- Game saves errors
- Connected Storage errors
- Cloud saves errors
ms.author: jgup
ms.topic: conceptual
security: public
edited: 00/00/0000
---

# Game saves errors

Describes the most common XGameSave API errors and how to respond to them.

## Errors 

### 0x80830001 - E_GS_INVALID_CONTAINER_NAME
The name of the container is invalid.

Valid characters for the path portion of the container name (up to and including 
the final forward slash) includes uppercase letters (A-Z), lowercase letters (a-z),
 numbers (0-9), underscore (_), and forward slash (/). The path portion may be 
 empty.

Valid characters for the file name portion (everything after the final forward 
slash) include uppercase letters (A-Z), lowercase letters (a-z), numbers (0-9), 
underscore (_), period (.), and hyphen (-). The file name may not be empty, end 
in a period or contain two consecutive periods.

### 0x80830002 - E_GS_NO_ACCESS

The Xbox Live Service Configuration ID (SCID) is not configured correctly on 
the service.

### 0x80830003 - E_GS_OUT_OF_LOCAL_STORAGE
The device has run out of room for save games. Users will need to free up storage 
space on the device. This error can be hit even if the game's per user storage 
quota has not been exceeded.

### 0x80830004 - E_GS_USER_CANCELED
The user canceled the download of their save games.

### 0x80830005 - E_GS_UPDATE_TOO_BIG
The size of the update is too big. The total size of the update must be smaller 
than GS_MAX_BLOB_SIZE (16 MB), regardless of the total number of blobs.

### 0x80830006 - E_GS_QUOTA_EXCEEDED
The game has exceeded the per-user quota for the game. By default this quota is 
256MB. Games can ask for an exception to make this larger.

### 0x80830007 - E_GS_PROVIDED_BUFFER_TOO_SMALL
The buffer provided to the API was too small.

### 0x80830008 - E_GS_BLOB_NOT_FOUND
The specified blob can't be found.

### 0x80830009 - E_GS_NO_SERVICE_CONFIGURATION
The title is not properly configured for using connected storage. This is possibly 
because the SCID is wrong or because this isn't configured correctly in Partner 
Center.

### 0x8083000A - E_GS_CONTAINER_NOT_IN_SYNC
The container is not yet synchronized.

### 0x8083000B - E_GS_CONTAINER_SYNC_FAILED
The synchronization of the container has failed.

### 0x8083000C - E_GS_USER_NOT_REGISTERED_IN_SERVICE
This indicates that the MSA isn't an Xbox Live account yet.

### 0x8083000D - E_GS_HANDLE_EXPIRED
The handle used by the function has expired and should be reacquired. There are three
handle types that are used by XGameSave: XGameSaveProviderHandle, XGameSaveContainerHandle,
and XGameSaveUpdateHandle. The XGameSaveUpdateHandle can't be re-used after submitting an 
update. Additionally, the XGameSaveUpdateHandle is no longer valid after the game is
suspended. 

### 0x8083000E - E_GS_ASYNC_FUNCTION_REQUIRED
The function is getting called on a time-sensitive thread. This can cause deadlocks in 
the game. The caller should use an asynchronous version of the API. For more information, 
see [Time-sensitive threads](../time-sensitive-threads.md).   

### 0x80831001 - E_GS_TERMINATEDTITLE_STALE_DATA
This error is never returned to the title through any of the user-facing XGameSave APIs. 
Instead, developers may see this in their debug output at the time that their game is terminated. 
This error indicates that the title didn't have the connected storage lock at the time the game 
save provider was initialized. This could have happened for several reasons including being 
offline at that time or having the user choose to play offline when presented with a conflict 
dialog. As the game didn't have the connected storage lock, the OS will terminate the game and 
present this error when it goes to suspend so as to get the game into a good state for the next 
launch.

### 0x8083000F - E_GS_PROVIDER_MISMATCH
The game is trying to mix and match the usage of XGameSave and XGameSaveFiles. This is not supported.
Games much choose which cloud save system they want to use in their game.

## See also

[XGameSave](../../../reference/system/xgamesave/xgamesave_members.md)
   