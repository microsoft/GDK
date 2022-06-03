---
author: joannaleecy
title: XblTitleStorageBlobMetadata
description: Metadata about a blob.
kindex: XblTitleStorageBlobMetadata
ms.author: migreen
ms.topic: reference
security: public
edited: 00/00/0000
quality: good
applies-to: pc-gdk
---

# XblTitleStorageBlobMetadata  

Metadata about a blob.  

## Syntax  
  
```cpp
typedef struct XblTitleStorageBlobMetadata {  
    char blobPath[XBL_TITLE_STORAGE_BLOB_PATH_MAX_LENGTH];  
    XblTitleStorageBlobType blobType;  
    XblTitleStorageType storageType;  
    char displayName[XBL_TITLE_STORAGE_BLOB_DISPLAY_NAME_MAX_LENGTH];  
    char eTag[XBL_TITLE_STORAGE_BLOB_ETAG_MAX_LENGTH];  
    time_t clientTimestamp;  
    size_t length;  
    char serviceConfigurationId[XBL_SCID_LENGTH];  
    uint64_t xboxUserId;  
} XblTitleStorageBlobMetadata  
```
  
### Members  
  
*blobPath*  
Type: char[XBL_TITLE_STORAGE_BLOB_PATH_MAX_LENGTH]  
  
Blob path is a unique string that conforms to a SubPath\file format (example: "foo\bar\blob.txt").
  
*blobType*  
Type: [XblTitleStorageBlobType](../enums/xbltitlestorageblobtype.md)  
  
Type of blob data. Possible values are: Binary, Json, and Config.
  
*storageType*  
Type: [XblTitleStorageType](../enums/xbltitlestoragetype.md)  
  
Type of storage.
  
*displayName*  
Type: char[XBL_TITLE_STORAGE_BLOB_DISPLAY_NAME_MAX_LENGTH]  
  
[optional] Friendly display name to show in app UI.
  
*eTag*  
Type: char[XBL_TITLE_STORAGE_BLOB_ETAG_MAX_LENGTH]  
  
ETag for the file used in read and write requests.
  
*clientTimestamp*  
Type: time_t  
  
[optional] Timestamp assigned by the client.
  
*length*  
Type: size_t  
  
Gets the number of bytes of the blob data.
  
*serviceConfigurationId*  
Type: char[XBL_SCID_LENGTH]  
  
The service configuration ID of the title
  
*xboxUserId*  
Type: uint64_t  
  
The Xbox User ID of the player this file belongs to. This value will be null for Global and Session files.
  
## Requirements  
  
**Header:** title_storage_c.h
  
## See also  
[title_storage_c](../title_storage_c_members.md)  
  
  