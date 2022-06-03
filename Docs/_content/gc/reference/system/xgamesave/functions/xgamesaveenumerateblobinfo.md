---
author: M-Stahl
title: XGameSaveEnumerateBlobInfo
description: Retrieves the blob info for the contents of a XGameSaveContainer.
kindex: XGameSaveEnumerateBlobInfo
ms.author: kelcon
ms.topic: reference
edited: 07/02/2019
quality: good
security: public
applies-to: pc-gdk
---

# XGameSaveEnumerateBlobInfo  

Retrieves the blob info for the contents of a XGameSaveContainer.  

## Syntax  
  
```cpp
HRESULT XGameSaveEnumerateBlobInfo(  
         XGameSaveContainerHandle container,  
         void* context,  
         XGameSaveBlobInfoCallback* callback  
)  
```  
  
### Parameters  
  
*container* &nbsp;&nbsp;\_In\_  
Type: XGameSaveContainerHandle  

  
Handle to the **XGameSaveContainer** containing the blobs to be enumerated.  


*context* &nbsp;&nbsp;\_In\_opt\_  
Type: void*  

  
Pointer that will be passed into the callback function.  


*callback* &nbsp;&nbsp;\_In\_  
Type: XGameSaveBlobInfoCallback*  

  
Function to be called for every blob in the container, return false to stop the enumeration.  

  
### Return value
Type: HRESULT
  
Function result.  
  
## Remarks  
  > [!NOTE]
> While this function is safe to call on a time-sensitive thread, the XGameSaveBlobInfoCallback may cause delays, depending on what the title does within the callback. As an example, copying data from the callback is fine; however, doing any non-time sensitive call can delay the callbacks return. For more information, see [Time-sensitive threads](../../../../system/overviews/time-sensitive-threads.md).   
  
Blobs contain the actual retrievable data that makes up a container. Enumerating blobs will allow you to see all of the data available inside of the container. You can use [XGameSaveEnumerateBlobInfoByName](xgamesaveenumerateblobinfobyname.md) to enumerate the blobs which match a certain prefix.
  

```cpp
// wrapper for calling a method on each item in the XGameSaveContainerInfo 
HRESULT Sample::_ForEachBlob(_In_ const XGameSaveContainerInfo* container, _In_ void* context, _In_ XGameSaveBlobInfoCallback* callback) 
{ 
    // create the container handle so we can inspect the contents 
    XGameSaveContainerHandle containerContext = nullptr; 
    HRESULT hr = XGameSaveCreateContainer(_provider, container->name, &containerContext); 
    if (SUCCEEDED(hr)) 
    { 
        // for each item in the container invoke the callback 
        hr = XGameSaveEnumerateBlobInfo(containerContext, context, callback); 
    } 
  
    if (containerContext != nullptr) 
    { 
        // make sure we close the context handle or we will leak memory 
        XGameSaveCloseContainer(containerContext); 
    } 
    return hr; 
} 
  
// check to see if the container has the minimum blobs we need to load a save 
HRESULT Sample::_CheckForRequiredBlobs(_In_ XGameSaveContainerInfo* container) 
{ 
    const char* blobNames[] = { 
        "WorldState", 
        "PlayerState", 
        "PlayerInventory" 
    }; 
    return _CheckContainerForRequiredBlobs(container, blobNames, _countof(blobNames)); 
} 
  
//confirm this container has the blobs the caller is looking for 
HRESULT Sample::_CheckContainerForRequiredBlobs( 
    _In_ XGameSaveContainerInfo* container, 
    _In_z_count_(countOfBlobs) const char** expectedBlobNames, 
    _In_ uint32_t countOfBlobs) 
{ 
    HRESULT hr; 
    struct QueryContext 
    { 
        QueryContext(const char** blobNames, uint32_t countOfBlobs) : 
            expectedCount(countOfBlobs), expectedBlobNames(blobNames), hitCount(0) 
        {} 
  
        uint32_t expectedCount; 
        const char** expectedBlobNames; 
        uint32_t hitCount; 
    }; 
  
    QueryContext qc{ expectedBlobNames, countOfBlobs }; 
  
    // simple check to see if we just see each of the blob names in the container 
    // a more robust check would identify which blob was missing to inform the caller 
    auto callback = [](_In_ const XGameSaveBlobInfo* info, _In_ void* context) 
    { 
        QueryContext* qc = reinterpret_cast<QueryContext*>(context); 
        for (uint32_t i = 0; i < qc->expectedCount; i++) 
        { 
            if (strcmp(qc->expectedBlobNames[i], info->name) == 0) 
            { 
                if (++qc->hitCount == qc->expectedCount) 
                { 
                    // all the expected names are here, can stop enum 
                    return false; 
                } 
            } 
        } 
        // keep enumerating 
        return true; 
    }; 
  
    hr = _ForEachBlob(container, &qc, callback); 
    if (SUCCEEDED(hr)) 
    { 
        if (qc.hitCount != qc.expectedCount) 
        { 
            printf("missing blobs from container!"); 
            hr = E_UNEXPECTED; 
        } 
    } 
  
    return hr; 
} 
  
// find the size of a set of blobs in a container 
HRESULT Sample::_GetContainerBlobsDataSize( 
    _In_ const XGameSaveContainerInfo* container, 
    _In_z_count_(countOfBlobs) const char** blobNames, 
    _In_ uint32_t countOfBlobs, 
    _Out_ size_t* containerSize) 
{ 
  
    *containerSize = 0; 
  
    struct BlobSize { 
        size_t size; 
        const char** blobNames; 
        uint32_t countOfBlobs; 
    }; 
  
    BlobSize blobSize = { 0, blobNames, countOfBlobs }; 
  
    HRESULT hr = _ForEachBlob(container, &blobSize, 
        [](const XGameSaveBlobInfo* info, void* ctx) 
    { 
        BlobSize* size = reinterpret_cast<BlobSize*>(ctx); 
        for (uint32_t i = 0; i < size->countOfBlobs; i++) 
        { 
            if (strcmp(info->name, size->blobNames[i]) == 0) 
            { 
                size->size += strlen(info->name) + 1; // length + null 
                size->size += info->size + sizeof(XGameSaveBlob); 
                break; 
            } 
        } 
        return true; 
    }); 
  
    if (SUCCEEDED(hr)) 
    { 
        *containerSize = blobSize.size; 
    } 
  
    return hr; 
} 
```
  
## Requirements  
  
**Header:** XGameSave.h
  
**Library:** xgameruntime.lib  
  
**Supported platforms:** Windows, Xbox One family consoles and Xbox Series consoles  
  
## See also  
[XGameSave](../xgamesave_members.md)  
[XGameSaveBlobInfo](../structs/xgamesaveblobinfo.md)  
[XGameSaveEnumerateBlobInfoByName](xgamesaveenumerateblobinfobyname.md)  
[Game save errors](../../../../system/overviews/game-save/game-saves-errors.md)