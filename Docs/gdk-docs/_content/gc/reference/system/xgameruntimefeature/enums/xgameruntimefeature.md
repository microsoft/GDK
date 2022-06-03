---
author: M-Stahl
title: XGameRuntimeFeature
description: Enumerates Gaming Runtime features.
kindex: XGameRuntimeFeature
ms.author: v-denken
ms.topic: reference
edited: 06/10/2019
quality: good
security: public
applies-to: pc-gdk
---

# XGameRuntimeFeature  
  
Enumerates Gaming Runtime features.  
  
## Syntax  
  
```cpp
enum class XGameRuntimeFeature  : uint32_t  
{  
    XAccessibility = 0,  
    XAppCapture = 1,  
    XAsync = 2,  
    XAsyncProvider = 3,  
    XDisplay = 4,  
    XGame = 5,  
    XGameInvite = 6,  
    XGameSave = 7,  
    XGameUI = 8,  
    XLauncher = 9,  
    XNetworking = 10,  
    XPackage = 11,  
    XPersistentLocalStorage = 12,  
    XSpeechSynthesizer = 13,  
    XStore = 14,  
    XSystem = 15,  
    XTaskQueue = 16,  
    XThread = 17,  
    XUser = 18,  
    XError = 19,  
    XGameEvent = 20, 
    XGameStreaming = 21, 
}  
```  
  
## Constants  
  
| Constant | Description |
| --- | --- |
| XAccessibility | Represents the Accessibility feature. For more information, see [XAccessibility](../../xaccessibility/xaccessibility_members.md). |  
| XAppCapture | Represents the AppCapture feature. For more information, see [XAppCapture](../../xappcapture/xappcapture_members.md). |  
| XAsync | Represents the Async feature. For more information about using the Async feature, see [Asynchronous Programming Model](../../../../system/overviews/async-programming-model.md) and [XAsync](../../xasync/xasync_members.md). |  
| XAsyncProvider | Represents the AsyncProvider feature. For more information about using the AsyncProvider feature, see [Asynchronous Programming Model](../../../../system/overviews/async-programming-model.md) and [XAsyncProvider](../../xasyncprovider/xasyncprovider_members.md). |  
| XDisplay | Represents the Display feature. For more information, see [XDisplay](../../xdisplay/xdisplay_members.md). |  
| XGame | Represents the Game feature. For more information, see [XGame](../../xgame/xgame_members.md). |  
| XGameInvite | Represents the GameInvite feature. For more information, see [XGameInvite](../../xgameinvite/xgameinvite_members.md). |  
| XGameSave | Represents the GameSave feature. For more information, see [XGameSave](../../xgamesave/xgamesave_members.md). |  
| XGameUI | Represents the GameUI feature. For more information, see [XGameUI](../../xgameui/xgameui_members.md). |  
| XLauncher | Represents the Launcher feature. For more information, see [XLauncher](../../xlauncher/xlauncher_members.md). |  
| XNetworking | Represents the Networking feature. For more information about using the Networking feature, see [Networking](../../../../networking/gc-networking-toc.md) and [XNetworking](../../../networking/xnetworking/xnetworking_members.md). |  
| XPackage | Represents the Package feature. For more information about using the Package feature, see [Packaging](../../../../packaging/gc-packaging-toc.md) and [XPackage](../../xpackage/xpackage_members.md). |  
| XPersistentLocalStorage | Represents the PersistentLocalStorage feature. For more information about using the PersistentLocalStorage feature, see [Local Storage](../../../../system/overviews/local-storage.md) and [XPersistentLocalStorage](../../xpersistentlocalstorage/xpersistentlocalstorage_members.md).|  
| XSpeechSynthesizer | Represents the SpeechSynthesizer feature. For more information, see [XSpeechSynthesizer](../../xspeechsynthesizer/xspeechsynthesizer_members.md). |  
| XStore | Represents the Store feature. For more information, see [XStore](../../xstore/xstore_members.md). |  
| XSystem | Represents the System feature. For more information, see [XSystem](../../xsystem/xsystem_members.md). |  
| XTaskQueue | Represents the TaskQueue feature. For more information about using the TaskQueue feature, see [Async Task Queue Design](../../../../system/overviews/async-task-queue-design.md) and [XTaskQueue](../../xtaskqueue/xtaskqueue_members.md). |  
| XThread | Represents the Thread feature. For more information, see [XThread](../../xthread/xthread_members.md). |  
| XUser | Represents the User feature. For more information, see [XUser](../../xuser/xuser_members.md). |  
| XError | Represents the Error feature. For more information, see [XError](../../xerror/xerror_members.md). |  
| XGameEvent | Represents the GameEvent feature. |  
| XGameStreaming | Represents the GameStreaming feature. For more information, see [XGameStreaming](../../xgamestreaming/xgamestreaming_members.md) |
  
## Remarks
  
This enumeration is used by the [XGameRuntimeIsFeatureAvailable](../functions/xgameruntimeisfeatureavailable.md) function to specify a Gaming Runtime feature.
  
The following example uses the **XGameRuntimeIsFeatureAvailable** function to check whether the Async, AsyncProvider, and TaskQueue features are available. All three features are necessary for using task queues to run asynchronous tasks.  
  
```cpp
// Confirm that all of the features needed to run asynchronous tasks on 
// task queues are available.
bool Game::CheckAsyncTaskQueueFeatures()
{
    
    return (XGameRuntimeIsFeatureAvailable(XGameRuntimeFeature::XTaskQueue) &&
        XGameRuntimeIsFeatureAvailable(XGameRuntimeFeature::XAsyncProvider) &&
        XGameRuntimeIsFeatureAvailable(XGameRuntimeFeature::XAsync));

}
```

  
## Requirements  
  
**Header:** XGameRuntimeFeature.h
  
**Supported platforms:** Windows, Xbox One family consoles and Xbox Series consoles  
  
## See also  
[Gaming Runtime Glossary](../../../../system/overviews/gaming-runtime-glossary.md)  
[XGameRuntimeFeature](../xgameruntimefeature_members.md)  
[XGameRuntimeIsFeatureAvailable](../functions/xgameruntimeisfeatureavailable.md)  
  