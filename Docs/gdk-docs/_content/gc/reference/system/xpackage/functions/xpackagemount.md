---
author: M-Stahl
title: XPackageMount
description: Mounts the installation of specified content, and returns a mount handle to it.
kindex: XPackageMount
ms.author: brianpe
ms.topic: reference
edited: 05/18/2019
quality: good
security: public
applies-to: pc-gdk
---

# XPackageMount  

Mounts the installation of specified content, and returns a mount handle to it.  

## Syntax  
  
```cpp
HRESULT XPackageMount(  
         const char* packageIdentifier,  
         XPackageMountHandle* mount  
)  
```  
  
### Parameters  
  
*packageIdentifier* &nbsp;&nbsp;\_In\_z\_  
Type: char*  

  
A string that uniquely identifies the installed package on the disk.  Pass in the packageIdentifier field from the [XPackageDetails](../structs/xpackagedetails.md) struct returned from  [XPackageEnumerationCallback](xpackageenumerationcallback.md). For more information about package identifiers, see [Manage and license downloadable content (DLC)](../../../../commerce/fundamentals/xstore-manage-and-license-optional-packages.md). 


*mount* &nbsp;&nbsp;\_Out\_  
Type: XPackageMountHandle*  

  
On return, contains a handle to the mount.  


  
### Return value
Type: HRESULT
  
HRESULT success or error code.  
Trying to mount another app will yield E_ACCESS_DENIED.
  
## Remarks  
  > [!NOTE]
> This function isn't safe to call on a time-sensitive thread. For more information, see [Time-sensitive threads](../../../../system/overviews/time-sensitive-threads.md).  
  
**XPackageMount** mounts the specified installation identity and returns a mount handle to it. This might take several seconds. 

[XPackageGetMountPathSize](xpackagegetmountpathsize.md) and [XPackageGetMountPath](xpackagegetmountpath.md) return the file path to the package's contents.  

Only content installations can be mounted. Trying to mount another app will yield E_ACCESS_DENIED.   

The following code sample illustrates how a package can be mounted. In this example, the user selected a package from the content list above: a new map to play. Here's the code the game would use to mount and access it: 

```cpp
HRESULT MountContent(
    const char* packageId,
    char** mountPath,
    XPackageMountHandle* mountHandle)
{
    XPackageMountHandle mount;
    HRESULT hr = XPackageMount(packageId, &mount);
    if (FAILED(hr)) return hr;

    size_t pathSize;
    hr = XPackageGetMountPathSize(mount, &pathSize);
    if (FAILED(hr))
    {
        XPackageCloseMountHandle(mount);
        return hr;
    }

    char* path = new (std::nothrow) char[pathSize];
    if (path == nullptr)
    {
        XPackageCloseMountHandle(mount);
        return E_OUTOFMEMORY;
    }

    hr = XPackageGetMountPath(mount, pathSize, path);

    if (FAILED(hr))
    {
        delete path;
        XPackageCloseMountHandle(mount);
        return hr;
    }

    *mountHandle = mount;
    *mountPath = path;

    return S_OK;
}
```
 
This code mounts a particular package ID and returns its mounted path to the caller. 
 

  
## Requirements  
  
**Header:** XPackage.h
  
**Library:** xgameruntime.lib  
  
**Supported platforms:** Windows, Xbox One family consoles and Xbox Series consoles  
  
## See also  
[How to create and use Downloadable Content Packages (DLC) for PC and Xbox One](../../../../packaging/packaging-downloadable-content-dlc.md)  
[XPackage](../xpackage_members.md)  
[XPackageEnumeratePackages](xpackageenumeratepackages.md)  
[XPackageEnumerationCallback](xpackageenumerationcallback.md)  
[XPackageDetails](../structs/xpackagedetails.md)  
[XPackageGetMountPath](xpackagegetmountpath.md)  
[XPackageGetMountPathSize](xpackagegetmountpathsize.md)  