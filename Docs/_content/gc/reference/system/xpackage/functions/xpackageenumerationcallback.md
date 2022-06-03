---
author: M-Stahl
title: XPackageEnumerationCallback
description: A callback used by [XPackageEnumeratePackages](xpackageenumeratepackages.md).
kindex: XPackageEnumerationCallback
ms.author: brianpe
ms.topic: reference
edited: 05/18/2019
quality: good
security: public
applies-to: pc-gdk
---

# XPackageEnumerationCallback  

The callback used by [XPackageEnumeratePackages](xpackageenumeratepackages.md) to enumerate each package.  



## Syntax  
  
```cpp
bool XPackageEnumerationCallback(  
         void* context,  
         const XPackageDetails* details  
)  
```  
  
### Parameters  
  
*context* &nbsp;&nbsp;\_In\_  
Type: void*  
  
The context passed to [XPackageEnumeratePackages](xpackageenumeratepackages.md) when enumeration of the package was initiated.  
  
*details* &nbsp;&nbsp;\_In\_  
Type: [XPackageDetails](../structs/xpackagedetails.md)*  
  
Pointer to an [XPackageDetails](../structs/xpackagedetails.md) structure that contains the installation information for the current package in the enumeration.

 
### Return value
Type: bool

Return true to continue enumerating packages, or false to stop the enumeration.

## Remarks

The **XPackageEnumerationCallback** callback is called for each package during the [XPackageEnumeratePackages](xpackageenumeratepackages.md) enumeration.

Both [XPackageEnumeratePackages](xpackageenumeratepackages.md) and [XPackageRegisterPackageInstalled](xpackageregisterpackageinstalled.md) provide details about an installation, through an [XPackageDetails](../structs/xpackagedetails.md) structure. If the package is installing, the **installing** property of **XPackageDetails** is **true** and you can create an installation monitor, to let the package’s identifier monitor progress.


There are no generic installation queue notifications; the intent is to use [XPackageEnumeratePackages](xpackageenumeratepackages.md) to show and track items in flight, and to use [XPackageRegisterPackageInstalled](xpackageregisterpackageinstalled.md) to announce the presence of new DLC. Nor is there a mechanism to start, stop, or cancel an installation. From a game’s perspective, the installation should take care of itself. Errors are automatically retried and are invisible to the game.

Example:


```cpp
bool CALLBACK ListDlcCallback(
    void* /* context */,
    const XPackageDetails* details)
{
    printf("Found dlc: %s\n", details->displayName);
    return true; // continue enumerating
}

HRESULT ListDlc()
{
    HRESULT hr = XPackageEnumeratePackages(
        XPackageKind::Content,                      /* Looking for content packages (DLC) */
        XPackageEnumerationScope::ThisAndRelated,   /* For this game and related games*/
        nullptr, ListDlcCallback);
    return hr;
}
```

## Requirements  
  
**Header:** XPackage.h
  
**Library:** xgameruntime.lib  
  
**Supported platforms:** Windows, Xbox One family consoles and Xbox Series consoles  
  
## See also  
[XPackage](../xpackage_members.md)      
[How to create and use Downloadable Content Packages (DLC) for PC and Xbox One](../../../../packaging/packaging-downloadable-content-dlc.md)  
[XPackageDetails](../structs/xpackagedetails.md)  
[XPackageEnumeratePackages](xpackageenumeratepackages.md)  
[XPackageRegisterPackageInstalled](xpackageregisterpackageinstalled.md)  