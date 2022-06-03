---
author: aablackm
title: XtfRemoteRun Members (API contents)
description: The XTF API that is used to run utility executables on a development console.
ms.assetid: N:Windows.Xbox.xtfremoterun
kindex: XtfRemoteRun
ms.author: stevenpr
ms.topic: navigation
edited: 01/06/2020
security: public
---

# XtfRemoteRun Members

The Xbox Tools Framework (XTF) API that is used to run utility executables on a development console.   

<a id="interfacesSection"></a>



  
## Interfaces  
  
| Interface | Description |  
| --- | --- |  
| [IXtfRemoteRunCallback](classes/IXtfRemoteRunCallback/interfaces/ixtfremoteruncallback.md) | Provides callbacks to be used when standard input or standard output of a remote executable are redirected by IXtfRemoteRunClient::Run Method. |  
| [IXtfRemoteRunClient](classes/IXtfRemoteRunClient/interfaces/ixtfremoterunclient.md) | Provides the ability to run an executable remotely on a development console. |  
  
## Functions  
  
| Function | Description |  
| --- | --- |  
| [XtfCreateRemoteRunClient](methods/xtfremoterun_xtfcreateremoterunclient.md) | Initializes a new instance of the IXtfRemoteRunClient interface with the specified address. |  
  

To create an object that implements IXtfRemoteRunClient, call [XtfCreateRemoteRunClient](methods/xtfremoterun_xtfcreateremoterunclient.md).  