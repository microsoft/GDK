---
author: M-Stahl
title: XPackageWriteStats
description: Contains the output write statistics (writeStats).
kindex: XPackageWriteStats
ms.author: brianpe
ms.topic: reference
edited: 07/08/2020
security: public
applies-to: pc-gdk
---

# XPackageWriteStats
  
Contains the output write statistics (writeStats).  
  
<a id="syntaxSection"></a>
  
## Syntax
  
```cpp
typedef struct XPackageWriteStats {  
    uint64_t interval;  
    uint64_t budget;  
    uint64_t elapsed;  
    uint64_t bytesWritten;  
} XPackageWriteStats  
```
  
<a id="membersSection"></a>
  
### Members
  
*interval*  
Type: uint64_t  
  
Read/Write: The total amount of time, in milliseconds, of the current interval.  
  
*budget*  
Type: uint64_t  
  
Read: The amount of data the system will permit the title to write in the current interval without causing an exceeded event to be logged.  
  
*elapsed*  
Type: uint64_t  
  
Read/Write: The amount of time, in milliseconds, elapsed in the current interval.  
  
*bytesWritten*  
Type: uint64_t  
  
Read/Write: The number of bytes written by the title in the current interval.  
  
<a id="remarksSection"></a>
  
## Remarks
  
The `XpackageWriteStats` structure is used by the [XPackageGetWriteStats](../functions/xpackagegetwritestats.md) function to both specify and receive write statistics (writeStats) for the current interval.  
  > [!NOTE]
> The first interval tracked by the title does not update *elapsed* and will not cause an exceeded event to be logged when surpassing the *budget*. Once the total *budget* of data has been written once, the interval will reset and the *elapsed* value will now start updating. Future intervals in the title will then reset based on interval times and trigger the exceeded event if the *budget* is surpassed.  

For information about the packaging technology used with Xbox One titles, see [Overview of Packaging](../../../../packaging/overviews/packaging.md). For information about the steps to create an XVC package, see [Getting started packaging titles for Xbox consoles](../../../../packaging/overviews/packaging-getting-started-for-console.md).  
  
<a id="requirementsSection"></a>
  
## Requirements
  
**Header:** XPackage.h  
  
**Supported platforms:** Windows, Xbox One family consoles and Xbox Series consoles  
  
<a id="seealsoSection"></a>
  
## See also
  
[Overview of downloadable content (DLC) packages](../../../../packaging/packaging-downloadable-content-dlc.md)  
[XPackage](../xpackage_members.md)  
  