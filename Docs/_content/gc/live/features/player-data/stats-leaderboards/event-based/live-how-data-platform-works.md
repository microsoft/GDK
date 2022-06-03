---
title: Event-based Player Data overview
description: Describes how the game sends events to your Xbox Live service configuration to update user stats, leaderboards, and achievements.
kindex:
- Xbox Live, data platform
- Event-based Player Data overview
author: joannaleecy
ms.author: migreen
ms.topic: conceptual
ms.localizationpriority: medium
edited: 00/00/0000
security: public
---

# Event-based Player Data overview




This topic describes how the game sends events to the Xbox Live service configuration to update user stats, leaderboards, and achievements. This topic also discusses the basic concepts that are required to understand how to best use the event-based Player Data platform.  
> [!NOTE]
> This topic only applies if you're using event-based Stats.

## Basic concepts
  
The Xbox Live event-based Data Platform is a service that runs in the cloud (also called a *remote datacenter*). Your game or app can send data, in the form of *events*, to the service. It then processes the data to create user statistics, leaderboards, and challenges according to rules that you've defined. These rules are known as a *service configuration*. They let the Xbox Live data platform know how to process the event data from your title.  
  
The flow of data starts when your title writes an event. An *event* consists of the name of the event, such as "PlayerScored", and can contain additional data that's relevant to the event. When your game writes an event, the system saves the event locally on the device, even if the device is offline and not connected to the internet. When the device is online and connected, a service running on the device then batches and uploads these events to the Xbox Live Data Platform. This allows a system to keep data in the event that internet connectivity isn't available at the time that the event is written.  
  
When the Xbox Live platform service receives the event, it creates or updates user statistics, leaderboards, and challenges based on the rules that you've defined in the service configuration.  
  
## Service configuration
  
Before your title can use the Xbox Live services, you must create a service configuration for your title. The service configuration lets the Xbox Live service know how your title will use the service. For the data platform, the service configuration defines the events that your title can send, along with any data that's associated with those events. The configuration also defines your title's stats, leaderboards, challenges, and the rules that affect them.  
  
## See also
  
[Event-based vs. title-managed Stats](../live-stats-eb-vs-tm.md#update-frequency)  
  
