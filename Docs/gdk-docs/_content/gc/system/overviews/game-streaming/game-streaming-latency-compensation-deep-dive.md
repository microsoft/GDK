---
title: Game streaming latency compensation deep dive
description: Describes the latency compensation of titles played by using Xbox Game Streaming.
author: M-Stahl
ms.author: morganb
ms.topic: conceptual
edited: 01/08/2021
kindex: Game streaming latency compensation
security: public
---

# Game streaming latency compensation deep dive

Use this topic to determine the latency compensation of your title when played by using Xbox Game Streaming. 

Video games can have time-sensitive input handling for fast actions. Imagine a platformer where the user's character is on a moving conveyor belt that leads to a cliff as shown in figure 1. 

The user must jump at the right time&mdash;too early and they miss the next platform, too late and they fall before jumping. Network latency in game streaming means that by the time the user sees their character in the right place to jump, they might have already fallen off the end from the perspective of Xbox Live. 

When the game eventually receives the button press over the network, it might record a fall, even if the user pressed the button on the right video frame from their perspective.

**Figure 1. Shows an example of a platformer with a character on a conveyor belt.**

![Screenshot of a platformer with a character on a conveyor belt](../../../../../resources/gamecore/secure/images/en-us/game-streaming-platformer-diagram.png)

## Latency compensation

To compensate for latency in examples as shown in figure 1, games have records of its previous states. 

When the user presses the jump button, the game searches for that point in the game to determine if the user pressed the button at the right time from their perspective. 

The key to correct latency compensation is knowing how far into the past to search. The Xbox Game Streaming APIs enable several options for that.

## Average latency

The simplest, but least accurate, approach for some scenarios is to use the average latency. 

The [XGameStreamingGetStreamAddedLatency](../../../reference/system/xgamestreaming/functions/xgamestreaminggetstreamaddedlatency.md) API returns a recent average of the latency that's added by streaming. That average is split into input latency and output latency. 

Input latency is the time it takes for a user input to be received by the server, and output latency is the time it takes for a video frame that's rendered by the game to be received and processed by the client device. 

For time-based actions, a game can use this average as an estimate of when an action occurred. However, network latency can vary, even frame-to-frame, so this approach is imprecise. Additionally, the stream-added latency measurements don't include non-streaming portions of latency, such as the amount of time the game takes to run simulations and render.

## Frame tokens with input

The [XGameStreamingGetAssociatedFrame](../../../reference/system/xgamestreaming/functions/xgamestreaminggetassociatedframe.md) API helps solve this problem by providing precise information about the game state the user saw when they pressed a button (or changed any other input). 

When a frame begins, games using Microsoft Game Development Kit (GDK) call `ID3D12Device::WaitFrameEventX` and receive a `D3D12XBOX_FRAME_PIPELINE_TOKEN`. You can use `D3D12XBOX_FRAME_PIPELINE_TOKEN` as a key to save the current state for later in a data structure of your choice, such as a hash map. When the frame is complete, the game calls `PresentX` with the token.

`PresentX` ensures that the token is automatically sent to the game streaming client, along with the matching video frame. 

Input that's sent to the server is accompanied with the token for the frame that's currently displayed on the client. When the game receives an `IGameInputReading`, you can pass it to the `XGameStreamingGetAssociatedFrame` API to get the token back. You can use that to look up the previous state and handle the input based on that stored state. 
> [!NOTE]
> If an input hasn't changed (because the user isn't touching the controller, or because they're just holding a button), there won't be a new token.

## Frame tokens without input

In some cases, you must know what the user has seen most recently, even if their input didn't change. Returning to the example shown in figure 1, when the character reaches the end of the conveyor belt, they fall. Part of the challenge and fairness of a game is reacting within those time windows. 

Ideally, a streaming user will have exactly as long to react as a non-streaming user. Because of latency, the ending time of the window should be shifted so that inputs that are received at the end of the window are accepted. 

To do that, the game can use latency tokens where a button was not pressed. If an input reading with no action matches the state from the end of the window, the user failed to react, and the game can fairly penalize them.

