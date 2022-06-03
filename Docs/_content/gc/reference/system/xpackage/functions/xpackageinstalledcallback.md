---
author: M-Stahl
title: XPackageInstalledCallback
description: A user-defined callback used by the XPackageRegisterPackageInstalled function.
kindex: XPackageInstalledCallback
ms.author: brianpe
ms.topic: reference
edited: 05/18/2019
security: public
applies-to: pc-gdk
---

# XPackageInstalledCallback  

A user-defined callback used by the [XPackageRegisterPackageInstalled](xpackageregisterpackageinstalled.md) function.  

## Syntax  
  
```cpp
void XPackageInstalledCallback(  
         void* context,  
         const XPackageDetails* details  
)  
```  
  
### Parameters  
  
*context* &nbsp;&nbsp;\_In\_  
Type: void*  

  
The context passed to the [XPackageRegisterPackageInstalled](xpackageregisterpackageinstalled.md) function.  


*details* &nbsp;&nbsp;\_In\_  
Type: [XPackageDetails*](../structs/xpackagedetails.md)  

  
Contains details about the package installation.  

  
### Return value

Type: void

Returns a pointer to the package installation details.
  
## Remarks

The ``XPackageInstalledCallback`` function is used to determine when a new package is completely installed. The following code example prints a message when a new downloadable content (DLC) package is installed.

```cpp
void CALLBACK NewPackageAdded(void* /* context */, const XPackageDetails* details)
{
    if (details->kind == XPackageKind::Content)
    {
        printf("Package added: %s\n", details->displayName);
    }
}

HRESULT ListenForNewDlc(XTaskQueueHandle queue, XTaskQueueRegistrationToken* token)
{
    HRESULT hr = XPackageRegisterPackageInstalled(queue, nullptr, NewPackageAdded, token);
    return hr;
}

void StopListeningForDlc(XTaskQueueRegistrationToken token)
{
    XPackageUnregisterPackageInstalled(token, false);
}
```  

For information about the packaging technology used with Xbox One titles, see [Overview of Packaging](../../../../packaging/overviews/packaging.md). For information about the steps to create an XVC package, see [Getting started packaging titles for Xbox consoles](../../../../packaging/overviews/packaging-getting-started-for-console.md). 
  
## Requirements  
  
**Header:** XPackage.h
  
**Library:** xgameruntime.lib  
  
**Supported platforms:** Windows, Xbox One family consoles and Xbox Series consoles  
  
## See also  

[How to create and use Downloadable Content Packages (DLC) for PC and Xbox One](../../../../packaging/packaging-downloadable-content-dlc.md)  
[XPackage](../xpackage_members.md) 
      
   
  
  