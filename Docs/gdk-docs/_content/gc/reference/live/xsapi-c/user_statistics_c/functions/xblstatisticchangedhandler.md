---
author: joannaleecy
title: XblStatisticChangedHandler
description: Event handler for statistic change notifications.
kindex: XblStatisticChangedHandler
ms.author: migreen
ms.topic: reference
security: public
edited: 00/00/0000
applies-to: pc-gdk
quality: good
---

# XblStatisticChangedHandler  

Event handler for statistic change notifications.  

## Syntax  
  
```cpp
void XblStatisticChangedHandler(  
         XblStatisticChangeEventArgs statisticChangeEventArgs,  
         void* context  
)  
```  
  
### Parameters  
  
*statisticChangeEventArgs* &nbsp;&nbsp;\_In\_  
Type: [XblStatisticChangeEventArgs](../structs/xblstatisticchangeeventargs.md)  
  
Contains information about a change to a subscribed statistic.  
  
*context* &nbsp;&nbsp;\_In\_  
Type: void*  
  
Caller context that will be passed back to the handler.  
  
  
### Return value  
Type: void
  

  
## Argument of
  
[XblUserStatisticsAddStatisticChangedHandler](xbluserstatisticsaddstatisticchangedhandler.md)
  
## Requirements  
  
**Header:** user_statistics_c.h
  
**Library:** Microsoft.Xbox.Services.141.GSDK.C.lib
  
## See also  
[user_statistics_c](../user_statistics_c_members.md)  
  
  