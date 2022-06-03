---
author: aablackm
title: XtfApplication (API contents)
description: The XTF API that is used to automate application management.
ms.assetid: N:Windows.Xbox.xtfapplication
kindex: XtfApplication
ms.author: stevenpr
ms.topic: navigation
edited: 01/06/2020
security: public
---

# XtfApplication


The Xbox Tools Framework (XTF) API that is used to automate application management.   

<a id="interfacesSection"></a>



  
## Interfaces  
  
| Interface | Description |  
| --- | --- |  
| [IXtfApplicationClient](classes/IXtfApplicationClient/ixtfapplicationclient-xtfapplication-xbox-microsoft-t.md) | Represents an Xbox Tools Framework (XTF) app client. |  
| [IXtfDeployCallback](classes/IXtfDeployCallback/ixtfdeploycallback-xtfapplication-xbox-microsoft-t.md) | Provides a callback that is called when a trackable action occurs during an IXtfApplicationClient::Deploy Method    operation. |  
  
## Functions  
  
| Function | Description |  
| --- | --- |  
| [XtfCreateApplicationClient](methods/xtfcreateapplicationclient-xtfapplication-xbox-microsoft-m.md) | Initializes a new instance of the [IXtfApplicationClient](classes/IXtfApplicationClient/ixtfapplicationclient-xtfapplication-xbox-microsoft-t.md) interface for the development console with the specified address. |  
  



To create an instance of XtfApplicationClient, call [XtfCreateApplicationClient](methods/xtfcreateapplicationclient-xtfapplication-xbox-microsoft-m.md).   