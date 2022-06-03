---
author: aablackm
title: XtfGetCredentialInfoList
description: Returns an `XtfNetworkCredentials` object that contains the list of credentials currently stored on the console.
ms.assetid: M:Windows.Xbox.xtfapi.XtfGetCredentialInfoList(LPCWSTR,XtfNetworkCredentials@)
kindex: XtfGetCredentialInfoList
ms.author: stevenpr
ms.topic: reference
edited: 04/15/2020
quality: good
security: public
---

# XtfGetCredentialInfoList
  
Returns an `XtfNetworkCredentials` object that contains the list of credentials currently stored on the console.  
  
<a id="syntaxSection"></a>



## Syntax  

```cpp
HRESULT XtfGetCredentialInfoList(
         LPCWSTR address,
         XtfNetworkCredentials* credentialInfo
)  
```

<a id="ID4EG"></a>



### Parameters  

*address*  
Type: LPCWSTR 

[in] Address of the console.


*credentialInfo*  
Type: XtfNetworkCredentials\*

[out] An `XtfNetworkCredentials` object that contains the list of credentials currently stored on the console.

<a id="ID4EN"></a>



### Return value  
Type: HRESULT 

A return value of `S_OK` indicates the function succeeded and that credential information can be retrieved from the **credentialInfo** object. Any other value indicates an unexpected error occurred.
<a id="remarks"></a>



## Remarks  


Use [XtfAddCredential](xtfaddcredential-xtfapi-xbox-windows-m.md) to add credentials. Use [XtfRemoveCredential](xtfremovecredential-xtfapi-xbox-windows-m.md) to remove credentials. Use [XtfGetCredentialInfoList](xtfgetcredentialinfolist-xtfapi-xbox-windows-m.md), [XtfGetCredentialInfoCount](xtfgetcredentialinfocount-xtfapi-xbox-windows-m.md), [XtfGetCredentialServerName](xtfgetcredentialtargetname-xtfapi-xbox-windows-m.md), and [XtfGetCredentialUserName](xtfgetcredentialusername-xtfapi-xbox-windows-m.md) to enumerate the current list of stored credentials. Use [XtfCloseCredentialInfoList](xtfclosecredentialinfo-xtfapi-xbox-windows-m.md) to free the `XtfNetworkCredentials` returned by [XtfGetCredentialInfoList](xtfgetcredentialinfolist-xtfapi-xbox-windows-m.md).  
> [!NOTE]
> [XtfGetCredentialInfoList](xtfgetcredentialinfolist-xtfapi-xbox-windows-m.md) retrieves all of the information from the console. [XtfGetCredentialServerName](xtfgetcredentialtargetname-xtfapi-xbox-windows-m.md), and [XtfGetCredentialUserName](xtfgetcredentialusername-xtfapi-xbox-windows-m.md) simply iterate across that retrieved information.  
> [!NOTE]
> When you have retrieved the values you needed, use [XtfCloseCredentialInfoList](xtfclosecredentialinfo-xtfapi-xbox-windows-m.md) to free resources associated with the returned XtfNetworkCredentials object.  

<a id="ID4ETC"></a>
  
