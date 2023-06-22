

# Microsoft Game Development Kit (GDK)

**The Microsoft Game Development Kit (GDK) contains the *common* tools, libraries, and documentation needed to build games for [Xbox Game Pass for PC on Windows 10/11]( https://www.xbox.com/en-US/xbox-game-pass/pc-games?OCID=AID2100895_SEM_64cb82c395a51ebbffc2e27408836bc1:G:s&ef_id=64cb82c395a51ebbffc2e27408836bc1:G:s&msclkid=64cb82c395a51ebbffc2e27408836bc1), Xbox consoles (Xbox Series X|S, Xbox One), and [cloud gaming with Xbox Game Pass Ultimate]( https://www.xbox.com/en-US/xbox-game-pass/cloud-gaming).**


## News (Updated 2023.03.16)

 - 06/22: **Latest Version:** [**June 2023 2023 GDK**] (updates to older branches may appear newer in the [RELEASES](https://github.com/microsoft/GDK/releases) section than the most recent major release).

-----

## General Info (Updated June 2021)

**How to Install**
 - Download. The recommended method is to go to the [Releases](https://github.com/microsoft/GDK/releases) page and pick the latest and greatest. Alternatively, you can pick the branch that fits your needs and clone or download that branch.
 - Install. Run PGDK.EXE to launch the install wizard. If you have a previous version of the GDK you may need to uninstall that first.

-----

**Docs & Downloads**
- GDK documentation is here on docs.microsoft.com (DMC):  https://aka.ms/gamedevdocs
- (New) Check out the Xbox public sample repository: https://github.com/microsoft/Xbox-GDK-Samples/
- Latest release of the GDK on GitHub: https://github.com/microsoft/GDK/releases

-----

## What is in the GDK? (Updated October 2021)

*Note for Xbox Developers:  A version of the GDK with Xbox Extensions (GDKX) to target Xbox consoles is only available to licensed partners in a managed program (https://aka.ms/gdkdl).*

 - The GDK is intended for developers learning about and onboarding into the Xbox ecosystem to build [Win32](https://docs.microsoft.com/en-us/windows/win32/) games for PC Game Pass on Windows 10/11.
-	Prior to this public release, the GDK was only available to developers under confidential licenses within an Xbox developer program.  
-	The GDK is now available to all developers free of charge, to help developers *learn how to build* games for the Xbox App on Windows and Game Pass; no license required for learning.
-	Additional licensing is required to obtain the Xbox Extensions to build games optimized for Xbox consoles or *publish* games to the Microsoft catalog for any platform.
- The GDK is not for use to self-publish through the [Xbox Creators Program](https://www.xbox.com/developers/creators-program) which is currently based on the Universal Windows Platform (UWP). 
-	More information can be found in our GDK public documentation (http://aka.ms/gamedevdocs) 


<br>
<p align="center">
<img src="https://github.com/microsoft/GDK/blob/Main/README/GDK_vs_GDKX.png" alt="GDK vs. GDKX Comparison Table" align="center" width=1080>
</p>
</br>


-----

## When to use the GDK (Updated October 2021)

Game development on Microsoft platforms has a history going back 40+ years which means that there have been and still are many options to build games that reach gamers on PC.  The GDK is an evolution to the Win32 legacy, to unify the app model between Xbox consoles, Windows PCs, and now Cloud Gaming to enable game developers to reach even more gamers on more devices, with less effort.  Microsoft Gaming Services are agnostic across many ecosystems and the GDK is sharing the app model across MILLIONS of devices.

### Q:  How do I build next-generation games for the Xbox App on Windows 10 and Xbox Game Pass for PC?

-	[Get started setting up your developer environment here!](https://docs.microsoft.com/gaming/gdk/_content/gc/getstarted/dev-pc-setup)
-	Using [Win32 + GDK](https://docs.microsoft.com/gaming/gdk/_content/gc/get-started-with-pc-dev/overviews/gr-getting-started) is the primary, supported app model to build games for Xbox console, Xbox Game Pass (both Xbox and PC), and [Xbox Game Streaming]( https://developer.microsoft.com/en-us/games/products/project-xcloud/)**.
-	Key Feature is that only Win32 + GDK fully supports all Microsoft Gameplay Services (Xbox Live identity, multiplayer, chat, leaderboards, achievements, commerce, etc.), and is *required for Xbox Game Pass(1) on both console and PC.*
-	[For developers building Win32 games on PC today](https://docs.microsoft.com/gaming/gdk/_content/gc/get-started-with-pc-dev/test-your-installation/gr-add-to-existing-project), Win32 + GDK builds on the Win32 C/C++ programming models to unify development across Xbox consoles and Windows PCs with the Microsoft Game Development Kit ([GDK](https://aka.ms/gdk)).

**(1) Requires software and licensing which only available via an NDA Xbox program (e.g. ID@Xbox program).**

### Q:  How do I run a GDK game built for the Xbox App on Windows 10 or Xbox Game Pass for PC on Xbox Consoles?

-	Xbox console development requires the “Microsoft Game Development Kit with Xbox Extensions (GDKX)”.  Games will need to retarget and rebuild for Xbox One or Xbox Series X|S with the GDKX installed.  
-	You need to download, install, and retarget your project for Xbox consoles using the GDKX
-	The GDKX is currently only available under confidential license within an NDA Xbox program (e.g. ID@Xbox).
-	The GDKX is just a bundled installer of the GDK + Xbox Extensions. Building a game with the GDK shares around ~80% of the same interfaces, but does not include the Xbox environment APIs and tools included in the Xbox Extensions.
-	The primary difference between games built with the GDK and the GDKX is the interaction with the Xbox graphics driver and DirectX12 Shader Compiler. 
-	For developers building Xbox One games today, Win32 + GDK is a direct replacement for the WinRT-based Exclusive Resource Application (ERA) app model using the [XDK]( https://docs.microsoft.com/en-us/gaming/xbox-live/get-started/setup-ide/managed-partners/vstudio-xbox/live-where-to-get-xdk), introduced on Xbox One; Xbox 360 developers similarly migrated to ERA in 2013.


### Q: How does the GDK compare to the Microsoft Universal Windows Platform (UWP)?

-	[The Universal Windows Platform]( https://docs.microsoft.com/en-us/windows/uwp/gaming/e2e) was introduced in 2015 for Windows 10 as a bridge between all the devices in the Windows family (Windows Phone, Surface, Windows PCs, and Xbox One*).
-	Key feature for is open development and self-publishing to [Windows Mixed Reality (MR)](https://developer.microsoft.com/en-us/mixed-reality/) or the Microsoft Store on Windows 10 PCs and Xbox; particularly well suited for interactive media applications.
-	For developers building Win32 games today, UWP requires porting to the [WinRT programming model]( https://docs.microsoft.com/en-us/windows/uwp/cpp-and-winrt-apis/intro-to-using-cpp-with-winrt)*.
-	UWP apps and games are community-supported only; partners inside Xbox managed programs (Xbox, Xbox Game Pass, Xbox Game Streaming) should use Microsoft Win32 + GDK.

<br></br>
-----

## How the GDK is released (Updated June 2021)

In the “When to use the GDK” section above, we cover the scenarios for which the GDK was designed to provide a modern app model that flows across Xbox consoles, Windows PCs, and Cloud Gaming.

In this section, we cover some of the more practical, basic questions that are also answered in the documentation, but come up frequently from developers getting started with this app model.


### Q:  What is the public GDK release schedule?

-	Three major GDK release branches a year with a mix of new features and fixes (flexibly April, June, and October to align with game development cycles).
-	GDK updates can release in parallel as needed, on separate branches, focused on reliability, stability, and fixes.  Developers can take updates vs. another major version to reduce churn and risk of breaking changes affecting compatibility (e.g. April Update #1, April Update #2, April Update #3, June Update #1, etc).


### Q:  Where are detailed public release notes published?

-	A public version of the release notes that does not contain confidential information about Xbox console features is under development.
-	A full version of the release notes with public + confidential information is available as part of the GDKX release and will be available for the public GDK sometime after June 2021; they will be published to the GitHub repo (http://aka.ms/gdk) 


### Q:  What are some of key elements missing in the GDK that is needed to build games for Xbox consoles?

-	The Xbox developer environment APIs and Tools required to target and build games that run on Xbox consoles, currently only bundled as the GDKX installer package.
-	The Xbox graphics driver and related DirectX 12 components (e.g. Shader Compiler) required to build binaries that work with proprietary Xbox hardware and software interfaces.
-	The corresponding confidential documentation for Xbox environment APIs and Tools; though some topics are only discoverable with access to the GDKX, most topics are available as public docs (~60%) or are discoverable via the table of contents as a redirect to the confidential documentation libraries (~35%).  


### Looking for related resources to build and publish to Xbox consoles with the GDK**X**?

- Xbox console development is limited to licensed partners inside managed development programs, such as [ID@Xbox](https://www.xbox.com/en-us/Developers/id)
-	License and login required - GDKX (confidential program downloads): https://aka.ms/gdkdl
-	License and login required - GDKX Documentation (secure): https://aka.ms/gdkxdocs 
- License and login required - Xbox Developer Forums: https://forums.xboxlive.com 
