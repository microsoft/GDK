---
author: aablackm
title: XtfFileIO (API contents)
description: The XTF API that is used to manage files on a development console.
ms.assetid: N:Windows.Xbox.xtffileio
kindex: XtfFileIO
ms.author: stevenpr
ms.topic: navigation
edited: 01/06/2020
security: public
---

# XtfFileIO


The Xbox Tools Framework (XTF) API that is used to manage files on a development console.   

<a id="interfacesSection"></a>



  
## Interfaces  
  
| Interface | Description |  
| --- | --- |  
| [IXtfBatchFileIOClient](classes/IXtfBatchFileIOClient/ixtfbatchfileioclient-xtffileio-xbox-microsoft-t.md) | Batch copies files between two locations on a development console. |  
| [IXtfCopyFileCallback](classes/IXtfCopyFileCallback/ixtfcopyfilecallback-xtffileio-xbox-microsoft-t.md) | Provides callbacks that are used when the status of an IXtfFileIOClient::CopyFiles Method or    IXtfBatchFileIOClient::CopyFiles Method operation changes. |  
| [IXtfFileIOClient](classes/IXtfFileIOClient/ixtffileioclient-xtffileio-xbox-microsoft-t.md) | Represents an Xbox Tools Framework (XTF) file I/O client. |  
| [IXtfFindFileCallback](classes/IXtfFindFileCallback/ixtffindfilecallback-xtffileio-xbox-microsoft-t.md) | Provides a callback that is used when a file is found during a find or delete operation. |  
  
## Functions  
  
| Function | Description |  
| --- | --- |  
| [XtfCreateFileIOClient](methods/xtfcreatefileioclient-xtffileio-xbox-microsoft-m.md) | Initializes a new instance of the IXtfFileIOClient interface with the specified address. |  
  
## Structures  
  
| Structure | Description |  
| --- | --- |  
| [XTFFILEINFO](structures/xtffileinfo-xtffileio-xbox-microsoft-t.md) | Contains information about a file for Xbox Tools Framework (XTF) apps. |  
| [XTFFILEIORESERVED](structures/xtffileioreserved-xtffileio-xbox-microsoft-t.md) | Reserved for internal use. |  
  


To create an object that implements the IXtfFileIOClient interface, call [XtfCreateFileIOClient](methods/xtfcreatefileioclient-xtffileio-xbox-microsoft-m.md).   