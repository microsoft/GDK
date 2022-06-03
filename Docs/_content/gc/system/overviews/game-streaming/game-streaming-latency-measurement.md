---
title: Game streaming latency measurement
description: Describes latency measurement for titles played by using Xbox Game Streaming.
author: M-Stahl
ms.author: morganb
ms.topic: conceptual
edited: 01/08/2021
kindex: Game streaming latency measurement
security: public
---

# Game streaming latency measurement

Use this topic to measure latency for your titles. Game streaming latency occurs when there's network latency and additional processing that's required to stream the title. There are several stages to game streaming as shown in figure 1. 

**Figure 1. Shows the different stages of Xbox Game Streaming.**

![Screenshot of the different stages of game streaming](../../../../../resources/gamecore/secure/images/en-us/game-streaming-stages.png)

## Game engine

Games typically have several stages that are between receiving a user's input and rendering the resulting frame as shown in figure 1. Depending on the game, this can vary from taking single-digit milliseconds to hundreds. 

While game engine latency isn't different between a streaming server and an Xbox console, a user might experience the impact more when it's combined with the rest of the stream's latency. Optimizing game engine latency and frame rate reduces the latency that users experience in your game.

## Server

In figure 1, the remainder of the Xbox Streaming Server time is spent preparing the frame to send to the client. This is largely during the Capture stage, which retrieves the frame from the GPU, and the Encode stage, which scales and compresses the frame to optimize for network bandwidth. 

## Network

Xbox servers send video to streaming clients and receive input back from the internet. That network connection has variable latency based on the following factors.
 * The physical distance between the client device and the server. 
   * Microsoft deploys servers to Azure datacenters around the world to minimize distance as much as possible. Users streaming from their Xbox console might be further away.
 * The speed of the user's internet connection.
 * The user's type of internet connection and hardware. 
   * For example, 2.4 gigahertz (GHz) wireless network connections often have more latency than 5 GHz connections. Some internet service providers (ISP) also have buffering strategies that increase latency.

Network latency changes over time, even from packet-to-packet. Variable latency can be caused by ISP strategies, paths through internet hardware, and physical changes. 

For example, a user that's playing on a cell phone while in a moving vehicle has variable latency with spikes as they switch to different towers. To account for this, `XGameStreamingGetStreamAddedLatency` returns the standard deviation of the latency (also known as "jitter").

For more information about simulating streaming network latency, see [Simulating latency while testing your game](game-streaming-simulate-latency-while-testing.md).

## Client

When the client receives the video frame, it must decode the frame and present it through its own graphics stack. 

The client's graphical hardware determines how long that decoding takes. Additionally, most clients must wait for a local `vSync` timer to present the next frame. On a client with a 60 Hertz (Hz) screen, that could take an average of 8 ms.

As with games that play on an Xbox console that's connected to a TV, streaming clients use a display that has its own latency. 

The display latency can vary from a fast gaming monitor, with just a couple milliseconds of latency, to an inexpensive mobile display or TV without game mode, that takes hundreds of milliseconds. Displays don't always report latency, so the Xbox Game Streaming APIs don't include client display latency.

Controllers and other input methods, such as touch, also have latency. Bluetooth&#174; connections for a controller can add noticeable latency. Like display latency, input latency can't be measured by the client, and so it isn't represented by the Xbox Game Streaming APIs.

## See also 

[Game streaming latency compensation overview](game-streaming-latency-compensation-overview.md)  
[Game streaming latency compensation deep dive](game-streaming-latency-compensation-deep-dive.md)  
[Simulating latency while testing your game](game-streaming-simulate-latency-while-testing.md)  
[XGameStreaming (API contents)](../../../reference/system/xgamestreaming/xgamestreaming_members.md#Latency)  