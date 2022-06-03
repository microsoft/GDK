---
author: aablackm
title: XtfRemoveCredential
description: Removes credentials from the given console. Use XtfAddCredential add credentials.
ms.assetid: M:Windows.Xbox.xtfapi.XtfRemoveCredential(LPCWSTR,LPCWSTR)
kindex: XtfRemoveCredential
ms.author: stevenpr
ms.topic: reference
edited: 07/02/2019
quality: good
security: public
---

# XtfRemoveCredential
Removes credentials from the given console. Use [XtfAddCredential](xtfaddcredential-xtfapi-xbox-windows-m.md) add credentials.
<a id="syntaxSection"></a>



## Syntax  

```cpp
HRESULT XtfRemoveCredential(
         LPCWSTR address,
         LPCWSTR serverName
)  
```

<a id="ID4EK"></a>



### Parameters  

*address*  
Type: LPCWSTR 

[in] Address of the console.


*serverName*  
Type: LPCWSTR 

[in] Target server or share name.

<a id="ID4ER"></a>



### Return value  
Type: HRESULT 

A return value of **S_OK** indicates the function succeeded. Any other value indicates an unexpected error occurred.  

## Remarks  


Use [XtfAddCredential](xtfaddcredential-xtfapi-xbox-windows-m.md) to add credentials. Use [XtfRemoveCredential](xtfremovecredential-xtfapi-xbox-windows-m.md) to remove credentials. Use [XtfGetCredentialInfoList](xtfgetcredentialinfocount-xtfapi-xbox-windows-m.md), [XtfGetCredentialInfoCount](xtfgetcredentialinfocount-xtfapi-xbox-windows-m.md), [XtfGetCredentialServerName](xtfgetcredentialtargetname-xtfapi-xbox-windows-m.md), and [XtfGetCredentialUserName](xtfgetcredentialusername-xtfapi-xbox-windows-m.md) to enumerate the current list of stored credentials. Use [XtfCloseCredentialInfoList](xtfclosecredentialinfo-xtfapi-xbox-windows-m.md) to free the XtfNetworkCredentials returned by [XtfGetCredentialInfoList](xtfgetcredentialinfolist-xtfapi-xbox-windows-m.md).  


See [XtfGetCredentialInfoList](xtfgetcredentialinfolist-xtfapi-xbox-windows-m.md) for an example of how to use this API.  
  
## Requirements  

**Header:** xtfapi.h  

**Library:** XtfApi.lib  
  
**Supported platforms:** Windows (for Xbox console tools)  
  
## See also  
[Run from PC Deployment (NDA topic)](../../../../../tools-console/usinggsdk/deployment/deployment.md)  
[XTF Transport Errors (NDA topic)](../../../../../tools-console/xbox-tools-and-apis/commandlinetools/xtf-transport-errors.md)