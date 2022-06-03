---
author: aablackm
title: XtfAddCredential
description: Adds credentials (user name and password) to the given console for use by Run from PC Deployment.
ms.assetid: M:Windows.Xbox.xtfapi.XtfAddCredential(LPCWSTR,LPCWSTR,LPCWSTR,LPCWSTR)
kindex: XtfAddCredential
ms.author: stevenpr
ms.topic: reference
edited: 06/10/2019
quality: good
security: public
---

# XtfAddCredential
Adds credentials (user name and password) to the given console for use by [Run from PC Deployment (NDA topic)](../../../../../tools-console/usinggsdk/deployment/deployment.md).   > [!NOTE]
> In this release, the password text is not encrypted when it is passed over the network to the console by [XtfAddCredential](xtfaddcredential-xtfapi-xbox-windows-m.md). See [Run from PC Deployment (NDA topic)](../../../../../tools-console/usinggsdk/deployment/deployment.md) for more information on how to create a low privilege user account for use with this feature.   

## Syntax  

```cpp
HRESULT XtfAddCredential(
         LPCWSTR address,
         LPCWSTR targetName,
         LPCWSTR userName,
         LPCWSTR password
)  
```

### Parameters  

*address*  
Type: LPCWSTR 

[in] Address of the console.


*targetName*  
Type: LPCWSTR 

[in] Target server or share name.


*userName*  
Type: LPCWSTR 

[in] User name to use. Format is `domain\user`.


*password*  
Type: LPCWSTR 

[in] Password for the user.

### Return value  
Type: HRESULT 

A return value of **S_OK** indicates the function succeeded. Any other value indicates an unexpected error occurred.

## Remarks  

Use [XtfAddCredential](xtfaddcredential-xtfapi-xbox-windows-m.md) to add credentials. Use [XtfRemoveCredential](xtfremovecredential-xtfapi-xbox-windows-m.md) to remove credentials. Use [XtfGetCredentialInfoList](xtfgetcredentialinfolist-xtfapi-xbox-windows-m.md), [XtfGetCredentialInfoCount](xtfgetcredentialinfocount-xtfapi-xbox-windows-m.md), [XtfGetCredentialServerName](xtfgetcredentialtargetname-xtfapi-xbox-windows-m.md), and [XtfGetCredentialUserName](xtfgetcredentialusername-xtfapi-xbox-windows-m.md) to enumerate the current list of stored credentials. Use [XtfCloseCredentialInfoList](xtfclosecredentialinfo-xtfapi-xbox-windows-m.md) to free the XtfNetworkCredentials returned by [XtfGetCredentialInfoList](xtfgetcredentialinfolist-xtfapi-xbox-windows-m.md).  


See [XtfGetCredentialInfoList](xtfgetcredentialinfolist-xtfapi-xbox-windows-m.md) for an example of how to use this API.  
  
## Requirements  

**Header:** xtfapi.h  

**Library:** XtfApi.lib  
  
**Supported platforms:** Windows (for Xbox console tools)  
  
## See also  

 [Run from PC Deployment (NDA topic)](../../../../../tools-console/usinggsdk/deployment/deployment.md)  
 [XTF Transport Errors (NDA topic)](../../../../../tools-console/xbox-tools-and-apis/commandlinetools/xtf-transport-errors.md)  
 [Additional Xtf APIs](../atoc-xtfapi.md)  