The [XGameStreamingGetLastFrameDisplayed](../../../reference/system/xgamestreaming/functions/xgamestreaminggetlastframedisplayed.md) API returns the `D3D12XBOX_FRAME_PIPELINE_TOKEN` for the frame that the streaming client displayed most recently. Since it's constantly updating, you can call it any time and see if the user has seen the end of an animation.
> [!NOTE]
> It's possible to use `XGameStreamingGetLastFrameDisplayed` in the same way as `XGameStreamingGetAssociatedFrame`. We recommend that you use `XGameStreamingGetAssociatedFrame` when processing input because it returns the token that was on the screen when that input occurred. If more time has passed `XGameStreamingGetLastFrameDisplayed` might return a token from a more recent frame.

## More scenarios

It's possible to compensate for latency in a variety of scenarios by using the three APIs in the previous section. The following sections provide more examples that are based on common multiuser latency compensation techniques.

### Movement

Moving a character, camera or aiming can fall into two categories.

#### Movement with discrete consequences

When users move into a collision or aim and fire, the game must make a user-observable decision on what the movement resulted in. 

For these cases, the binary decision is typically delayed until the game has received an input that's correlated with the frame where the decision was needed. For something like colliding or falling off a cliff, the game might need to animate something while waiting. 

For instance, a user might clip into an object, or float or jump over a cliff during the time it takes for the game to receive the actual inputs.

#### General movement

General movement is any navigation or aiming, but it can be important for cases like driving where accumulated movement is more important than what happens on a given frame. 

##### Input projection

The game can use the history of inputs to project it forward based on how much time has passed since the user saw the frame where they provided input. For example, if the coordinates of a thumbstick is at 0.5, and it's progressed an average of 0.1 per frame while the latency token is 3 frames old, the game could treat it as though it's at 0.8. 

Of course, this can lead to mispredictions if the user changes speed and direction. To incorporate the user's actual input, the game can keep a buffer of previously predicted states. When the actual input for that state appears, the game can rerun its simulation from that state with the real input and correct the visible state. 

As mentioned above, the game should wait to trigger any consequences until the real inputs are known. Over higher latency connections, this could lead to visible “popping” and the game might want to provide smoothing or other cover for the misprediction. 

With this strategy, the rendered frame takes more time to get to the client. The game might want to project even further by the average output latency to synchronize the user's view with the server's simulation. This is more likely to matter in multiuser games where the speed of the server's simulation can be controlled by an external multiuser server.

##### Game-specific prediction 
    
Rather than projecting an input history, a game might have a better guess of what a user would do. This could range from simple heuristics like a 2d platformer character moving to the right to machine learning based on user history. As with input projection, the game can keep a buffer of predictions and rerun its simulation as real inputs come in.

### Touch tracing

Games using native touch might place a cursor or reticule under the user's finger. With higher latency, a user notices the cursor follows behind a moving finger. As mentioned in the General movement section of this topic, a game might predict the direction and speed of moving touch inputs to keep a cursor generally under the moving finger.

### Multiuser

An advantage of multiuser games that are running on Xbox Game Streaming is that the users' Xbox servers are likely in the same Azure datacenter. If the game's multiuser server is also in that Azure region, the latency between the Xbox consoles and the multiuser server is less than a millisecond. However, the users' client devices are further away. 

Multiuser games typically have strategies for handling game-to-multiuser server latency. Often these involve a timestamp or frame counter from the multiuser server. 

By associating those timestamps and counters with frame tokens, a multiuser game can include the stream in its latency calculations. This helps multiuser games feel right to streaming users as well as level the field between streaming and non-streaming users.

## See also

[Game streaming latency compensation overview](game-streaming-latency-compensation-overview.md)  
[Game streaming latency measurement](game-streaming-latency-measurement.md)  
[Simulating latency while testing your game](game-streaming-simulate-latency-while-testing.md)  
[XGameStreaming (API contents)](../../../reference/system/xgamestreaming/xgamestreaming_members.md#Latency)  