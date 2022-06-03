---
author: M-Stahl
title: XTaskQueueRegistrationToken
description: A token returned when registering a callback, to identify the registration.
kindex: XTaskQueueRegistrationToken
ms.author: mstahl
ms.topic: reference
edited: 06/04/2019
security: public
applies-to: pc-gdk
---

# XTaskQueueRegistrationToken
  
A token returned when registering a callback, to identify the registration.  
  
## Syntax
  
```cpp
typedef struct XTaskQueueRegistrationToken {  
    uint64_t token;  
} XTaskQueueRegistrationToken  
```
  
### Members
  
*token*  
Type: uint64_t  
  
The token returned when registering a callback to identify the registration.  
  
## Remarks  
  
`XTaskQueueRegistrationToken` represents a *registration token*, returned when registering a callback for a task queue. Use the registration token when un-registering a previously-registered callback. Registration tokens are unique only within the scope of the callback for which you are registering.  
  
`XTaskQueueRegistrationToken` is used by the following functions:  
  
| Header | Function |
| ------ | -------- |
| [XAppCapture](../../xappcapture/xappcapture_members.md) | [XAppBroadcastRegisterIsAppBroadcastingChanged](../../xappcapture/functions/xappbroadcastregisterisappbroadcastingchanged.md) |  
| [XAppCapture](../../xappcapture/xappcapture_members.md) | [XAppBroadcastUnregisterIsAppBroadcastingChanged](../../xappcapture/functions/xappbroadcastunregisterisappbroadcastingchanged.md) |  
| [XAppCapture](../../xappcapture/xappcapture_members.md) | [XAppCaptureRegisterMetadataPurged](../../xappcapture/functions/xappcaptureregistermetadatapurged.md) |  
| [XAppCapture](../../xappcapture/xappcapture_members.md) | [XAppCaptureUnRegisterMetadataPurged](../../xappcapture/functions/xappcaptureunregistermetadatapurged.md) |  
| [XGameInvite](../../xgameinvite/xgameinvite_members.md) | [XGameInviteRegisterForEvent](../../xgameinvite/functions/xgameinviteregisterforevent.md) |  
| [XGameInvite](../../xgameinvite/xgameinvite_members.md) | [XGameInviteUnregisterForEvent](../../xgameinvite/functions/xgameinviteunregisterforevent.md) |  
| [XNetworking](../../../networking/xnetworking/xnetworking_members.md) | [XNetworkingRegisterConnectivityHintChanged](../../../networking/xnetworking/functions/xnetworkingregisterconnectivityhintchanged.md) |  
| [XNetworking](../../../networking/xnetworking/xnetworking_members.md) | [XNetworkingRegisterPreferredLocalUdpMultiplayerPortChanged](../../../networking/xnetworking/functions/xnetworkingregisterpreferredlocaludpmultiplayerportchanged.md) |  
| [XNetworking](../../../networking/xnetworking/xnetworking_members.md) | [XNetworkingUnregisterConnectivityHintChanged](../../../networking/xnetworking/functions/xnetworkingunregisterconnectivityhintchanged.md) |  
| [XNetworking](../../../networking/xnetworking/xnetworking_members.md) | [XNetworkingUnregisterPreferredLocalUdpMultiplayerPortChanged](../../../networking/xnetworking/functions/xnetworkingunregisterpreferredlocaludpmultiplayerportchanged.md) |  
| [XPackage](../../xpackage/xpackage_members.md) | [XPackageRegisterInstallationProgressChanged](../../xpackage/functions/xpackageregisterinstallationprogresschanged.md) |  
| [XPackage](../../xpackage/xpackage_members.md) | [XPackageRegisterPackageInstalled](../../xpackage/functions/xpackageregisterpackageinstalled.md) |  
| [XPackage](../../xpackage/xpackage_members.md) | [XPackageUnregisterInstallationProgressChanged](../../xpackage/functions/xpackageunregisterinstallationprogresschanged.md) |  
| [XPackage](../../xpackage/xpackage_members.md) | [XPackageUnregisterPackageInstalled](../../xpackage/functions/xpackageunregisterpackageinstalled.md) |  
| [XStore](../../xstore/xstore_members.md) | [XStoreRegisterGameLicenseChanged](../../xstore/functions/xstoreregistergamelicensechanged.md) |  
| [XStore](../../xstore/xstore_members.md) | [XStoreRegisterPackageLicenseLost](../../xstore/functions/xstoreregisterpackagelicenselost.md) |  
| [XStore](../../xstore/xstore_members.md) | [XStoreUnregisterGameLicenseChanged](../../xstore/functions/xstoreunregistergamelicensechanged.md) |  
| [XStore](../../xstore/xstore_members.md) | [XStoreUnregisterPackageLicenseLost](../../xstore/functions/xstoreunregisterpackagelicenselost.md) |  
| [XTaskQueue](../xtaskqueue_members.md) | [XTaskQueueRegisterMonitor](../functions/xtaskqueueregistermonitor.md) |  
| [XTaskQueue](../xtaskqueue_members.md) | [XTaskQueueRegisterWaiter](../functions/xtaskqueueregisterwaiter.md) |  
| [XTaskQueue](../xtaskqueue_members.md) | [XTaskQueueUnregisterMonitor](../functions/xtaskqueueunregistermonitor.md) |  
| [XTaskQueue](../xtaskqueue_members.md) | [XTaskQueueUnregisterWaiter](../functions/xtaskqueueunregisterwaiter.md) |  
| [XUser](../../xuser/xuser_members.md) | [XUserRegisterForChangeEvent](../../xuser/functions/xuserregisterforchangeevent.md) |  
| [XUser](../../xuser/xuser_members.md) | [XUserRegisterForDefaultAudioEndpointUtf16Changed](../../xuser/functions/xuserregisterfordefaultaudioendpointutf16changed.md) |  
| [XUser](../../xuser/xuser_members.md) | [XUserRegisterForDeviceAssociationChanged](../../xuser/functions/xuserregisterfordeviceassociationchanged.md) |  
| [XUser](../../xuser/xuser_members.md) | [XUserUnregisterForChangeEvent](../../xuser/functions/xuserunregisterforchangeevent.md) |  
| [XUser](../../xuser/xuser_members.md) | [XUserUnregisterForDefaultAudioEndpointUtf16Changed](../../xuser/functions/xuserunregisterfordefaultaudioendpointutf16changed.md) |  
| [XUser](../../xuser/xuser_members.md) | [XUserUnregisterForDeviceAssociationChanged](../../xuser/functions/xuserregisterfordeviceassociationchanged.md) |  
  
## Requirements
  
**Header:** XTaskQueue.h  
  
**Supported platforms:** Windows, Xbox One family consoles and Xbox Series consoles  
  
## See also
  
[XTaskQueue members](../xtaskqueue_members.md)  
[Asynchronous Programming Model](../../../../system/overviews/async-programming-model.md)  
[Async Task Queue design](../../../../system/overviews/async-task-queue-design.md)  
  