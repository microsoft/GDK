---
author: M-Stahl
title: XPackageRegisterPackageInstalled
description: Registers a callback to be called when an installation is completed.
kindex: XPackageRegisterPackageInstalled
ms.author: brianpe
ms.topic: reference
edited: 05/18/2019
quality: good
security: public
applies-to: pc-gdk
---

# XPackageRegisterPackageInstalled  

Registers a callback to be called when an installation is completed.  

## Syntax  
  
```cpp
HRESULT XPackageRegisterPackageInstalled(  
         XTaskQueueHandle queue,  
         void* context,  
         XPackageInstalledCallback* callback,  
         XTaskQueueRegistrationToken* token  
)  
```  
  
### Parameters  
  
*queue* &nbsp;&nbsp;\_In\_  
Type: XTaskQueueHandle  

  
The asynchronous queue on which the callback is to run.  


*context* &nbsp;&nbsp;\_In\_opt\_  
Type: void*  

  
Context to be passed to the callback.  


*callback* &nbsp;&nbsp;\_In\_  
Type: XPackageInstalledCallback*  

  
User-defined callback to be called when an installation is completed.  


*token* &nbsp;&nbsp;\_Out\_  
Type: [XTaskQueueRegistrationToken*](../../xtaskqueue/structs/xtaskqueueregistrationtoken.md)  

  
On return, contains a token that identifies the callback that can be used to unregister the callback with [XPackageUnregisterPackageInstalled](xpackageunregisterpackageinstalled.md).  


  
### Return value
Type: HRESULT
  
HRESULT success or error code.    

## Remarks 

PackageInstalled notifications can be used to determine when a new package is fully installed.

Both the [XPackageEnumeratePackages](xpackageenumeratepackages.md) API and [XPackageRegisterPackageInstalled](xpackageregisterpackageinstalled.md) API provide details about an installation, through an **XPackageDetails** structure. If the package is installing, the **installing** property is set to true and you can create an installation monitor, to let the package’s identifier monitor the progress of installation.

There are no generic installation queue notifications; the intent is to use [XPackageEnumeratePackages](xpackageenumeratepackages.md) to show and track items in flight, and to use **PackageInstalled** to announce the presence of new DLC. Nor is there an API to stop, start, or cancel an installation. From a game’s perspective, the installation should take care of itself. Errors are automatically retried and invisible to the game. 

In the following example, **XPackageRegisterPackageInstalled** is used to print a message when a new DLC package is installed:

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

## Requirements  
  
**Header:** XPackage.h
  
**Library:** xgameruntime.lib  
  
**Supported platforms:** Windows, Xbox One family consoles and Xbox Series consoles  
  
## See also  
[XPackage](../xpackage_members.md)
  
  