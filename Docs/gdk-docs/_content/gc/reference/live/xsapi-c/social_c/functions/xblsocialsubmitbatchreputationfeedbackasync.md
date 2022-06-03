---
author: joannaleecy
title: XblSocialSubmitBatchReputationFeedbackAsync
description: Submits reputation feedback on the specified user.
kindex: XblSocialSubmitBatchReputationFeedbackAsync
ms.author: migreen
ms.topic: reference
security: public
edited: 00/00/0000
applies-to: pc-gdk
quality: good
---

# XblSocialSubmitBatchReputationFeedbackAsync  

Submits reputation feedback on the specified user.  

## Syntax  
  
```cpp
HRESULT XblSocialSubmitBatchReputationFeedbackAsync(  
         XblContextHandle xboxLiveContext,  
         const XblReputationFeedbackItem* feedbackItems,  
         size_t feedbackItemsCount,  
         XAsyncBlock* async  
)  
```  
  
### Parameters  
  
*xboxLiveContext* &nbsp;&nbsp;\_In\_  
Type: [XblContextHandle](../../types_c/handles/xblcontexthandle.md)  
  
An xbox live context handle created with XblContextCreateHandle.  
  
*feedbackItems* &nbsp;&nbsp;\_In\_  
Type: [XblReputationFeedbackItem*](../structs/xblreputationfeedbackitem.md)  
  
An array of XblReputationFeedbackItem objects to submit reputation feedback on.  
  
*feedbackItemsCount* &nbsp;&nbsp;\_In\_  
Type: size_t  
  
The count of items in the feedbackItems array.  
  
*async* &nbsp;&nbsp;\_In\_  
Type: XAsyncBlock*  
  
Caller allocated AsyncBlock.  
  
  
### Return value  
Type: HRESULT
  
HRESULT return code for this API operation.
  
## Remarks  
  
Make sure to call [XAsyncGetStatus](../../../../system/xasync/functions/xasyncgetstatus.md) to get the result.
  
## REST Call  
  
V101 POST /users/batchfeedback
  
## Requirements  
  
**Header:** social_c.h
  
**Library:** Microsoft.Xbox.Services.141.GSDK.C.lib
  
## See also  
[social_c](../social_c_members.md)  
  
  