---
title: Flows for multiplayer game invites
description: Provides updated flow diagrams for inviting another user to a multiplayer game.
kindex:
- Flows for multiplayer game invites
- multiplayer 2015
author: joannaleecy
ms.author: migreen
ms.topic: conceptual
ms.assetid: 1569588e-3bbc-47d3-8b7d-cc9774071adc
ms.localizationpriority: medium
ms.date: 04/04/2017
edited: 03/08/2021
security: public
---

# Flows for multiplayer game invites

This topic breaks down the flow for multiplayer game invites from one user to another on Xbox Live.  

With the Xbox One, the UX for multiplayer game invites has changed. 
This is a change to the UX only and doesn't affect any behavior or functionality from the perspective of your title.
This means that you don't have to make any code changes to accommodate this UX change. 

## Summary of changes

 * The initial invitation toast notification has changed from "join my party" 
 to "&lt;game title&gt; Let's Play". 
 Users can launch the game and jump right into gameplay by selecting a button in the notification.
 * The Party app doesn't snap by default when the user selects the new toast with the 
 deprecation of app snapping across Xbox One family consoles and Xbox Series consoles.
 This change was also made so that the user can jump right into gameplay.
 * A new toast has been added on the sender's side that says "Adding &lt;number&gt; friends to the game". 
 This makes it clear that invites were sent out when a game session was associated with a user's party.

The detailed UX flows are described in the following sections. 
Each table shows an example flow for two users, Felix and Hannah. 
These flows are shown in each column and occur in parallel.

The <b style="background-color: #FFFF00">highlighted text</b> shows the adjustments that have been made from the prior UX flows.  
  
## Inviting users from within a game

<table>
  <tr>
    <th>Step</th>
    <th>Felix's Device</th>
    <th>Hannah's Device</th>
  </tr>

  <tr>
    <td>1.</td>
    <td>
      <p>Felix is in the multiplayer lobby for a game that he's playing.</p>
      <p>Felix selects "Invite a Friend".</p>
      <p>Felix selects Hannah.</p>
      <p>A toast notification appears that indicates that an invite was sent.</p>
    </td>
    <td>
      Hannah is playing a different game.
    </td>
  </tr>

  <tr>
    <td>2.</td>
    <td>
      &nbsp;
    </td>
    <td>
      <p>A toast notification appears that indicates a multiplayer game invitation has arrived from Felix, and <b style="background-color: #FFFF00">it displays the game name and icon</b>.</p>
      <p>In the <b>Notification center</b>, <b style="background-color: #FFFF00">Hannah can select "Launch and accept invite"</b>, "Accept invite", or <b style="background-color: #FFFF00">"Decline invite"</b>.</p>
    </td>
  </tr>

  <tr>
    <td>&nbsp;</td>
    <td>
      &nbsp;
    </td>
    <td>
      <b style="background-color: #FFFF00">Case 1: Hannah selects "Launch and accept invite"</b>
    </td>
  </tr>

  <tr>
    <td>3.</td>
    <td>
      <p>A toast notification appears that indicates that Hannah has joined Felix's party.</p>
      <p>Felix starts the game from the multiplayer lobby.</p>
      <p><b style="background-color: #FFFF00">A toast notification appears that indicates that a game invite was sent to Hannah.</b></p>
    </td>
    <td>
      The game launches and the Party app doesn't snap.
    </td>
  </tr>

  <tr>
    <td>&nbsp;</td>
    <td>
      &nbsp;
    </td>
    <td>
      <b>Case 2: Hannah selects "Accept invite"</b>
    </td>
  </tr>

  <tr>
    <td>3.</td>
    <td>
      &nbsp;
    </td>
    <td>
      Hannah joins the party.
    </td>
  </tr>

  <tr>
    <td>4.</td>
    <td>
      <b style="background-color: #FFFF00">A toast notification appears that indicates that a game invite was sent to Hannah.</b>
    </td>
    <td>
      &nbsp;
    </td>
  </tr>

  <tr>
    <td>5.</td>
    <td>
      &nbsp;
    </td>
    <td>
      <p>A toast notification appears that indicates that a game was found for the party.</p>
      <p>In the <b>Notification center</b>, Hannah can select one of the following options.
        <ul>
          <li><b>Accept game invite</b> to launch the title and join the game session.</li>
          <li><b>Decline game invite</b> to decline the invite and not join the game. Hannah is still in the party and will receive subsequent game invites.</li>
          <li><b style="background-color: #FFFF00">"Leave party" to remove oneself from the party.</b></li>
        </ul>
      </p>
    </td>
  </tr>

</table>


