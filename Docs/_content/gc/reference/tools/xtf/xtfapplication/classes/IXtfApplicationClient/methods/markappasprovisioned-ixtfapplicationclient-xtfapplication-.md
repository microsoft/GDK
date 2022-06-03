---
author: aablackm
title: MarkAppAsProvisioned
description: Marks an app as provisioned.
ms.assetid: M:Windows.Xbox.xtfapplication.IXtfApplicationClient.MarkAppAsProvisioned(LPCWSTR)
kindex:
- MarkAppAsProvisioned method
- IXtfApplicationClient--MarkAppAsProvisioned method
ms.author: stevenpr
ms.topic: reference
edited: 06/05/2019
quality: good
security: public
---

# IXtfApplicationClient::MarkAppAsProvisioned method
Marks an app as provisioned.
<a id="syntaxSection"></a>



## Syntax  

```cpp
public:
HRESULT MarkAppAsProvisioned(
         LPCWSTR pszPackageMoniker
)  
```

<a id="ID4EG"></a>



### Parameters  

*pszPackageMoniker*  
Type: LPCWSTR 

The package identifier of the package that contains the app to be marked as provisioned. For more information about package identifiers, see [Manage and license downloadable content (DLC)](../../../../../../../commerce/fundamentals/xstore-manage-and-license-optional-packages.md). 

<a id="ID4EP"></a>



### Return value  
Type: HRESULT 

HRESULT success or error code.  
<a id="remarks"></a>



## Remarks  


 **MarkAppAsProvisioned** is used by the [xbprovision.exe (NDA topic)](../../../../../../../tools-console/xbox-tools-and-apis/commandlinetools/xbprovision.md) tool to mark apps so that they are later handled properly by the [xbcleanup.exe (NDA topic)](../../../../../../../tools-console/xbox-tools-and-apis/commandlinetools/xbcleanup.md) tool. To maximize future compatibility, your tools should use the deployment and provisioning tools provided with the GDK, rather than call this API directly. 

 Need code sample  

<a id="requirements"></a>



## Requirements  

**Header:** xtfapplication.h  

**Library:** xtfapplication.lib  
  
**Supported platforms:** Windows (for Xbox console tools)  
  
<a id="ID4ENB"></a>



## See also  

<a id="ID4EPB"></a>



##### Reference  
[IXtfApplicationClient Interface](../ixtfapplicationclient-xtfapplication-xbox-microsoft-t.md)  

[XtfApplication](../../../xtfapplication-xbox-microsoft-n.md)  