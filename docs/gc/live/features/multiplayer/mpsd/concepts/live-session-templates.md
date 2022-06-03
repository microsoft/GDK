---
title: Multiplayer session templates
description: Describes a multiplayer session template as a blueprint for creating a multiplayer session.
kindex:
- Multiplayer session templates
- session templates
author: joannaleecy
ms.author: migreen
ms.topic: conceptual
ms.assetid: 178c9863-0fce-4e6a-9147-a928110b53a2
ms.localizationpriority: medium
ms.date: 04/04/2017
edited: 00/00/0000
security: public
---

<a id="top"></a>
# Multiplayer session templates

This topic describes multiplayer session templates and provides examples of templates that you can copy and modify for your multiplayer sessions.

A multiplayer session template is a blueprint for creating a multiplayer session.
All sessions must be created based on a predefined template.

A template defines constants that are the same for any session that's created from the template.
When you create a session from a template, you can add and modify additional data to the session. However, you can't modify the constants that are defined in the template.

For more information, see the Session overview section in [Multiplayer session advanced topics](live-mpsd-details.md#session-overview).

You can get the list of session templates that apply to a service configuration identifier (SCID) and the contents of specific session templates from Multiplayer Session Directory (MPSD).

## About session templates

A session template to create or modify a session uses the same format as an HTTP `PUT` request.
The difference is that the template defines only constants. Members, servers, and properties aren't defined.

Any session constant can be defined, including a custom section and the full range of system constants.

### Session template versions

The session templates defined in this topic are constructed by using template contract version 107.
When using them to create a new template, ensure that the contract version is specified as 107.

If you use Xbox Services API (XSAPI) and watch the resulting requests in the debugger, you might notice that the requests use template contract version 105.
MPSD effectively "upgrades" these requests to version 107 at runtime.
> [!NOTE]
> You can use a contract version in the request that differs from the one in the session template.

If necessary, you can change a session template from version 104 or 105 to version 107.


 [Return to the top of this topic.](#top)

## Session template default values

Each session created from a session template starts as a copy of the template.
Values that aren't specified in the template can be specified when the session is created.
Default values are provided in some cases when no other value is set.

The default set of time-outs for contract version 107 is shown in the following example.

```json
    {
      "constants": {
        "system": {
          "reservedRemovalTimeout": 30000,
          "inactiveRemovalTimeout": 0,
          "readyRemovalTimeout": 180000,
          "sessionEmptyTimeout": 0
        }
      }
    }
```

You can force a value to remain unset by specifying `null`.
This overrides any default setting and prevents the value from being set at session creation.

For example, to remove `sessionEmptyTimeout`, so even empty sessions continue indefinitely, add the following to the session template.

```json
    {
      "constants": {
        "system": {
          "sessionEmptyTimeout": null
        }
      }
    }
```
> [!IMPORTANT]
> Constants that are set through a template can't be changed by writes to MPSD. To change the values, you must create and submit a new template with the required changes.

 [Return to the top of this topic.](#top)


## Example session templates

This section provides examples of session templates for various purposes and networking topologies.
You can make any required changes to an appropriate template and paste it into your service configuration.

### Standard lobby session

Use this template to create a lobby session for your game.

* Change the `maxMembersCount` value to the maximum number of players that you want to support in your lobby session.
* If your title doesn't support players from different platforms (such as an Xbox console and a Windows PC) playing together, you can remove the `crossPlay` element.
* You can change the other values, too. The following values are good ones to start with if you're not sure what you need.

```json
{
   "constants": {
        "system": {
            "version": 1,
            "maxMembersCount": 8,
            "visibility": "open",
            "capabilities": {
                "connectivity": true,
                "connectionRequiredForActiveMembers": true,
                "crossPlay": true,
                "userAuthorizationStyle": true
            },
        },
        "custom": {}
    }
}
```

### Standard game session without matchmaking

Use this template to create a game session for your game if your game doesn't include anonymous matchmaking and doesn't require more than 100 members.

This template adds only two new values to the ones that are specified in the standard lobby session template.
* `constants.system.inviteProtocol : "game"`
* `constants.system.capabilities.gameplay : true`

```json
{
   "constants": {
        "system": {
            "version": 1,
            "maxMembersCount": 8,
            "visibility": "open",
            "inviteProtocol": "game",
            "capabilities": {
                "connectivity": true,
                "connectionRequiredForActiveMembers": true,
                "gameplay" : true,
                "crossPlay": true,
                "userAuthorizationStyle": true
            }
        },
        "custom": {}
    }
}
```

### Add matchmaking to a game session template, where quality of service (QoS) checks are handled by the Multiplayer service

To enable matchmaking in your game, specify values for `memberInitialization` in your game session template.

When you create your SmartMatch hopper, use the following template as the target session template for your hopper.

```json
{
   "constants": {
        "system": {
            "memberInitialization": {
               "joinTimeout": 20000,
               "measurementTimeout": 15000,
               "membersNeededToStart": 2
            }
        }
    }
}
```

### Add matchmaking to a game session, where QoS checks are handled by a title-managed datacenter

```json
{
   "constants": {
        "system": {
            "peerToHostRequirements": {  
                "latencyMaximum": 250,
                "bandwidthDownMinimum": 256,
                "bandwidthUpMinimum": 256,
                "hostSelectionMetric": "latency"
            },
            "memberInitialization": {
               "joinTimeout": 15000,
               "measurementTimeout": 15000,
               "membersNeededToStart": 2
            }
        },
        "custom": {}
    }
}
```

### Basic session template for client/server game session

Use the following template for a title that has clients connect to a third-party&ndash;hosted server instead of peer-to-peer communication.

```json
    {
      "constants": {
        "system": {
          "version": 1,
          "maxMembersCount": 12,
          "visibility": "open",
          "inviteProtocol": "game",
          "capabilities": {
            "connectionRequiredForActiveMembers": true,
            "gameplay": true,
          },
        },
        "custom": {}
      }
    }
```

### Lobby or SmartMatch ticket session template for peer-based networking

Use the following template to create a lobby session or a SmartMatch ticket session to send a group of players into matchmaking.

This template is for use by clients that are using a peer-to-peer or peer-to-host network topology. It doesn't configure a game session.

```json
    {
      "constants": {
        "system": {
          "version": 1,
          "maxMembersCount": 10,
          "visibility": "open",
          "capabilities": {
            "connectionRequiredForActiveMembers": true,
          },
          "memberInitialization": {
            "membersNeededToStart": 1
          },
        },
        "custom": {}
      }
    }
```

 [Return to the top of this topic.](#top)

### QoS templates

If your game uses matchmaking and evaluates QoS, you must add some constants to the session template to inform MPSD to coordinate with the client to manage users who are joining the session.
This coordination validates the quality of the connection state before informing users that the game is ready to start.

In the case of client/server games, the coordination validates connection quality before a group of players enters matchmaking.

#### Peer-to-host game session template with QoS

Use the following template to create a peer-to-host game session with QoS.

```json
    {
      "constants": {
        "system": {
          "version": 1,
          "maxMembersCount": 12,
          "visibility": "open",
          "inviteProtocol": "game",
          "capabilities": {
            "connectivity": true,
            "connectionRequiredForActiveMembers": true,
            "gameplay" : true
          },
          "memberInitialization": {
            "membersNeededToStart": 2
          },
          "peerToHostRequirements": {
            "latencyMaximum": 350,
            "bandwidthDownMinimum": 1000,
            "bandwidthUpMinimum": 1000,
            "hostSelectionMetric": "latency"
          }
        },
        "custom": { }
      }
    }
```

#### Peer-to-peer game session template with QoS

Use the following template to create a peer-to-peer game session with QoS.

```json
    {
    "constants": {
      "system": {
        "version": 1,
        "maxMembersCount": 12,
        "visibility": "open",
        "inviteProtocol": "game",
        "capabilities": {
          "connectivity": true,
          "connectionRequiredForActiveMembers": true,
          "gameplay" : true
        },
        "memberInitialization": {
          "membersNeededToStart": 2
        },
        "peerToPeerRequirements": {
          "latencyMaximum": 250,
          "bandwidthMinimum": 10000
        }
      },
      "custom": { }
     }
    }
```

#### Client/server lobby or matchmaking session template with QoS

Use the following template to create a lobby session or matchmaking session by using QoS.
This template shouldn't be used to configure a game session.

```json
    {
      "constants": {
        "system": {
          "version": 1,
          "maxMembersCount": 12,
          "visibility": "open",
          "memberInitialization": {
            "membersNeededToStart": 1
          }
        },
        "custom": {}
      }
    }
```

#### Session template for crossplay between Xbox One and Windows 10

Use the following template to enable crossplay multiplayer between Xbox One (or later) and Windows 10.

* The optional `crossPlay` capability supports interactions such as invites and join-in-progress between platforms.

* The `userAuthorizationStyle` capability enables access to Windows 10.

```json
    {
      "constants": {
        "system": {
          "capabilities": {
            "crossPlay": true,
            "userAuthorizationStyle": true
          },
        },
        "custom": {}
      }
    }
```