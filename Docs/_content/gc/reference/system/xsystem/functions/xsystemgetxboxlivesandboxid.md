---
author: M-Stahl
title: XSystemGetXboxLiveSandboxId
description: Retrieves the Xbox Live sandbox ID.
kindex: XSystemGetXboxLiveSandboxId
ms.author: v-denken
ms.topic: reference
edited: 06/25/2019
quality: good
security: public
applies-to: pc-gdk
---

# XSystemGetXboxLiveSandboxId  

Retrieves the Xbox Live sandbox ID.  

## Syntax  
  
```cpp
HRESULT XSystemGetXboxLiveSandboxId(  
         size_t sandboxIdSize,  
         char* sandboxId,  
         size_t* sandboxIdUsed  
)  
```  
  
### Parameters  
  
*sandboxIdSize* &nbsp;&nbsp;\_In\_  
Type: size_t  
  
The size of the *sandboxId*, in bytes. This value must be equal to or greater than the **XSystemXboxLiveSandboxIdMaxBytes** 
constant defined in XSystem.h.  
  
*sandboxId* &nbsp;&nbsp;\_Out\_writes\_bytes\_to\_(sandboxIdSize,\*sandboxIdUsed)  
Type: char*  
  
The character buffer that will receive the sandbox ID.  
  
*sandboxIdUsed* &nbsp;&nbsp;\_Out\_opt\_  
Type: size_t*  
  
The actual size, in bytes, of the *sandboxId* buffer returned.  
  
### Return value
Type: [HRESULT](/openspecs/windows_protocols/ms-erref/0642cb2f-2075-4469-918c-4441e69c548a)  
  
Returns **S_OK** if successful; otherwise, returns an error code. For a list of error codes, see 
[Error Codes](../../../errorcodes.md). If the function fails because *sandboxIdSize* is set to a value less than 
**XSystemXboxLiveSandboxIdMaxBytes**, the return value is set to **HRESULT_FROM_WIN32(ERROR_INSUFFICIENT_BUFFER)**.  
  
## Remarks  
  > [!NOTE]
> This function isn't safe to call on a time-sensitive thread. For more information, 
see [Time-sensitive threads](../../../../system/overviews/time-sensitive-threads.md).  
  
Together with the TitleID and the Service Configuration ID (SCID), the sandbox ID is critical to the development 
of Xbox Live titles and applications. The sandbox ID identifies your sandbox, which provides content isolation for your development kit during development. Content isolation ensures that you have a clean environment for developing and testing your title.  
  > [!NOTE]
> Sandbox IDs are case sensitive.  
  
For Xbox and PC devices, the sandbox ID is stored on the device. If the sandbox ID is not found, or you do not 
have permissions to access the sandbox ID, the sandbox ID defaults to 'RETAIL'. 

This function will also return 'RETAIL' if in fact your game is running in the retail environment.
  
## Requirements  
  
**Header:** XSystem.h
  
**Library:** xgameruntime.lib
  
**Supported platforms:** Windows, Xbox One family consoles and Xbox Series consoles  
  
## See also  
[Configuring dev kit settings (NDA topic)](../../../../getstarted/common-settings/config-dev-kit-settings.md)  
[Setting up sandboxes for Xbox Live development](../../../../live/test-release/sandboxes/live-setting-up-sandboxes.md)  
[XSystemGetConsoleId](xsystemgetconsoleid.md)  
[XSystem](../xsystem_members.md)  
  