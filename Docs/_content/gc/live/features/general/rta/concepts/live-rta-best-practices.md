---
title: Best practices for the RTA service
description: Describes best practices when using the Real-Time Activity (RTA) service.
kindex:
- Best Practices for the RTA service
- RTA
ms.topic: article
ms.assetid: 543b78e3-d06b-4969-95db-2cb996a8bbd3
ms.localizationpriority: medium
author: joannaleecy
ms.author: migreen
ms.date: 04/04/2017
edited: 01/29/2021
security: public
---

# Best practices for the RTA service

Use this topic to make the most out of the Real-Time Activity (RTA) service for your title.

## The basics

RTA uses [WebSocket](/iis/configuration/system.webserver/websocket) sessions to create a persistent connection with the client.
That's how the service delivers statistics to you.
When a client sends an authenticated connection request, RTA uses the provided token to verify that the connection can be made, and then establishes it.

Once the connection has been established, your app can make requests to subscribe to specific statistics. 
On a successful subscription, RTA returns the current value and some additional metadata, such as the type of statistic, as part of the response payload.
RTA forwards any statistic updates that occur while the client is subscribed.

When your title doesn't require real-time updates on a statistic, it stops tracking that statistic.


## Disconnecting

When the authentication token for a user expires, the session is terminated by the service. Your title should act accordingly when this occurs. 
RTA connections close after two hours by design, which forces the client to reconnect.
This is due to the authentication token for the connection caching to save message bandwidth.
Eventually that token expires. 
By closing the connection and forcing the client to reconnect, the client refreshes the authentication token.
[Xbox Live Services API (XSAPI)](/gaming/xbox-live/api-ref/xsapi/live-introduction-to-xbox-live-apis) handles the authentication token refresh for the title by proactively reconnecting to RTA and resubmitting subscriptions after 90 minutes. 
A client can be disconnected due to issues with the user's ISP, or when the process for the title is suspended. 
  
In each of these cases, if the title that has registered for RTA connection state changed events, a disconnection event is raised.  
  > [!NOTE]
> In general, no action from the title is required upon disconnection, but the title might want to update the UI to reflect that the RTA connectivity has been lost.  
  
XSAPI automatically tries to reestablish the WebSocket connection and maintains any existing RTA service subscriptions.  
  > [!NOTE]
> If a client uses RTA for multiplayer sessions, and is disconnected for 30 seconds, the Multiplayer Session Directory (MPSD) detects that the RTA session is closed and kicks the user out of the session. XSAPI automatically reestablishes the RTA connection, but it's the responsibility of the title to rewrite its MPSD sessions once the RTA subscription is reestablished.  
  
For more information about MPSD, see [Multiplayer Session Directory overview](../../../multiplayer/mpsd/live-mpsd-overview.md).


## Unsubscribing

We don't recommend tracking statistics for unneeded real-time updates. 
Each tracked statistic corresponds to an RTA subscription, and the service limits the number of subscriptions a user can have per title. 
If you're subscribing to everything, you might hit that limit, and this prevents the ability to subscribe to important statistics.  
  
For example, your title might only need updates for a statistic that's within a certain scene. 
When the user enters that scene, your title should track that statistic. 
When the user leaves that scene, your title should stop tracking that statistic. 
Similarly, if statistics change, notifications aren't needed. 
Removing all statistic change handlers automatically causes XSAPI to tear down the related RTA subscriptions.  
  
For more information about subscription limits, see the Throttles section later in this topic.  
  
## Awareness of latent items in the queue

When unsubscribing from a statistic, it's possible that there's an update for the statistic that's still in the process of reaching your client. 
So, even if your title has just unsubscribed from a statistic, be aware that it may still get an update or two that's related to that statistic. 
  
We recommend ignoring the statistics updates when the subscription identifier isn't recognized.  
  
  
## Ignore messages you don't understand
  
The message protocol can update. To keep your app agnostic of any new messages, we recommend that your title discards unknown message types.  
  
  
## Throttles

RTA enforces a `UserStats` throttle of 1000, and a `Presence` throttle of 2500.  
  
If a client hits the throttling limit, it receives an error as part of a subscribe or unsubscribe call, or it disconnects. 
In either case, more information about the throttling limitation that was hit becomes available to the client along with the error or disconnect message.  
  
When developing your title, keep these concepts in mind. If you're doing something extreme, 
you may have a degraded app experience because the service can throttle your calls.  
  
In the current release of RTA, you can have 1000 subscriptions-to-statistics per instance of an app. 
Additionally, an instance of an app can also subscribe to a user's entire Friends list length for presence updates. 
This number might change in future releases.  
  
## See also  
[Real-Time Activity service overview](../live-real-time-activity-service-overview.md)  
[Registering for player stat change notifications](live-register-for-stat-notifications.md)  
[Getting started with Xbox Live APIs](../../../../get-started/live-gs-xbl-apis.md)