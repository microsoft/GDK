---
author: joannaleecy
title: XblMultiplayerSessionVisibility
description: Defines values that indicate the visibility or accessibility of a session.
kindex: XblMultiplayerSessionVisibility
ms.author: migreen
ms.topic: reference
security: public
edited: 00/00/0000
quality: good
applies-to: pc-gdk
---

# XblMultiplayerSessionVisibility  

Defines values that indicate the visibility or accessibility of a session.    

## Syntax  
  
```cpp
enum class XblMultiplayerSessionVisibility  : uint32_t  
{  
    Unknown,  
    Any,  
    PrivateSession,  
    Visible,  
    Full,  
    Open  
}  
```  
  
## Constants  
  
| Constant | Description |
| --- | --- |
| Unknown | The status is unknown. |  
| Any | Ignore the session visibility filter. |  
| PrivateSession | The session is private and is not visible to players who aren't in the session. Attempting to join causes the service to return HTTP_E_STATUS_FORBIDDEN (403). |  
| Visible | The session is visible to players who aren't in the session, but the session is read-only to them and they can't join. Attempting to join causes the service to return HTTP_E_STATUS_BAD_REQUEST (400). |  
| Full | The session is full and cannot be joined by anyone. Attempting to join causes the service to return HTTP_E_STATUS_BAD_REQUEST (400). |  
| Open | The session is open and can be joined by anyone. |  
  
## Remarks  
  
For more information, see [Game session visibility and joinability](../../../../../live/features/multiplayer/mpsd/concepts/live-game-session-visibility-joinability.md) and the [Visibility and joinability](../../../../../live/features/multiplayer/mpsd/concepts/live-mpsd-details.md#visibility-and-joinability) section of [Multiplayer Session advanced topics](../../../../../live/features/multiplayer/mpsd/concepts/live-mpsd-details.md).
  
## Member of
  
[XblMultiplayerActivityDetails](../structs/xblmultiplayeractivitydetails.md)  
[XblMultiplayerSessionConstants](../structs/xblmultiplayersessionconstants.md)  
[XblMultiplayerSessionInitArgs](../structs/xblmultiplayersessioninitargs.md)  
[XblMultiplayerSessionQuery](../structs/xblmultiplayersessionquery.md)  
[XblMultiplayerSessionQueryResult](../structs/xblmultiplayersessionqueryresult.md)
  
## Argument of
  
[XblMultiplayerSearchHandleGetVisibility](../functions/xblmultiplayersearchhandlegetvisibility.md)  
[XblMultiplayerSessionConstantsSetVisibility](../functions/xblmultiplayersessionconstantssetvisibility.md)
  
## Requirements  
  
**Header:** multiplayer_c.h
  
## See also  
[multiplayer_c](../multiplayer_c_members.md)  
  
  