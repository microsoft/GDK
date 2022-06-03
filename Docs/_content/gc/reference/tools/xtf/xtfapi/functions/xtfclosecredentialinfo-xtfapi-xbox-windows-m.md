---
author: aablackm
title: XtfCloseCredentialInfoList
description: Frees resources associated with an XtfNetworkCredentials object returned by XtfGetCredentialInfoList.
ms.assetid: M:Windows.Xbox.xtfapi.XtfCloseCredentialInfoList(XtfNetworkCredentials)
kindex: XtfCloseCredentialInfoList
ms.author: stevenpr
ms.topic: reference
edited: 06/13/2019
quality: good
security: public
---

# XtfCloseCredentialInfoList
Frees resources associated with an XtfNetworkCredentials object returned by [XtfGetCredentialInfoList](xtfgetcredentialinfolist-xtfapi-xbox-windows-m.md).
## Syntax  

```cpp
HRESULT XtfCloseCredentialInfoList(
         XtfNetworkCredentials credentialInfo
)  
```

### Parameters  

*credentialInfo*  
Type: XtfNetworkCredentials 

[in] An XtfNetworkCredentials object created by calling [XtfGetCredentialInfoList](xtfgetcredentialinfolist-xtfapi-xbox-windows-m.md).

### Return value  
Type: HRESULT 

A return value of **S_OK** indicates the function succeeded. Any other value indicates an unexpected error occurred.

## Remarks  


Use [XtfAddCredential](xtfaddcredential-xtfapi-xbox-windows-m.md) to add credentials. Use [XtfRemoveCredential](xtfremovecredential-xtfapi-xbox-windows-m.md) to remove credentials. Use [XtfGetCredentialInfoList](xtfgetcredentialinfolist-xtfapi-xbox-windows-m.md), [XtfGetCredentialInfoCount](xtfgetcredentialinfocount-xtfapi-xbox-windows-m.md), [XtfGetCredentialServerName](xtfgetcredentialtargetname-xtfapi-xbox-windows-m.md), and [XtfGetCredentialUserName](xtfgetcredentialusername-xtfapi-xbox-windows-m.md) to enumerate the current list of stored credentials. Use [XtfCloseCredentialInfoList](xtfclosecredentialinfo-xtfapi-xbox-windows-m.md) to free the `XtfNetworkCredentials` returned by [XtfGetCredentialInfoList](xtfgetcredentialinfolist-xtfapi-xbox-windows-m.md).  


See [XtfGetCredentialInfoList](xtfgetcredentialinfolist-xtfapi-xbox-windows-m.md) for an example of how to use this API.  

## Requirements  

**Header:** xtfapi.h  

**Library:** XtfApi.lib  
  
**Supported platforms:** Windows (for Xbox console tools)  
  
## See also  

[XTF Transport Errors (NDA topic)](../../../../../tools-console/xbox-tools-and-apis/commandlinetools/xtf-transport-errors.md)  
[Additional Xtf APIs](../atoc-xtfapi.md)  