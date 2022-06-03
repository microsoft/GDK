---
author: joannaleecy
title: XblMultiplayerSessionConstantsSetCloudComputePackageJson
description: This can only be set when creating a new session. Can only be specified if the 'cloudCompute' capability is set. Enables clients to request that a cloud compute instance be allocated on behalf of the session.
kindex: XblMultiplayerSessionConstantsSetCloudComputePackageJson
ms.author: migreen
ms.topic: reference
security: public
edited: 00/00/0000
applies-to: pc-gdk
---

# XblMultiplayerSessionConstantsSetCloudComputePackageJson  

This can only be set when creating a new session. Can only be specified if the 'cloudCompute' capability is set. Enables clients to request that a cloud compute instance be allocated on behalf of the session.  

## Syntax  
  
```cpp
HRESULT XblMultiplayerSessionConstantsSetCloudComputePackageJson(  
         XblMultiplayerSessionHandle handle,  
         const char* sessionCloudComputePackageConstantsJson  
)  
```  
  
### Parameters  
  
*handle* &nbsp;&nbsp;\_In\_  
Type: [XblMultiplayerSessionHandle](../handles/xblmultiplayersessionhandle.md)  
  
Handle to the multiplayer session.  
  
*sessionCloudComputePackageConstantsJson* &nbsp;&nbsp;\_In\_  
Type: char*  
  
Cloud compute instance to be allocated on behalf of the session. Example Json: { "crossSandbox": true, // True if the cloud compute resources are provisioned to be sandbox-agnostic, false if they are provisioned per-sandbox. "titleId" : "4567", // The title ID and GSI set of the cloud compute package to allocate. "gsiSet" : "128ce92a-45d0-4319-8a7e-bd8e940114ec" }  
  
  
### Return value  
Type: HRESULT
  
HRESULT return code for this API operation.
  
## Requirements  
  
**Header:** multiplayer_c.h
  
**Library:** Microsoft.Xbox.Services.141.GSDK.C.lib
  
## See also  
[multiplayer_c](../multiplayer_c_members.md)  
  
  