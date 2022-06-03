---
author: joannaleecy
title: XblSocialSubmitReputationFeedbackAsync
description: Submits reputation feedback on the specified user.
kindex: XblSocialSubmitReputationFeedbackAsync
ms.author: migreen
ms.topic: reference
security: public
edited: 00/00/0000
applies-to: pc-gdk
quality: good
---

# XblSocialSubmitReputationFeedbackAsync  

Submits reputation feedback on the specified user.  

## Syntax  
  
```cpp
HRESULT XblSocialSubmitReputationFeedbackAsync(  
         XblContextHandle xboxLiveContext,  
         uint64_t xboxUserId,  
         XblReputationFeedbackType reputationFeedbackType,  
         const XblMultiplayerSessionReference* sessionReference,  
         const char* reasonMessage,  
         const char* evidenceResourceId,  
         XAsyncBlock* async  
)  
```  
  
### Parameters  
  
*xboxLiveContext* &nbsp;&nbsp;\_In\_  
Type: [XblContextHandle](../../types_c/handles/xblcontexthandle.md)  
  
An xbox live context handle created with XblContextCreateHandle.  
  
*xboxUserId* &nbsp;&nbsp;\_In\_  
Type: uint64_t  
  
The Xbox User ID of the user that reputation feedback is being submitted on.  
  
*reputationFeedbackType* &nbsp;&nbsp;\_In\_  
Type: [XblReputationFeedbackType](../enums/xblreputationfeedbacktype.md)  
  
The reputation feedback type being submitted.  
  
*sessionReference* &nbsp;&nbsp;\_In\_opt\_  
Type: [XblMultiplayerSessionReference*](../../multiplayer_c/structs/xblmultiplayersessionreference.md)  
  
Multiplayer session reference describing the MPSD session this feedback relates to. (Optional)  
  
*reasonMessage* &nbsp;&nbsp;\_In\_z\_  
Type: char*  
  
User supplied text in UTF-8 encoded added to explain the reason for the feedback. (Optional)  
  
*evidenceResourceId* &nbsp;&nbsp;\_In\_opt\_z\_  
Type: char*  
  
The UTF-8 encoded id of a resource that can be used as evidence for the feedback. Example: the Id of a video file. (Optional)  
  
*async* &nbsp;&nbsp;\_In\_  
Type: XAsyncBlock*  
  
Caller allocated AsyncBlock.  
  
  
### Return value  
Type: HRESULT
  
HRESULT return code for this API operation.
  
## Remarks  
  
Make sure to call [XAsyncGetStatus](../../../../system/xasync/functions/xasyncgetstatus.md) to get the result.
  
## REST Call  
  
V100 POST /users/xuid({xuid})/feedback
  
## Requirements  
  
**Header:** social_c.h
  
**Library:** Microsoft.Xbox.Services.141.GSDK.C.lib
  
## See also  
[social_c](../social_c_members.md)  
  
  