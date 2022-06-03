---
author: aablackm
title: XtfGetConsoleInfoList
description: Returns an `XtfConsoleInfo` object that contains information about a console.
ms.assetid: M:Windows.Xbox.XtfGetConsoleInfoList(PCWSTR,XtfConsoleInfo@)
kindex: XtfGetConsoleInfoList
ms.author: stevenpr
ms.topic: reference
edited: 01/06/2020
security: public
---

# XtfGetConsoleInfoList
  
Returns an `XtfConsoleInfo` object that contains information about a console.  
  
<a id="syntaxSection"></a>
  
## Syntax
  
```cpp
HRESULT XtfGetConsoleInfoList(
         PCWSTR address,
         XtfConsoleInfo *hConsoleInfo
)  
```
  
<a id="parametersSection"></a>
  
### Parameters
  
*address*  
Type: PCWSTR  
  
\[in\] The address of the console.  
  
*hConsoleInfo*  
Type: XtfConsoleInfo\*  
  
\[out\] A pointer to be used with the [XtfGetConsoleFieldValue](../../xtfapi/functions/xtfgetconsolefieldvalue-xbox-microsoft-m.md) function to retrieve information about a console.  
  
<a id="retvalSection"></a>
  
### Return value
  
Type: HRESULT  
  
Returns `S_OK` if the function succeeded and [XtfGetConsoleFieldValue](../../xtfapi/functions/xtfgetconsolefieldvalue-xbox-microsoft-m.md) can be used to retrieve values from **hConsoleInfo**; otherwise, returns an HRESULT error code.  
  
<a id="remarksSection"></a>
  
## Remarks
  
To retrieve information about a console, first use this function to get an `XtfConsoleInfo` pointer, and then use [XtfGetConsoleFieldValue](../../xtfapi/functions/xtfgetconsolefieldvalue-xbox-microsoft-m.md) to retrieve information about the console from that pointer. After you retrieve the information you need, use [XtfCloseConsoleInfoList](../../xtfapi/functions/xtfcloseconsoleinfolist-xbox-microsoft-m.md) to free resources associated with the returned `XtfConsoleInfo` pointer.  
> [!NOTE]
> `XtfGetConsoleInfoList` retrieves all of the information from the console and provides a pointer to that information. [XtfGetConsoleFieldValue](../../xtfapi/functions/xtfgetconsolefieldvalue-xbox-microsoft-m.md) only iterates that retrieved information. You must use both functions together to retrieve information about a console.
> [!NOTE]
> If the target console specified in `address` for this function has not been provisioned, the [XtfGetConsoleFieldValue](../../xtfapi/functions/xtfgetconsolefieldvalue-xbox-microsoft-m.md) function returns an empty value if [XtfConsoleFieldId::DeviceID](../../xtfapi/enums/xtfconsolefieldid-xbox-windows-t.md) is specified in `field`.  
  
The following code sample demonstrates how to use the `XtfGetConsoleInfoList` and `XtfGetConsoleFieldValue` functions together to retrieve the console ID of a development console.  
  
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
  
<a id="requirementsSection"></a>
  
## Requirements
  
**Header:** xtfapi.h  
  
**Library:** XtfApi.lib  
  
**Supported platforms:** Windows (for Xbox console tools)  
  
<a id="seealsoSection"></a>
  
## See also
  
[XtfConsoleControl](../xtfconsolecontrol_members.md)  
[Xbox Tools Framework](../../atoc-xbox-tools-framework.md)  
  