---
author: aablackm
title: XtfGetConsoleFieldValue
description: Retrieves information about a console, one of Tools IP Address, Console IP Address, AccessKey, Console ID, HostName, Device ID, DevKit Cert type, SystemMajorVersion, SystemMinorVersion, SystemBuildVersion, or SystemRevisionVersion.
ms.assetid: M:Windows.Xbox.XtfGetConsoleFieldValue(XtfConsoleInfo,XtfConsoleFieldId,XtfConsoleFieldType@,BYTE@,UINT32@)
kindex: XtfGetConsoleFieldValue
ms.author: stevenpr
ms.topic: reference
edited: 06/10/2019
quality: good
security: public
---

# XtfGetConsoleFieldValue
Retrieves information about a console, one of Tools IP Address, Console IP Address, AccessKey, Console ID, HostName, Device ID, DevKit Cert type, SystemMajorVersion, SystemMinorVersion, SystemBuildVersion, or SystemRevisionVersion.
<a id="syntaxSection"></a>



## Syntax  

```cpp
HRESULT XtfGetConsoleFieldValue(
         XtfConsoleInfo hConsoleInfo,
         XtfConsoleFieldId field,
         XtfConsoleFieldType *fieldType,
         BYTE *buffer,
         UINT32 *cbBuffer
)  
```

<a id="ID4EH"></a>



### Parameters  

*hConsoleInfo*  
Type: XtfConsoleInfo 

[in] XtfConsoleInfo object returned by XtfGetConsoleInfoList.


*field*  
Type: XtfConsoleFieldId 

[in] Identifier of the value to return, one of Tools IP Address, Console IP Address, AccessKey, Console ID, HostName, Device ID, DevKit Cert type, SystemMajorVersion, SystemMinorVersion, SystemBuildVersion, or SystemRevisionVersion.


*fieldType*  
Type: XtfConsoleFieldType *

[out] The data type of the returned value, either UINT32 or PWCHAR.


*buffer*  
Type: BYTE *

[out] A pointer to the buffer that receives the returned value. To determine the required buffer size, set this parameter to nullptr and the cbBuffer parameter to 0. When the function returns bufferSize will be set to the size of the required buffer in bytes. This size will include space for the terminating null character if required.


*cbBuffer*  
Type: UINT32 *

[in, out] On input the size of the buffer in bytes. The buffer size must include room for a terminating null character if the returned value is a PWCHAR. On output the required length of buffer in bytes.

<a id="ID4EN"></a>



### Return value  
Type: HRESULT 

A return value of S_OK indicates the function succeeded and buffer fieldType contains the value and type of the value.   

A return value of HRESULT_FROM_WIN32(ERROR_MORE_DATA) indicates the buffer supplied for the **buffer** argument was not large enough. The required buffer size is contained in **cbBuffer**.  


If the value is not available (for example Device ID) on an unprovisioned devkit, the return HRESULT will be 0x80070490.  


Any other value indicates an unexpected error occurred.  

<a id="remarks"></a>



## Remarks  


Use [XtfGetConsoleInfoList](../../xtfconsolecontrol/functions/xtfgetconsoleinfolist-xtfconsolecontrol-xbox-microsoft-m.md) to get an **XtfConsoleInfo** object then use [XtfGetConsoleFieldValue](xtfgetconsolefieldvalue-xbox-microsoft-m.md) to retrieve the values from that object. When you have retrieved the values you needed, use [XtfCloseConsoleInfoList](xtfcloseconsoleinfolist-xbox-microsoft-m.md) to free resources associated with the returned **XtfConsoleInfo** object.  
> [!NOTE]
> **XtfGetConsoleInfoList** retrieves all of the information from the console. [XtfGetConsoleFieldValue](xtfgetconsolefieldvalue-xbox-microsoft-m.md) simply iterates across that retrieved information.  
> [!NOTE]
> If the target console has not been provisioned **DeviceID** will return an empty value.  

<a id="ID4E2C"></a>
  
```cpp
int wmain(int argc, wchar_t **argv)
{
  HRESULT             hr             = S_OK;
  PCWSTR              consoleAddress = L" 190.167.10.18";
  XtfConsoleInfo      hConsoleInfo   = nullptr;
  XtfConsoleFieldType fieldType      = XtfConsoleFieldType::FieldTypeUINT32;
  BYTE *              pValueBuffer   = nullptr;
  UINT32              bufferSize     = 0;

  hr = XtfGetConsoleInfoList(consoleAddress, &hConsoleInfo);
  if (FAILED(hr))
  {
    wprintf(L"\n\n*** XtfGetConsoleInfoList failed 0x%x", hr);
    return hr;
  }

  hr = XtfGetConsoleFieldValue(hConsoleInfo, XtfConsoleFieldId::ConsoleId, &fieldType, nullptr, &bufferSize);
  if (hr != HRESULT_FROM_WIN32(ERROR_MORE_DATA))
  {
    XtfCloseConsoleInfoList(hConsoleInfo);
    wprintf(L"\n\n*** XtfGetConsoleFieldValue failed 0x%x", hr);
    return hr;
  }

  pValueBuffer = new BYTE[bufferSize];

  hr  = XtfGetConsoleFieldValue(hConsoleInfo, XtfConsoleFieldId::ConsoleId, &fieldType, pValueBuffer, &bufferSize);
  if (SUCCEEDED(hr))
  {
    PWCHAR consoleId = (PWCHAR)pValueBuffer;
    wprintf(L"\n\n*** Console ID is %s", consoleId);
  }
  else
  {
    wprintf(L"\n\n*** XtfGetConsoleFieldValue failed 0x%x", hr);
  }

  XtfCloseConsoleInfoList(hConsoleInfo);
  delete[] pValueBuffer;

  return hr;
}  
```

## Requirements  

**Header:** xtfapi.h  

**Library:** XtfApi.lib  
  
**Supported platforms:** Windows (for Xbox console tools)  
  
## See also  

[XTF Transport Errors (NDA topic)](../../../../../tools-console/xbox-tools-and-apis/commandlinetools/xtf-transport-errors.md)  
[Additional Xtf APIs](../atoc-xtfapi.md)  