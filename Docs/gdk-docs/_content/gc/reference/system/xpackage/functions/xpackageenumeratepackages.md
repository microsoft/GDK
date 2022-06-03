---
author: M-Stahl
title: XPackageEnumeratePackages
description: Finds installed or installing packages related to the calling process.
kindex: XPackageEnumeratePackages
ms.author: brianpe
ms.topic: reference
edited: 05/18/2019
quality: good
security: public
applies-to: pc-gdk
---

# XPackageEnumeratePackages  

Finds packages that are already installed, or being installed, and are related to the calling process.  

## Syntax  
  
```cpp
HRESULT XPackageEnumeratePackages(  
         XPackageKind kind,  
         XPackageEnumerationScope scope,  
         void* context,  
         XPackageEnumerationCallback* callback  
)  
```  
  
### Parameters  
  
*kind* &nbsp;&nbsp;\_In\_  
Type: [XPackageKind](../enums/xpackagekind.md)  

  
The type of installation packages to be enumerated.  


*scope* &nbsp;&nbsp;\_In\_  
Type: [XPackageEnumerationScope](../enums/xpackageenumerationscope.md)  

  
The scope of the installation packages.  


*context* &nbsp;&nbsp;\_In\_opt\_  
Type: void*  

  
Context to be passed to the callback specified in the *callback* parameter.  


*callback* &nbsp;&nbsp;\_In\_  
Type: XPackageEnumerationCallback*  

  
A callback to be called on completion.  


  
### Return value
Type: HRESULT
  
HRESULT success or error code.    
  
## Remarks
  > [!NOTE]
> This function isn't safe to call on a time-sensitive thread. For more information, see [Time-sensitive threads](../../../../system/overviews/time-sensitive-threads.md).  
  
Use **XPackageEnumeratePackages** to find packages that are already installed, or being installed, and are related to the calling process. This function can find content packages as well as app packages. It provides details about an installation, through an XPackageDetails structure. 

If the package is still installing, the **installing** property is set to true and you can create an installation monitor to let the package’s identifier monitor the progress of installation. 

There are no generic installation queue notifications; the intent is to use [XPackageEnumeratePackages](xpackageenumeratepackages.md) to show and track items in flight. Nor is there an API to stop, start, or cancel an installation. From a game’s perspective, the installation should take care of itself. Errors are automatically retried and are invisible to the game. 

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

  
  