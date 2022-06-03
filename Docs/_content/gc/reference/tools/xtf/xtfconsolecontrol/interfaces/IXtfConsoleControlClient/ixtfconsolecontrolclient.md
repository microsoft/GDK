---
author: aablackm
title: IXtfConsoleControlClient (Interface contents)
description: Represents an Xbox Tools Framework (XTF) development console client.
ms.assetid: T:Windows.Xbox.xtfconsolecontrol.IXtfConsoleControlClient
kindex: IXtfConsoleControlClient interface, about
ms.author: stevenpr
ms.topic: navigation
edited: 00/00/0000
security: public
---

# IXtfConsoleControlClient  

Represents an Xbox Tools Framework (XTF) development console client.  
<a id="syntaxSection"></a>

## Syntax  

```cpp
class IXtfConsoleControlClient : public IUnknown  
```

  
## Methods  
  
| Method | Description |  
| --- | --- |  
| [GenerateStackDump](methods/ixtfconsolecontrolclient_generatestackdump.md) | Generates a stack dump. |  
| [GetAllSettings](methods/ixtfconsolecontrolclient_getallsettings.md) | Returns settings for the current console. |  
| [GetConfigSettings](methods/ixtfconsolecontrolclient_getconfigsettings.md) | Causes all configuration settings to be enumerated, invoking a callback for each configuration setting. |  
| [GetConfigValue](methods/ixtfconsolecontrolclient_getconfigvalue.md) | Gets the value of the specified configuration setting. |  
| [GetRunningProcesses](methods/ixtfconsolecontrolclient_getrunningprocesses.md) | Causes all running processes to be enumerated, invoking a callback for each running process. |  
| [GetSystemTime](methods/ixtfconsolecontrolclient_getsystemtime.md) | Retrieves the system time from the current development console. |  
| [QueryConnectedStandby](methods/ixtfconsolecontrolclient_queryconnectedstandby.md) | Determines whether the current development console is in Connected Standby mode. |  
| [QueryConnectedStandbyEx](methods/ixtfconsolecontrolclient_queryconnectedstandbyex.md) | Determines whether the current development console is in Connected Standby mode and allows Xbox app connections. |  
| [SetConfigValue](methods/ixtfconsolecontrolclient_setconfigvalue.md) | Sets the value of the specified configuration setting. |  
| [ShutdownConsole](methods/ixtfconsolecontrolclient_shutdownconsole.md) | Shuts down the development console. |  
| [UpdatesPending](methods/ixtfconsolecontrolclient_updatespending.md) | Reserved for internal use. |  
  

<a id="requirements"></a>

## Requirements  

**Header:** xtfconsolecontrol.h  

**Library:** xtfconsolecontrol.lib  
  
**Supported platforms:** Windows (for Xbox console tools)  
  
<a id="ID4E1"></a>

## See also  
[xtfconsolecontrol](../../xtfconsolecontrol_members.md)  