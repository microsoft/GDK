---
author: joannaleecy
title: real_time_activity_c (contents)
description: Real Time Activity C API
kindex: real_time_activity_c
ms.author: migreen
ms.topic: navigation
security: public
edited: 00/00/0000
applies-to: pc-gdk
---

# real_time_activity_c  



  
## Enumerations  
  
| Enumeration | Description |  
| --- | --- |  
| [XblRealTimeActivityConnectionState](enums/xblrealtimeactivityconnectionstate.md) | Enumeration for the possible connection states of the connection to the real-time activity service. |  
| [XblRealTimeActivitySubscriptionState](enums/xblrealtimeactivitysubscriptionstate.md) | Enumeration for the possible states of a statistic subscription request to the real-time activity service. |  
  
## Functions  
  
| Function | Description |  
| --- | --- |  
| [XblRealTimeActivityActivate](functions/xblrealtimeactivityactivate.md) | Forces XSAPI to open a WebSocket connection to the Xbox Live real-time activity service. DEPRECATED. Calling this API is no longer required. The WebSocket connection will be made automatically by XSAPI as necessary. This API will be removed in a future release. |  
| [XblRealTimeActivityAddConnectionStateChangeHandler](functions/xblrealtimeactivityaddconnectionstatechangehandler.md) | Registers a handler function to receive a notification that is sent when the client service loses or gains connectivity to the real time activity service. |  
| [XblRealTimeActivityAddResyncHandler](functions/xblrealtimeactivityaddresynchandler.md) | Registers a handler function to receive a notification that is sent when there is a resync message from the real time activity service. |  
| [XblRealTimeActivityConnectionStateChangeHandler](functions/xblrealtimeactivityconnectionstatechangehandler.md) | Handler function for when the client service loses or gains connectivity to the real time activity service. |  
| [XblRealTimeActivityDeactivate](functions/xblrealtimeactivitydeactivate.md) | Indicates that a client real-time activity session is complete. If there are no remaining real-time service activations, the WebSocket connection will be cleaned up along with remaining subscriptions. DEPRECATED. Calling this API is no longer required. The WebSocket connection will be cleaned up automatically by XSAPI when it is no longer needed. This API will be removed in a future release. |  
| [XblRealTimeActivityRemoveConnectionStateChangeHandler](functions/xblrealtimeactivityremoveconnectionstatechangehandler.md) | Unregisters an event handler for real time activity connectivity state changes. |  
| [XblRealTimeActivityRemoveResyncHandler](functions/xblrealtimeactivityremoveresynchandler.md) | Unregisters an event handler for real time activity resync notifications. |  
| [XblRealTimeActivityRemoveSubscriptionErrorHandler](functions/xblrealtimeactivityremovesubscriptionerrorhandler.md) | Unregisters an event handler for real time activity error notifications. DEPRECATED. RTA service errors will now be handled by XSAPI internally and callback will no longer be invoked. |  
| [XblRealTimeActivityResyncHandler](functions/xblrealtimeactivityresynchandler.md) | Handler function for when there is a resync message from the real time activity service. |  
| [XblRealTimeActivitySubscriptionErrorHandler](functions/xblrealtimeactivitysubscriptionerrorhandler.md) | Handler function for when there is an error in the real time activity service. |  
| [XblRealTimeActivitySubscriptionGetId](functions/xblrealtimeactivitysubscriptiongetid.md) | Get the unique ID for the subscription. DEPRECATED. The state of RTA subscriptions is no longer exposed publicly. This API will return a unique client side ID, but it is in no way related to the ID assigned by the RTA service. |  
| [XblRealTimeActivitySubscriptionGetState](functions/xblrealtimeactivitysubscriptiongetstate.md) | Get the state of the subscription. DEPRECATED. The state of RTA subscriptions is no longer exposed publicly. XblRealTimeActivitySubscriptionState::Unknown will always be returned. |  
  
## Handles  
  
| Handle | Description |  
| --- | --- |  
| [XblRealTimeActivitySubscriptionHandle](handles/xblrealtimeactivitysubscriptionhandle.md) | Subscription handle. |  
