---
author: aablackm
title: XtfRegisterNetworkSharePackage
description: Registers a package for Run from PC Deployment.
ms.assetid: M:Windows.Xbox.xtfapi.XtfRegisterNetworkSharePackage(LPCWSTR,LPCWSTR,LPCWSTR,LPCWSTR@,XtfPackageInfo@)
kindex: XtfRegisterNetworkSharePackage
ms.author: stevenpr
ms.topic: reference
edited: 06/10/2019
quality: good
security: public
---

# XtfRegisterNetworkSharePackage
Registers a package for [Run from PC Deployment (NDA topic)](../../../../../tools-console/usinggsdk/deployment/deployment.md).   > [!NOTE]
> In this release, the password text is not encrypted when it is passed over the network to the console by [XtfRegisterNetworkSharePackage](xtfregisternetworksharepackage-xtfapi-xbox-windows-m.md). See [Run from PC Deployment (NDA topic)](../../../../../tools-console/usinggsdk/deployment/deployment.md) for more information on how to create a low privilege user account for use with this feature.   

<a id="syntaxSection"></a>



## Syntax  

```cpp
HRESULT XtfRegisterNetworkSharePackage(
         LPCWSTR address,
         LPCWSTR sharePath,
         LPCWSTR userName,
         LPCWSTR password,
         XtfPackageInfo *packageInfo
)  
```

<a id="ID4ET"></a>



### Parameters  

*address*  
Type: LPCWSTR 

[in] Address of the console.


*sharePath*  
Type: LPCWSTR 

[in] The path to the share on a Dev PC to register.


*userName*  
Type: LPCWSTR 

[in] User name to use in domain\user format. Can be L"".


*password*  
Type: LPCWSTR 

[in, out] Password for the user. Not encrypted. Can be L"".


*packageInfo*  
Type: XtfPackageInfo *

[out] Package information object about the package that was registered.

<a id="ID4E1"></a>



### Return value  
Type: HRESULT 

A return value of **S_OK** indicates the function succeeded. Any other value indicates an unexpected error occurred.  
<a id="remarks"></a>



## Remarks  


If userName and password are equal to L"", the credentials registered for sharePath using [XtfAddCredential](xtfaddcredential-xtfapi-xbox-windows-m.md) are used.   


Use [XtfGetPackageFullName](xtfgetpackagefullname-xtfapi-xbox-windows-m.md), [XtfGetCountofAppUserModelIds](xtfgetcountofappusermodelids-xtfapi-xbox-windows-m.md), and [XtfGetAumid](xtfgetaumid-xtfapi-xbox-windows-m.md) to retrieve information from the packageInfo object. Use [XtfClosePackageInfo](xtfclosepackageinfo-xtfapi-xbox-windows-m.md) to free the packageInfo object when you are done with it.  
  
## Requirements  

**Header:** xtfapi.h  

**Library:** XtfApi.lib  
  
**Supported platforms:** Windows (for Xbox console tools)  
  
## See also  

[XTF Transport Errors (NDA topic)](../../../../../tools-console/xbox-tools-and-apis/commandlinetools/xtf-transport-errors.md)  
[Additional Xtf APIs](../atoc-xtfapi.md)  