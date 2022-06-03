---
author: aablackm
title: IXtfCopyFileCallback Interface (Interface contents)
description: Provides callbacks that are used when the status of an IXtfFileIOClient::CopyFiles Method or    IXtfBatchFileIOClient::CopyFiles Method operation changes.
ms.assetid: T:Windows.Xbox.xtffileio.IXtfCopyFileCallback
kindex: IXtfCopyFileCallback interface, about
ms.author: stevenpr
ms.topic: navigation
edited: 00/00/0000
security: public
---

# IXtfCopyFileCallback Interface
Provides callbacks that are used when the status of an [IXtfFileIOClient::CopyFiles](../IXtfFileIOClient/methods/copyfiles-ixtffileioclient-xtffileio-xbox-microsoft-m.md) or [IXtfBatchFileIOClient::CopyFiles](../IXtfBatchFileIOClient/methods/copyfiles-ixtfbatchfileioclient-xtffileio-xbox-microsoft-m.md) operation changes.
<a id="syntaxSection"></a>



## Syntax  

```cpp
interface IXtfCopyFileCallback : public IUnknown  
```

  
## Methods  
  
| Method | Description |  
| --- | --- |  
| [OnEndFileCopy](methods/onendfilecopy-ixtfcopyfilecallback-xtffileio-xbox-microsoft-m.md) | Called when a file finishes copying between two locations on a development console. |  
| [OnFileCopyProgress](methods/onfilecopyprogress-ixtfcopyfilecallback-xtffileio-xbox-microsoft-m.md) | Called when the progress of a file copy changes. |  
| [OnStartFileCopy](methods/onstartfilecopy-ixtfcopyfilecallback-xtffileio-xbox-microsoft-m.md) | Called when a file starts copying between two locations on a development console. |  


<a id="requirements"></a>



## Requirements  

**Header:** xtffileio.h  

**Library:** xtffileio.lib  
  
**Supported platforms:** Windows (for Xbox console tools)  
  
<a id="ID4EDB"></a>



## See also  

<a id="ID4EFB"></a>



##### Reference  

[XtfFileIO](../../xtffileio-xbox-microsoft-n.md)  