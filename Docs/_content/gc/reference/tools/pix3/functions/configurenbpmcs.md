---
author: aablackm
title: ConfigureNBPMCs
description: Configures the four hardware Performance Monitor Counters (PMCs) inside the north bridge to enable a title to read the counters directly for the title code.
kindex: ConfigureNBPMCs
ms.author: scotmi
ms.topic: reference
edited: 07/02/2019
quality: good
security: public
---

# ConfigureNBPMCs  

Configures the four hardware Performance Monitor Counters (PMCs) inside the north bridge to enable a title to read the counters directly for the title code.  

## Syntax  
  
```cpp
HRESULT ConfigureNBPMCs(  
         unsigned int eventIndex6,  
         unsigned int eventIndex7,  
         unsigned int eventIndex8,  
         unsigned int eventIndex9  
)  
```  
  
### Parameters  
  
*eventIndex6* &nbsp;&nbsp;  
Type: unsigned int  
  
Index of the event to count.  

*eventIndex7* &nbsp;&nbsp;  
Type: unsigned int  
  
Index of the event to count.  

*eventIndex8* &nbsp;&nbsp;  
Type: unsigned int  
  
Index of the event to count.  

*eventIndex9* &nbsp;&nbsp;  
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
  
The north bridge has 4 performance counters which can count events. NB PMC values can be read from any core. North bridge memory transactions are 64 bytes.

Events marked with * are recorded from the dram controllers (DCTs). Set eventIndex6 only when configuring these events since the same event need to be set for each dram controller
On Xbox One, we have 4 dram controllers and 4 counters, so you sum PMC6-PMC9 to get the total result.  
For example: total memory traffic for NBAllReadWrites = (PCM6+PMC7+PCM8+PMC9) * 64  

On Xbox One X, we have 12 dram controllers and 4 counters so we only count traffic on every 3rd DCT. Memory traffic is mostly symmetric so it reasonable to assume that the total number of events is three times the sum PMC6-PMC9.  
For example: total memory traffic for NBAllReadWrites = (PCM6+PMC7+PCM8+PMC9) * 3 * 64  

| Index | Event | Description |  
| --- | --- | --- |  
| 0 | Reserved | |  
| 1 | NBGarlicReads* | The number of garlic bus reads |  
| 2 | NBGarlicWrites* | The number of garlic bus writes |  
| 3 | NBGarlicReadsWrites* | The number of garlic bus reads and writes |  
| 4 | NBOnionReads* | The number of onion bus reads |  
| 5 | NBOnionWrites* | The number of onion bus writes |  
| 6 | NBOnionReadsWrites* | The number of onion bus reads and write |  
| 7 | NBAllReadWrites* | The number of all NB reads and writes |  
| 8 | NBCPUToMemory | The number of CPU transactions to memory |  
| 9 | NBIOToMemory | The number of IO transactions to memory |  
  
## Requirements  
  
**Header:** pix3.h
  
**Library:** pixevt.lib
  
**Supported platforms:** Xbox One family consoles and Xbox Series consoles  
  
## See also  
  
[GetPMCValue](getpmcvalue.md)  
[ConfigurePMCs](configurepmcs.md)  
[ConfigureL2IPMCs](configurel2ipmcs.md)  
[PIX3 on Xbox](../pix3_members.md)  
[PIX (NDA topic)](../../../../tools-console/xbox-tools-and-apis/pix/pix.md)  