---
author: aablackm
title: ConfigurePMCs
description: Configures the four hardware Performance Monitor Counters (PMCs) to enable a title to read the counters directly for the title code.
kindex: ConfigurePMCs
ms.author: scotmi
ms.topic: reference
edited: 06/13/2019
quality: good
security: public
---

# ConfigurePMCs  

Configures the four hardware Performance Monitor Counters (PMCs) to enable a title to read the counters directly for the title code.  

## Syntax  
  
```cpp
HRESULT ConfigurePMCs(  
         unsigned int eventIndex0,  
         unsigned int eventIndex1,  
         unsigned int eventIndex2,  
         unsigned int eventIndex3  
)  
```  
  
### Parameters  
  
*eventIndex0* &nbsp;&nbsp;  
Type: unsigned int  

  
Index of the event to count.  


*eventIndex1* &nbsp;&nbsp;  
Type: unsigned int  

  
Index of the event to count.  


*eventIndex2* &nbsp;&nbsp;  
Type: unsigned int  

  
Index of the event to count.  


*eventIndex3* &nbsp;&nbsp;  
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
  
There are four hardware counters that can be configured directly to count events. The events are listed in the table below. The index of the event is used both to specify the event for this method, and to retrieve the count using [GetPMCValue](getpmcvalue.md).  

| Index | Event | Description |  
| --- | --- | --- |  
| 0 | Reserved | Reserved. |  
| 1 | RetiredSseAvx | The number of SSE/AVX operations retired. |  
| 2 | DCacheAccesses | The number of accesses to the L1 data cache for load and store references. |  
| 3 | DCacheMisses | The number of L1 data cache references which miss the data cache. |  
| 4 | DCacheRefills | The number of L1 data cache refills satisfied from the L2 cache (and/or the northbridge) from uncatchable memory. |  
| 5 | L1DTLBMissL2DTLBHit | The number of L1 data cache accesses that miss in the L1 DTLB and hit in the L2 DTLB. |  
| 6 | DtlbMiss | The number of L1 data cache accesses that miss in both the L1 and L2 DTLBs. |  
| 7 | L1DtlbHit | The number of L1 data cache accesses that hit in the L1 DTLB. |  
| 8 | L1ITLBMissL2ITLBHit | The number of instruction fetches that miss in the L1 ITLB but hit in the L2 ITLB. |  
| 9 | ItlbMiss | The number of instruction fetches that miss in the 4K ITLB and 2M ITLB. |  
| 10 | ItlbInstructionFetchHits | The number of instruction fetches that hit in the 4K ITLB and 2M ITLB. |  
| 11 | MisalignedAccess | The number of L1 data cache accesses that are misaligned. Misaligned accesses incur at least an extra cache access and an extra cycle of latency on reads. |  
| 12 | IneffectiveSWPrefetches | The number of software prefetches that do not cause an actual L1 data cache refill. |  
| 13 | CpuClkNotHalted | The number of clocks that the CPU is not in a halted state. |  
| 14 | RetiredInstructions | The number of instructions retired (execution completed and architectural state updated). This count includes exceptions and interrupts. |  
| 15 | BranchInstructions | The number of branch instructions retired. This includes all types of architectural control flow changes, including exceptions and interrupts. |  
| 16 | MispredictedBranch | The number of branch instructions retired, of any type, that were not correctly predicted in either target or direction. This includes those for which prediction is not attempted (far control transfers, exceptions and interrupts), and excludes resyncs. |  
| 17 | RetiredTakenBranch | The number of taken branches that were retired. This includes all types of architectural control flow changes, including exceptions and interrupts, and excludes resyncs. |  
| 18 | RetiredFarSyscall | The number of far syscalls retired. |  
| 19 | RetiredNearReturns | The number of near return instructions retired. |  
| 20 | RetiredReturnsMispredicted | A near return instruction was retired that mispredicted in either target or direction. |  
| 21 | MispredictedTakenBranch | A taken branch instruction was retired that mispredicted in target address (but not in direction). |  
| 22 | MmxFPInstructions | A floating point (x87, MMX, or SSE) instruction was retired. |  
| 23 | RetiredFPInstructions | The number of SSE/AVX operations retired. |  
| 24 | RetiredMmxInstructions | The number of MMX operations retired. |  
| 25 | RetiredSseInstructions | The number of SSE operations retired. |  
| 26 | InstructionFetchStalls | The number cycles that the instruction fetch engine is stalled. |  
| 27 | DataCachePrefetches | L1 data cache prefetches. |  
| 28 | DataCacheReadSize | The number of L1 data cache reads. |  
| 29 | DataCacheWriteSize | The number of L1 data cache writes. |  
| 30 | ITLBReloadStalls | The number of cycles when the fetch engine is stalled for an ITLB reload. |  
  
  
## Requirements  
  
**Header:** pix3.h
  
**Library:** pixevt.lib
  
**Supported platforms:** Xbox One family consoles and Xbox Series consoles  
  
## See also  
  
[ConfigureL2IPMCs](configurel2ipmcs.md)  
[ConfigureNBPMCs](configurenbpmcs.md)  
[GetPMCValue](getpmcvalue.md)  
[PIX (NDA topic)](../../../../tools-console/xbox-tools-and-apis/pix/pix.md)  
[PIX3 on Xbox](../pix3_members.md)  