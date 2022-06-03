---
author: M-Stahl
title: XPackageGetMountPath
description: Gets the path to a mounted installation.
kindex: XPackageGetMountPath
ms.author: brianpe
ms.topic: reference
edited: 05/18/2019
quality: good
security: public
applies-to: pc-gdk
---

# XPackageGetMountPath  

Gets the path to a mounted installation. 

## Syntax  
  
```cpp
HRESULT XPackageGetMountPath(  
         XPackageMountHandle mount,  
         size_t pathSize,  
         char* path  
)  
```  
  
### Parameters  
  
*mount* &nbsp;&nbsp;\_In\_  
Type: XPackageMountHandle  

  
The handle to the mount.  


*pathSize* &nbsp;&nbsp;\_In\_  
Type: size_t  

  
Size of the *path* parameter, in bytes. Use [XPackageGetMountPathSize](xpackagegetmountpathsize.md) to determine the required path size.


*path* &nbsp;&nbsp;\_Out\_writes\_(pathSize)  
Type: char*  

  
The path to the mounted installation.  
  
### Return value  
Type: HRESULT  
  
HRESULT success or error code.    
  
## Remarks
  > [!NOTE]
> This function isn't safe to call on a time-sensitive thread. For more information, see [Time-sensitive threads](../../../../system/overviews/time-sensitive-threads.md).  
  
**XPackageGetMountPath** mounts the specified package identifier and returns a mount handle to it. This might take several seconds. For more information about package identifiers, see [Manage and license downloadable content (DLC)](../../../../commerce/fundamentals/xstore-manage-and-license-optional-packages.md). 

Together, **XPackageGetMountPath** and [XPackageGetMountPathSize](xpackagegetmountpathsize.md) are used to return the file path to a package's contents. 

Only content packages can be mounted. An attempt to mount another game will yield E_ACCESS_DENIED. 

The following code example shows how packages are usually mounted:  

```cpp
HRESULT MountDlc(char* dlcIdentifier)
{
    XPackageMountHandle mountHandle;
    HRESULT hr = XPackageMount(dlcIdentifier, &mountHandle);
    if (FAILED(hr)) return hr;

    size_t pathSize;
    hr = XPackageGetMountPathSize(mountHandle, &pathSize);
    if (FAILED(hr))
    {
        XPackageCloseMountHandle(mountHandle);
        return hr;
    }

    char* path = new (std::nothrow) char[pathSize];
    if (path == nullptr)
    {
        XPackageCloseMountHandle(mountHandle);
        return E_OUTOFMEMORY;
    }

    hr = XPackageGetMountPath(mountHandle, pathSize, path);
    if (FAILED(hr))
    {
        XPackageCloseMountHandle(mountHandle);
        delete[] path;
        return hr;
    }

    printf("Dlc %s mounted at path %s\n", dlcIdentifier, path);

    delete[] path;

    // Unmounts DLC path if this is the last handle
    // to it.
    XPackageCloseMountHandle(mountHandle);
    return S_OK;
}
```  


## Requirements  
  
**Header:** XPackage.h
  
**Library:** xgameruntime.lib  
  
**Supported platforms:** Windows, Xbox One family consoles and Xbox Series consoles  
  
## See also  
[XPackage](../xpackage_members.md)      
[How to create and use Downloadable Content Packages (DLC) for PC and Xbox One](../../../../packaging/packaging-downloadable-content-dlc.md)
  [XPackageGetMountPathSize](xpackagegetmountpathsize.md)
  