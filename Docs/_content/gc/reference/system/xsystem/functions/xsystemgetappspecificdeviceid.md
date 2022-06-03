---
author: M-Stahl
title: XSystemGetAppSpecificDeviceId
description: Returns a unique value from the console that is specific to caller’s title ID.
kindex: XSystemGetAppSpecificDeviceId
ms.author: jgup
ms.topic: reference
edited: 00/00/0000
quality: good
security: public
applies-to: pc-gdk
---

# XSystemGetAppSpecificDeviceId  

Returns a unique value from the console that is specific to caller’s title ID. 

## Syntax  
  
```cpp
HRESULT XSystemGetAppSpecificDeviceId(  
         size_t appSpecificDeviceIdSize,  
         char* appSpecificDeviceId,  
         size_t* appSpecificDeviceIdUsed  
)  
```  
  
### Parameters  
  
*appSpecificDeviceIdSize* &nbsp;&nbsp;\_In\_  
Type: size_t  
  
The size of the *appSpecificDeviceId*, in bytes. This value must be equal to or greater than the **XSystemAppSpecificDeviceIdBytes** 
constant defined in XSystem.h.  
  
*appSpecificDeviceId* &nbsp;&nbsp;\_Out\_writes\_bytes\_to_(appSpecificDeviceIdSize, \*appSpecificDeviceIdUsed)  
Type: char*  
  
The character buffer that will receive the application specific device ID.  
  
*appSpecificDeviceIdUsed* &nbsp;&nbsp;\_Out\_opt\_  
Type: size_t*  
  
The size, in bytes, of the *appSpecificDeviceIdUsed* buffer returned.  
  
### Return value
Type: [HRESULT](/openspecs/windows_protocols/ms-erref/0642cb2f-2075-4469-918c-4441e69c548a)  
  
Returns **S_OK** if successful; otherwise, returns an error code. For a list of error codes, see [Error Codes](../../../errorcodes.md). 
If the function fails because *appSpecificDeviceIdSize* is set to a value less than **XSystemAppSpecificDeviceIdBytes**, the 
return value is set to **HRESULT_FROM_WIN32(ERROR_INSUFFICIENT_BUFFER)**.
  
## Remarks  
  > [!NOTE]
> This function isn't safe to call on a time-sensitive thread. For more information, see 
[Time-sensitive threads](../../../../system/overviews/time-sensitive-threads.md).  

The constant string “00000000000000000000000000000000000000000000” will be returned in cases where the application 
specific device identifier could not be obtained due to an error.

If your application is using Single-Sign-On (SSO), you should the XSTS SSO token’s pairwise ID instead of the id returned
by this function.
  
  
## Requirements  
  
**Header:** XSystem.h
  
**Library:** xgameruntime.lib
  
**Supported platforms:** Windows, Xbox One family consoles and Xbox Series consoles  
  
## See also  
[Activating your dev kit (NDA topic)](../../../../getstarted/config-dev-kit-software/activating-dev-kit.md)  
[XSystemGetXboxLiveSandbodId](xsystemgetxboxlivesandboxid.md)  
[XSystem](../xsystem_members.md)  
  