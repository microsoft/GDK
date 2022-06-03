---
author: shawnfa
title: Building a native touch interface for your game with IGameInput
description: Using the IGameInput API to capture native touch events for Xbox Game Streaming
kindex: Game Streaming Native Touch
ms.author: shawnfa
ms.prod: xbox
ms.technology: gdk
ms.topic: conceptual
edited: 00/00/0000
security: public
---

# Building a native touch interface for your game with IGameInput

When players stream your game to their mobile devices, one of the best ways that you can increase their enjoyment of the game is to enable them to interact with your game with touch controls.  Xbox game streaming supports the ability to overlay touch controls on your game using the [Touch Adaptation Kit](game-streaming-touch-touch-adaptation-kit-overview.md), and that can be a great choice for many screens in your game where having a virtual gamepad is a natural way to play the game. However, for portions of your game like menus, maps, inventory screens and others, it may be more natural to interact with the game directly with touch inputs.

For example, it’s very natural for a player to want to tap on menu options to interact with them, or to want to use mobile phone gestures to zoom in on and scroll around a map.  The Microsoft Game Development Kit (GDK) provides APIs that enable you to build this native touch interface into your game, enabling it to feel like a truly mobile experience.

The Touch Adaptation Kit and native touch are not mutually exclusive – you can use both in your game, using each form of touch input where it makes the most sense for your title. For example, having native touch menus while using the Touch Adaptation Kit for the main gameplay loop might be reasonable way to structure your title’s touch input strategy.
> [!NOTE]
> Please notify your account manager if you are building a game with native touch.  The Xbox Game Streaming back end services will need to be configured to enable your game to receive touch events when your game is deployed to retail environments.

Native touch is made available to your game via the [IGameInputReading::GetTouchState](../../../reference/input/gameinput/interfaces/igameinputreading/methods/igameinputreading_gettouchstate.md) API. This API will provide you with the current set of touch points representing the current set of fingers the player is touching the screen with.

In order to convert these touch points to press, move, and release events it can be useful to track their state across each frame.

* Any touch point that was not present in the prior frame but is present in the current frame is a new touch press
* Any touch point present in the previous frame and still present in the current frame is either a move or a no-op if the coordinates of the touch has not changed.
* Touch points that were present in the previous frame but are no longer present is a touch release.

A very basic input loop to build these press, move and release events might look like the following:

~~~c++
struct TouchPoint
{
    // GameInputTouchState.touchId corresponding to this point
    uint64_t Id = 0;    

    // X pixel being touched
    uint32_t X = 0;

    // Y pixel being touched
    uint32_t Y = 0;

    // Is this entry in the array of touch points currently being used to track a touch
    bool IsInUse = false;

    // Is this TouchPoint tracking a finger which is currently touching the screen
    bool IsTouchActive = false;
};

// Touch points currently being tracked
std::array<TouchPoint, 10> g_touchPoints = {};

extern IGameInput* g_gameInput;
extern uint32_t g_frameWidth;
extern uint32_t g_frameHeight;

void TouchPointPressed(const TouchPoint& touchPoint);
void TouchPointMoved(const TouchPoint& touchPoint);
void TouchPointReleased(const TouchPoint& touchPoint);


void ProcessTouchInput()
{
    // Reset the active touch state from the previous frame
    for (TouchPoint& touchPoint : g_touchPoints)
    {
        touchPoint.IsTouchActive = false;
    }

    // Process any new touch points for this frame
    Microsoft::WRL::ComPtr<IGameInputReading> reading = nullptr;
    if (SUCCEEDED(g_gameInput->GetCurrentReading(GameInputKindTouch, nullptr, &reading)))
    {
        uint32_t touchCount = reading->GetTouchCount();
        if (touchCount > 0)
        {
            std::vector<GameInputTouchState> touchStates(touchCount);
            touchCount = reading->GetTouchState(touchCount, touchStates.data());

            for (const GameInputTouchState& touchState : touchStates)
            {
                const uint32_t x = static_cast<uint32_t>(touchState.positionX * g_frameWidth);
                const uint32_t y = static_cast<uint32_t>(touchState.positionY * g_frameHeight);

                // Check to see if we are already tracking this touch point
                auto existingPoint = std::find_if(std::begin(g_touchPoints), std::end(g_touchPoints), [id = touchState.touchId](const TouchPoint& point)
                {
                    return point.IsInUse && point.Id == id;
                });

                if (existingPoint != g_touchPoints.end())
                {
                    // We were already tracking the point - it is still alive this frame, but it may have
                    // also moved position.
                    existingPoint->IsTouchActive = true;
                    if (existingPoint->X != x || existingPoint->Y != y)
                    {
                        existingPoint->X = x;
                        existingPoint->Y = y;
                        TouchPointMoved(*existingPoint);
                    }
                }
                else
                {
                    // This is a new touch point. Start tracking it and treat it as a press
                    auto insertPoint = std::find_if(std::begin(g_touchPoints), std::end(g_touchPoints), [](const TouchPoint& point)
                    {
                        return !point.IsInUse;
                    });

                    if (insertPoint != std::end(g_touchPoints))
                    {
                        insertPoint->Id = touchState.touchId;
                        insertPoint->X = x;
                        insertPoint->Y = y;
                        insertPoint->IsInUse = true;
                        insertPoint->IsTouchActive = true;

                        TouchPointPressed(*insertPoint);
                    }
                }
            }
        }

        // Look for any points which were pressed last frame but are no longer pressed this frame
        // and treat those as touch releases
        for (TouchPoint& touchPoint : g_touchPoints)
        {
            if (touchPoint.IsInUse && !touchPoint.IsTouchActive)
            {
                TouchPointReleased(touchPoint);
                touchPoint = TouchPoint{};
            }
        }
    }
}
~~~
