---
author: aablackm
title: Output
description: Called to receive text sent by running remote executable to its standard output.
ms.assetid: M:Windows.Xbox.xtfremoterun.IXtfRemoteRunCallback.Output(LPCWSTR)
kindex:
- Output method
- IXtfRemoteRunCallback--Output method
ms.author: stevenpr
ms.topic: reference
edited: 00/00/0000
security: public
---

# IXtfRemoteRunCallback::Output Method
Called to receive text sent by running remote executable to its standard output.
  

<a id="syntaxSection"></a>
## Syntax  

```cpp
public:
HRESULT Output(
         LPCWSTR pszText
)  
```

<a id="ID4EG"></a>


<a id="parametersSection"></a> 
### Parameters  

*pszText*  
Type: LPCWSTR 

The output text from the remote executable.

<a id="ID4EP"></a>

  
<a id="retvalSection"></a> 
### Return value  
Type: HRESULT 

HRESULT success or error code.

<a id="remarks"></a>
## Remarks

The `Output` function allows you to collect output from a remotely run executable when it is used as a part of the [IXtfRemoteRunCallback Interface](../interfaces/ixtfremoteruncallback.md).  
The [IXtfRemoteRunCallback Interface](../interfaces/ixtfremoteruncallback.md) is, in turn, used as a parameter for the [IXtfRemoteRunClient::Run](../../IXtfRemoteRunClient/methods/ixtfremoterunclient_run.md) function. 
`IXtfRemoteRunCallback::Output` is user-defined.  

<a id="requirements"></a>
## Requirements  

**Header:** xtfremoterun.h  

**Library:** xtfremoterun.lib  
  
**Supported platforms:** Windows (for Xbox console tools)  
  
## See also

[IXtfRemoteRunCallback Interface](../interfaces/ixtfremoteruncallback.md)  
[IXtfRemoteRunCallback::Input](ixtfremoteruncallback_input.md)  
[IXtfRemoteRunClient::Run](../../IXtfRemoteRunClient/methods/ixtfremoterunclient_run.md)  