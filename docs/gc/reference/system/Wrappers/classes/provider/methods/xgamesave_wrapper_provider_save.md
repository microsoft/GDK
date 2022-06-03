---
author: M-Stahl
title: Save
description: Saves data to the specified blob (file) within the specified container.
kindex: Wrappers.XGameSave.Provider.Save
ms.author: jgup
ms.topic: reference
ms.date: 02/23/2020
edited: 02/02/2021
security: public
applies-to: pc-gdk
---

# Microsoft.Xbox.Wrappers.XGameSave.Provider.Save

Saves data to the specified blob (file) within the specified container.

<a id="syntaxSection"></a>

## Syntax

```cpp
HRESULT Save(const std::string& containerName,
             const std::string& blobName,
             size_t dataSize,
             const uint8_t* blobData);
```

<a id="parametersSection"></a>

### Parameters

*containerName*&nbsp;&nbsp; \_In\_  
Type: std::string

The name of the container.

*blobName*&nbsp;&nbsp;\_In\_  
Type: std::string

The name of the blob.

*dataSize*&nbsp;&nbsp; \_In\_  
Type: size_t

The amount of data to write to the blob. This size is limited to a maximum of 16 MB (GS_MAX_BLOB_SIZE).

*blobData*&nbsp;&nbsp; \_In\_  
Type: uint8_t\*

A pointer to the bytes to write to the blob.

<a id="retvalSection"></a>

### Return value

Type: HRESULT

This method returns **S_OK** upon success, and the following HRESULT codes upon failure:

- **GS_INVALID_CONTAINER_NAME**
- **GS_OUT_OF_LOCAL_STORAGE**
- **GS_UPDATE_TOO_BIG**
- **GS_QUOTA_EXCEEDED**
- **GS_HANDLE_EXPIRED**

<a id="exampleSection"></a>

## Example

The following code example demonstrates how to use the **Save** function.

```cpp
using Microsoft::Xbox::Wrappers::GameSave;

std::vector<uint8_t> saveData; // Contains the player's data.

Provider provider = new Provider();

if(SUCCEEDED(provider->Initalize(userHandle, mySCID))
{  
   HRESULT hr = provider->Save("Save slot 1", "progress", saveData.size(), saveData.data());
   if(FAILED(hr))
   {
      if(hr == E_GS_QUOTA_EXCEEDED)
      {
         // Message that the user must delete saves for this game.
      }
      else if(hr == E_GS_OUT_OF_LOCAL_STORAGE)
      {
         // Message to the user that they have run out of save
         // space on the local device.
      }
      else if(hr == E_GS_UPDATE_TOO_BIG)
      {
         // This is really a development time thing to catch.
         // Your save size was too large for this Save call. Save
         // calls are limited to a maximum size of
         // 16 MB (GS_MAX_BLOB_SIZE).
      }
      else if(hr == E_GS_HANDLE_EXPIRED)
      {
         // You must recreate the provider, and then try again.
      }
      else
      {
         // Log error.
      }
   }
}
```

<a id="remarksSection"></a>

## Remarks

You must call the [Initialize](xgamesave_wrapper_provider_initialize.md) method before you can call any other method from the `Provider` class.

To intialize the save game wrapper, and synchronizes all of the containers for the specified user, call [Initialize](xgamesave_wrapper_provider_initialize.md).

To load the data from the given blob, from within the specified container, call [Load](xgamesave_wrapper_provider_load.md).

<a id="requirementsSection"></a>

## Requirements

**Header:** xgamesavewrappers.hpp
  
**Supported platforms:** Windows, Xbox One family consoles and Xbox Series consoles  

<a id="seealsoSection"></a>

## See also

[Microsoft.Xbox.Wrappers.XGameSave.Provider](../xgamesave_wrapper_provider.md)  
[XGameSave wrapper members](../../../xgamesave_wrapper_members.md)  
[Game saves simplified wrapper](../../../../../../system/overviews/game-save/game-saves-simplified-wrapper.md)  
[Load](xgamesave_wrapper_provider_load.md)  