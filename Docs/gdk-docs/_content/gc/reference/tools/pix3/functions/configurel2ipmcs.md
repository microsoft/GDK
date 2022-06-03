---
author: aablackm
title: ConfigureL2IPMCs
description: Configures performance counters inside the L2 caches.
kindex: ConfigureL2IPMCs
ms.author: scotmi
ms.topic: reference
edited: 07/02/2019
quality: good
security: public
---

# ConfigureL2IPMCs  

Configures performance counters inside the L2 caches.  

## Syntax  
  
```cpp
HRESULT ConfigureL2IPMCs(  
         unsigned int eventIndex10,  
         unsigned int eventIndex11,  
         unsigned int eventIndex12,  
         unsigned int eventIndex13  
)  
```  
  
### Parameters  
  
*eventIndex10* &nbsp;&nbsp;  
Type: unsigned int  
  
Index of the event to count.  

*eventIndex11* &nbsp;&nbsp;  
Type: unsigned int  
  
Index of the event to count.  

*eventIndex12* &nbsp;&nbsp;  
Type: unsigned int  
  
Index of the event to count.  

*eventIndex13* &nbsp;&nbsp;  
Type: unsigned int  
  
Index of the event to count.  

  
### Return value
  
Type: HRESULT
  
Success or error code.  

| Code | Description |  
| --- | --- |  
| S_OK | Success. |  
| E_INVALIDARG | One or more of the indexes is out of range. |  
| E_ACCESS_DENIED | Access to the driver is denied. |      
  
## Remarks  
  
There are two L2 caches and each L2 cache has 4 performance counters which can count events.  
ConfigureL2IPMCs configures the events of both L2s to be the same.  
The first L2 is tied to cores 0-3. The second is tied to cores 4-7. Events for a specific L2 must be read from a core tired to the specific L2.  
L2 transactions are 64 bytes.  

| Index | Event | Description |  
| --- | --- | --- |  
| 0 |  Reserved | |  
| 1 |  L2MissICFill | The number of IC requests that miss the L2 |  
| 2 |  L2MissDCFill | The number of DC requests that miss the L2 |  
| 3 |  L2MissPrefetchFill | The number of prefetch requests that miss the L2 |  
| 4 |  L2MissAll | The total number of L2 Misses |  
| 5 |  L2Writeback | The number of L2 clean and dirty writebacks |  
| 6 |  L2CleanWriteback | The number of L2 clean writebacks |  
| 7 |  L2Fill | The number of L2 Fills |  
| 8 |  L2FillWriteback | The total number of L2 fills and writebacks  |  
  
## Requirements  
  
**Header:** pix3.h
  
**Library:** pixevt.lib
  
**Supported platforms:** Xbox One family consoles and Xbox Series consoles  
  
## See also  
  
[GetPMCValue](getpmcvalue.md)  
[ConfigurePMCs](configurepmcs.md)  
[ConfigureNBPMCs](configurenbpmcs.md)  
[PIX3 on Xbox](../pix3_members.md)  
[PIX (NDA topic)](../../../../tools-console/xbox-tools-and-apis/pix/pix.md)  