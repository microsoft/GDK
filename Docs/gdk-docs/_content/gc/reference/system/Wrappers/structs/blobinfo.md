---
author: M-Stahl
title: BlobInfo
description: Contains the name and size of a blob (file) used by XGameSave wrappers.
kindex: BlobInfo
ms.author: jgup
ms.topic: reference
ms.date: 02/23/2020
edited: 02/02/2021
security: public
applies-to: pc-gdk
quality: good
---

# Microsoft.Xbox.Wrappers.XGameSave.BlobInfo

Contains the name and size of a blob (file) used by XGameSave wrappers.

<a id="syntaxSection"></a>

## Syntax

```cpp
struct BlobInfo
{
    BlobInfo(const XGameSaveBlobInfo* info)
    {
        name = info->name;
        size = info->size;
    }
    std::string name;
    uint32_t size;
};
```

<a id="membersSection"></a>

### Members

*BlobInfo*  
Type: XGameSaveBlobInfo

The struct's constructor.

*name*  
Type: std::string

The name of the blob.

*size*  
Type: uint32t

The size of the blob, in bytes.

<a id="remarksSection"></a>

## Remarks

You can initialize the `blobinfo` structure by calling the BlobInfo constructor (**BlobInfo::BlobInfo()**), passing a pointer to an [XGameSaveBlobInfo](../../xgamesave/structs/xgamesaveblobinfo.md) object.

`XGameSaveBlobInfo` contains the properties of an [XGameSaveBlob](../../xgamesave/structs/xgamesaveblob.md), and is a parameter for the [XGameSaveBlobInfoCallback](../../xgamesave/functions/xgamesaveblobinfocallback.md) function.

You can ensure that you're reading the correct blob by using the `name` property.

To read the contents of the blob with a sufficiently large buffer, use the `size` property.

<a id="requirementsSection"></a>

## Requirements

**Header:** xgamesavewrappers.hpp

**Supported platforms:** Windows, Xbox One family consoles and Xbox Series consoles

<a id="seealsoSection"></a>

## See also

[Microsoft.Xbox.Wrappers.XGameSave.Provider](../classes/provider/xgamesave_wrapper_provider.md)  
[XGameSave wrapper members](../xgamesave_wrapper_members.md)  
[Game saves simplified wrapper](../../../../system/overviews/game-save/game-saves-simplified-wrapper.md)  