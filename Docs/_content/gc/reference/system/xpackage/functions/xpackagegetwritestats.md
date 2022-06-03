---
author: M-Stahl
title: XPackageGetWriteStats
description: Gets the output write statistics (writeStats).
kindex: XPackageGetWriteStats
ms.author: brianpe
ms.topic: reference
edited: 07/08/2020
security: public
applies-to: pc-gdk
---

# XPackageGetWriteStats
  
Gets the output write statistics (writeStats).  
  
<a id="syntaxSection"></a>
  
## Syntax
  
```cpp
HRESULT XPackageGetWriteStats(  
         XPackageWriteStats* writeStats  
)  
```  
  
<a id="parametersSection"></a>
  
### Parameters
  
*writeStats* &nbsp;&nbsp;\_Out\_  
Type: [XPackageWriteStats*](../structs/xpackagewritestats.md)  
  
Pointer to a `XPackageWriteStats` structure.  
  
<a id="retvalSection"></a>
  
### Return value
  
Type: HRESULT  
  
HRESULT success or error code. The function populates *writeStats* only if it succeeds.  
  
<a id="remarksSection"></a>
  
## Remarks
  
This function calls the system to return the write statistics for the time of the current interval. If it is successful, it populates the `XPackageWriteStats` structure with the output write statistics.  
  
It retrieves the current write statistics for the title, including current interval length, time elapsed in the current interval, total budget for this interval, and amount written. These statistics can be used to ensure the game does not write too much content within an interval, triggering an event that may prevent the game from passing certification.  
  
| **writeStats** | **Description** |  
| --- | --- |  
| **Interval** | This is a 64-bit value indicating the total amount of time (in milliseconds) of the current write interval. |  
| **Budget** | This is a 64-bit value indicating the amount of data the system will permit the title to write in the current interval without causing an exceeded event to be logged. |  
| **Bytes Written** | This is a 64-bit value indicating number of bytes written by the title in the current interval. |  
| **Time Elapsed** | This is a 64-bit value indicating the amount of time (in milliseconds) elapsed in the current interval. |  
  > [!NOTE]
> The first interval tracked by the title does not update *Time Elapsed* and will not cause an exceeded event to be logged when surpassing the *Budget*. Once the total *Budget* of data has been written once, the interval will reset and the *Time Elapsed* value will now start updating. Future intervals in the title will then reset based on interval times and trigger the exceeded event if the *Budget* is surpassed.  

<a id="requirementsSection"></a>
  
## Requirements
  
**Header:** XPackage.h  
  
**Library:** xgameruntime.lib  
  
**Supported platforms:** Windows, Xbox One family consoles and Xbox Series consoles  
  
<a id="seealsoSection"></a>
  
## See also
  
[Getting started packaging titles for Xbox consoles](../../../../packaging/overviews/packaging-getting-started-for-console.md)  
[Overview of Packaging](../../../../packaging/overviews/packaging.md)  
[XPackage](../xpackage_members.md)  
  