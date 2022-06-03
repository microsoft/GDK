---
author: M-Stahl
title: Time-sensitive threads
description: Describes time-sensitive threads.
kindex: Time sensitive threads
ms.author: jgup
ms.topic: conceptual
edited: 10/31/2019
security: public
---

# Time-sensitive threads
  
Games want to get as much performance as they possibly can from the system. To support this, some of the game's threads are time-sensitive in that they don't want any unexpectedly long-running operations to take place on those threads. A canonical example of a time-sensitive thread is the one used for the game's rendering.  

The Gaming Runtime Services (GRTS) makes it a little bit easier to identify what APIs aren't safe to call on a time-sensitive thread.  
  
![alert](../../../../resources/gamecore/images/en-us/common/note.gif) **NOTE:** You can identify GRTS APIs because they begin with "X" (for example, [XGameSaveInitializeProvider](../../reference/system/xgamesave/functions/xgamesaveinitializeprovider.md) or [XGameGetXboxTitleId](../../reference/system/xgame/functions/xgamegetxboxtitleid.md)).  
  
For the identification system to work, games need to call [XThreadSetTimeSensitive](../../reference/system/xthread/functions/xthreadsettimesensitive.md) on their time-sensitive threads. This API stores a bit in thread local storage that can be queried by GRTS APIs.  
  
A GRTS API that's considered safe to call on a time-sensitive thread will exhibit a consistent runtime performance when given the same input. If a GRTS API isn't safe to call on a time-sensitive thread, the GRTS API has an internal call to [XThreadAssertNotTimeSensitive](../../reference/system/xthread/functions/xthreadassertnottimesensitive.md). If the unsafe function is called on a thread that has been marked as time-sensitive, the following happens.  
  
- If a debugger is attached, an assert gets triggered and the developer is informed of the violation. Developers also get instructed on how they can then globally disable the breakpoints.  
- An Event Tracing for Windows (ETW) event is emitted that can be viewed in [XbWatson (NDA topic)](../../tools-console/xbox-tools-and-apis/xbWatson/xbwatson.md).  
  
<a id="unsafe-function-list"></a>

## Unsafe functions for time-sensitive threads
  
The following GRTS API functions aren't safe to call on time-sensitive threads. All other GRTS API functions are time-sensitive&ndash;safe and can be called on time-sensitive threads.
  
### Networking API
  
| Header | Function |  
| ------ | -------- |  
| [XNetworking](../../reference/networking/xnetworking/xnetworking_members.md) | [XNetworkingQueryPreferredLocalUdpMultiplayerPort](../../reference/networking/xnetworking/functions/xnetworkingquerypreferredlocaludpmultiplayerport.md) |  
| [XNetworking](../../reference/networking/xnetworking/xnetworking_members.md) | [XNetworkingUnregisterConnectivityHintChanged](../../reference/networking/xnetworking/functions/xnetworkingunregisterconnectivityhintchanged.md) |  
| [XNetworking](../../reference/networking/xnetworking/xnetworking_members.md) | [XNetworkingUnregisterPreferredLocalUdpMultiplayerPortChanged](../../reference/networking/xnetworking/functions/xnetworkingunregisterpreferredlocaludpmultiplayerportchanged.md) |  
| [XNetworking](../../reference/networking/xnetworking/xnetworking_members.md) | [XNetworkingVerifyServerCertificate](../../reference/networking/xnetworking/functions/xnetworkingverifyservercertificate.md) |  
  
### System API
  
