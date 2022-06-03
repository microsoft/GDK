---
author: joannaleecy
title: presence_c (contents)
description: Presence C API
kindex: presence_c
ms.author: migreen
ms.topic: navigation
security: public
edited: 00/00/0000
applies-to: pc-gdk
---

# presence_c  



  
## Enumerations  
  
| Enumeration | Description |  
| --- | --- |  
| [XblPresenceBroadcastProvider](enums/xblpresencebroadcastprovider.md) | Defines values representing the streaming provider. |  
| [XblPresenceDetailLevel](enums/xblpresencedetaillevel.md) | Defines values used to set the level of presence detail return from the service. Choosing proper detail level could help the performance of the API. |  
| [XblPresenceDeviceType](enums/xblpresencedevicetype.md) | Defines values used to indicate the device type associate with an XblSocialManagerPresenceTitleRecord. |  
| [XblPresenceMediaIdType](enums/xblpresencemediaidtype.md) | Defines values used to indicate the media id types for media presence data. |  
| [XblPresenceTitleState](enums/xblpresencetitlestate.md) | Defines values used to indicate the title presence state for a user. |  
| [XblPresenceTitleViewState](enums/xblpresencetitleviewstate.md) | Defines values used to indicate the states of the screen view of presence information. |  
| [XblPresenceUserState](enums/xblpresenceuserstate.md) | Defines values used to indicate the state of the user with regard to the presence service. |  
  
## Functions  
  
