---
author: M-Stahl
title: XPersistentLocalStorageGetPathSize
description: Returns the length, in characters, of the path to the persistent local storage (PLS).
kindex: XPersistentLocalStorageGetPathSize
ms.author: v-denken
ms.topic: reference
edited: 07/09/2019
quality: good
security: public
applies-to: pc-gdk
---

# XPersistentLocalStorageGetPathSize  

Returns the length, in characters, of the path to the persistent local storage (PLS).  

## Syntax  
  
```cpp
HRESULT XPersistentLocalStorageGetPathSize(  
         size_t* pathSize  
)  
```  
  
### Parameters  
  
*pathSize* &nbsp;&nbsp;\_Out\_  
Type: size_t*  
  
The length, in characters, of the PLS path.  
  
### Return value  
Type: [HRESULT](/openspecs/windows_protocols/ms-erref/0642cb2f-2075-4469-918c-4441e69c548a)  
  
Returns **S_OK** if successful; otherwise, returns an error code. For a list of error codes, see [Error Codes](../../../errorcodes.md).  
  
## Remarks  
  > [!NOTE]
> This function isn't safe to call on a time-sensitive thread. For more information, see [Time-sensitive threads](../../../../system/overviews/time-sensitive-threads.md).  
  
The return value of this function is used for the *pathSize* parameter of the [XPersistentLocalStorageGetPath](xpersistentlocalstoragegetpath.md) function to return the game-specific PLS path on the device. For more information about PLS, see [Local Storage](../../../../system/overviews/local-storage.md).  
  
When calling the **XPersistentLocalStorageGetPath** function, allocate at least as many characters for the *path* parameter of **XPersistentLocalStorageGetPath** as the number specified in the value returned in the *pathSize* parameter of this function; failure to do so will cause an error.  
  
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
[XPersistentLocalStorageGetPath](xpersistentlocalstoragegetpath.md)  
[XPersistentLocalStorage](../xpersistentlocalstorage_members.md)  
[How to use the new MicrosoftGame.config file](../../../../system/overviews/microsoft-game-config/MicrosoftGameConfig-toc.md)
  
  