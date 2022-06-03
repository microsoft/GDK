---
author: aablackm
title: XtfGetCredentialUserName
description: Gets the user name part of the credentials stored at an index in an XtfNetworkCredentials object returned by XtfGetCredentialInfoList.
ms.assetid: M:Windows.Xbox.xtfapi.XtfGetCredentialUserName(XtfNetworkCredentials,UINT32,PWSTR@,UINT32@)
kindex: XtfGetCredentialUserName
ms.author: stevenpr
ms.topic: reference
edited: 06/10/2019
quality: good
security: public
---

# XtfGetCredentialUserName
Gets the user name part of the credentials stored at an index in an XtfNetworkCredentials object returned by [XtfGetCredentialInfoList](xtfgetcredentialinfolist-xtfapi-xbox-windows-m.md).
<a id="syntaxSection"></a>



## Syntax  

```cpp
HRESULT XtfGetCredentialUserName(
         XtfNetworkCredentials credentialInfo,
         UINT32 credentialIndex,
         PWSTR userName,
         UINT32 *userNameLength
)  
```

<a id="ID4EK"></a>



### Parameters  

*credentialInfo*  
Type: XtfNetworkCredentials 

[in] An XtfNetworkCredentials object created by calling [XtfGetCredentialInfoList](xtfgetcredentialinfolist-xtfapi-xbox-windows-m.md).


*credentialIndex*  
Type: UINT32 

[in] Index of the **userName** in the **credentialInfo** object.


*userName*  
Type: PWSTR 

[out] User name at the given index in the **credentialInfo** object.


*userNameLength*  
Type: UINT32 *

[in, out] Length of **userName** buffer in WCHAR.

<a id="ID4ER"></a>



### Return value  
Type: HRESULT 

Returns **S_OK** if successful. Returns HRESULT_FROM_WIN32(ERROR_MORE_DATA) if **userName** is not large enough. The required buffer length is returned in **userNameLength**.
<a id="remarks"></a>



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