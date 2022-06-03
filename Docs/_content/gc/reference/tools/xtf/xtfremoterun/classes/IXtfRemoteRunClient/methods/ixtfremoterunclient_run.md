---
author: aablackm
title: Run
description: Run a given command on the console.
ms.assetid: M:Windows.Xbox.xtfremoterun.IXtfRemoteRunClient.Run(LPCWSTR,LPCWSTR,DWORD,DWORD,IXtfRemoteRunCallback)
kindex:
- Run method
- IXtfRemoteRunClient--Run method
ms.author: stevenpr
ms.topic: reference
edited: 00/00/0000
security: public
---

# IXtfRemoteRunClient::Run Method
Run a given command on the console.
  

<a id="syntaxSection"></a>
## Syntax  

```cpp
public:
HRESULT Run(
         LPCWSTR pszCommandLine,
         LPCWSTR pszWorkingDirectory,
         DWORD dwFlags,
         DWORD dwPeriod,
         IXtfRemoteRunCallback *pCallback
)  
```

<a id="ID4EG"></a>


<a id="parametersSection"></a> 
### Parameters  

*pszCommandLine*  
Type: LPCWSTR 

The command line to execute on the remote console.


*pszWorkingDirectory*  
Type: LPCWSTR 

The working directory on the remote console.


*dwFlags*  
Type: DWORD 

One or more of the flags described in Remarks.


*dwPeriod*  
Type: DWORD 

When output is redirected, it is batched and sent back to the client periodically. This value specifies the number of milliseconds between batching operations.


*pCallback*  
Type: [IXtfRemoteRunCallback *](../../IXtfRemoteRunCallback/interfaces/ixtfremoteruncallback.md)

A callback used when standard input or output are redirected.

<a id="ID4EP"></a>


<a id="retvalSection"></a> 
### Return value  
Type: HRESULT 

HRESULT success or error code.


<a id="remarks"></a>
## Remarks  
  

The dwFlags parameter is a bitwise-AND of any of the following values:   
   
  
| Flag value| Effect| 
| --- | --- |
| XTFRUN_WAIT | Wait for the command to complete. Default behavior is to run the command and return immediately without waiting for completion. |
| XTFRUN_GUEST_USER | Run under the guest user account. Default behavior is to run as the elevated system user.|
| XTFRUN_REDIRECT_INPUT | Redirect standard input through the given pCallback. This implies XTFRUN_WAIT. |
| XTFRUN_REDIRECT_OUTPUT | Redirect standard output through the given pCallback. This implies XTFRUN_WAIT. |
| XTFRUN_REDIRECT_BOTH | Redirect both standard input and standard output through the given pCallback. This implies XTFRUN_WAIT. |   
  
  
   
The [IXtfRemoteRunCallback](../../IXtfRemoteRunCallback/interfaces/ixtfremoteruncallback.md) contains both an input and an output callback function. You can populate either or both of these member whether you need input *or* output for a function or you need input *and* output for a function.
  
For more information about callback *input*, see [IXtfRemoteRunCallback::Input](../../IXtfRemoteRunCallback/methods/ixtfremoteruncallback_input.md).   
  
For more information about callback *output*, see [IXtfRemoteRunCallback::Output](../../IXtfRemoteRunCallback/methods/ixtfremoteruncallback_output.md).   
  

<a id="requirements"></a>
## Requirements  

**Header:** xtfremoterun.h  

**Library:** xtfremoterun.lib  
  
**Supported platforms:** Windows (for Xbox console tools)  
  
## See also

[XtfRemoteRun](../interfaces/ixtfremoterunclient.md)  
[IXtfRemoteRunClient](../interfaces/ixtfremoterunclient.md)  
[IXtfRemoteRunCallback](../../IXtfRemoteRunCallback/interfaces/ixtfremoteruncallback.md)  