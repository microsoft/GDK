---
author: M-Stahl
title: XPersistentLocalStorageGetPath
description: Returns the game-specific path to the persistent local storage (PLS) on the device.
kindex: XPersistentLocalStorageGetPath
ms.author: v-denken
ms.topic: reference
edited: 07/09/2019
quality: good
security: public
applies-to: pc-gdk
---

# XPersistentLocalStorageGetPath  

Returns the game-specific path to the persistent local storage (PLS) on the device.  

## Syntax  
  
```cpp
HRESULT XPersistentLocalStorageGetPath(  
         size_t pathSize,  
         char* path,  
         size_t* pathUsed  
)  
```  
  
### Parameters  
  
*pathSize* &nbsp;&nbsp;\_In\_  
Type: size_t  
  
The number of characters in the buffer provided for the PLS path. To obtain this value, call [XPersistentLocalStorageGetPathSize](xpersistentlocalstoragegetpathsize.md).  
  
*path* &nbsp;&nbsp;\_Out\_writes\_to\_(pathSize,*pathUsed)  
Type: char*  
  
The PLS path to which your game can write data.  
  
*pathUsed* &nbsp;&nbsp;\_Out\_opt\_  
Type: size_t*  

The number of characters written to the supplied buffer.   

### Return value
Type: [HRESULT](/openspecs/windows_protocols/ms-erref/0642cb2f-2075-4469-918c-4441e69c548a)  
  
Returns **S_OK** if successful; otherwise, returns an error code. For a list of error codes, see [Error Codes](../../../errorcodes.md). If the function fails because *pathSize* is less than the length of the PLS path, the return value is set to **E_FAIL** for Xbox devices and to **HRESULT_FROM_WIN32(ERROR_INSUFFICIENT_BUFFER)** for PC devices. 
  
## Remarks
  > [!NOTE]
> This function isn't safe to call on a time-sensitive thread. For more information, see [Time-sensitive threads](../../../../system/overviews/time-sensitive-threads.md).  
  
Games might require PLS for tasks such as staging space, in-game DLC, and on-demand generation of content. Although the space is retained across activations of the game, it can also be deleted by users. For more information about PLS, see [Local Storage](../../../../system/overviews/local-storage.md)  
  
PLS is accessed and managed according to the device's family. For Xbox devices, we provide access to a folder mounted to the root of a drive. The amount of storage space provisioned for that folder is specified in the MicrosoftGame.config file for your game. The provisioned space is available and always present during a launch of your game. To free up space, users may delete the provisioned space without uninstalling the game, when the game is not running; however, when the game is running, the availability of storage is guaranteed. To get this space provisioned for Xbox devices, you must have a corresponding entry in your MicrosoftGame.config file.  
  
For PC devices, we provide access to a local storage folder's location on the PC, but space is not specifically provisioned for your game. Users may delete that space even while the game is running. The availability of storage is not guaranteed, and an entry in your MicrosoftGame.config file is not required to claim storage space. You must first confirm that the space available in the local storage folder is sufficient for your game's purposes.   
  
Before calling this function to retrieve the PLS path, call the [XPersistentLocalStorageGetPathSize](xpersistentlocalstoragegetpathsize.md) function to get the number of characters in the PLS path, then provide that value in the *pathSize* parameter and allocate at least as many characters for the *path* parameter. An error will occur if fewer characters are specified in *pathSize* than are contained in the PLS path.  

The following example illustrates how to use the **XPersistentLocalStorageGetPathSize** and **XPersistentLocalStorageGetPath** functions to get the PLS path for your game.   
  
```cpp
// Confirm that all of the features needed to run asynchronous tasks on 
// task queues are available.
LPCSTR Game::CheckPLSPath()
{
    // Confirm the length of the path to the local storage folder.
    LPCSTR returnPath = "";
    size_t pathSize;
    if (SUCCEEDED(XPersistentLocalStorageGetPathSize(&pathSize)))
    {
        char * path = new char[pathSize];
        size_t * pathUsed = new size_t;
        if (path != nullptr)
        {
            // Get the path to the local storage folder.
            if (SUCCEEDED(XPersistentLocalStorageGetPath(pathSize, path, pathUsed))) 
            {
                // Just to be safe, copy the bytes used in the buffer 
                // to a separate string.
                char * actualPath = new char[*pathUsed];
                strncpy(actualPath, path, *pathUsed);
                returnPath = actualPath;
            }
        }
    };

    return returnPath;
}
```

  
## Requirements  
  
**Header:** XPersistentLocalStorage.h
  
**Library:** xgameruntime.lib
  
**Supported platforms:** Windows, Xbox One family consoles and Xbox Series consoles  
  
## See also  
[XPersistentLocalStorageGetPathSize](xpersistentlocalstoragegetpathsize.md)  
[XPersistentLocalStorage](../xpersistentlocalstorage_members.md)  
[How to use the new MicrosoftGame.config file](../../../../system/overviews/microsoft-game-config/MicrosoftGameConfig-toc.md)
  