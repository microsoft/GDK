---
author: aablackm
title: IXtfRemoteRunCallback Interface (Interface contents)
description: Provides callbacks to be used when standard input or standard output of a remote executable are redirected by IXtfRemoteRunClient::Run Method.
ms.assetid: T:Windows.Xbox.xtfremoterun.IXtfRemoteRunCallback
kindex: IXtfRemoteRunCallback interface, about
ms.author: stevenpr
ms.topic: navigation
edited: 00/00/0000
security: public
---

# IXtfRemoteRunCallback Interface

Provides callbacks to be used when standard input or standard output of a remote executable are redirected by [Run](../../IXtfRemoteRunClient/methods/ixtfremoterunclient_run.md).
<a id="syntaxSection"></a>



## Syntax  

```cpp
interface IXtfRemoteRunCallback : public IUnknown  
```

  
## Methods  
  
| Method | Description |  
| --- | --- |  
| [Input](../methods/ixtfremoteruncallback_input.md) | Called to pass text into the running remote executable via its standard input. |  
| [Output](../methods/ixtfremoteruncallback_output.md) | Called to receive text sent by running remote executable to its standard output. |  


<a id="requirements"></a>

## Remarks

The **IXtfRemoteRunCallback** interface is passed into [IXtfRemoteRunClient::Run](../../IXtfRemoteRunClient/methods/ixtfremoterunclient_run.md) as a parameter in the event that the executable to be called requires an input, or writes some output that needs to be collected. The interface contains both an [input callback function](../methods/ixtfremoteruncallback_input.md), and an [output callback function](../methods/ixtfremoteruncallback_output.md). These can be assigned value independent of each other to provide input or output reading capability for an executable. The **IXtfRemoteRunCallback** interface is user defined.

## Requirements  

**Header:** xtfremoterun.h  

**Library:** xtfremoterun.lib  
  
**Supported platforms:** Windows (for Xbox console tools)  
  
<a id="ID4E4"></a>



## See also  

<a id="ID4E6"></a>

[XtfRemoteRun](../../../xtfremoterun_members.md)  
[IXtfRemoteRunCallback](ixtfremoteruncallback.md)  
[IXtfRemoteRunClient::Run](../../IXtfRemoteRunClient/methods/ixtfremoterunclient_run.md)  
[IXtfRemoteRunCallback::Input](../methods/ixtfremoteruncallback_input.md)  
[IXtfRemoteRunCallback::Output](../methods/ixtfremoteruncallback_output.md)  