```cpp
HRESULT               hr                = S_OK;
PCWSTR                consoleAddress    = L"190.167.10.182";
XtfNetworkCredentials credentialInfo    = nullptr;
UINT32                count             = 0;
PWSTR                 pServerNameBuffer = nullptr;
PWSTR                 pUserNameBuffer   = nullptr;
UINT32                bufferSize        = 0;

hr = XtfAddCredential(consoleAddress, L"devpc001", L"devpc001\\test", L"test");
if (FAILED(hr))
{
    wprintf(L"\n\n*** XtfAddCredential failed 0x%x", hr);
    return hr;
}

hr = XtfAddCredential(consoleAddress, L"devpc002", L"devpc002\\test1", L"test1");
if (FAILED(hr))
{
    wprintf(L"\n\n*** XtfAddCredential failed 0x%x", hr);
    return hr;
}

hr = XtfGetCredentialInfoList(consoleAddress, &credentialInfo);
if (FAILED(hr))
{
    wprintf(L"\n\n*** XtfGetCredentialInfoList failed 0x%x", hr);
    return hr;
}

hr = XtfGetCredentialInfoCount(credentialInfo, &count);
if (FAILED(hr))
{
    wprintf(L"\n\n*** XtfGetCredentialInfoCount failed 0x%x", hr);
    return hr;
}

wprintf(L"\n\n*** List of Users:");
wprintf(L"\n\t*** Number of users: %d", count);


for (UINT32 i=0; i < count ; i++)
{
    bufferSize=0;
    hr = XtfGetCredentialServerName(credentialInfo, i, nullptr, &bufferSize);
    if (hr != HRESULT_FROM_WIN32(ERROR_MORE_DATA))
    {
        wprintf(L"\n\n*** XtfGetCredentialServerName failed 0x%x", hr);
        return hr;
    }

    pServerNameBuffer = new WCHAR[bufferSize];

    hr = XtfGetCredentialServerName(credentialInfo, i, pServerNameBuffer, &bufferSize);
    if (FAILED(hr))
    {
        wprintf(L"\n\n*** XtfGetCredentialServerName failed 0x%x", hr);
        return hr;
    }

    bufferSize=0;
    hr = XtfGetCredentialUserName(credentialInfo, i, nullptr, &bufferSize);
    if (hr != HRESULT_FROM_WIN32(ERROR_MORE_DATA))
    {
        wprintf(L"\n\n*** XtfGetCredentialUserName failed 0x%x", hr);
        return hr;
    }

    pUserNameBuffer = new WCHAR[bufferSize];

    hr = XtfGetCredentialUserName(credentialInfo, i, pUserNameBuffer, &bufferSize);
    if (FAILED(hr))
    {
        wprintf(L"\n\n*** XtfGetCredentialUserName failed 0x%x", hr);
        return hr;
    }

    wprintf(L"\n\t Server: %ls, User: %ls", pServerNameBuffer, pUserNameBuffer);
    delete[] pServerNameBuffer;
    delete[] pUserNameBuffer;
}

XtfCloseCredentialInfoList(credentialInfo);

hr = XtfRemoveCredential(consoleAddress, L"devpc001");
if (FAILED(hr))
{
    wprintf(L"\n\n*** XtfRemoveCredential failed 0x%x", hr);
    return hr;
}

hr = XtfRemoveCredential(consoleAddress, L"devpc002");
if (FAILED(hr))
{
    wprintf(L"\n\n*** XtfRemoveCredential failed 0x%x", hr);
    return hr;
}

hr = XtfGetCredentialInfoList(consoleAddress, &credentialInfo);
if (FAILED(hr))
{
    wprintf(L"\n\n*** XtfGetCredentialInfoList failed 0x%x", hr);
    return hr;
}

hr = XtfGetCredentialInfoCount(credentialInfo, &count);
if (FAILED(hr))
{
    wprintf(L"\n\n*** XtfGetCredentialInfoCount failed 0x%x", hr);
    return hr;
}

wprintf(L"\n\n*** Number of users: %d", count);
XtfCloseCredentialInfoList(credentialInfo);

wprintf(L"\n\n");
return hr;  
```

## Requirements  

**Header:** xtfapi.h  

**Library:** XtfApi.lib  
  
**Supported platforms:** Windows (for Xbox console tools)  
  
## See also  
[Run from PC Deployment (NDA topic)](../../../../../tools-console/usinggsdk/deployment/deployment.md)  
[XTF Transport Errors (NDA topic)](../../../../../tools-console/xbox-tools-and-apis/commandlinetools/xtf-transport-errors.md)  
[Additional Xtf APIs](../atoc-xtfapi.md)  