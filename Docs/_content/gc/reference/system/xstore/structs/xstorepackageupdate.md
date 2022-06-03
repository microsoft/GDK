---
author: M-Stahl
title: XStorePackageUpdate
description: Describes a package update.
kindex: XStorePackageUpdate
ms.author: shanede
ms.topic: reference
edited: 00/00/0000
quality: good
security: public
applies-to: pc-gdk
---

# XStorePackageUpdate  

Describes a package update.  

## Syntax  
  
```cpp
typedef struct XStorePackageUpdate {  
    char packageIdentifier[XPACKAGE_IDENTIFIER_MAX_LENGTH];  
    bool isMandatory;  
} XStorePackageUpdate  
```
  
### Members  
  
*packageIdentifier*  
Type: char[XPACKAGE_IDENTIFIER_MAX_LENGTH]  
  
A string that uniquely identifies a store package. For more information about package identifiers, see [Manage and license downloadable content (DLC)](../../../../commerce/fundamentals/xstore-manage-and-license-optional-packages.md).  
  
*isMandatory*  
Type: bool  
  
Indicates if the update is mandatory.  
  
## Remarks
  
To retrieve the list of available updates call [XStoreQueryGameAndDlcPackageUpdatesAsync](../functions/xstorequerygameanddlcpackageupdatesasync.md). The available updates will be returned in [XStoreQueryGameAndDlcPackageUpdatesResult](../functions/xstorequerygameanddlcpackageupdatesresult.md). [XStoreQueryGameAndDlcPackageUpdatesResult](../functions/xstorequerygameanddlcpackageupdatesresult.md) has a return parameter that is a list of **XStorePackageUpdate** objects.
 
## Requirements  
  
**Header:** XStore.h (included in XGameRuntime.h)
  
**Supported platforms:** Windows, Xbox One family consoles and Xbox Series consoles  
  
## See also  
[XStore](../xstore_members.md)  
[XStoreQueryGameAndDlcPackageUpdatesAsync](../functions/xstorequerygameanddlcpackageupdatesasync.md)  
[XStoreQueryGameAndDlcPackageUpdatesResult](../functions/xstorequerygameanddlcpackageupdatesresult.md)  
  