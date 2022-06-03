---
author: aablackm
title: XtfGetCredentialInfoCount
description: Gets the count of credentials stored in an `XtfNetworkCredentials` object returned by [XtfGetCredentialInfoList](xtfgetcredentialinfolist-xtfapi-xbox-windows-m.md).
kindex: XtfGetCredentialInfoCount
ms.author: stevenpr
ms.topic: reference
edited: 04/15/2020
security: public
---

# XtfGetCredentialInfoCount
  
Gets the count of credentials stored in an `XtfNetworkCredentials` object returned by [XtfGetCredentialInfoList](xtfgetcredentialinfolist-xtfapi-xbox-windows-m.md).  
  
<a id="syntaxSection"></a>
  
## Syntax
  
```cpp
HRESULT XtfGetCredentialInfoCount(
         XtfNetworkCredentials credentialInfo,
         UINT32* count
)  
```
  
<a id="parametersSection"></a>
  
### Parameters
  
*credentialInfo*  
Type: XtfNetworkCredentials  
  
\[in\] An `XtfNetworkCredentials` object created by calling [XtfGetCredentialInfoList](xtfgetcredentialinfolist-xtfapi-xbox-windows-m.md).  
  
*count*  
Type: UINT32\*  
  
\[out\] The number of credentials stored in *credentialInfo*.  
  
<a id="retvalSection"></a>
  
### Return value
  
Type: HRESULT  
  
Returns `S_OK` if successful; otherwise, returns an HRESULT error code.  
  
<a id="remarksSection"></a>
  
## Remarks
  
Use this function to get the number of credentials stored in the `XtfNetworkCredentials` object returned by the [XtfGetCredentialInfoList](xtfgetcredentialinfolist-xtfapi-xbox-windows-m.md) function. Use this function with the `XtfGetCredentialInfoList`, [XtfGetCredentialServerName](xtfgetcredentialtargetname-xtfapi-xbox-windows-m.md), and [XtfGetCredentialUserName](xtfgetcredentialusername-xtfapi-xbox-windows-m.md) functions to enumerate the current list of stored credentials on a console. You can also use [XtfAddCredential](xtfaddcredential-xtfapi-xbox-windows-m.md) to add credentials and [XtfRemoveCredential](xtfremovecredential-xtfapi-xbox-windows-m.md) to remove credentials.  
  
When you're done, use [XtfCloseCredentialInfoList](xtfclosecredentialinfo-xtfapi-xbox-windows-m.md) to free the `XtfNetworkCredentials` object returned by `XtfGetCredentialInfoList`.  
  
For an example that demonstrates how to manage and enumerate stored credentials, see [XtfGetCredentialInfoList](xtfgetcredentialinfolist-xtfapi-xbox-windows-m.md).  
  
<a id="requirementsSection"></a>
  
## Requirements
  
**Header:** xtfapi.h  
  
**Library:** XtfApi.lib  
  
**Supported platforms:** Windows (for Xbox console tools)  
  
<a id="seealsoSection"></a>
  
## See also
  
[Run from PC Deployment (NDA topic)](../../../../../tools-console/usinggsdk/deployment/deployment.md)  
[XTF Transport Errors (NDA topic)](../../../../../tools-console/xbox-tools-and-apis/commandlinetools/xtf-transport-errors.md)  
[Additional Xtf APIs](../atoc-xtfapi.md)  
  