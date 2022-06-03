---
title: Wheel
description: A set of touch controls arranged in an inner and outer circular area.
author: arikcohen
kindex: Touch Adaptation Kit layout, wheels
edited: 00/00/0000
ms.author: arikc
ms.prod: gaming
ms.date: 12/20/2020
ms.topic: reference
security: public
---

# Wheel

A set of touch controls arranged in an inner and outer circular area.

## Properties

[`inner`](game-streaming-touch-inner-wheel.md) - _object_, _optional_. Up to four controls that are arranged in the [inner](game-streaming-touch-inner-wheel.md) portion of the wheel.

`outer` - _array_, _optional_. An array of up to 8 slots that can be filled by controls and/or [control cluster](game-streaming-touch-control-cluster-outer.md) that are placed around the inner area of the circular area represented by the `wheel`.

- The first slot in the `outer` area starts at the top of the wheel (around 1 o'clock) and continues clockwise.
- A slot can be skipped with `null`.
- A [control cluster](game-streaming-touch-control-cluster-outer.md) will always take up 2 of the 8 available slots -- the slot it is specified in and the subsequent one.

## Remarks

> [!NOTE]
> The size and rotation of the `wheel` control can be adjusted by the player. When customizing to their preferences, the player can change both the size and rotation of the wheels.

![Customizing wheels by the player](../../../../../../resources/gamecore/secure/images/en-us/game-streaming/touch-control-images/game-streaming-touch-control-images-wheel-ergo.jpg)

**Tips**

- The [`inner`](game-streaming-touch-inner-wheel.md) area should be used to position the control(s) that should be most accessible to the player for that hand.
- The `inner` slot on the left should be utilized for the primary player movement control.
- `outer` slots that are require the player to move their hand to reach should be used for infrequently accessed commands.

## Samples

##### Example 1: A sample wheel with a joystick in the center and a custom button in each outer slot

![Wheel with joystick in inner slot and custom buttons in each outer slot](../../../../../../resources/gamecore/secure/images/en-us/game-streaming/touch-control-images/game-streaming-touch-control-images-wheel-example.png)

```JSON
"left": {
    "inner": [
        {
            "type": "joystick",
            "axis": {
                "input": "axisXY",
                "output": "leftJoystick",
                "deadzone": {
                    "threshold": 0.05,
                    "radial": true
                }
            }
        }
    ],
    "outer" : [
        {
            "type": "button",
            "action": "gamepadX",
            "styles": {
                "default" : {
                    "faceImage" : {
                        "type": "asset",
                        "value": "one"
                    },
                    "background" : {
                        "type": "color",
                        "value": "#80808080"
                    }
                }
            }
        },
        {
            "type": "button",
            "action": "gamepadX",
            "styles": {
                "default" : {
                    "faceImage" : {
                        "type": "asset",
                        "value": "two"
                    },
                    "background" : {
                        "type": "color",
                        "value": "#80808080"
                    }
                }
            }
        },
        {
            "type": "button",
            "action": "gamepadX",
            "styles": {
                "default" : {
                    "faceImage" : {
                        "type": "asset",
                        "value": "three"
                    },
                    "background" : {
                        "type": "color",
                        "value": "#80808080"
                    }
                }
            }
        },
        {
            "type": "button",
            "action": "gamepadX",
            "styles": {
                "default" : {
                    "faceImage" : {
                        "type": "asset",
                        "value": "four"
                    },
                    "background" : {
                        "type": "color",
                        "value": "#80808080"
                    }
                }
            }
        },
        {
            "type": "button",
            "action": "gamepadX",
            "styles": {
                "default" : {
                    "faceImage" : {
                        "type": "asset",
                        "value": "five"
                    },
                    "background" : {
                        "type": "color",
                        "value": "#80808080"
                    }
                }
            }
        },
        {
            "type": "button",
            "action": "gamepadX",
            "styles": {
                "default" : {
                    "faceImage" : {
                        "type": "asset",
                        "value": "six"
                    },
                    "background" : {
                        "type": "color",
                        "value": "#80808080"
                    }
                }
            }
        },
        {
            "type": "button",
            "action": "gamepadX",
            "styles": {
                "default" : {
                    "faceImage" : {
                        "type": "asset",
                        "value": "seven"
                    },
                    "background" : {
                        "type": "color",
                        "value": "#80808080"
                    }
                }
            }
        },
        {
            "type": "button",
            "action": "gamepadX",
            "styles": {
                "default" : {
                    "faceImage" : {
                        "type": "asset",
                        "value": "eight"
                    },
                    "background" : {
                        "type": "color",
                        "value": "#80808080"
                    }
                }
            }
        }
    ]
}
```

##### Example 2: A sample left wheel with a directional pad and map button

![Wheel with joystick in inner slot and custom buttons in each outer slot](../../../../../../resources/gamecore/secure/images/en-us/game-streaming/touch-control-images/game-streaming-touch-control-images-wheel-left-dpad.png)

```JSON
 "left": {
    "inner": [
        {
            "type": "directionalPad",
            "scale": 1.5
        }
    ],
    "outer" : [
        {
            "type": "button",
            "action": "leftBumper",
            "styles": {
                "default" : {
                    "faceImage" : {
                        "type": "icon",
                        "value": "map"
                    }
                }
            }
        },
        null,
        null,
        null,
        null,
        null,
        null
    ]
}
```

##### Example 3: A sample right wheel with three buttons

The buttons are aligned on the most easily reachable for the right hand. The buttons in the `outer` area are arranged in a cluster to have a larger hit area.

![Wheel with joystick in inner slot and custom buttons in each outer slot](../../../../../../resources/gamecore/secure/images/en-us/game-streaming/touch-control-images/game-streaming-touch-control-images-wheel-right.png)

```JSON
"right": {
    "inner": [
    {
        "type": "button",
        "action": "gamepadX",
        "styles": {
        "default": {
            "faceImage": {
            "type": "icon",
            "value": "sword"
            }
        }
        }
    }
    ],
    "outer": [
    [
        {
            "type": "button",
            "action": "gamepadB",
            "styles": {
                "default": {
                "faceImage": {
                    "type": "icon",
                    "value": "interact"
                }
                }
            }
        },
        null
    ],
    null,
    [
        {
            "type": "button",
            "action": "gamepadA",
            "styles": {
                "default": {
                "faceImage": {
                    "type": "icon",
                    "value": "jump"
                }
                }
            }
        },
        null
    ]
    ]
}

```

## See Also

[Touch Adaptation Kit Reference](../../../../system/overviews/game-streaming/game-streaming-touch-touch-adaptation-kit-overview.md)  
[Layout](game-streaming-touch-layout.md)
