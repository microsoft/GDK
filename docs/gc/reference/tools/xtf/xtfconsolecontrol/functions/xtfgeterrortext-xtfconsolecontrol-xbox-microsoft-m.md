---
author: aablackm
title: XtfGetErrorText
description: Gets a user-friendly error message and action text for the specified `HRESULT`.
ms.assetid: M:Windows.Xbox.XtfGetErrorText(HRESULT,PWSTR@,UINT32@,PWSTR@,UINT32@)
kindex: XtfGetErrorText
ms.author: stevenpr
ms.topic: reference
edited: 06/29/2020
security: public
---

# XtfGetErrorText  
  
Gets a user-friendly error message and user action text for the specified `HRESULT`.  
  
<a id="syntaxSection"></a>
  
## Syntax
  
```cpp
HRESULT XtfGetErrorText(
         HRESULT HResult,
         PWSTR *errorMessageBuffer,
         UINT32 *errorMessageBufferLength,
         PWSTR *userActionTextBuffer,
         UINT32 *userActionTextBufferLength
)  
```
  
<a id="parametersSection"></a>
  
### Parameters
  
*HResult*  
Type: HRESULT  
  
\[in\] The `HRESULT` to look up the error message and user action text for.  
  
*errorMessageBuffer*  
Type: PWSTR\*  
  
\[out\] A pointer to the buffer that receives the error message as a null-terminated string. To determine the required buffer length, set this parameter to `nullptr` and the *errorMessageBufferLength* parameter to 0. Upon invocation, *errorMessageBufferLength* is set to the length of the required buffer in WCHARs, including the terminating null character.
  
*errorMessageBufferLength*  
Type: UINT32\*  
  
\[in, out\] On input the length of the error message buffer in WCHARs. The buffer length must include room for a terminating null character. On output the required length of **errorMessageBuffer** in WCHARs
  
*userActionTextBuffer*  
Type: PWSTR\*  
  
\[out\] A pointer to the buffer that receives the user action text as a null terminated string. To determine the required buffer length, set this parameter to `nullptr` and the *userActionTextBufferLength* parameter to 0. Upon invocation, *userActionTextBufferLength* is set to the length of the required buffer in WCHARs, including the terminating null character.
  
*userActionTextBufferLength*  
Type: UINT32\*  
  
\[in, out\] The length of the user action text buffer in WCHARs. The buffer length must include room for a terminating null character.
  
<a id="retvalSection"></a>
  
### Return value
  
Type: HRESULT  
  
Returns `S_OK` if successful; otherwise, it returns an HRESULT error code.  
  
If `S_OK` is returned, the function succeeded. `errorMessageBuffer` and `userActionTextBuffer` are set to the error message and user action text, respectively, for the specified `HRESULT`.  
  
If `HRESULT_FROM_WIN32(ERROR_MORE_DATA)` is returned, the buffer supplied for `errorMessageBuffer` or `userActionTextBuffer` was not large enough. `errorMessageBufferLength` and `userActionTextBufferLength` are set to the required buffer lengths of the error message and user action text, respectively, for the specified `HRESULT`.  
  
If any other HRESULT code is returned, an unexpected error occurred.  
  
<a id="remarksSection"></a>
  
## Remarks
  
If the `HRESULT` passed to `XtfGetErrorText` is not a recognized Xbox Tools Framework (XTF) error code, `errorMessageBuffer` is set to "Unspecified error". You can use this result to check whether the specified `HRESULT` is a recognized XTF error code. For more information about recognized XTF error codes, see [XTF transport errors (NDA topic)](../../../../../tools-console/xbox-tools-and-apis/commandlinetools/xtf-transport-errors.md).  
  
<a id="requirementsSection"></a>
  
## Requirements
  
**Header:** xtfapi.h  
  
**Library:** XtfApi.lib  
  
**Supported platforms:** Windows (for Xbox console tools)  
  
<a id="seealsoSection"></a>
  
## See also
  
[XtfConsoleControl](../xtfconsolecontrol_members.md)  
[Xbox Tools Framework native API reference](../../atoc-xtf-native.md)  
  