## In a party and switching titles flow

<table>
  <tr>
    <th>Step</th>
    <th>Felix's Device</th>
    <th>Hannah's Device</th>
  </tr>

  <tr>
    <td>1.</td>
    <td>
      <p>Playing a game together.</p>
      <p>Felix switches to a different game and navigates to the multiplayer menu.</p>
      <p>The console's UI asks Felix if he wants to switch his Party to the new game. He can select <b>Yes</b> or <b>No</b>.</p>
    </td>
    <td style="text-align:top">
      Playing a game together.
    </td>
  </tr>

  <tr>
    <td>&nbsp;</td>
    <td>
      <b>Case 1: Felix selects "Yes"</b>
    </td>
    <td>
      &nbsp;
    </td>
  </tr>

  <tr>
    <td>2.</td>
    <td>
      <p>Party joins a session on the new title.</p>
      <p>From the multiplayer lobby, Felix starts the game.</p>
      <p><b style="background-color: #FFFF00">A toast notification appears that indicates that a game invite has been sent to Hannah.</b></p>
    </td>
    <td>
      &nbsp;
    </td>
  </tr>

  <tr>
    <td>3.</td>
    <td>
      &nbsp;
    </td>
    <td>
      <p>A toast notification appears that indicates that a game was found for the party.</p>
      <p>From the <b>Notification center</b>, Hannah can select one of the following options.
        <ul>
          <li><b>Accept game invite</b> to launch the title and join the game session.</li>
          <li><b>Decline game invite</b> to decline the invite and not join the game. Hannah is still in the party and will receive subsequent game invites.</li>
          <li><b style="background-color: #FFFF00">"Leave party" to remove oneself from the party.</b></li>
        </ul>
      </p>
    </td>
  </tr>

  <tr>
    <td>&nbsp;</td>
    <td>
      <b>Case 2: Felix selects "No"</b>
    </td>
    <td>
      &nbsp;
    </td>
  </tr>

  <tr>
    <td>2.</td>
    <td>
      The Party doesn't join the new game session in the other title.
      Felix plays on multiplayer mode without his party members.
      Felix is still in the party.
    </td>
    <td>
      &nbsp;
    </td>
  </tr>

</table>


## Invite flow from Home

<table>
  <tr>
    <th>Step</th>
    <th>Felix's Device</th>
    <th>Hannah's Device</th>
  </tr>

  <tr>
    <td>1.</td>
    <td>
      <p>Felix is browsing <b>Home</b>, and in his <b>Friends</b> list, he sees that Hannah is online.</p>
      <p>Felix chooses to invite Hannah to his party. A toast notification appears that indicates that the invite is sent. The Party app launches for Felix.</p>
    </td>
    <td>
      Hannah is playing a game.
    </td>
  </tr>

  <tr>
    <td>2.</td>
    <td>
      &nbsp;
    </td>
    <td>
      <p>A toast notification appears that indicates that Felix has invited Hannah to his party.</p>
      <p>In the <b>Notification center</b>, Hannah can select <b>Accept the invite</b>.</p>
      <p>When Hannah accepts the invitation, the Party app launches and adds her to Felix's party.</p>
    </td>
  </tr>

  <tr>
    <td>3.</td>
    <td>
      <p>A toast notification appears that indicates that Hannah has joined the party.</p>
      <p>Felix and Hannah discuss what game they want to play. Felix launches the game and enters the multiplayer game mode.</p>
      <p>Game either gives an option to invite friends, or auto-pulls the party members.</p>
      <p><b style="background-color: #FFFF00">A toast notification appears that indicates that a game invite has been sent.</b></p>
    </td>
    <td>
      <p>A toast notification appears that indicates that a game has been found for the party.</p>
      <p>In the <b>Notification center</b>, Hannah can select one of the following options. 
        <ul>
          <li><b>Accept game invite</b> to launch the title and join the game session.</li>
          <li><b>Decline game invite</b> to decline the invite and not join the game. Hannah is still in the party and will receive subsequent game invites.</li>
          <li><b style="background-color: #FFFF00">"Leave party" to remove oneself from the party.</b></li>
        </ul>  
      </p>
    </td>
  </tr>

</table>


## More about game invitation toast notifications

The **Game Invite Sent** toast notification only appears the first time a game session is established with remote party members.
Subsequent requests that are sent to remote party members don't generate this toast notification, 
so that the user isn't spammed with repeated notifications if the title makes multiple calls to `PullReservedPlayersAsync`.  
> [!NOTE]
> The best practice is to add all desired friends as Reserved, and then call `PullReservedPlayersAsync` only once.