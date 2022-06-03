---
author: joannaleecy
title: XblNetworkAddressTranslationSetting
description: Defines values that indicate the current network address translation (NAT) settings for a console connecting to Xbox Live.
kindex: XblNetworkAddressTranslationSetting
ms.author: migreen
ms.topic: reference
security: public
edited: 00/00/0000
quality: good
applies-to: pc-gdk
---

# XblNetworkAddressTranslationSetting  

Defines values that indicate the current network address translation (NAT) settings for a console connecting to Xbox Live.    

## Syntax  
  
```cpp
enum class XblNetworkAddressTranslationSetting  : uint32_t  
{  
    Unknown,  
    Open,  
    Moderate,  
    Strict  
}  
```  
  
## Constants  
  
| Constant | Description |
| --- | --- |
| Unknown | The server returned an unrecognized response. |  
| Open | Can connect with any consoles regardless of their NAT settings. |  
| Moderate | Can connect only with consoles that use Moderate or Open settings. |  
| Strict | Can connect only with consoles that use Open NAT settings. |  
  
## Member of
  
[XblMultiplayerSessionMember](../structs/xblmultiplayersessionmember.md)
  
## Requirements  
  
**Header:** multiplayer_c.h
  
## See also  
[multiplayer_c](../multiplayer_c_members.md)  
  
  