---
author: aablackm
title: XtfWaitForConsoleState
description: Blocks execution until either the specified console states are reached or a timeout occurs.
kindex: XtfWaitForConsoleState
ms.author: scotmi
ms.topic: reference
edited: 04/20/2020
security: public
---

# XtfWaitForConsoleState
  
Blocks execution until either the specified console states are reached or a timeout occurs.  
  
## Syntax
  
```cpp
HRESULT XtfWaitForConsoleState(  
         PCWSTR address,  
         UINT32 consoleState,  
         const UINT32 timeoutMS  
)  
```  
  
<a id="parametersSection"></a>
  
### Parameters
  
*address*  
Type: PCWSTR  
  
\[in\] The address of the console.  
  
*consoleState*  
Type: UINT32  
  
\[in\] A bitwise-OR combination of flags that indicate the current state of the console. This parameter supports the following flags:
  
| Flag | Value | Description |  
| ---- | ----- | ----------- |  
| XTF_SYSTEM_OS_READY | 0x0001 | The System OS is ready Xbox Tools Framework (XTF) communications. |  
| XTF_TITLE_OS_READY | 0x0002 | The Game OS is ready for XTF communications.<br\>This flag is equivalent to the `XTF_TITLESTATE_TITLEOSRUNNING` and `XTF_TITLESTATE_TITLENETWORK_READY` flags returned by the [XtfGetTitleOSState](xtfgettitleosstate-xtfapi-xbox-windows-m.md) function. |  
| XTF_TITLE_PROCESS_READY | 0x0004 | The process for the game is ready for XTF communications.<br\>This flag is equivalent to the `XTF_TITLESTATE_TITLERUNNING` flag returned by the `XtfGetTitleOSState` function. |  
  
*timeoutMS*  
Type: UINT32  
  
\[in\] The timeout, in milliseconds, before the function returns `ERROR_TIMEOUT`.  
  
<a id="retvalSection"></a>
  
### Return value
  
Type: HRESULT  
  
Returns `S_OK` if successful; otherwise, returns one of the following HRESULT error codes.  
  
| Error code | Description |  
| ---------- | ----------- |  
| ERROR_TIMEOUT | The timeout specified in *timeoutMS* has elapsed and the states specified in *consoleState* were not reached. |  
| E_INVALIDARG | The values passed into *address* or *consoleState* were not valid. |  
  
<a id="remarksSection"></a>
  
## Remarks
  
This function loops every 250 milliseconds, validating the current state of the console against the states specified in `consoleState`. If the states specified in `consoleState` don't match the current state of the console within the time specified in `timeoutMS`, the function returns `ERROR_TIMEOUT`; otherwise, the function stops looping and returns `S_OK`. For more information about the System OS and Game OS, see For a complete introduction, see [What is the Microsoft Game Development Kit? (NDA topic)](../../../../../intro/overviews/introduction.md).
  
## Requirements  
  
**Header:** xtfapi.h
  
**Library:** XtfApi.lib
  
**Supported platforms:** Windows (for Xbox console tools)  
  
<a id="seealsoSection"></a>
  
## See also
  
[XTF Transport Errors (NDA topic)](../../../../../tools-console/xbox-tools-and-apis/commandlinetools/xtf-transport-errors.md)  
[Additional Xtf APIs](../atoc-xtfapi.md)  
  