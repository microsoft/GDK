---
author: joannaleecy
title: xbox_live_global_c (contents)
description: Xbox Live Global C API
kindex: xbox_live_global_c
ms.author: migreen
ms.topic: navigation
security: public
edited: 00/00/0000
applies-to: pc-gdk
---

# xbox_live_global_c  



  
## Enumerations  
  
| Enumeration | Description |  
| --- | --- |  
| [XblApiType](enums/xblapitype.md) | Internal use only. |  
| [XblConfigSetting](enums/xblconfigsetting.md) | Defines the config settings value that is passed to the below API's. |  
  
## Functions  
  
| Function | Description |  
| --- | --- |  
| [XblAddServiceCallRoutedHandler](functions/xbladdservicecallroutedhandler.md) | Registers for all service call notifications. |  
| [XblCleanupAsync](functions/xblcleanupasync.md) | Immediately reclaims all resources associated with the library. |  
| [XblDisableAssertsForXboxLiveThrottlingInDevSandboxes](functions/xbldisableassertsforxboxlivethrottlingindevsandboxes.md) | Disables asserts for Xbox Live throttling in dev sandboxes. |  
| [XblGetAsyncQueue](functions/xblgetasyncqueue.md) | Gets the async queue that is used for XSAPI's internal asynchronous operations. |  
| [XblGetScid](functions/xblgetscid.md) | Get the service configuration Id for the application. This is set during XblInitialize. |  
| [XblInitialize](functions/xblinitialize.md) | Initializes the library instance. |  
| [XblMemGetFunctions](functions/xblmemgetfunctions.md) | Gets the memory hook functions previously set by [XblMemSetFunctions](functions/xblmemsetfunctions.md). |  
| [XblMemSetFunctions](functions/xblmemsetfunctions.md) | Optionally sets the memory hook functions to allow callers to route memory allocations to their own memory manager. |  
| [XblRemoveServiceCallRoutedHandler](functions/xblremoveservicecallroutedhandler.md) | Unregisters from all service call notifications. |  
| [XblSetApiType](functions/xblsetapitype.md) | Internal method. |  
| [XblSetOverrideConfiguration](functions/xblsetoverrideconfiguration.md) | Sets an override configuration for advanced scenarios where a common Service Configuration ID (SCID) and title Id are needed for cross platform experiences. |  
  
## Structures  
  
| Structure | Description |  
| --- | --- |  
| [XblInitArgs](structs/xblinitargs.md) | Defines values representing the Xbox Live initialization arguments. |  
| [XblServiceCallRoutedArgs](structs/xblservicecallroutedargs.md) | Contains information about a service call. |  
