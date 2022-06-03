---
author: joannaleecy
title: title_managed_statistics_c (contents)
description: Title Managed Statistics C API
kindex: title_managed_statistics_c
ms.author: migreen
ms.topic: navigation
security: public
edited: 00/00/0000
applies-to: pc-gdk
---

# title_managed_statistics_c  



  
## Enumerations  
  
| Enumeration | Description |  
| --- | --- |  
| [XblTitleManagedStatType](enums/xbltitlemanagedstattype.md) | Enumeration values that indicate the Title Managed Stat type. |  
  
## Functions  
  
| Function | Description |  
| --- | --- |  
| [XblTitleManagedStatsDeleteStatsAsync](functions/xbltitlemanagedstatsdeletestatsasync.md) | Delete stats for the calling user (any stats not referenced will remain unchanged). |  
| [XblTitleManagedStatsUpdateStatsAsync](functions/xbltitlemanagedstatsupdatestatsasync.md) | Partially update the calling user's stats. Stats will only be overwritten if they already exist (any stats not referenced will remain unchanged). |  
| [XblTitleManagedStatsWriteAsync](functions/xbltitlemanagedstatswriteasync.md) | Completely update the calling user's stats. This call wipes out all existing stats (any stats not referenced in the provided array will be removed). |  
  
## Structures  
  
| Structure | Description |  
| --- | --- |  
| [XblTitleManagedStatistic](structs/xbltitlemanagedstatistic.md) | Contains information about a Title Managed statistic. |  
