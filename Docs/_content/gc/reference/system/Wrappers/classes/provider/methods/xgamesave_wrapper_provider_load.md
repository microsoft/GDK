---
author: M-Stahl
title: Load
description: Loads the data from the given blob (file), from within the specified container.
kindex: Wrappers.XGameSave.Provider.Load
ms.author: jgup
ms.topic: reference
ms.date: 02/23/2020
edited: 02/02/2021
security: public
applies-to: pc-gdk
---

# Microsoft.Xbox.Wrappers.XGameSave.Provider.Load

Loads the data from the given blob (file), from within the specified container.

<a id="syntaxSection"></a>

## Syntax

```cpp
BlobData Load(const std::string& containerName,
              const std::string& blobName );
```

<a id="parametersSection"></a>

### Parameters

*containerName*&nbsp;&nbsp; \_In\_  
Type: std::string

The name of the container.

*blobName*&nbsp;&nbsp;\_In\_  
Type: std::string

The name of the blob from which to load data.

<a id="retvalSection"></a>

### Return value

Type: BlobData

This method returns a vector containing a bytewise copy of the contents of the blob.

<a id="exampleSection"></a>

### Example

The following example code demonstrates how to use the **Load** method.

```cpp
using Microsoft::Xbox::Wrappers::GameSave;

Provider provider = new Provider();

if(SUCCEEDED(provider->Initalize(userHandle, mySCID))
{
   std::vector<std::string> containers = provider->QueryContainers("Save slot 1");
   
   if(containers.size == 1)
   {
      BlobData data = provider->Load("Save slot 1", "progress");
      
      if(!data.empty())
      {
         // Read the data into the game.
      }
      else
      {
         // Unexpected because there should be
         // only one blob in the container.
      }
   }
}
```

<a id="remarksSection"></a>

## Remarks

This method throws an exception if you call it on the UI thread.

If there is no match for the container and blob names, then the returned vector is empty.

You must call the [Initialize](xgamesave_wrapper_provider_initialize.md) method before you can call any other method from the `Provider` class.

<a id="requirementsSection"></a>

## Requirements

**Header:** xgamesavewrappers.hpp

**Supported platforms:** Windows, Xbox One family consoles and Xbox Series consoles

<a id="seealsoSection"></a>

## See also

[Microsoft.Xbox.Wrappers.XGameSave.Provider](../xgamesave_wrapper_provider.md)  
[XGameSave wrapper members](../../../xgamesave_wrapper_members.md)  
[Game saves simplified wrapper](../../../../../../system/overviews/game-save/game-saves-simplified-wrapper.md)  