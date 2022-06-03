---
author: aablackm
title: DebugEnable
description: Enables or disables debugging for the app package with the specified package moniker.
ms.assetid: M:Windows.Xbox.xtfapplication.IXtfApplicationClient.DebugEnable(LPCWSTR,BOOL)
kindex:
- DebugEnable method
- IXtfApplicationClient--DebugEnable method
ms.author: stevenpr
ms.topic: reference
edited: 06/05/2019
security: public
---

# IXtfApplicationClient::DebugEnable
  
Enables or disables debugging for the app package with the specified package moniker.  
  
<a id="syntaxSection"></a>
  
## Syntax
  
```cpp
public:
HRESULT DebugEnable(
         LPCWSTR pszPackageMoniker,
         BOOL fEnable
)  
```
  
<a id="parametersSection"></a>
  
### Parameters
  
*pszPackageMoniker*  
Type: LPCWSTR  
  
A pointer to the package moniker for the app.  
  
*fEnable*  
Type: BOOL  
  
Specify TRUE to enable debugging, or FALSE to disable debugging.  
  
<a id="retvalSection"></a>
  
### Return value
  
Type: HRESULT  
  
Returns `S_OK` if successful; otherwise, returns an HRESULT error code.  
  
<a id="remarksSection"></a>
  
## Remarks
  > [!NOTE]
> This method applies only to Xbox One Software Development Kit\ERA titles. Invoking this method has no effect on Microsoft Game Development Kit (GDK) titles.  
  
This method enables or disables debugging for the app package with the package moniker specified in `pszPackageMoniker`, respectively setting or clearing the debug flag for that package.  
  > [!NOTE]
> You should set the debug flag for a package only when that package is not running. Setting the debug flag on a running package can yield unpredictable results.  
  
Setting the debug flag for an app package has the following effects for all apps in the app package:  
  
* The app is not terminated if it takes longer than 45 seconds to complete activation.  
* The app is not terminated if it takes too long to suspend. The limit is 1 second for an exclusive app, or 5 seconds for a shared app.  
* The app is not suspended after losing visibility for too long. The limit is 10 minutes for exclusive apps, or 5 seconds for shared apps.  
* To suspend the app, either invoke the [xbapp suspend (NDA topic)](../../../../../../../tools-console/xbox-tools-and-apis/commandlinetools/xbapp.md#xbapp_suspend) command or invoke the [IXtfApplicationClient::Suspend](suspend-ixtfapplicationclient-xtfapplication-xbox-windows-.md) function.  
* When your app is in debug mode, it is not subject to normal Process Lifetime Management (PLM) limits, and will suspend or resume only when you direct it to do so using Xbox Tools Framework (XTF) tools.  
  > [!NOTE]
> In debug mode, your app can be suspended in states where the normal PLM process would not cause it to be suspended, such as when it is visible. Use caution when testing suspend and resume behavior while your app is running in debug mode, to ensure that you're testing normal behavior and not the effects of running in debug mode.  
  
Clearing the debug flag for an app package has the following effects for apps in the app package:  
  
* The app is terminated if it takes longer than 45 seconds to complete activation.  
* The app is terminated if it takes too long to suspend. The limit is 1 second for an exclusive app, or 5 seconds for a shared app.  
* The app is suspended after losing visibility for too long. The limit is 10 minutes for exclusive apps, or 5 seconds for shared apps.  
  
The state of the debug flag applies on a package-wide basis. If you have multiple apps in a single package with the debug flag set, then all of the apps will run in debug mode.  
  
Rebooting your dev kit clears the debug flag.  
  
Running your app from Visual Studio with the debugger attached to the app process, by pressing F5 (**Debug > Start Debugging**), automatically sets the debug flag before your app runs, and clears the flag after the app terminates. Running your app without attaching the debugger to the app process, by pressing Ctrl+F5 (**Debug > Start Without Debugging**), clears the debug flag before your app runs, and the flag remains clear after your app terminates. If your app crashes in debug mode and Visual Studio is attached to your app, then Visual Studio clears the debug flag when it is detached from your app.  
  
The debug flag state remains set in the following situations:  
  
* If the app crashes, as long as the Visual Studio debugger is not attached at the time.  
* Through a suspend and resume operation.  
* Through a termination, as long as the Visual Studio debugger is not attached at the time.  
  
For more information about game life cycle states, see [Xbox Game Life Cycle (NDA topic)](../../../../../../../system/overviews/xbox-game-life-cycle.md).  
  
<a id="requirementsSection"></a>
  
## Requirements
  
**Header:** xtfapplication.h  
  
**Library:** xtfapplication.lib  
  
**Supported platforms:** Windows (for Xbox console tools)  
  
<a id="seealsoSection"></a>
  
## See also
  
[IXtfApplicationClient](../ixtfapplicationclient-xtfapplication-xbox-microsoft-t.md)  
[XtfApplication](../../../xtfapplication-xbox-microsoft-n.md)  
  