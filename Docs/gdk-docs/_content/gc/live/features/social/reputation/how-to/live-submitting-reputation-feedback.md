---
title: Submitting Reputation feedback
description: Example code for submitting Reputation feedback.
kindex:
- Submitting Reputation feedback
- Reputation
author: joannaleecy
ms.author: migreen
ms.topic: conceptual
ms.localizationpriority: medium
edited: 00/00/0000
security: public
---

# Submitting Reputation feedback


## Submitting a single Reputation feedback


**C API**


```cpp
auto asyncBlock = std::make_unique<XAsyncBlock>();
asyncBlock->queue = queue;
asyncBlock->callback = [](XAsyncBlock* asyncBlock)
{
    std::unique_ptr<XAsyncBlock> asyncBlockPtr{ asyncBlock }; // Take over ownership of the XAsyncBlock*
    HRESULT hr = XAsyncGetStatus(asyncBlock, false);
};

uint64_t xuid{ 123 };
HRESULT hr = XblSocialSubmitReputationFeedbackAsync(
    xboxLiveContext,
    xuid,
    XblReputationFeedbackType::PositiveHelpfulPlayer,
    nullptr,
    "Helpful player",
    nullptr,
    asyncBlock.get()
);
if (SUCCEEDED(hr))
{
    // The call succeeded, so release the std::unique_ptr ownership of XAsyncBlock* since the callback will take over ownership.
    // If the call fails, the std::unique_ptr will keep ownership and delete the XAsyncBlock*
    asyncBlock.release();
}
```

**Reference**
* [XAsyncBlock](../../../../../reference/system/xasync/structs/xasyncblock.md)
* [XAsyncGetStatus](../../../../../reference/system/xasync/functions/xasyncgetstatus.md)
* [XblReputationFeedbackType](../../../../../reference/live/xsapi-c/social_c/enums/xblreputationfeedbacktype.md)
* [XblSocialSubmitReputationFeedbackAsync](../../../../../reference/live/xsapi-c/social_c/functions/xblsocialsubmitreputationfeedbackasync.md)


## Submitting multiple Reputation feedback items


**C API**


```cpp
std::vector<XblReputationFeedbackItem> feedbackItems;
feedbackItems.push_back(XblReputationFeedbackItem
    {
        123,
        XblReputationFeedbackType::PositiveHelpfulPlayer,
        nullptr,
        "Helpful player",
        nullptr
    });
// Add any additional feedback items here

auto asyncBlock = std::make_unique<XAsyncBlock>();
asyncBlock->queue = queue;
asyncBlock->callback = [](XAsyncBlock* asyncBlock)
{
    std::unique_ptr<XAsyncBlock> asyncBlockPtr{ asyncBlock }; // Take over ownership of the XAsyncBlock*
    HRESULT hr = XAsyncGetStatus(asyncBlock, false);
};

HRESULT hr = XblSocialSubmitBatchReputationFeedbackAsync(
    xboxLiveContext,
    feedbackItems.data(),
    feedbackItems.size(),
    asyncBlock.get()
);
if (SUCCEEDED(hr))
{
    // The call succeeded, so release the std::unique_ptr ownership of XAsyncBlock* since the callback will take over ownership.
    // If the call fails, the std::unique_ptr will keep ownership and delete the XAsyncBlock*
    asyncBlock.release();
}
```

**Reference**
* [XAsyncBlock](../../../../../reference/system/xasync/structs/xasyncblock.md)
* [XAsyncGetStatus](../../../../../reference/system/xasync/functions/xasyncgetstatus.md)
* [XblReputationFeedbackItem](../../../../../reference/live/xsapi-c/social_c/structs/xblreputationfeedbackitem.md)
* [XblReputationFeedbackType](../../../../../reference/live/xsapi-c/social_c/enums/xblreputationfeedbacktype.md)
* [XblSocialSubmitBatchReputationFeedbackAsync](../../../../../reference/live/xsapi-c/social_c/functions/xblsocialsubmitbatchreputationfeedbackasync.md)