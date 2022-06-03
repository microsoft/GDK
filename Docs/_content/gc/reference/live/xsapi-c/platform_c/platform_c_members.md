---
author: joannaleecy
title: platform_c (contents)
description: Platform C API
kindex: platform_c
ms.author: migreen
ms.topic: navigation
security: public
edited: 00/00/0000
applies-to: pc-gdk
---

# platform_c  



  
## Enumerations  
  
| Enumeration | Description |  
| --- | --- |  
| [XblClientOperationResult](enums/xblclientoperationresult.md) | Enum defining the results of a client operation. |  
| [XblLocalStorageWriteMode](enums/xbllocalstoragewritemode.md) | Write mode for a local storage write operation. |  
  
## Functions  
  
| Function | Description |  
| --- | --- |  
| [XblLocalStorageClearComplete](functions/xbllocalstorageclearcomplete.md) | Completes a local storage clear operation. [XblLocalStorageClearHandler](functions/xbllocalstorageclearhandler.md) |  
| [XblLocalStorageClearHandler](functions/xbllocalstorageclearhandler.md) | Invoked by XSAPI to request the client to perform a local storage clear operation. |  
| [XblLocalStorageReadComplete](functions/xbllocalstoragereadcomplete.md) | Completes a local storage read operation. [XblLocalStorageReadHandler](functions/xbllocalstoragereadhandler.md) |  
| [XblLocalStorageReadHandler](functions/xbllocalstoragereadhandler.md) | Invoked by XSAPI to request the client to perform a local storage read operation. |  
| [XblLocalStorageSetHandlers](functions/xbllocalstoragesethandlers.md) | Sets the storage handlers. |  
| [XblLocalStorageWriteComplete](functions/xbllocalstoragewritecomplete.md) | Completes a local storage write operation. [XblLocalStorageWriteHandler](functions/xbllocalstoragewritehandler.md) |  
| [XblLocalStorageWriteHandler](functions/xbllocalstoragewritehandler.md) | Invoked by XSAPI to request the client to perform a local storage write operation. |  
  
## Handles  
  
| Handle | Description |  
| --- | --- |  
| [XblClientOperationHandle](handles/xblclientoperationhandle.md) | Handle to an operation XSAPI requested the client to perform. |  
