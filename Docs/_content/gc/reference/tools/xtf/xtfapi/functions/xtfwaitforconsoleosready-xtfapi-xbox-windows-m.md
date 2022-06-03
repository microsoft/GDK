---
author: aablackm
title: XtfWaitForConsoleOSReady
description: Waits until the console OS is ready to receive commands before returning.
ms.assetid: M:Windows.Xbox.xtfapi.XtfWaitForConsoleOSReady(PCWSTR,UINT32)
kindex: XtfWaitForConsoleOSReady
ms.author: stevenpr
ms.topic: reference
edited: 06/10/2019
quality: good
security: public
---

# XtfWaitForConsoleOSReady  

Waits until the console OS is ready to receive commands before returning.

## Syntax  

```cpp
HRESULT XtfWaitForConsoleOSReady(
         PCWSTR address,
         UINT32 timeoutMS
)  
```

### Parameters  

*address*  
Type: PCWSTR 

[in] Address of the console. If address is the System IP address or HostName, the API will block until the System OS is ready. If the address includes /title (for example L"123.12.123.24/title") then the API will block until the Game OS has started.

*timeoutMS*  
Type: UINT32 

[in] Timeout in milliseconds.

### Return value  
Type: HRESULT 

Returns **S_OK** on success. If the OS is not ready before the timeout has expired, XtfWaitForConsoleOSReady returns ERROR_TIMEOUT. If the specified address is not valid XtfWaitForConsoleOSReady returns E_INVALIDARG.

## Remarks  


The following table shows examples of how this API behaves based on the state of the console.  

<table>
<tr><th>

State</th><th>

Action</th><th>

Result</th></tr>

<tr><td>System is up and running</td><td>XtfWaitForConsoleOSReady</td><td>Return S_OK immediately</td></tr>

<tr><td>System is up and running</td> <td> <ul>
<li>      XtfConsoleControlClient::Reboot</li>
<li>XtfWaitForConsoleOSReady</li>
<li>XtfApplicationClient::Launch</li>
</ul>
</td><td>XtfWaitForConsoleOSReady blocks until the console fully reboots. Launch is successful and launches full screen instead of getting launched constrained into home.</td></tr>

<tr><td>System is off</td><td>XtfWaitForConsoleOSReady</td><td>XtfWaitForConsoleOSReady blocks for timeout and returns an error.</td></tr>

<tr><td>System is off</td><td><ul>
<li>XtfWaitForConsoleOSReady</li>
<li>Turn console on</li>
<li>XtfApplicationClient::Launch</li>
</ul>
</td><td>XtfWaitForConsoleOSReady blocks until the console fully boots. Launch is successful and launches full screen instead of getting launched constrained into home.</td></tr>
</table>

## Requirements  

**Header:** xtfapi.h  

**Library:** XtfApi.lib  
  
**Supported platforms:** Windows (for Xbox console tools)  
  
## See also  

[XtfRegisterPackage](xtfregisterpackage-xtfapi-xbox-windows-m.md)  
[XTF Transport Errors (NDA topic)](../../../../../tools-console/xbox-tools-and-apis/commandlinetools/xtf-transport-errors.md)  
[Additional Xtf APIs](../atoc-xtfapi.md) 