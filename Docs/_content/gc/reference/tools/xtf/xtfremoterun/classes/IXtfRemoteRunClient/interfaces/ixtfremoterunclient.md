---
author: aablackm
title: IXtfRemoteRunClient Interface (Interface contents)
description: Provides the ability to run an executable remotely on a development console.
ms.assetid: T:Windows.Xbox.xtfremoterun.IXtfRemoteRunClient
kindex: IXtfRemoteRunClient interface, about
ms.author: stevenpr
ms.topic: navigation
edited: 00/00/0000
security: public
---

# IXtfRemoteRunClient Interface
Provides the ability to run an executable remotely on a development console.
<a id="syntaxSection"></a>



## Syntax  

```cpp
interface IXtfRemoteRunClient : public IUnknown  
```

  
## Methods  
  
| Method | Description |  
| --- | --- |  
| [Run](../methods/ixtfremoterunclient_run.md) | Run a given command on the console. |  


## Remarks

To create an instance of **XtfRemoteRunClient**, call [XtfCreateRemoteRunClient](../../../methods/xtfremoterun_xtfcreateremoterunclient.md). To run executables with the **XtfRemoteRunClient** call [IXtfRemoteRunClient::Run](../methods/ixtfremoterunclient_run.md). To run the executable with input or output you will need to use an instance of the [IXtfRemoteRunCallback Interface](../../IXtfRemoteRunCallback/interfaces/ixtfremoteruncallback.md) as a parameter to [IXtfRemoteRunClient::Run](../methods/ixtfremoterunclient_run.md).


<a id="requirements"></a>

## Requirements  

**Header:** xtfremoterun.h  

**Library:** xtfremoterun.lib  
  
**Supported platforms:** Windows (for Xbox console tools)  
  
<a id="ID4E6"></a>



## See also  

<a id="ID4EBB"></a>

[XtfRemoteRun](../../../xtfremoterun_members.md)  
[IXtfRemoteRunClient](ixtfremoterunclient.md)  
[IXtfRemoteRunClient::Run](../methods/ixtfremoterunclient_run.md)