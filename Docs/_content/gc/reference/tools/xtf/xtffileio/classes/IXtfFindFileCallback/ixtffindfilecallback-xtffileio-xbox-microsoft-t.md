---
author: aablackm
title: IXtfFindFileCallback Interface (Interface contents)
description: Provides a callback that is used when a file is found during a find or delete operation.
ms.assetid: T:Windows.Xbox.xtffileio.IXtfFindFileCallback
kindex: IXtfFindFileCallback interface, about
ms.author: stevenpr
ms.topic: navigation
edited: 00/00/0000
security: public
---

# IXtfFindFileCallback Interface
Provides a callback that is used when a file is found during a find or delete operation.
<a id="syntaxSection"></a>



## Syntax  

```cpp
interface IXtfFindFileCallback : public IUnknown  
```

  
## Methods  
  
| Method | Description |  
| --- | --- |  
| [OnFoundFile](methods/onfoundfile-ixtffindfilecallback-xtffileio-xbox-microsoft-m.md) | Called when a file is found during a find or delete operation. |  


<a id="requirements"></a>



## Requirements  

**Header:** xtffileio.h  

**Library:** xtffileio.lib  
  
**Supported platforms:** Windows (for Xbox console tools)  
  
<a id="ID4E1"></a>



## See also  

<a id="ID4E3"></a>



##### Reference  

[XtfFileIO](../../xtffileio-xbox-microsoft-n.md)  