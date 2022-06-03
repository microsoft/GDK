---
author: M-Stahl
title: Simplified wrapper
description: Describes simplified wrappers that can reduce the cost of adding `XGameSave` support to your title.
kindex: Save games simplified wrapper
ms.author: jgup
ms.topic: conceptual
edited: 04/10/2020
security: public
---

# Game saves simplified wrapper

The existing `XGameSave` API gives developers the best possible control of how they can manage their save game 
system. The API provides full control of performance, threading, policies about how to synchronize, and 
transactional updates. For games that don't require such control and for developers who just want a simple way to integrate 
roamable saves into their games, we provide a C++ wrapper that presents a much simpler API.

The simplified wrapper is provided as an .spp file that can be integrated into your game: *%GRDKLatest%GameKit\Include\xgamesavewrappers.hpp*.

Games should choose which solution they want to use: the `XGameSave` API or the simplified wrappers. 
Unless games modify the source code for the .hpp file, the two solutions shouldn't be mixed together.

The simplified wrapper is subject to all the limitations of the full API because it's implemented by using 
the `XGameSave` API.

## Using the wrapper

Using the wrapper is fairly straightforward as shown in the following steps.

1. Include *xgamesavewrappers.hpp* in your project.
1. Create a new [Provider](../../../reference/system/Wrappers/classes/provider/xgamesave_wrapper_provider.md) class. Make 
   sure to hold on to a pointer to this object for the lifetime of your game. 
1. Call [Provider::Initialize](../../../reference/system/Wrappers/classes/provider/methods/xgamesave_wrapper_provider_initialize.md) to synchronize the user's saves 
   for the game. This must be done before calling any of the other save game wrapper APIs. This call shouldn't be called on your game's UI thread because it can block and possibly show UI.

Just as with the full `XGameSave` API, the game's saves are part of a single storage space. The storage space 
is made of multiple containers that the game can choose to define. Each container can be made of multiple 
blobs. These blobs are the data that the game reads to and writes from.

After initializing the `Provider` class, games can do any combination of the following: 

- Enumerate their containers and blobs by using either [Provider::QueryContainers](../../../reference/system/Wrappers/classes/provider/methods/xgamesave_wrapper_provider_querycontainers.md) 
  or [Provider::QueryContainerBlobs](../../../reference/system/Wrappers/classes/provider/methods/xgamesave_wrapper_provider_querycontainerblobs.md).
- Load their blobs (files) by using [Provider::Load](../../../reference/system/Wrappers/classes/provider/methods/xgamesave_wrapper_provider_load.md).
- Update or create new blobs (files) by using [Provider::Save](../../../reference/system/Wrappers/classes/provider/methods/xgamesave_wrapper_provider_save.md).
- [Delete containers](../../../reference/system/Wrappers/classes/provider/methods/xgamesave_wrapper_provider_delete_string.md) with all their contents or 
  [delete select blobs](../../../reference/system/Wrappers/classes/provider/methods/xgamesave_wrapper_provider_delete_string_string.md) from within a container.
- Check on how much space still remains by calling [Provider::GetQuota](../../../reference/system/Wrappers/classes/provider/methods/xgamesave_wrapper_provider_getquota.md).

## Example of the Load method

The following code example demonstrates how to use the `Load` method.

```cpp
using Microsoft::Xbox::Wrappers::GameSave;

Provider provider = new Provider();

// NOTE: Initialize will throw an exception if called on the UI thread.
if(SUCCEEDED(provider->Initialize(userHandle, mySCID))
{
   // Note that container names can't contain spaces.
   std::vector<std::string> containers = provider->QueryContainers("Save_slot_1");
   if(containers.size() == 1)
   {
      BlobData data = provider->Load("Save_slot_1", "progress");
      if(!data.empty())
      {
         // Read the data into the game.
      }
      else
      {
         // This is unexpected in this use case because the sample
         // code assumes that there is just one blob in the
         // container. 
      }
   }
}
```

## Example of the Save function

The following code example demonstrates how to use the `Save` function.

```cpp
using Microsoft::Xbox::Wrappers::GameSave;

std::vector<uint8_t> saveData; // Contains the user's data.

Provider provider = new Provider();

// NOTE: Initialize will throw an exception if called on the UI thread.
if(SUCCEEDED(provider->Initialize(userHandle, mySCID))
{  
   // Note that container names can't contain spaces.
   HRESULT hr = provider->Save("Save_slot_1", "progress", saveData.size(), saveData.data());
   if(FAILED(hr))
   {
      if(hr == E_GS_QUOTA_EXCEEDED)
      {
         // Message that the user must clear out saves for this game.
      }
      else if(hr == E_GS_OUT_OF_LOCAL_STORAGE)
      {
         // Message to the user that they have run out of save space on the local device.
      }
      else if(hr == E_GS_UPDATE_TOO_BIG)
      {
         // This is really a development-time item to catch. Your save size was too 
         // big for a given call to save. Each such call is limited to 16 MB (GS_MAX_BLOB_SIZE).
      }
      else if(hr == E_GS_HANDLE_EXPIRED)
      {
         // Need to re-create the provider and try again.
      }
      else
      {
         // Log error.
      }
   }
}
```

## See also

[XGameSave API reference](../../../reference/system/xgamesave/xgamesave_members.md)

   