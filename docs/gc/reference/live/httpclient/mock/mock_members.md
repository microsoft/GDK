---
author: joannaleecy
title: mock (contents)
description: Mock API
kindex: mock
ms.author: migreen
ms.topic: navigation
security: public
edited: 00/00/0000
applies-to: pc-gdk
---

# mock  



  
## Functions  
  
| Function | Description |  
| --- | --- |  
| [HCMockAddMock](functions/hcmockaddmock.md) | Configures libHttpClient to return mock response instead of making a network call when HCHttpCallPerformAsync() is called. |  
| [HCMockCallCreate](functions/hcmockcallcreate.md) | Creates a mock HTTP call handle. |  
| [HCMockClearMocks](functions/hcmockclearmocks.md) | Removes and cleans up all mock calls added by HCMockAddMock. |  
| [HCMockRemoveMock](functions/hcmockremovemock.md) | Removes and cleans up the mock. |  
| [HCMockResponseSetHeader](functions/hcmockresponsesetheader.md) | Set a response header to return for the mock. |  
| [HCMockResponseSetNetworkErrorCode](functions/hcmockresponsesetnetworkerrorcode.md) | Set the network error code to return for the mock. |  
| [HCMockResponseSetResponseBodyBytes](functions/hcmockresponsesetresponsebodybytes.md) | Set the response body string to return for the mock. |  
| [HCMockResponseSetStatusCode](functions/hcmockresponsesetstatuscode.md) | Set the HTTP status code to return for the mock. |  
| [HCMockSetMockMatchedCallback](functions/hcmocksetmockmatchedcallback.md) | Add an intermediate callback that will be called when the specified mock is matched. This gives the client another opportunity to specify the mock response. |  
