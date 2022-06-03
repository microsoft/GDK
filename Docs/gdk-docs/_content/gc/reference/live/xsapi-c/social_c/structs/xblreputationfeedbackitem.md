---
author: joannaleecy
title: XblReputationFeedbackItem
description: Represents the parameters for submitting reputation feedback on a user.
kindex: XblReputationFeedbackItem
ms.author: migreen
ms.topic: reference
security: public
edited: 00/00/0000
quality: good
applies-to: pc-gdk
---

# XblReputationFeedbackItem  

Represents the parameters for submitting reputation feedback on a user.  

## Syntax  
  
```cpp
typedef struct XblReputationFeedbackItem {  
    uint64_t xboxUserId;  
    XblReputationFeedbackType feedbackType;  
    XblMultiplayerSessionReference* sessionReference;  
    const char* reasonMessage;  
    const char* evidenceResourceId;  
} XblReputationFeedbackItem  
```
  
### Members  
  
*xboxUserId*  
Type: uint64_t  
  
The Xbox User ID of the user that reputation feedback is being submitted on.
  
*feedbackType*  
Type: [XblReputationFeedbackType](../enums/xblreputationfeedbacktype.md)  
  
The reputation feedback type being submitted.
  
*sessionReference*  
Type: [XblMultiplayerSessionReference*](../../multiplayer_c/structs/xblmultiplayersessionreference.md)  
  
Multiplayer session reference describing the MPSD session this feedback relates to. (Optional)
  
*reasonMessage*  
Type: const char*  
  
UTF-8 encoded user supplied text added to explain the reason for the feedback.
  
*evidenceResourceId*  
Type: const char*  
  
The UTF-8 encoded id of a resource that can be used as evidence for the feedback. Example: the Id of a video file.
  
## Argument of
  
[XblSocialSubmitBatchReputationFeedbackAsync](../functions/xblsocialsubmitbatchreputationfeedbackasync.md)
  
## Requirements  
  
**Header:** social_c.h
  
## See also  
[social_c](../social_c_members.md)  
  
  