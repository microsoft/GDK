---
author: aablackm
title: IXtfFileIOClient Interface (Interface contents)
description: Represents an Xbox Tools Framework (XTF) file I/O client.
ms.assetid: T:Windows.Xbox.xtffileio.IXtfFileIOClient
kindex: IXtfFileIOClient interface, about
ms.author: stevenpr
ms.topic: navigation
edited: 00/00/0000
security: public
---

# IXtfFileIOClient Interface
Represents an Xbox Tools Framework (XTF) file I/O client.
<a id="syntaxSection"></a>



## Syntax  

```cpp
interface IXtfFileIOClient : public IUnknown  
```

  
## Methods  
  
| Method | Description |  
| --- | --- |  
| [CopyFiles](methods/copyfiles-ixtffileioclient-xtffileio-xbox-microsoft-m.md) | Copies files between two locations on a development console and returns information about the operation. |  
| [CreateDirectory](methods/createdirectory-ixtffileioclient-xtffileio-xbox-microsoft-m.md) | Creates the specified directory on the development console. |  
| [DeleteFiles](methods/deletefiles-ixtffileioclient-xtffileio-xbox-microsoft-m.md) | Deletes files from the development console. |  
| [FindFiles](methods/findfiles-ixtffileioclient-xtffileio-xbox-microsoft-m.md) | Searches for files on a development console. |  
| [GetFileAttributes](methods/getfileattributes-ixtffileioclient-xtffileio-xbox-microsoft-m.md) | Retrieves the attributes of the specified file on the development console. |  
| [GetFileInfo](methods/getfileinfo-ixtffileioclient-xtffileio-xbox-microsoft-m.md) | Retrieves information about the specified file on the development console. |  
| [GetFileSize](methods/getfilesize-ixtffileioclient-xtffileio-xbox-microsoft-m.md) | Retrieves the size of the specified file on the development console. |  
| [RemoveDirectory](methods/removedirectory-ixtffileioclient-xtffileio-xbox-microsoft-m.md) | Deletes the specified directory from the development console. |  
| [SetFileAttributes](methods/setfileattributes-ixtffileioclient-xtffileio-xbox-microsoft-m.md) | Sets attributes for files on the development console. |  


<a id="requirements"></a>

## Remarks

This interface is created by calling [XtfCreateFileIOClient](../../methods/xtfcreatefileioclient-xtffileio-xbox-microsoft-m.md). **IXtfFileIOClient** allows you to do all of the basic file manipulations on a dev console programatically. **IXtfFileIOClient** functionality includes finding, copying, creating, deleting, editing, and getting information for files and directories, on a development console.

## Requirements  

**Header:** xtffileio.h  

**Library:** xtffileio.lib  
  
**Supported platforms:** Windows (for Xbox console tools)  
  
<a id="ID4E1"></a>



## See also  

<a id="ID4E3"></a>

[XtfFileIO](../../xtffileio-xbox-microsoft-n.md)  
[XtfCreateFileIOClient](../../methods/xtfcreatefileioclient-xtffileio-xbox-microsoft-m.md)  