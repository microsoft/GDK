---
author: M-Stahl
title: XStoreRateAndReviewResult
description: The results for a call to [XStoreShowRateAndReviewUIAsync](../functions/xstoreshowrateandreviewuiasync.md).
kindex: XStoreRateAndReviewResult
ms.author: shanede
ms.topic: reference
edited: 00/00/0000
quality: good
security: public
applies-to: pc-gdk
---

# XStoreRateAndReviewResult  

The results for a call to [XStoreShowRateAndReviewUIAsync](../functions/xstoreshowrateandreviewuiasync.md).  

## Syntax  
  
```cpp
typedef struct XStoreRateAndReviewResult {  
    bool wasUpdated;  
} XStoreRateAndReviewResult  
```
  
### Members  
  
*wasUpdated*  
Type: bool  
  
Indicates whether the rating and review has changed.  
  
## Remarks  

To obtain an **XStoreRateAndReviewResult** you must first call [XStoreShowRateAndReviewUIAsync](../functions/xstoreshowrateandreviewuiasync.md). The struct is populated in its result function [XStoreShowRateAndReviewUIResult](../functions/xstoreshowrateandreviewuiresult.md). **XStoreRateAndReviewResult** is a return parameter for [XStoreShowRateAndReviewUIResult](../functions/xstoreshowrateandreviewuiresult.md).  
  
## Requirements  
  
**Header:** XStore.h (included in XGameRuntime.h)
  
**Supported platforms:** Windows, Xbox One family consoles and Xbox Series consoles  
  
## See also  
[XStore](../xstore_members.md)  
[XStoreShowRateAndReviewUIAsync](../functions/xstoreshowrateandreviewuiasync.md)  
[XStoreShowRateAndReviewUIResult](../functions/xstoreshowrateandreviewuiresult.md)  
  