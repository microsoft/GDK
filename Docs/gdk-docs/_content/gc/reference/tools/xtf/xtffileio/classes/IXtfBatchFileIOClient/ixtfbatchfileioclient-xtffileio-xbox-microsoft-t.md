---
author: aablackm
title: IXtfBatchFileIOClient Interface (Interface contents)
description: Batch copies files between two locations on a development console.
ms.assetid: T:Windows.Xbox.xtffileio.IXtfBatchFileIOClient
kindex: IXtfBatchFileIOClient interface, about
ms.author: stevenpr
ms.topic: navigation
edited: 00/00/0000
security: public
---

# IXtfBatchFileIOClient Interface
Batch copies files between two locations on a development console.
<a id="syntaxSection"></a>



## Syntax  

```cpp
interface IXtfBatchFileIOClient : public IUnknown  
```

  
## Methods  
  
| Method | Description |  
| --- | --- |  
| [CopyFiles](methods/copyfiles-ixtfbatchfileioclient-xtffileio-xbox-microsoft-m.md) | Batch-copies files between two locations on a development console and returns information about the operation. |  


<a id="requirements"></a>

## Remarks

This is a deprecated interface. Use the [IXtfFileIOClient Interface](../IXtfFileIOClient/ixtffileioclient-xtffileio-xbox-microsoft-t.md) instead.

## Requirements  

**Header:** xtffileio.h  

**Library:** xtffileio.lib  
  
**Supported platforms:** Windows (for Xbox console tools)  
  
<a id="ID4E1"></a>



## See also  

<a id="ID4E3"></a>

[XtfFileIO](../../xtffileio-xbox-microsoft-n.md)  
[IXtfBatchFileIOClient::CopyFiles](methods/copyfiles-ixtfbatchfileioclient-xtffileio-xbox-microsoft-m.md)  