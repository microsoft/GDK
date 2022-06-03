---
author: M-Stahl
title: XGameStreamingClientProperty
description: Properties that can be queried for about the client streaming device
kindex: XGameStreamingClientProperty
ms.author: arikc
ms.topic: reference
edited: 00/00/0000
quality: good
security: public
applies-to: pc-gdk
---

# XGameStreamingClientProperty  

Properties that can be queried for about the client streaming device.

## Syntax  
  
```cpp
enum class XGameStreamingClientProperty  : uint32_t  
{  
    None = 0,  
    StreamPhysicalDimensions = 1,  
    TouchInputEnabled = 2,  
    TouchBundleVersion = 4,  
    IPAddress = 5,
    SessionId = 6
}  
```  
  
## Constants  
  
| Constant | Description | Related Function |
| :--- | :--- | :--- | 
| None |    |  |
| StreamPhysicalDimensions | The physical dimensions of the stream size.   | [XGameStreamingGetStreamPhysicalDimensions](../functions/xgamestreaminggetstreamphysicaldimensions.md) |
| TouchInputEnabled | Whether the streaming device is currently sending touch input. | [XGameStreamingIsTouchInputEnabled](../functions/xgamestreamingistouchinputenabled.md) |
| TouchBundleVersion | The version number and version name of the touch adaptation bundle currently in use by the client app. | [XGameStreamingGetTouchBundleVersion](../functions/xgamestreaminggettouchbundleversion.md) | 
| IPAddress | The IP address of the client. | [XGameStreamingGetClientIPAddress](../functions/xgamestreaminggetclientipaddress.md) |
| SessionId | The session id of the client. | [XGameStreamingGetSessionId](../functions/xgamestreaminggetsessionid.md) |
  
## Remarks  
  
The [XGameStreamingClientPropertiesChangedCallBack](../functions/xgamestreamingclientpropertieschangedcallback.md) is invoked whenever any property of the client device that is streaming has changed.  

Upon initial registering of the callback function via  [XGameStreamingRegisterClientPropertiesChanged](../functions/xgamestreamingregisterclientpropertieschanged.md) the callback will be invoked for all connected devices for each of the properties that are applicable to that device.

To unregister the callback function use [XGameStreamingUnregisterClientPropertiesChanged](../functions/xgamestreamingunregisterclientpropertieschanged.md).
  
## Requirements  
  
**Header:** xgamestreaming.h
  
**Supported platforms:** Windows, Xbox One family consoles and Xbox Series consoles  
  
## See also  
[XGameStreamingClientPropertiesChangedCallBack](../functions/xgamestreamingclientpropertieschangedcallback.md) 
[XGameStreamingRegisterClientPropertiesChanged](../functions/xgamestreamingregisterclientpropertieschanged.md)  
[XGameStreamingUnregisterClientPropertiesChanged](../functions/xgamestreamingunregisterclientpropertieschanged.md)  
[XGameStreaming](../xgamestreaming_members.md)  

  
  