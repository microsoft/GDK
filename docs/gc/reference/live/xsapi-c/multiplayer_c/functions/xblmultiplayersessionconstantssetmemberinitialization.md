---
author: joannaleecy
title: XblMultiplayerSessionConstantsSetMemberInitialization
description: If a 'memberInitialization' object is set, the session expects the client system or title to perform initialization following session creation and/or as new members join the session. This can only be set when creating a new session.
kindex: XblMultiplayerSessionConstantsSetMemberInitialization
ms.author: migreen
ms.topic: reference
security: public
edited: 00/00/0000
applies-to: pc-gdk
---

# XblMultiplayerSessionConstantsSetMemberInitialization  

If a 'memberInitialization' object is set, the session expects the client system or title to perform initialization following session creation and/or as new members join the session. This can only be set when creating a new session.  

## Syntax  
  
```cpp
HRESULT XblMultiplayerSessionConstantsSetMemberInitialization(  
         XblMultiplayerSessionHandle handle,  
         XblMultiplayerMemberInitialization memberInitialization  
)  
```  
  
### Parameters  
  
*handle* &nbsp;&nbsp;\_In\_  
Type: [XblMultiplayerSessionHandle](../handles/xblmultiplayersessionhandle.md)  
  
Handle to the multiplayer session.  
  
*memberInitialization* &nbsp;&nbsp;\_In\_  
Type: [XblMultiplayerMemberInitialization](../structs/xblmultiplayermemberinitialization.md)  
  
Object specifying member initialization parameters.  
  
  
### Return value  
Type: HRESULT
  
HRESULT return code for this API operation.
  
## Remarks  
  
The timeouts and initialization stages are automatically tracked by the session, including QoS measurements if any metrics are set. These timeouts override the session's reservation and ready timeouts for members that have 'initializationEpisode' set.
  
## Requirements  
  
**Header:** multiplayer_c.h
  
**Library:** Microsoft.Xbox.Services.141.GSDK.C.lib
  
## See also  
[multiplayer_c](../multiplayer_c_members.md)  
  
  