| Header | Function |  
| ------ | -------- |  
| [XAccessibility](../../reference/system/xaccessibility/xaccessibility_members.md) | [XClosedCaptionGetProperties](../../reference/system/xaccessibility/functions/xclosedcaptiongetproperties.md) |  
| [XAccessibility](../../reference/system/xaccessibility/xaccessibility_members.md) | [XClosedCaptionSetEnabled](../../reference/system/xaccessibility/functions/xclosedcaptionsetenabled.md) |  
| [XAccessibility](../../reference/system/xaccessibility/xaccessibility_members.md) | [XHighContrastGetMode](../../reference/system/xaccessibility/functions/xhighcontrastgetmode.md) |  
| [XAccessibility](../../reference/system/xaccessibility/xaccessibility_members.md) | [XSpeechToTextSendString](../../reference/system/xaccessibility/functions/xspeechtotextsendstring.md) |  
| [XAccessibility](../../reference/system/xaccessibility/xaccessibility_members.md) | [XSpeechToTextSetPositionHint](../../reference/system/xaccessibility/functions/xspeechtotextsetpositionhint.md) |  
| [XAppCapture](../../reference/system/xappcapture/xappcapture_members.md) | [XAppBroadcastGetStatus](../../reference/system/xappcapture/functions/xappbroadcastgetstatus.md) |  
| [XAppCapture](../../reference/system/xappcapture/xappcapture_members.md) | [XAppBroadcastIsAppBroadcasting](../../reference/system/xappcapture/functions/xappbroadcastisappbroadcasting.md) |  
| [XAppCapture](../../reference/system/xappcapture/xappcapture_members.md) | [XAppBroadcastRegisterIsAppBroadcastingChanged](../../reference/system/xappcapture/functions/xappbroadcastregisterisappbroadcastingchanged.md) |  
| [XAppCapture](../../reference/system/xappcapture/xappcapture_members.md) | [XAppBroadcastShowUI](../../reference/system/xappcapture/functions/xappbroadcastshowui.md) |  
| [XAppCapture](../../reference/system/xappcapture/xappcapture_members.md) | [XAppBroadcastUnregisterIsAppBroadcastingChanged](../../reference/system/xappcapture/functions/xappbroadcastunregisterisappbroadcastingchanged.md) |  
| [XAppCapture](../../reference/system/xappcapture/xappcapture_members.md) | [XAppCaptureCloseScreenshotStream](../../reference/system/xappcapture/functions/xappcaptureclosescreenshotstream.md) |  
| [XAppCapture](../../reference/system/xappcapture/xappcapture_members.md) | [XAppCaptureDisableRecord](../../reference/system/xappcapture/functions/xappcapturedisablerecord.md) |  
| [XAppCapture](../../reference/system/xappcapture/xappcapture_members.md) | [XAppCaptureEnableRecord](../../reference/system/xappcapture/functions/xappcaptureenablerecord.md) |  
| [XAppCapture](../../reference/system/xappcapture/xappcapture_members.md) | [XAppCaptureMetadataAddDoubleEvent](../../reference/system/xappcapture/functions/xappcapturemetadataadddoubleevent.md) |  
| [XAppCapture](../../reference/system/xappcapture/xappcapture_members.md) | [XAppCaptureMetadataAddInt32Event](../../reference/system/xappcapture/functions/xappcapturemetadataaddint32event.md) |  
| [XAppCapture](../../reference/system/xappcapture/xappcapture_members.md) | [XAppCaptureMetadataAddStringEvent](../../reference/system/xappcapture/functions/xappcapturemetadataaddstringevent.md) |  
| [XAppCapture](../../reference/system/xappcapture/xappcapture_members.md) | [XAppCaptureMetadataRemainingStorageBytesAvailable](../../reference/system/xappcapture/functions/xappcapturemetadataremainingstoragebytesavailable.md) |  
| [XAppCapture](../../reference/system/xappcapture/xappcapture_members.md) | [XAppCaptureMetadataStartDoubleState](../../reference/system/xappcapture/functions/xappcapturemetadatastartdoublestate.md) |  
| [XAppCapture](../../reference/system/xappcapture/xappcapture_members.md) | [XAppCaptureMetadataStartInt32State](../../reference/system/xappcapture/functions/xappcapturemetadatastartint32state.md) |  
| [XAppCapture](../../reference/system/xappcapture/xappcapture_members.md) | [XAppCaptureMetadataStartStringState](../../reference/system/xappcapture/functions/xappcapturemetadatastartstringstate.md) |  
| [XAppCapture](../../reference/system/xappcapture/xappcapture_members.md) | [XAppCaptureMetadataStopAllStates](../../reference/system/xappcapture/functions/xappcapturemetadatastopallstates.md) |  
| [XAppCapture](../../reference/system/xappcapture/xappcapture_members.md) | [XAppCaptureMetadataStopState](../../reference/system/xappcapture/functions/xappcapturemetadatastopstate.md) |  
| [XAppCapture](../../reference/system/xappcapture/xappcapture_members.md) | [XAppCaptureOpenScreenshotStream](../../reference/system/xappcapture/functions/xappcaptureopenscreenshotstream.md) |  
| [XAppCapture](../../reference/system/xappcapture/xappcapture_members.md) | [XAppCaptureReadScreenshotStream](../../reference/system/xappcapture/functions/xappcapturereadscreenshotstream.md) |  
| [XAppCapture](../../reference/system/xappcapture/xappcapture_members.md) | [XAppCaptureRecordDiagnosticClip](../../reference/system/xappcapture/functions/xappcapturerecorddiagnosticclip.md) |  
| [XAppCapture](../../reference/system/xappcapture/xappcapture_members.md) | [XAppCaptureRegisterMetadataPurged](../../reference/system/xappcapture/functions/xappcaptureregistermetadatapurged.md) |  
| [XAppCapture](../../reference/system/xappcapture/xappcapture_members.md) | [XAppCaptureTakeDiagnosticScreenshot](../../reference/system/xappcapture/functions/xappcapturetakediagnosticscreenshot.md) |  
| [XAppCapture](../../reference/system/xappcapture/xappcapture_members.md) | [XAppCaptureTakeScreenshot](../../reference/system/xappcapture/functions/xappcapturetakescreenshot.md) |  
| [XAppCapture](../../reference/system/xappcapture/xappcapture_members.md) | [XAppCaptureUnRegisterMetadataPurged](../../reference/system/xappcapture/functions/xappcaptureunregistermetadatapurged.md) |  
| [XAsyncProvider](../../reference/system/xasyncprovider/xasyncprovider_members.md) | [XAsyncComplete](../../reference/system/xasyncprovider/functions/xasynccomplete.md) |  
| [XDisplay](../../reference/system/xdisplay/xdisplay_members.md) | [XDisplayAcquireTimeoutDeferral](../../reference/system/xdisplay/functions/xdisplayacquiretimeoutdeferral.md) |  
| [XDisplay](../../reference/system/xdisplay/xdisplay_members.md) | [XDisplayCloseTimeoutDeferralHandle](../../reference/system/xdisplay/functions/xdisplayclosetimeoutdeferralhandle.md) |  
| [XDisplay](../../reference/system/xdisplay/xdisplay_members.md) | [XDisplayTryEnableHdrMode](../../reference/system/xdisplay/functions/xdisplaytryenablehdrmode.md) |  
| [XError](../../reference/system/xerror/xerror_members.md) | [XErrorSetCallback](../../reference/system/xerror/functions/xerrorsetcallback.md) |  
| [XError](../../reference/system/xerror/xerror_members.md) | [XErrorSetOptions](../../reference/system/xerror/functions/xerrorsetoptions.md) |  
| [XGame](../../reference/system/xgame/xgame_members.md) | [XGameGetXboxTitleId](../../reference/system/xgame/functions/xgamegetxboxtitleid.md) |  
| [XGame](../../reference/system/xgame/xgame_members.md) | [XLaunchNewGame](../../reference/system/xgame/functions/xlaunchnewgame.md) |  
| [XGameEvent](../../reference/system/xgameevent/xgameevent_members.md) | [XGameEventWrite](../../reference/system/xgameevent/functions/xgameeventwrite.md) |  
| [XGameInvite](../../reference/system/xgameinvite/xgameinvite_members.md) | [XGameInviteRegisterForEvent](../../reference/system/xgameinvite/functions/xgameinviteregisterforevent.md) |  
| [XGameInvite](../../reference/system/xgameinvite/xgameinvite_members.md) | [XGameInviteUnregisterForEvent](../../reference/system/xgameinvite/functions/xgameinviteunregisterforevent.md) |  
| [XGameSave](../../reference/system/xgamesave/xgamesave_members.md) | [XGameSaveCloseContainer](../../reference/system/xgamesave/functions/xgamesaveclosecontainer.md) |  
| [XGameSave](../../reference/system/xgamesave/xgamesave_members.md) | [XGameSaveCloseProvider](../../reference/system/xgamesave/functions/xgamesavecloseprovider.md) |  
| [XGameSave](../../reference/system/xgamesave/xgamesave_members.md) | [XGameSaveCloseUpdate](../../reference/system/xgamesave/functions/xgamesavecloseupdate.md) |  
| [XGameSave](../../reference/system/xgamesave/xgamesave_members.md) | [XGameSaveCreateContainer](../../reference/system/xgamesave/functions/xgamesavecreatecontainer.md) |  
| [XGameSave](../../reference/system/xgamesave/xgamesave_members.md) | [XGameSaveCreateUpdate](../../reference/system/xgamesave/functions/xgamesavecreateupdate.md) |  
| [XGameSave](../../reference/system/xgamesave/xgamesave_members.md) | [XGameSaveDeleteContainer](../../reference/system/xgamesave/functions/xgamesavedeletecontainer.md) |  
| [XGameSave](../../reference/system/xgamesave/xgamesave_members.md) | [XGameSaveEnumerateBlobInfo](../../reference/system/xgamesave/functions/xgamesaveenumerateblobinfo.md) |  
| [XGameSave](../../reference/system/xgamesave/xgamesave_members.md) | [XGameSaveEnumerateBlobInfoByName](../../reference/system/xgamesave/functions/xgamesaveenumerateblobinfobyname.md) |  
| [XGameSave](../../reference/system/xgamesave/xgamesave_members.md) | [XGameSaveEnumerateContainerInfo](../../reference/system/xgamesave/functions/xgamesaveenumeratecontainerinfo.md) |  
| [XGameSave](../../reference/system/xgamesave/xgamesave_members.md) | [XGameSaveEnumerateContainerInfoByName](../../reference/system/xgamesave/functions/xgamesaveenumeratecontainerinfobyname.md) |  
| [XGameSave](../../reference/system/xgamesave/xgamesave_members.md) | [XGameSaveGetContainerInfo](../../reference/system/xgamesave/functions/xgamesavegetcontainerinfo.md) |  
| [XGameSave](../../reference/system/xgamesave/xgamesave_members.md) | [XGameSaveGetRemainingQuota](../../reference/system/xgamesave/functions/xgamesavegetremainingquota.md) |  
| [XGameSave](../../reference/system/xgamesave/xgamesave_members.md) | [XGameSaveInitializeProvider](../../reference/system/xgamesave/functions/xgamesaveinitializeprovider.md) |  
| [XGameSave](../../reference/system/xgamesave/xgamesave_members.md) | [XGameSaveReadBlobData](../../reference/system/xgamesave/functions/xgamesavereadblobdata.md) |  
| [XGameSave](../../reference/system/xgamesave/xgamesave_members.md) | [XGameSaveSubmitBlobDelete](../../reference/system/xgamesave/functions/xgamesavesubmitblobdelete.md) |  
| [XGameSave](../../reference/system/xgamesave/xgamesave_members.md) | [XGameSaveSubmitBlobWrite](../../reference/system/xgamesave/functions/xgamesavesubmitblobwrite.md) |  
| [XGameSave](../../reference/system/xgamesave/xgamesave_members.md) | [XGameSaveSubmitUpdate](../../reference/system/xgamesave/functions/xgamesavesubmitupdate.md) |  
| [XGameStreaming](../../reference/system/xgamestreaming/xgamestreaming_members.md) | [XGameStreamingGetStreamAddedLatency](../../reference/system/xgamestreaming/functions/xgamestreaminggetstreamaddedlatency.md) |  
| [XGameStreaming](../../reference/system/xgamestreaming/xgamestreaming_members.md) | [XGameStreamingInitialize](../../reference/system/xgamestreaming/functions/xgamestreaminginitialize.md) |  
| [XGameStreaming](../../reference/system/xgamestreaming/xgamestreaming_members.md) | [XGameStreamingRegisterClientPropertiesChanged](../../reference/system/xgamestreaming/functions/xgamestreamingregisterclientpropertieschanged.md) |  
| [XGameStreaming](../../reference/system/xgamestreaming/xgamestreaming_members.md) | [XGameStreamingRegisterConnectionStateChanged](../../reference/system/xgamestreaming/functions/xgamestreamingregisterconnectionstatechanged.md) |  
| [XGameStreaming](../../reference/system/xgamestreaming/xgamestreaming_members.md) | [XGameStreamingUninitialize](../../reference/system/xgamestreaming/functions/xgamestreaminguninitialize.md) |  
| [XGameStreaming](../../reference/system/xgamestreaming/xgamestreaming_members.md) | [XGameStreamingUnregisterClientPropertiesChanged](../../reference/system/xgamestreaming/functions/xgamestreamingunregisterclientpropertieschanged.md) |  
| [XGameStreaming](../../reference/system/xgamestreaming/xgamestreaming_members.md) | [XGameStreamingUnregisterConnectionStateChanged](../../reference/system/xgamestreaming/functions/xgamestreamingunregisterconnectionstatechanged.md) |  
| [XGameUI](../../reference/system/xgameui/xgameui_members.md) | [XGameUiSetNotificationPositionHint](../../reference/system/xgameui/functions/xgameuisetnotificationpositionhint.md) |  
| [XLauncher](../../reference/system/xlauncher/xlauncher_members.md) | [XLaunchUri](../../reference/system/xlauncher/functions/xlaunchuri.md) |  
| [XPackage](../../reference/system/xpackage/xpackage_members.md) | [XPackageChangeChunkInstallOrder](../../reference/system/xpackage/functions/xpackagechangechunkinstallorder.md) |  
| [XPackage](../../reference/system/xpackage/xpackage_members.md) | [XPackageCloseMountHandle](../../reference/system/xpackage/functions/xpackageclosemounthandle.md) |  
| [XPackage](../../reference/system/xpackage/xpackage_members.md) | [XPackageCreateInstallationMonitor](../../reference/system/xpackage/functions/xpackagecreateinstallationmonitor.md) |  
| [XPackage](../../reference/system/xpackage/xpackage_members.md) | [XPackageEnumerateChunkAvailability](../../reference/system/xpackage/functions/xpackageenumeratechunkavailability.md) |  
| [XPackage](../../reference/system/xpackage/xpackage_members.md) | [XPackageEnumeratePackages](../../reference/system/xpackage/functions/xpackageenumeratepackages.md) |  
| [XPackage](../../reference/system/xpackage/xpackage_members.md) | [XPackageEstimateDownloadSize](../../reference/system/xpackage/functions/xpackageestimatedownloadsize.md) |  
| [XPackage](../../reference/system/xpackage/xpackage_members.md) | [XPackageFindChunkAvailability](../../reference/system/xpackage/functions/xpackagefindchunkavailability.md) |  
| [XPackage](../../reference/system/xpackage/xpackage_members.md) | [XPackageGetMountPath](../../reference/system/xpackage/functions/xpackagegetmountpath.md) |  
| [XPackage](../../reference/system/xpackage/xpackage_members.md) | [XPackageGetMountPathSize](../../reference/system/xpackage/functions/xpackagegetmountpathsize.md) |  
| [XPackage](../../reference/system/xpackage/xpackage_members.md) | [XPackageGetUserLocale](../../reference/system/xpackage/functions/xpackagegetuserlocale.md) |  
| [XPackage](../../reference/system/xpackage/xpackage_members.md) | [XPackageInstallChunks](../../reference/system/xpackage/functions/xpackageinstallchunks.md) |  
| [XPackage](../../reference/system/xpackage/xpackage_members.md) | [XPackageMount](../../reference/system/xpackage/functions/xpackagemount.md) |  
| [XPackage](../../reference/system/xpackage/xpackage_members.md) | [XPackageUninstallChunks](../../reference/system/xpackage/functions/xpackageuninstallchunks.md) |  
| [XPackage](../../reference/system/xpackage/xpackage_members.md) | [XPackageUnregisterInstallationProgressChanged](../../reference/system/xpackage/functions/xpackageunregisterinstallationprogresschanged.md) |  
| [XPackage](../../reference/system/xpackage/xpackage_members.md) | [XPackageUnregisterPackageInstalled](../../reference/system/xpackage/functions/xpackageunregisterpackageinstalled.md) |  
| [XPackage](../../reference/system/xpackage/xpackage_members.md) | [XPackageUpdateInstallationMonitor](../../reference/system/xpackage/functions/xpackageupdateinstallationmonitor.md) |  
| [XPersistentLocalStorage](../../reference/system/xpersistentlocalstorage/xpersistentlocalstorage_members.md) | [XPersistentLocalStorageGetPath](../../reference/system/xpersistentlocalstorage/functions/xpersistentlocalstoragegetpath.md) |  
| [XPersistentLocalStorage](../../reference/system/xpersistentlocalstorage/xpersistentlocalstorage_members.md) | [XPersistentLocalStorageGetPathSize](../../reference/system/xpersistentlocalstorage/functions/xpersistentlocalstoragegetpathsize.md) |  
| [XSpeechSynthesizer](../../reference/system/xspeechsynthesizer/xspeechsynthesizer_members.md) | [XSpeechSynthesizerCloseHandle](../../reference/system/xspeechsynthesizer/functions/xspeechsynthesizerclosehandle.md) |  
| [XSpeechSynthesizer](../../reference/system/xspeechsynthesizer/xspeechsynthesizer_members.md) | [XSpeechSynthesizerCloseStreamHandle](../../reference/system/xspeechsynthesizer/functions/xspeechsynthesizerclosestreamhandle.md) |  
| [XSpeechSynthesizer](../../reference/system/xspeechsynthesizer/xspeechsynthesizer_members.md) | [XSpeechSynthesizerCreate](../../reference/system/xspeechsynthesizer/functions/xspeechsynthesizercreate.md) |  
| [XSpeechSynthesizer](../../reference/system/xspeechsynthesizer/xspeechsynthesizer_members.md) | [XSpeechSynthesizerCreateStreamFromText](../../reference/system/xspeechsynthesizer/functions/xspeechsynthesizercreatestreamfromtext.md) |  
| [XSpeechSynthesizer](../../reference/system/xspeechsynthesizer/xspeechsynthesizer_members.md) | [XSpeechSynthesizerEnumerateInstalledVoices](../../reference/system/xspeechsynthesizer/functions/xspeechsynthesizerenumerateinstalledvoices.md) |  
| [XSpeechSynthesizer](../../reference/system/xspeechsynthesizer/xspeechsynthesizer_members.md) | [XSpeechSynthesizerGetStreamData](../../reference/system/xspeechsynthesizer/functions/xspeechsynthesizergetstreamdata.md) |  
| [XSpeechSynthesizer](../../reference/system/xspeechsynthesizer/xspeechsynthesizer_members.md) | [XSpeechSynthesizerGetStreamDataSize](../../reference/system/xspeechsynthesizer/functions/xspeechsynthesizergetstreamdatasize.md) |  
| [XSpeechSynthesizer](../../reference/system/xspeechsynthesizer/xspeechsynthesizer_members.md) | [XSpeechSynthesizerSetCustomVoice](../../reference/system/xspeechsynthesizer/functions/xspeechsynthesizersetcustomvoice.md) |  
| [XSpeechSynthesizer](../../reference/system/xspeechsynthesizer/xspeechsynthesizer_members.md) | [XSpeechSynthesizerSetDefaultVoice](../../reference/system/xspeechsynthesizer/functions/xspeechsynthesizersetdefaultvoice.md) |  
| [XStore](../../reference/system/xstore/xstore_members.md) | [XStoreCloseContextHandle](../../reference/system/xstore/functions/xstoreclosecontexthandle.md) |  
| [XStore](../../reference/system/xstore/xstore_members.md) | [XStoreCloseLicenseHandle](../../reference/system/xstore/functions/xstorecloselicensehandle.md) |  
| [XStore](../../reference/system/xstore/xstore_members.md) | [XStoreCloseProductsQueryHandle](../../reference/system/xstore/functions/xstorecloseproductsqueryhandle.md) |  
| [XStore](../../reference/system/xstore/xstore_members.md) | [XStoreCreateContext](../../reference/system/xstore/functions/xstorecreatecontext.md) |  
| [XStore](../../reference/system/xstore/xstore_members.md) | [XStoreEnumerateProductsQuery](../../reference/system/xstore/functions/xstoreenumerateproductsquery.md) |  
| [XStore](../../reference/system/xstore/xstore_members.md) | [XStoreUnregisterGameLicenseChanged](../../reference/system/xstore/functions/xstoreunregistergamelicensechanged.md) |  
| [XStore](../../reference/system/xstore/xstore_members.md) | [XStoreUnregisterPackageLicenseLost](../../reference/system/xstore/functions/xstoreunregisterpackagelicenselost.md) |  
| [XSystem](../../reference/system/xsystem/xsystem_members.md) | [XSystemGetAnalyticsInfo](../../reference/system/xsystem/functions/xsystemgetanalyticsinfo.md) |  
| [XSystem](../../reference/system/xsystem/xsystem_members.md) | [XSystemGetConsoleId](../../reference/system/xsystem/functions/xsystemgetconsoleid.md) |  
| [XSystem](../../reference/system/xsystem/xsystem_members.md) | [XSystemGetXboxLiveSandboxId](../../reference/system/xsystem/functions/xsystemgetxboxlivesandboxid.md) |  
| [XTaskQueue](../../reference/system/xtaskqueue/xtaskqueue_members.md) | [XTaskQueueCreate](../../reference/system/xtaskqueue/functions/xtaskqueuecreate.md) |  
| [XTaskQueue](../../reference/system/xtaskqueue/xtaskqueue_members.md) | [XTaskQueueCreateComposite](../../reference/system/xtaskqueue/functions/xtaskqueuecreatecomposite.md) |  
| [XTaskQueue](../../reference/system/xtaskqueue/xtaskqueue_members.md) | [XTaskQueueGetCurrentProcessTaskQueue](../../reference/system/xtaskqueue/functions/xtaskqueuegetcurrentprocesstaskqueue.md) |  
| [XTaskQueue](../../reference/system/xtaskqueue/xtaskqueue_members.md) | [XTaskQueueGetPort](../../reference/system/xtaskqueue/functions/xtaskqueuegetport.md) |  
| [XTaskQueue](../../reference/system/xtaskqueue/xtaskqueue_members.md) | [XTaskQueueRegisterMonitor](../../reference/system/xtaskqueue/functions/xtaskqueueregistermonitor.md) |  
| [XTaskQueue](../../reference/system/xtaskqueue/xtaskqueue_members.md) | [XTaskQueueRegisterWaiter](../../reference/system/xtaskqueue/functions/xtaskqueueregisterwaiter.md) |  
| [XTaskQueue](../../reference/system/xtaskqueue/xtaskqueue_members.md) | [XTaskQueueSetCurrentProcessTaskQueue](../../reference/system/xtaskqueue/functions/xtaskqueuesetcurrentprocesstaskqueue.md) |  
| [XTaskQueue](../../reference/system/xtaskqueue/xtaskqueue_members.md) | [XTaskQueueTerminate](../../reference/system/xtaskqueue/functions/xtaskqueueterminate.md) |  
| [XTaskQueue](../../reference/system/xtaskqueue/xtaskqueue_members.md) | [XTaskQueueUnregisterMonitor](../../reference/system/xtaskqueue/functions/xtaskqueueunregistermonitor.md) |  
| [XTaskQueue](../../reference/system/xtaskqueue/xtaskqueue_members.md) | [XTaskQueueUnregisterWaiter](../../reference/system/xtaskqueue/functions/xtaskqueueunregisterwaiter.md) |  
| [XUser](../../reference/system/xuser/xuser_members.md) | [XUserCloseHandle](../../reference/system/xuser/functions/xuserclosehandle.md) |  
| [XUser](../../reference/system/xuser/xuser_members.md) | [XUserCloseSignOutDeferralHandle](../../reference/system/xuser/functions/xuserclosesignoutdeferralhandle.md) |  
| [XUser](../../reference/system/xuser/xuser_members.md) | [XUserFindForDevice](../../reference/system/xuser/functions/xuserfindfordevice.md) |  
| [XUser](../../reference/system/xuser/xuser_members.md) | [XUserFindUserById](../../reference/system/xuser/functions/xuserfinduserbyid.md) |  
| [XUser](../../reference/system/xuser/xuser_members.md) | [XUserFindUserByLocalId](../../reference/system/xuser/functions/xuserfinduserbylocalid.md) |  
| [XUser](../../reference/system/xuser/xuser_members.md) | [XUserGetDefaultAudioEndpointUtf16](../../reference/system/xuser/functions/xusergetdefaultaudioendpointutf16.md) |  
| [XUser](../../reference/system/xuser/xuser_members.md) | [XUserRegisterForChangeEvent](../../reference/system/xuser/functions/xuserregisterforchangeevent.md) |  
| [XUser](../../reference/system/xuser/xuser_members.md) | [XUserRegisterForDefaultAudioEndpointUtf16Changed](../../reference/system/xuser/functions/xuserregisterfordefaultaudioendpointutf16changed.md) |  
| [XUser](../../reference/system/xuser/xuser_members.md) | [XUserRegisterForDeviceAssociationChanged](../../reference/system/xuser/functions/xuserregisterfordeviceassociationchanged.md) |  
| [XUser](../../reference/system/xuser/xuser_members.md) | [XUserUnregisterForChangeEvent](../../reference/system/xuser/functions/xuserunregisterforchangeevent.md) |  
| [XUser](../../reference/system/xuser/xuser_members.md) | [XUserUnregisterforDefaultAudioEndpointUtf16Changed](../../reference/system/xuser/functions/xuserunregisterfordefaultaudioendpointutf16changed.md) |  
| [XUser](../../reference/system/xuser/xuser_members.md) | [XUserUnregisterforDeviceAssociationChanged](../../reference/system/xuser/functions/xuserunregisterfordeviceassociationchanged.md) |  
  


## See also

[XThread API reference](../../reference/system/xthread/xthread_members.md)