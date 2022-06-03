---
author: joannaleecy
title: social_c (contents)
description: Social C API
kindex: social_c
ms.author: migreen
ms.topic: navigation
security: public
edited: 00/00/0000
applies-to: pc-gdk
---

# social_c  



  
## Enumerations  
  
| Enumeration | Description |  
| --- | --- |  
| [XblReputationFeedbackType](enums/xblreputationfeedbacktype.md) | Defines values used to identify the type of reputation feedback. |  
| [XblSocialNotificationType](enums/xblsocialnotificationtype.md) | Defines values used to identify the type of social notification. |  
| [XblSocialRelationshipFilter](enums/xblsocialrelationshipfilter.md) | Defines the relationship filters available for social groups. |  
  
## Functions  
  
| Function | Description |  
| --- | --- |  
| [XblSocialAddSocialRelationshipChangedHandler](functions/xblsocialaddsocialrelationshipchangedhandler.md) | Registers an event handler for notifications of social relationship changes caused by the registering user. |  
| [XblSocialGetSocialRelationshipsAsync](functions/xblsocialgetsocialrelationshipsasync.md) | Gets a list of people that the caller is socially connected to. |  
| [XblSocialGetSocialRelationshipsResult](functions/xblsocialgetsocialrelationshipsresult.md) | Get the result handle from an XblSocialGetSocialRelationshipsAsync API call. |  
| [XblSocialRelationshipResultCloseHandle](functions/xblsocialrelationshipresultclosehandle.md) | Closes the XblSocialRelationshipResultHandle. |  
| [XblSocialRelationshipResultDuplicateHandle](functions/xblsocialrelationshipresultduplicatehandle.md) | Duplicates the XblSocialRelationshipResultHandle. |  
| [XblSocialRelationshipResultGetNextAsync](functions/xblsocialrelationshipresultgetnextasync.md) | Gets the next page of a list of people that the caller is socially connected to. |  
| [XblSocialRelationshipResultGetNextResult](functions/xblsocialrelationshipresultgetnextresult.md) | Get the result from an XblSocialRelationshipResultGetNextAsync API call. |  
| [XblSocialRelationshipResultGetRelationships](functions/xblsocialrelationshipresultgetrelationships.md) | Get a list of the XblSocialRelationship objects from an XblSocialRelationshipResultHandle. |  
| [XblSocialRelationshipResultGetTotalCount](functions/xblsocialrelationshipresultgettotalcount.md) | Gets the total number of results for an XblSocialRelationshipResultHandle. |  
| [XblSocialRelationshipResultHasNext](functions/xblsocialrelationshipresulthasnext.md) | Checks if there are more pages of social relationships to retrieve from the service. |  
| [XblSocialRemoveSocialRelationshipChangedHandler](functions/xblsocialremovesocialrelationshipchangedhandler.md) | Removes a social relationship change handler. |  
| [XblSocialSubmitBatchReputationFeedbackAsync](functions/xblsocialsubmitbatchreputationfeedbackasync.md) | Submits reputation feedback on the specified user. |  
| [XblSocialSubmitReputationFeedbackAsync](functions/xblsocialsubmitreputationfeedbackasync.md) | Submits reputation feedback on the specified user. |  
| [XblSocialSubscribeToSocialRelationshipChange](functions/xblsocialsubscribetosocialrelationshipchange.md) | Subscribes to the social service for people changed events. DEPRECATED. Calling this API is no longer required and it will be removed in a future release. RTA subscription will be managed automatically by XSAPI as [XblSocialRelationshipChangedHandler](functions/xblsocialaddsocialrelationshipchangedhandler.md) are added and removed. |  
| [XblSocialUnsubscribeFromSocialRelationshipChange](functions/xblsocialunsubscribefromsocialrelationshipchange.md) | Un-subscribes a previously created social relationship change subscription. DEPRECATED. Calling this API is no longer required and it will be removed in a future release. RTA subscription will be managed automatically by XSAPI as [XblSocialRelationshipChangedHandler](functions/xblsocialremovesocialrelationshipchangedhandler.md) are added and removed. |  
  
## Handles  
  
| Handle | Description |  
| --- | --- |  
| [XblSocialRelationshipResultHandle](handles/xblsocialrelationshipresulthandle.md) | A handle to a social relationship result. |  
  
## Structures  
  
| Structure | Description |  
| --- | --- |  
| [XblReputationFeedbackItem](structs/xblreputationfeedbackitem.md) | Represents the parameters for submitting reputation feedback on a user. |  
| [XblSocialRelationship](structs/xblsocialrelationship.md) | Represents the relationship between the user and another Xbox user. |  
| [XblSocialRelationshipChangeEventArgs](structs/xblsocialrelationshipchangeeventargs.md) | Event arguments for a social relationship change. |  
