---
author: M-Stahl
title: XSystemGetConsoleId
description: Returns the ID of the current console.
kindex: XSystemGetConsoleId
ms.author: v-denken
ms.topic: reference
edited: 06/25/2019
quality: good
security: public
applies-to: pc-gdk
---

# XSystemGetConsoleId  

Returns the console ID of the current device.  

## Syntax  
  
```cpp
HRESULT XSystemGetConsoleId(  
         size_t consoleIdSize,  
         char* consoleId,  
         size_t* consoleIdUsed  
)  
```  
  
### Parameters  
  
*consoleIdSize* &nbsp;&nbsp;\_In\_  
Type: size_t  
  
The size of the *consoleId*, in bytes. This value must be equal to or greater than the **XSystemConsoleIdBytes** constant defined in XSystem.h.  
  
*consoleId* &nbsp;&nbsp;\_Out\_writes\_bytes\_to\_(consoleIdSize,\*consoleIdUsed)  
Type: char*  
  
The character buffer that will receive the console ID.  
  
*consoleIdUsed* &nbsp;&nbsp;\_Out\_opt\_  
Type: size_t*  
  
The size, in bytes, of the *consoleId* buffer returned.  
  
### Return value
Type: [HRESULT](/openspecs/windows_protocols/ms-erref/0642cb2f-2075-4469-918c-4441e69c548a)  
  
Returns **S_OK** if successful; otherwise, returns an error code. For a list of error codes, see [Error Codes](../../../errorcodes.md). If the function fails because *consoleIdSize* is set to a value less than **XSystemConsoleIdBytes**, the return value is set to **HRESULT_FROM_WIN32(ERROR_INSUFFICIENT_BUFFER)**.  
  
## Remarks  
  > [!NOTE]
> This function isn't safe to call on a time-sensitive thread. For more information, see [Time-sensitive threads](../../../../system/overviews/time-sensitive-threads.md).  
  
The console ID uniquely identifies an Xbox device for Xbox Live for development scenarios only. The console ID is used to identify the console for logging and management purposes; for example, to capture analytics information, or to determine which development kit to reboot in a development environment. The ID returned by this function is a match to the Console ID viewable in Settings \ System \ Console info.
  
For Xbox devices, the console ID is stored on the device. If the console ID is not found, or if you don't have permission to access the console ID, then the console ID defaults to `00000000.00000000.00000000.00000000.00`. For PC devices, the console ID always defaults to `00000000.00000000.00000000.00000000.00`.  

In RETAIL, this function will always return `00000000.00000000.00000000.00000000.00`. If the game is needing an identifier that can
be used in all situations including retail, there are two possibilties:

- If your application is using Single-Sign-On (SSO), you should the XSTS SSO token’s pairwise ID instead of the id returned by this function.
- Otherwise, use the [XSystemGetAppSpecificDeviceId](xsystemgetappspecificdeviceid.md) function.
  
## Requirements  
  
**Header:** XSystem.h
  
**Library:** xgameruntime.lib
  
**Supported platforms:** Windows, Xbox One family consoles and Xbox Series consoles  
  
## See also  
[Activating your dev kit (NDA topic)](../../../../getstarted/config-dev-kit-software/activating-dev-kit.md)  
[XSystemGetXboxLiveSandbodId](xsystemgetxboxlivesandboxid.md)  
[XSystem](../xsystem_members.md)  
  