---
title: Client-side use of Xbox Live user privileges
description: Describes how to check and resolve Xbox Live user privileges concerns for your title.
kindex: Client-side use of Xbox Live User Privileges
author: joannaleecy
ms.author: jeffshi
ms.topic: conceptual
ms.date: 03/12/2020
edited: 03/04/2021
security: public
---

# Client-side use of Xbox Live user privileges

Use this topic to check and resolve user privileges that are available on Xbox Live, 
and to determine the upsell system on an Xbox console or Windows PC.

## Table of contents 
 * [Prerequisites](#ID4ETB)
 * [Client-side handling and the user experience for privileges and upsell](#ID4EQBAC)
 * [Best practices for app-side privilege handling](#ID4E6HAC)
 * [Testing privilege-based access control in your apps](#ID4EDMAC)
 * [Privilege IDs to check](#ID4EUOAC)

<a name="ID4ETB"></a>

## Prerequisites

To handle user privileges in your Xbox Live client app, configure your title for authentication with Xbox Live. 
For more information, see [Authentication and sign-in overview](../../auth/live-authentication-overview.md) and [Xbox Live user privileges overview](../live-user-privileges-overview.md).

<a name="ID4EQBAC"></a>

## Client-side handling and the user experience for privileges and upsell

Client apps are subject to Xbox Requirements (XR) that require privileges to control a 
portion of the title, such as XR-045: Xbox Live and Account Privileges. 
For more information, see [Policies and Xbox Requirements](../../../../../policies/GC-policies-nav.md).

For apps that are controlled by privileges, you can use APIs. [XUserCheckPrivilege](../../../../../reference/system/xuser/functions/xusercheckprivilege.md) 
determines whether a user has a specific privilege. [XUserResolvePrivilegeWithUiAsync](../../../../../reference/system/xuser/functions/xuserresolveprivilegewithuiasync.md) displays a resolution UI that's required user privileges. 
This presents the necessary UI to explain or upsell if the user doesn't have the privilege.

As an example, an app that's subject to the `XPRIVILEGE_MULTIPLAYER_SESSIONS` privilege has the following flow.
 1. The user sees an option to start a multiplayer session and attempts to start a match 
 by selecting the appropriate option in the UI.
 1. The app checks the "hint" by using the `XUserCheckPrivilege` API. 
    * If it's there, assume the user has the privilege and proceed.
    * If it's not there, go to the next step.    > [!NOTE]
    > Xbox Live APIs return a status code of 403 (`HTTP_E_STATUS_FORBIDDEN`) when access 
    is denied to a feature because of a missing privilege in the XToken. 
    All endpoints of Xbox Live enforce privilege-based access control as appropriate.
 1. In response to the failure code, the title app then calls `XUserResolvePrivilegeWithUiAsync` with the appropriate 
 privilege ID for the one that you're trying to resolve. This function calls Xbox Live to see if the user has the privilege, 
 and then it tells the user why the action failed or show the 
 user the UI to resolve it. The following might result from this API call.
    * Show the UI that's related to the user's enforcement status that was 
    issued by Xbox Live policy and enforcement moderators.
    * Show the UI that's related to their parental controls.
    * Promote an applicable subscription service such as an Xbox Live Gold subscription.
    * Return the result to the title (either a success or a failure, with a reason).    > [!NOTE]
    > If Xbox Live or the network are unreachable, `XUserResolvePrivilegeWithUiAsync` fails. 
    This failure should be treated as if the user didn't possess the privilege.
 1. On return from `XUserResolvePrivilegeWithUiAsync`:
    1. If failure is returned, the title should allow the user to keep clicking the button, 
    because (for example) the user's bans might lapse, or parental controls might change.
    1. If success is returned, then the user has been remediated, and your title might attempt the action again. 
    The user's token will contain the needed privileges as part of the remediation performed by `XUserResolvePrivilegeWithUiAsync`.
  > [!NOTE]
> Privileges are macro-level checks that answer the question, "Can I?" 
For example, "Can this user access multiplayer features?" 
However, privileges aren't the only permission your app must check.  
>  
>For more information about what privileges are applicable to your title, see 
[XR-015 in the topic Policies and Xbox Requirements](../../../../../policies/GC-policies-nav.md).
  
### Example code
  
Use the following code example to ensure that you're checking for a user's multiplayer privileges before they access your title.  
  
```cpp
//
//  Check the multiplayer privilege.
//
bool hasPrivilege = false;
XUserPrivilegeDenyReason reason = { };
HRESULT hr = XUserCheckPrivilege(user, XUserPrivilegeOptions::None, XUserPrivilege::Multiplayer, &hasPrivilege, &reason);
```
  
<a name="ID4E6HAC"></a>

## Best practices for app-side privilege handling

When handling user privileges in your title, ensure that you're employing the following best practices.  

<a name="ID4EDIAC"></a>

### Frequency for resolving privileges in app

For privilege checks, the requirement is to ensure once per launch that the user has the appropriate privileges and resolve them. 
We recommend checking every logical session and discrete action.  

Your definition of a session might vary widely depending on the usage of your app.  

The following are examples of best practices. 
 * For media streaming apps, such as video players, resolve privilege checks once per selection of the **Play** button (stream start), or at the start of a playlist (for multiple streams, such as a music playlist).
 * For messaging apps, check privileges once for the first message that's sent.
 * For multiplayer apps that are using third-party match services, resolve privilege checks every session (match) start.
  
<a name="ID4EYIAC"></a>

### Never assume the subscription tier of a user
  
Historically, claims from Xbox 360 provided information about the subscription tier of the user (such as Xbox Live Gold status). 
This claim was deprecated with the introduction of the Xbox One family and later. 
Ensure that you're making your decisions by using privileges. The user's tier, or how they acquired a privilege, should be opaque to the app.

<a name="ID4EGJAC"></a>

### Offline mode

If `XUserCheckPrivilege` returns that the service is down or unreachable, then treat this result as if the privilege check returned a failure.
By doing so, your app has a fail-safe to keep it XR-compliant.
  
<a name="ID4ERJAC"></a>

### Targeting the correct user

We recommend always referencing the acting user if another user isn't specified for the privilege check.
If your app supports designating a user, use the currently designated user.

For example, there are three users logged in: Bill, Bob, and Beth. 
Your app supports switching between "active users" to designate whose recommendations, history, and settings to use. 
Beth launched your app. 
When your app is running, the active user switched Bob. 
Bob has a separate profile, set of recommendations, and history. 
Call to `XUserCheckPrivilege` to initiate a privilege check for Bob.  
  
<a name="ID4EQKAC"></a>

### Checking without UI, or with the UI out of focus

There are cases in which your app can't present a modal, so the UX for a privilege check is blocked. 
For example, when the app is playing music in the background, or during 
incoming calls while the Skype app is running in the background. 
However, your app must still check for a privilege. We recommended calling `XUserCheckPrivilege`. 
`XUserCheckPrivilege` returns the current permission state of the user, or returns an applicable failure, rather than presenting the UI. 
Your app can affect the user, as defined by their privileges, and inform the user of the privilege 
check when your app regains focus.  

Conversely, your title can show the user non-modal error information, or another UX, as desired. 
When it's appropriate to show the user a blocking UX, call to `XUserResolvePrivilegeWithUiAsync` again to show the proper UX&mdash;such as upsell or enforcement status.

<a name="ID4EDMAC"></a>

## Testing privilege-based access control in your apps

Privileges are computed based on the following inputs.
 * Effective subscription entitlements of the user
 * Effective privilege entitlements of the device
 * Effective privilege entitlements of the client platform
 * Effective privilege entitlements of the current title
   * It's possible to package a title with a collection of privileges so that all users of the apps automatically get these privileges for use in the running app. If your title requires this feature, contact your Microsoft account manager.
 * Parental controls for parents to decide what privileges to add or remove for the children in their family
 * Xbox Live moderators might ban privileges for users or devices that have been identified for abuse of the service
  
<a name="ID4E3MAC"></a>

### Testing privileges that are provided by subscriptions

You can create [test accounts](../../../../test-release/test-accounts/live-setup-testaccounts.md) with an Xbox Live Gold subscription by using [Partner Center](https://partner.microsoft.com/dashboard/).
Use these accounts to test your privilege logic for privileges that are offered through an Xbox Live Gold subscription.

You can purchase other subscriptions by using your [test account](../../../../test-release/test-accounts/live-setup-testaccounts.md) on a development client.
> [!NOTE]
> The subscription must be published to a development sandbox where your account or device is authorized, and the account on the development client must be active on the same sandbox.

You can't directly purchase retail Xbox Live Gold subscriptions by using a [test account](../../../../test-release/test-accounts/live-setup-testaccounts.md) that's created through [Partner Center](https://partner.microsoft.com/dashboard/).
Instead, you can purchase a developer-specific version of Xbox Live Gold that only applies to development scenarios.


<a name="ID4EZNAC"></a>

### Testing privileges that are provided by the running title

If you want to set up an app to automatically issue privileges when users are in the app, contact your Microsoft account manager.
Testing this scenario requires configuring your app for Xbox Live authentication and running the app with users signed in.
  
<a name="ID4EEOAC"></a>

### Testing privileges that are removed by parental control


To test your privilege logic with privileges that can be removed by using parental controls (such as `XPRIVILEGE_COMMUNICATIONS`), set up family accounts on the client device.
Parents or guardians might use the device to restrict privileges of the children in their family.

It's also possible for a user to restrict privileges on their own account.
We recommend using this method to test scenarios that require that a user's privileges be restricted.

> [!NOTE]
> [Partner Center](https://partner.microsoft.com/dashboard/) doesn't currently provide a way to create families of [test accounts](../../../../test-release/test-accounts/live-setup-testaccounts.md).

<a name="ID4EUOAC"></a>

## Privilege IDs to check

Your title must check the following privilege IDs. For more information, see [XR-045: Xbox Live and Account Privileges](/gaming/xbox-live/policies/xr/live-pc-xr045).

| Privilege ID | Privilege name | Enum constant | Description |
| --- | --- | --- | --- |
| 254 | `XPRIVILEGE_MULTIPLAYER_SESSIONS` | `XUserPrivilege::Multiplayer` | The user can join multiplayer sessions for a game when this privilege is present. |
| 185 | `XPRIVILEGE_CROSS_PLAY` | `XUserPrivilege::CrossPlay` | The user can participate in a gameplay session with other real-world users who aren't signed into Xbox Live. Example scenarios include synchronous user-versus-user gameplay in the same session, asynchronous turn-based gameplay, team-based gameplay, user-initiated matchmaking, sending or accepting invitations, and join-in-progress sessions. |
| 252 | `XPRIVILEGE_COMMUNICATIONS` | `XUserPrivilege::Communications` | The user can use voice chat or text messaging with anyone when this privilege is present. Extra privacy permission checks are required to determine who the user is authorized to communicate with. |
| 189 | `XPRIVILEGE_SESSIONS` | `XUserPrivilege::Sessions` | The user can participate in connected single-player experiences in shared environments. These experiences can't have any features that are covered under privilege 252 (`XPRIVILEGE_COMMUNICATIONS`) or 254 (`XPRIVILEGE_MULTIPLAYER_SESSIONS`). Use of this privilege is a title capability that requires platform approval. |
| 247 | `XPRIVILEGE_USER_CREATED_CONTENT` | `XUserPrivilege::UserGeneratedContent` | The user can download and view online user-created content when this privilege is present. |
| 220 | `XPRIVILEGE_SOCIAL_NETWORK_SHARING` | `XUserPrivilege::SocialNetworkSharing` | The user can share progress information on social networks when this privilege is present. |

For more information about available privileges, see [XUserPrivilege](../../../../../reference/system/xuser/enums/xuserprivilege.md).


<a name="ID4EJGAE"></a>

### Privilege computation logic

Privileges are computed independently for each user that's simultaneously signed in on a console or other device. 
Privileges are added from the effective entitlements of the user, the device, the title that's currently running, and the platform. 
Then privileges are removed for each user based on parental controls, Xbox Live policy and enforcement status, and the guest status of each user.

Effective entitlements might result from subscriptions that are purchased by the user, purchased by other users logged in at the same time, or subscriptions that are directly associated to a device. 
Effective entitlements might also result from promotional offers, such as "Free multiplayer weekend" events.


<a name="ID4EYGAE"></a>

#### Privilege entitlements that result from the device type

Certain types of devices (such as Xbox One family consoles and Xbox Series consoles, Windows PC, or mobile) automatically grant a collection of privileges to any user that connects to Xbox Live from the platform.


<a name="ID4EGHAE"></a>

#### Effective privilege entitlements that result from subscriptions

Subscription products might provide a collection of privileges to applicable users.
The following scenarios are ways a user is effectively granted subscription-based privileges. 
 * The user has purchased the subscription product.
 * Another active user on the same device has purchased the subscription product.
 * The subscription product is associated to the device that the user is currently using.

Starting with Xbox One, the Xbox Live Gold subscription follows this logic.
It's possible to associate a Xbox Live Gold subscription to a device, and all users on the device are effectively entitled 
to privileges that are associated to the Xbox Live Gold subscription tier.
Any user, including sponsored guests, that are simultaneously active on a device with a user who purchased a 
Xbox Live Gold subscription are effectively entitled to the privileges that are associated with the Xbox Live Gold subscription.

Partner subscriptions might also be used to issue privileges to an active user.
In addition, privileges that are associated to a partner subscription might be issued only when a specific participating title is running.


<a name="ID4EBIAE"></a>

#### Promotional entitlements

Promotional entitlements add privileges for a limited period to users who meet certain dynamic criteria.
For example, a promotion might offer the multiplayer privilege to certain users for the duration of a weekend.
Historical promotions such as a "Free Xbox Live Gold Weekend" follow the model of promotional entitlements.
> [!NOTE]
> Your services and titles don't need to be directly aware of promotions such as these. 
Privileges from promotional entitlements are dynamically computed when Xbox Security Token Service (XSTS) tokens are issued to users who connect to the service.


<a name="ID4ELIAE"></a>

#### Privileges that are removed for sponsored guest accounts

Sponsored guests are guest accounts who are signed in with Xbox Live.
Sponsored guests only exist in the presence of at least one other active user on the client device, 
such as a split-screen multiplayer game with only one user signed in.
These accounts are authenticated users and get a token like any other authenticated user.
Sponsored guests do have privileges, but some privileges are withheld for guest users, regardless of the sponsored guest's effective entitlements or the app that's currently running.

To check privileges for sponsored guests, call `XUserCheckPrivilege`. This doesn't attempt resolution.
You shouldn't need to display a resolution UI, and you shouldn't need to call `XUserResolvePrivilegeWithUiAsync`, because sponsored guests can't be "resolved". Unlike active Xbox Live accounts, sponsored guests don't have any path to make purchases, incur enforcement action, or have an otherwise unique set of privileges or restrictions.

If a user isn't currently signed in (which is the case with a "pure guest"), no token is issued for the user.
This means that no effective privileges are computed for any user on the device.

XR-045 requires that your title check the privilege 202 by using `XPRIVILEGE_SOCIAL_NETWORK_SHARING`, or `XUserPrivilege::SocialNetworkSharing`. This is one of the privileges that are removed for guests.  


<a name="ID4EMLAE"></a>

#### Online safety and Microsoft enforcement

Xbox Live policy and enforcement moderators might remove privileges from abusive users or devices.


<a name="ID4EXLAE"></a>

#### Parental controls

Parents can remove privileges from child accounts that are in their family, regardless of the child's subscription or the current running title.
This is controlled by using the Xbox One, Xbox 360, or Xbox.com clients.

<a name="ID4EFMAE"></a>

#### Privileges for Xbox Live Gold subscribers

Policies for privilege entitlements for a particular subscription are dynamic and will change over time.
Keep in mind that even if a subscriber is entitled to a privilege, that subscriber might lose that privilege because of parental control changes or enforcement policies.
> [!NOTE]
> Privileges aren't an accurate reflection of the current subscription of a user.

XR-045 requires that your title check the privilege 254 by using `XPRIVILEGE_MULTIPLAYER_SESSIONS`, or `XUserPrivilege::Multiplayer`. This is one of the privileges that Xbox Live Gold subscribers are entitled to.


<a name="ID4EYPAE"></a>

#### Partner subscriptions and privileges

It's possible to configure partner subscriptions to provide a collection of Xbox Live privileges.
Partner subscriptions are only used to compute the privileges of a user when the user is logged in to apps that have been explicitly associated to the subscription.

To set up partner subscriptions, contact your Microsoft account manager.

Partner subscriptions can be tested in development sandboxes before they're released.
Only users and devices that are authorized to use these development sandboxes can purchase these subscriptions.


## See also  

[Policies and Xbox Requirements](../../../../../policies/GC-policies-nav.md)  
[XUserCheckPrivilege](../../../../../reference/system/xuser/functions/xusercheckprivilege.md)  
[XUserPrivilege](../../../../../reference/system/xuser/enums/xuserprivilege.md)  
[XUserPrivilegeDenyReason](../../../../../reference/system/xuser/enums/xuserprivilegedenyreason.md)  
[XUserPrivilegeOptions](../../../../../reference/system/xuser/enums/xuserprivilegeoptions.md)