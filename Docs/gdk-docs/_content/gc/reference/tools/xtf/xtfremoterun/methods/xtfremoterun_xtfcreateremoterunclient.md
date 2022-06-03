---
author: aablackm
title: XtfCreateRemoteRunClient
description: Initializes a new instance of the IXtfRemoteRunClient interface with the specified address.
ms.assetid: M:Windows.Xbox.xtfremoterun.XtfCreateRemoteRunClient(LPCWSTR,REFIID,void)
kindex: XtfCreateRemoteRunClient
ms.author: stevenpr
ms.topic: reference
edited: 00/00/0000
security: public
---

# XtfCreateRemoteRunClient Method

Initializes a new instance of the IXtfRemoteRunClient interface with the specified address.
  

<a id="syntaxSection"></a>
## Syntax  

```cpp
HRESULT XtfCreateRemoteRunClient(
         LPCWSTR pszAddress,
         REFIID riid,
         void **ppvObject
)  
```

<a id="ID4EG"></a>


<a id="parametersSection"></a> 
### Parameters  

*pszAddress*  
Type: LPCWSTR 

Pointer to the tools IP address of the development console to use for the new [IXtfRemoteRunClient](../classes/IXtfRemoteRunClient/interfaces/ixtfremoterunclient.md).


*riid*  
Type: REFIID 

Pointer that receives the instance identifier of the newly created [IXtfRemoteRunClient](../classes/IXtfRemoteRunClient/interfaces/ixtfremoterunclient.md).


*ppvObject*  
Type: void **

Pointer that receives a reference to the newly created [IXtfRemoteRunClient](../classes/IXtfRemoteRunClient/interfaces/ixtfremoterunclient.md).

<a id="ID4EN"></a>

  
<a id="retvalSection"></a> 
### Return value  
Type: HRESULT 

The result of the operation.

<a id="remarksSection"></a>  
## Remarks

The [Remote Run Client](../classes/IXtfRemoteRunClient/interfaces/ixtfremoterunclient.md) is the class which will call executables on your console.  
This class can be used to execute a wide variety of executables from test tools to common command line instructions like *kill process*. 
After creating the run client, you can use its [Run](../classes/IXtfRemoteRunClient/methods/ixtfremoterunclient_run.md) function to run executables. 
To run executables which require input or output, you will need to use the [IXtfRemoteRunCallback's interface](../classes/IXtfRemoteRunCallback/interfaces/ixtfremoteruncallback.md) as a parameter to the [Run](../classes/IXtfRemoteRunClient/methods/ixtfremoterunclient_run.md) function.

<a id="requirements"></a>
## Requirements  

**Header:** xtfremoterun.h  

**Library:** xtfremoterun.lib  
  
**Supported platforms:** Windows (for Xbox console tools)  
  
## See also

[IXtfRemoteRunClient](../classes/IXtfRemoteRunClient/interfaces/ixtfremoterunclient.md)  
[IXtfRemoteRunClient::Run](../classes/IXtfRemoteRunClient/methods/ixtfremoterunclient_run.md)  
[IXtfRemoteRunCallback Interface](../classes/IXtfRemoteRunCallback/interfaces/ixtfremoteruncallback.md)  