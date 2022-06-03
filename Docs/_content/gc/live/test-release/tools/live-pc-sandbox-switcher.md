---
title: PC Sandbox Switcher (XblPCSandbox.exe)
description: Command-line tool that helps manage the Xbox Live sandbox on PC.
kindex:
- PC Sandbox Switcher (XblPCSandbox.exe)
- sandbox switcher
ms.topic: conceptual
ms.localizationpriority: medium
author: joannaleecy
ms.author: migreen
ms.date: 03/12/2020
edited: 00/00/0000
security: public
---

# Xbox Live PC Sandbox Switcher (XblPCSandbox.exe)

Xbox Live PC Sandbox Switcher is a command-line tool that helps manage the Xbox Live sandbox on PC.
This Sandbox Switcher can do the following:

* Show the name of the current sandbox.
* Set a sandbox to use.
* Re-launch the Microsoft Store app, the Xbox app, and the Xbox Companion app in sandbox mode.


To use this tool, after installing the Microsoft Game Development Kit (GDK), open a gaming command prompt window and run the tool from there.
This tool is also provided as part of the GDK and `XboxLiveTools.zip`; see [Development tools for Xbox Live](live-tools.md).


### Requirements for running the command

For setting the sandbox, the Sandbox Switcher requires elevated privileges (such as a command prompt that has been started with "Run as administrator").

If the tool is run without elevated privileges, then the tool will attempt to re-run in an elevated state.


### Getting the current sandbox

<pre>
XblPCSandbox /get
</pre>

Gets the current Xbox Live sandbox, if any.


### Showing Help info

<pre>
XblPCSandbox /?
</pre>

Shows the help information, similar to this section.


### Setting the sandbox

<pre>
XblPCSandbox <i>sandbox</i> [/noApps]
</pre>

Sets the Xbox Live sandbox for the device.
For example: `XblPCSandbox XDKS.1`

When setting the sandbox, the Sandbox Switcher always restarts the Xbox Live Auth Manager.

If the Microsoft Store app, the Xbox app, and/or the Xbox Companion app is open, setting the sandbox relaunches the open apps in sandbox mode.
If one of these apps is not open, the Sandbox Switcher doesn't open that app.

**sandbox** The sandbox to set the device to.

**/noApps** Will set the sandbox without opening any system apps. Call 'XBLPCSandbox /apps' to launch the apps in sandbox mode.


#### Switching back to RETAIL

To reset the device to normal, set the sandbox to RETAIL.
For example: `XblPCSandbox RETAIL`

Resetting the sandbox to RETAIL will restart the Xbox Live Auth Manager and relaunch opened system apps (the Microsoft Store app, the Xbox app, and/or the Xbox Companion app) back to normal.

### Launching system apps in sandbox mode

<pre>
XblPCSandbox /apps
</pre>

Will relaunch the Microsoft Store app, the Xbox app, and/or the Xbox Companion app in sandbox mode if they are open.