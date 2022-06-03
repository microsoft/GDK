---
author: aablackm
title: Input
description: Called to pass text into the running remote executable via its standard input.
ms.assetid: M:Windows.Xbox.xtfremoterun.IXtfRemoteRunCallback.Input(LPBSTR)
kindex:
- Input method
- IXtfRemoteRunCallback--Input method
ms.author: stevenpr
ms.topic: reference
edited: 00/00/0000
security: public
---

# IXtfRemoteRunCallback::Input Method
Called to pass text into the running remote executable via its standard input.


<a id="syntaxSection"></a>  
## Syntax  

```cpp
public:
HRESULT Input(
         LPBSTR pbstrText
)  
```

<a id="ID4EG"></a>

<a id="parametersSection"></a>  
### Parameters  

*pbstrText*  
Type: LPBSTR 

The text to be sent through standard input for the remote executable.

  
<a id="retvalSection"></a> 
### Return value  
Type: HRESULT 

HRESULT success or error code.
  
<a id="remarksSection"></a>  
## Remarks

The **Input** function allows you to pass input to a remotely run executable when it is used as a part of the [IXtfRemoteRunCallback Interface](../interfaces/ixtfremoteruncallback.md). The [IXtfRemoteRunCallback Interface](../interfaces/ixtfremoteruncallback.md) is in turn used as a parameter for the [IXtfRemoteRunClient::Run](../../IXtfRemoteRunClient/methods/ixtfremoterunclient_run.md) function. **IXtfRemoteRunCallback::Input** is user defined.

For more information on how to handle LPBSTR pointers returned by this API, please refer to [Allocating and Releasing Memory for a BSTR](/cpp/atl-mfc-shared/allocating-and-releasing-memory-for-a-bstr?view=vs-2019).

<a id="requirements"></a>
## Requirements  

**Header:** xtfremoterun.h  

**Library:** xtfremoterun.lib  
  
**Supported platforms:** Windows (for Xbox console tools)  
  

## See also

[IXtfRemoteRunCallback Interface](../interfaces/ixtfremoteruncallback.md)  
[IXtfRemoteRunCallback::Output](ixtfremoteruncallback_output.md)  
[IXtfRemoteRunClient::Run](../../IXtfRemoteRunClient/methods/ixtfremoterunclient_run.md)  