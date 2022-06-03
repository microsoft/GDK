---
author: aablackm
title: IXtfApplicationClient Interface (Interface contents)
description: Represents an Xbox Tools Framework (XTF) app client.
ms.assetid: T:Windows.Xbox.xtfapplication.IXtfApplicationClient
kindex: IXtfApplicationClient interface, about
ms.author: stevenpr
ms.topic: navigation
edited: 00/00/0000
security: public
---

# IXtfApplicationClient Interface
Represents an Xbox Tools Framework (XTF) app client.
<a id="syntaxSection"></a>



## Syntax  

```cpp
interface IXtfApplicationClient : public IUnknown  
```

  
## Methods  
  
| Method | Description |  
| --- | --- |  
| [Constrain](methods/constrain-ixtfapplicationclient-xtfapplication-xbox-windows-m.md) | Places the app with the specified package moniker into constrained mode. |  
| [DebugEnable](methods/debugenable-ixtfapplicationclient-xtfapplication-xbox-microsoft-m.md) | Enables or disables debugging for the app package with the specified package moniker. |  
| [Deploy](methods/deploy-ixtfapplicationclient-xtfapplication-xbox-microsoft-m.md) | Deploys the specified app package. |  
| [EnableGlobalOption](methods/enableglobaloption-ixtfapplicationclient-xtfapplication-xb.md) | Reserved for internal use. |  
| [GetDlc](methods/getdlc-ixtfapplicationclient-xtfapplication-xbox-microsoft-m.md) | Gets a list of the downloadable content (DLC) that is currently installed on the development console. |  
| [GetInstalled](methods/getinstalled-ixtfapplicationclient-xtfapplication-xbox-microsoft-m.md) | Gets a list of the apps that are currently installed on the development console. |  
| [Launch](methods/launch-ixtfapplicationclient-xtfapplication-xbox-microsoft-m.md) | Launches the app with the specified AUMID and command-line arguments. |  
| [MarkAppAsProvisioned](methods/markappasprovisioned-ixtfapplicationclient-xtfapplication-.md) | Marks an app as provisioned. |  
| [QueryExecutionState](methods/queryexecutionstate-ixtfapplicationclient-xtfapplication-xbox-microsoft-m.md) | Queries the execution state of the app with the specified package moniker. |  
| [Resume](methods/resume-ixtfapplicationclient-xtfapplication-xbox-microsoft-m.md) | Resumes execution of the app with the specified package moniker. |  
| [SetDefaultApp](methods/setdefaultapp-ixtfapplicationclient-xtfapplication-xbox-wi.md) | Sets the ID of the application to launch when an activation request is received for a specific title ID. |  
| [Snap](methods/snap-ixtfapplicationclient-xtfapplication-xbox-windows-m.md) | Reserved for internal use. |  
| [Suspend](methods/suspend-ixtfapplicationclient-xtfapplication-xbox-windows-.md) | Suspends execution of the app with the specified package moniker. |  
| [Terminate](methods/terminate-ixtfapplicationclient-xtfapplication-xbox-microsoft-m.md) | Terminates the app with the specified package moniker. |  
| [Unconstrain](methods/unconstrain-ixtfapplicationclient-xtfapplication-xbox-windows-m.md) | Returns the constrained app with the specified package moniker to the regular running state. |  
| [Uninstall](methods/uninstall-ixtfapplicationclient-xtfapplication-xbox-microsoft-m.md) | Uninstalls the app with the specified package moniker. |  


   

<a id="requirements"></a>



## Requirements  

**Header:** xtfapplication.h  

**Library:** xtfapplication.lib  
  
**Supported platforms:** Windows (for Xbox console tools)  
  
<a id="ID4EAB"></a>



## See also  

<a id="ID4ECB"></a>



##### Reference  

[XtfApplication](../../xtfapplication-xbox-microsoft-n.md)  