---
author: M-Stahl
title: XPackageCloseMountHandle
description: Closes the specified mount handle.
kindex: XPackageCloseMountHandle
ms.author: brianpe
ms.topic: reference
edited: 05/18/2019
quality: good
security: public
applies-to: pc-gdk
---

# XPackageCloseMountHandle  

Closes the specified mount handle, and unmounts the device.  

## Syntax  
  
```cpp
void XPackageCloseMountHandle(  
         XPackageMountHandle mount  
)  
```  
  
### Parameters  
  
*mount* &nbsp;&nbsp;\_In\_  
Type: XPackageMountHandle  

  
The mount handle to be closed.  


  
### Return value
Type: void

## Remarks
  > [!NOTE]
> This function isn't safe to call on a time-sensitive thread. For more information, see [Time-sensitive threads](../../../../system/overviews/time-sensitive-threads.md).  
  
After [XPackageMount](xpackagemount.md) mounts a particular package identifier and returns a mount handle to it, XPackageCloseMountHandle unmounts the device. This might take several seconds. For more information about package identifiers, see [Manage and license downloadable content (DLC)](../../../../commerce/fundamentals/xstore-manage-and-license-optional-packages.md). 

[XPackageGetMountPathSize](xpackagegetmountpathsize.md) and [XPackageGetMountPath](xpackagegetmountpath.md) are used to return the file path to the package's contents. 

Only content packages can be mounted. An attempt to mount another game will yield E_ACCESS_DENIED. 

Example:

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
[XPackageMount](xpackagemount.md)  
[XPackageGetMountPathSize](xpackagegetmountpathsize.md)    
[XPackageGetMountPath](xpackagegetmountpath.md)

  
  