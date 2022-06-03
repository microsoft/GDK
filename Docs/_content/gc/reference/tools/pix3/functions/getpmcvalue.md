---
author: aablackm
title: GetPMCValue
description: Gets the value of a hardware Performance Monitor Counter (PMC).
kindex: GetPMCValue
ms.author: scotmi
ms.topic: reference
edited: 06/13/2019
quality: good
security: public
---

# GetPMCValue  
  
Gets the value of a hardware Performance Monitor Counter (PMC).  

## Syntax  
  
```cpp
void GetPMCValue(  
         UINT32 index,  
         UINT64* value  
)  
```  
  
### Parameters  
  
*index* &nbsp;&nbsp;  
Type: UINT32  
  
Index of the hardware counter (from 0 to 3).  

*value* &nbsp;&nbsp;  
Type: UINT64*  
  
The value of the counter, as a pointer to a 64 bit integer.  
  
### Return value
Type: void  
  
## Remarks  
  
There are four hardware counters that can be configured directly to count events. The countable events are listed in the remarks for [ConfigurePMCs](configurepmcs.md). [ConfigurePMCs](configurepmcs.md) is used to configure the hardware counters to track event.  You can then use `GetPMCValue` to retrieve the counts of one of the configured events.

  
## Requirements  
  
**Header:** pix3_xbox.h
  
**Library:** pixevt.lib
  
**Supported platforms:** Xbox One family consoles and Xbox Series consoles  
  
## See also  
  
[ConfigurePMCs](configurepmcs.md)  
[ConfigureL2IPMCs](configurel2ipmcs.md)  
[ConfigureNBPMCs](configurenbpmcs.md)  
[PIX3 on Xbox](../pix3_members.md)  
[PIX (NDA topic)](../../../../tools-console/xbox-tools-and-apis/pix/pix.md)  