| Function | Description |  
| --- | --- |  
| [XblPresenceAddDevicePresenceChangedHandler](functions/xblpresenceadddevicepresencechangedhandler.md) | Registers an event handler for device presence change notifications. Notifications will only be received for the Users configured with [XblPresenceTrackUsers](functions/xblpresencetrackusers.md). |  
| [XblPresenceAddTitlePresenceChangedHandler](functions/xblpresenceaddtitlepresencechangedhandler.md) | Registers an event handler for title presence change notifications. Notifications will only be received for the Users and Titles configured with [XblPresenceTrackUsers](functions/xblpresencetrackusers.md) and [XblPresenceTrackAdditionalTitles](functions/xblpresencetrackadditionaltitles.md) respectively. |  
| [XblPresenceDevicePresenceChangedHandler](functions/xblpresencedevicepresencechangedhandler.md) | Event handler for device presence change notifications. |  
| [XblPresenceGetPresenceAsync](functions/xblpresencegetpresenceasync.md) | Gets presence info for a specific Xbox User Id. |  
| [XblPresenceGetPresenceForMultipleUsersAsync](functions/xblpresencegetpresenceformultipleusersasync.md) | Gets presence info for multiple users. |  
| [XblPresenceGetPresenceForMultipleUsersResult](functions/xblpresencegetpresenceformultipleusersresult.md) | Get result for an XblPresenceGetPresenceForMultipleUsers call. |  
| [XblPresenceGetPresenceForMultipleUsersResultCount](functions/xblpresencegetpresenceformultipleusersresultcount.md) | Get result count for an XblPresenceGetPresenceForMultipleUsersAsync call. |  
| [XblPresenceGetPresenceForSocialGroupAsync](functions/xblpresencegetpresenceforsocialgroupasync.md) | Gets presence info for a specific group of users. |  
| [XblPresenceGetPresenceForSocialGroupResult](functions/xblpresencegetpresenceforsocialgroupresult.md) | Get result for an XblPresenceGetPresenceForSocialGroup call. |  
| [XblPresenceGetPresenceForSocialGroupResultCount](functions/xblpresencegetpresenceforsocialgroupresultcount.md) | Get result count for an XblPresenceGetPresenceForSocialGroupAsync call. |  
| [XblPresenceGetPresenceResult](functions/xblpresencegetpresenceresult.md) | Get result for an XblPresenceGetPresenceAsync call. |  
| [XblPresenceRecordCloseHandle](functions/xblpresencerecordclosehandle.md) | Closes a XblPresenceRecordHandle. |  
| [XblPresenceRecordDuplicateHandle](functions/xblpresencerecordduplicatehandle.md) | Duplicates a XblPresenceRecordHandle. |  
| [XblPresenceRecordGetDeviceRecords](functions/xblpresencerecordgetdevicerecords.md) | Get the device presence records associated with a returned presence record. |  
| [XblPresenceRecordGetUserState](functions/xblpresencerecordgetuserstate.md) | Get the global presence state for a presence record. |  
| [XblPresenceRecordGetXuid](functions/xblpresencerecordgetxuid.md) | Get the Xuid for the user a presence record is associated with. |  
| [XblPresenceRemoveDevicePresenceChangedHandler](functions/xblpresenceremovedevicepresencechangedhandler.md) | Unregisters an event handler for device presence change notifications. |  
| [XblPresenceRemoveTitlePresenceChangedHandler](functions/xblpresenceremovetitlepresencechangedhandler.md) | Unregisters an event handler for title presence change notifications. |  
| [XblPresenceSetPresenceAsync](functions/xblpresencesetpresenceasync.md) | Sets presence info for the current user context. |  
| [XblPresenceStopTrackingAdditionalTitles](functions/xblpresencestoptrackingadditionaltitles.md) | Configures the list of titles for which real-time title presence will be tracked. Title presence updates for the specified titles will no longer be received. |  
| [XblPresenceStopTrackingUsers](functions/xblpresencestoptrackingusers.md) | Configures the list of users for whom real-time device and title presence updates will be tracked. Presence updates for the specified Users will no longer be received. |  
| [XblPresenceSubscribeToDevicePresenceChange](functions/xblpresencesubscribetodevicepresencechange.md) | Subscribes to device presence change notifications. DEPRECATED. This API continues to work, however it will be removed in a future release. Individual RTA subscription will be managed automatically by XSAPI as users are tracked with [XblPresenceTrackUsers](functions/xblpresencetrackusers.md). |  
| [XblPresenceSubscribeToTitlePresenceChange](functions/xblpresencesubscribetotitlepresencechange.md) | Subscribes to title presence change notifications. DEPRECATED. This API will be removed in a future release. Individual RTA subscription will be managed automatically by XSAPI as titles are tracked with [XblPresenceTrackAdditionalTitles](functions/xblpresencetrackadditionaltitles.md). |  
| [XblPresenceTitlePresenceChangedHandler](functions/xblpresencetitlepresencechangedhandler.md) | Event handler for title presence change notifications. |  
| [XblPresenceTrackAdditionalTitles](functions/xblpresencetrackadditionaltitles.md) | Configures the list of titles for which real-time title presence will be tracked. To receive title presence updates for titles other than the current title, they must be added using this API. |  
| [XblPresenceTrackUsers](functions/xblpresencetrackusers.md) | Configures the list of users for whom real-time device and title presence updates will be tracked. |  
| [XblPresenceUnsubscribeFromDevicePresenceChange](functions/xblpresenceunsubscribefromdevicepresencechange.md) | Unsubscribes a previously created device presence change subscription. DEPRECATED. This API continues to work, however it will be removed in a future release. Individual RTA subscription will be managed automatically by XSAPI as users are untracked with [XblPresenceStopTrackingUsers](functions/xblpresencestoptrackingusers.md). |  
| [XblPresenceUnsubscribeFromTitlePresenceChange](functions/xblpresenceunsubscribefromtitlepresencechange.md) | Unsubscribes a previously created title presence change subscription. DEPRECATED. This API will be removed in a future release. Individual RTA subscription will be managed automatically by XSAPI as titles are untracked with [XblPresenceStopTrackingAdditionalTitles](functions/xblpresencestoptrackingadditionaltitles.md). |  
  
## Handles  
  
| Handle | Description |  
| --- | --- |  
| [XblPresenceRecordHandle](handles/xblpresencerecordhandle.md) | The handle to an xbl presence record. |  
  
## Structures  
  
| Structure | Description |  
| --- | --- |  
| [XblPresenceBroadcastRecord](structs/xblpresencebroadcastrecord.md) | The broadcast information of what the user is broadcasting. |  
| [XblPresenceDeviceRecord](structs/xblpresencedevicerecord.md) | Defines values representing the xbl presence device record. |  
| [XblPresenceQueryFilters](structs/xblpresencequeryfilters.md) | Struct passed to presence APIs to filter the presence records returned. |  
| [XblPresenceRichPresenceIds](structs/xblpresencerichpresenceids.md) | Ids needed to set Rich Presence. |  
| [XblPresenceTitleRecord](structs/xblpresencetitlerecord.md) | Defines values representing the xbl presence title record. |  
