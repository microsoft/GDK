---
author: M-Stahl
title: XGameStreamingGetTouchBundleVersionNameSize
description: Gets the number of bytes required to store the version name of the touch adaptation bundle currently in use by the client app.
kindex: XGameStreamingGetTouchBundleVersionNameSize
ms.author: arikccohen
ms.topic: reference
security: public
edited: 00/00/0000
applies-to: pc-gdk
quality: good
---

# XGameStreamingGetTouchBundleVersionNameSize  

Gets the number of bytes required to store the version name of the touch adaptation bundle currently in use by the client app.    

## Syntax  
  
```cpp
size_t XGameStreamingGetTouchBundleVersionNameSize(  
         XGameStreamingClientId client  
)  
```  
  
### Parameters  
  
*client* &nbsp;&nbsp;\_In\_  
Type: XGameStreamingClientId  
  
The streaming client that is being queried.
  
  
### Return value
Type: size_t
  
The size of the version name that is in the touch adaptation bundle that is currently being used on the specified client.  

If no version name is specified in the touch adaptation bundle then the size will be 0.  

## Remarks  

Use `XGameStreamingGetTouchBundleVersionNameSize` to get the size before using [XGameStreamingGetTouchBundleVersion](xgamestreaminggettouchbundleversion.md) to get the version name itself.

## Requirements  
  
**Header:** XGameStreaming.h  
  
**Library:** xgameruntime.lib  
  
**Supported Platforms**: Windows, Xbox One family consoles and Xbox Series consoles  
  
## See also  
[XGameStreaming](../xgamestreaming_members.md#ClientProperties)  
[XGameStreamingGetTouchBundleVersion](xgamestreaminggettouchbundleversion.md)  


  
  