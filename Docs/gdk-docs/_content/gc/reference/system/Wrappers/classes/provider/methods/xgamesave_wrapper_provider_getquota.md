---
author: M-Stahl
title: GetQuota
description: Returns the amount of data available to store using the save game wrapper.
kindex: Wrappers.XGameSave.Provider.GetQuota
ms.author: jgup
ms.topic: reference
ms.date: 02/23/2020
edited: 00/00/0000
security: public
applies-to: pc-gdk
quality: good
---

# Microsoft.Xbox.Wrappers.XGameSave.Provider.GetQuota  

Returns the amount of data available to store using the Save game wrapper.

## Syntax  
  
```cpp
int64_t GetQuota();
```  

### Return value  
Type: int64_t

Returns the number of bytes still available within the storage space.  
  
## Remarks  
  
Each game has a limited quota on how much data they can save for a given user. If this quota is exceeded, 
attempting to save additional data will fail with E_GS_QUOTA_EXCEEDED. To give an accurate view we always 
make sure that any outstanding writes, updates or deletes are handled first before returning since any of 
these can change the remaining quota. 
  
## Requirements  
  
**Header:** xgamesavewrappers.hpp
  
**Supported platforms:** Windows, Xbox One family consoles and Xbox Series consoles  
  
## See also
[Game Saves Simplified Wrapper](../../../../../../system/overviews/game-save/game-saves-simplified-wrapper.md)

  
  