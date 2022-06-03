---
author: M-Stahl
title: XNetworking (API contents)
description: MultiplayerNetworking APIs
kindex: XNetworking
ms.author: v-doglov
ms.topic: navigation
edited: 00/00/0000
security: public
applies-to: pc-gdk
---

# XNetworking

Contains methods for the following features:

* Retrieving the preferred networking port for local multiplayer.
* Retrieving the list of certificate thumbprints from the Network Security Allow List (NSAL).

  
## Functions  
  
| Function | Description |  
| --- | --- |  
| [XNetworkingConnectivityHintChangedCallback](functions/xnetworkingconnectivityhintchangedcallback.md) | Gets called when the connectivity hint structure is changed. |  
| [XNetworkingGetConnectivityHint](functions/xnetworkinggetconnectivityhint.md) | Queries for device-wide information about the current network connectivity level, data limits, interface type, and network initialization state. |  
| [XNetworkingPreferredLocalUdpMultiplayerPortChangedCallback](functions/xnetworkingpreferredlocaludpmultiplayerportchangedcallback.md) | Gets called when the preferred local multiplayer port is changed. |  
| [XNetworkingQueryPreferredLocalUdpMultiplayerPort](functions/xnetworkingquerypreferredlocaludpmultiplayerport.md) | Gets the preferred local UDP port to use for multiplayer traffic. |  
| [XNetworkingQueryPreferredLocalUdpMultiplayerPortAsync](functions/xnetworkingquerypreferredlocaludpmultiplayerportasync.md) | Gets the preferred local UDP port to use for multiplayer traffic asynchronously. |  
| [XNetworkingQueryPreferredLocalUdpMultiplayerPortAsyncResult](functions/xnetworkingquerypreferredlocaludpmultiplayerportasyncresult.md) | Gets the results from a QueryPreferredLocalUdpMultiplayerPortAsync call. |  
| [XNetworkingQuerySecurityInformationForUrlAsync](functions/xnetworkingquerysecurityinformationforurlasync.md) | Retrieves additional security information associated with a URL configured in the Universal Developer Portal for Xbox Live–enabled titles. |  
| [XNetworkingQuerySecurityInformationForUrlAsyncResult](functions/xnetworkingquerysecurityinformationforurlasyncresult.md) | Gets the results from the XNetworkingQuerySecurityInformationForUrlAsync function. |  
| [XNetworkingQuerySecurityInformationForUrlAsyncResultSize](functions/xnetworkingquerysecurityinformationforurlasyncresultsize.md) | Gets the size of the results buffer from a QueryThumbprintsForUrlAsync call. |  
| [XNetworkingQuerySecurityInformationForUrlUtf16Async](functions/xnetworkingquerysecurityinformationforurlutf16async.md) | Retrieves security information associated with an URL as configured in the Universal Developer Portal for Xbox Live enabled titles. |  
| [XNetworkingQuerySecurityInformationForUrlUtf16AsyncResult](functions/xnetworkingquerysecurityinformationforurlutf16asyncresult.md) | Gets the buffer results from the XNetworkingQuerySecurityInformationForUrlUtf16Async function. |  
| [XNetworkingQuerySecurityInformationForUrlUtf16AsyncResultSize](functions/xnetworkingquerysecurityinformationforurlutf16asyncresultsize.md) | Gets the size of the result buffer from the XNetworkingQuerySecurityInformationForUrlUtf16Async function. |  
| [XNetworkingRegisterConnectivityHintChanged](functions/xnetworkingregisterconnectivityhintchanged.md) | Registers title to changes in device-wide information about current network connectivity level, data limits, interface type, and network initialization state. |  
| [XNetworkingRegisterPreferredLocalUdpMultiplayerPortChanged](functions/xnetworkingregisterpreferredlocaludpmultiplayerportchanged.md) | Registers a callback function to call when the preferred local UDP multiplayer port changes. |  
| [XNetworkingUnregisterConnectivityHintChanged](functions/xnetworkingunregisterconnectivityhintchanged.md) | Unregisters a callback function that was registered with XNetworkingRegisterConnectivityHintChanged. |  
| [XNetworkingUnregisterPreferredLocalUdpMultiplayerPortChanged](functions/xnetworkingunregisterpreferredlocaludpmultiplayerportchanged.md) | Unregisters a callback function that was registered with RegisterPreferredLocalUdpMultiplayerPortChanged. |  
| [XNetworkingVerifyServerCertificate](functions/xnetworkingverifyservercertificate.md) | Provides additional certificate chain validation. |  
  
## Structures  
  
| Structure | Description |  
| --- | --- |  
| [XNetworkingConnectivityHint](structs/xnetworkingconnectivityhint.md) | Defines the current device-wide state of the network, including network connectivity level, data limits, interface type, and network initialization state. |  
| [XNetworkingSecurityInformation](structs/xnetworkingsecurityinformation.md) | Defines the security information used in configuring the HTTP stack for a specific URL endpoint. |  
| [XNetworkingThumbprint](structs/xnetworkingthumbprint.md) | Defines the certificate type, thumbprint, and thumbprint size. |  
  
## Enumerations  
  
| Enumeration | Description |  
| --- | --- |  
| [XNetworkingConnectivityCostHint](enums/xnetworkingconnectivitycosthint.md) | Defines data-limit classification hints for a device. |  
| [XNetworkingConnectivityLevelHint](enums/xnetworkingconnectivitylevelhint.md) | Defines connectivity level hints for a device. |  
| [XNetworkingThumbprintType](enums/xnetworkingthumbprinttype.md) | Defines types of certificate thumbprints used in a title. |  
