---
author: aablackm
title: XtfCloseConsoleInfoList
description: Frees resources associated with an <api>XtfConsoleInfo</api> object returned by XtfGetConsoleInfoList.
ms.assetid: M:Windows.Xbox.XtfCloseConsoleInfoList(XtfConsoleInfo)
kindex: XtfCloseConsoleInfoList
ms.author: stevenpr
ms.topic: reference
edited: 06/10/2019
quality: good
security: public
---

# XtfCloseConsoleInfoList
Frees resources associated with an **XtfConsoleInfo** object returned by [XtfGetConsoleInfoList](../../xtfconsolecontrol/functions/xtfgetconsoleinfolist-xtfconsolecontrol-xbox-microsoft-m.md).

## Syntax  

```cpp
HRESULT XtfCloseConsoleInfoList(
         XtfConsoleInfo hConsoleInfo
)  
```

### Parameters  

*hConsoleInfo*  
Type: XtfConsoleInfo 

[in] XtfConsoleInfo object to free.

### Return value  
Type: HRESULT 

A return value of S_OK indicates the function succeeded. Any other value indicates an unexpected error occurred.

## Remarks  


Use [XtfGetConsoleInfoList](../../xtfconsolecontrol/functions/xtfgetconsoleinfolist-xtfconsolecontrol-xbox-microsoft-m.md) to get an **XtfConsoleInfo** object then use [XtfGetConsoleFieldValue](xtfgetconsolefieldvalue-xbox-microsoft-m.md) to retrieve the values from that object. When you have retrieved the values you needed, use [XtfCloseConsoleInfoList](xtfcloseconsoleinfolist-xbox-microsoft-m.md) to free resources associated with the returned **XtfConsoleInfo** object.  
> [!NOTE]
> **XtfGetConsoleInfoList** retrieves all of the information from the console. [XtfGetConsoleFieldValue](xtfgetconsolefieldvalue-xbox-microsoft-m.md) simply iterates across that retrieved information.  
> [!NOTE]
> If the target console has not been provisioned **DeviceID** will return an empty value.

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