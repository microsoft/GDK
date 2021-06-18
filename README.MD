

# Microsoft Game Development Kit (GDK)

The Microsoft Game Development Kit (GDK) contains the *common* tools, libraries, and documentation needed to build games for the [Xbox App on Windows 10]( https://www.xbox.com/en-US/apps/xbox-app-for-windows-10), [Xbox Game Pass for PC]( https://www.xbox.com/en-US/xbox-game-pass/pc-games?OCID=AID2100895_SEM_64cb82c395a51ebbffc2e27408836bc1:G:s&ef_id=64cb82c395a51ebbffc2e27408836bc1:G:s&msclkid=64cb82c395a51ebbffc2e27408836bc1), Xbox consoles (Xbox Series X|S, Xbox One), and [Xbox Game Pass cloud gaming]( https://www.xbox.com/en-US/xbox-game-pass/cloud-gaming).

You can obtain the latest release of the GDK on GitHub here: https://aka.ms/gdk. 

-	Prior to this public release, the GDK was only available to developers under confidential licenses within an Xbox developer program.  
-	The GDK is now available to all developers free of charge, to help developers *learn how to build* games for the Xbox App on Windows and Game Pass; no license required for learning.
-	Additional licensing is required to obtain the Xbox Extensions to build games optimized for Xbox consoles or *publish* games to the Microsoft catalog for any platform.
-	More information can be found in our GDK public documentation (http://aka.ms/gamedevdocs) 


<br>
<p align="center">
<img src="https://github.com/microsoft/GDK/blob/Main/README/GDK_vs_GDKX.png" alt="GDK vs. GDKX Comparison Table" align="center" width=480>
</p>
</br>


-----

## When to use the GDK

Windows game development has a history going back 40+ years which means that there have been and still are many options to build games that reach gamers on PC.  The GDK is an evolution to the Win32 legacy, to unify the app model between Xbox consoles, Windows PCs, and now Cloud Gaming to enable game developers to reach even more gamers on more devices, with less effort.  Microsoft Gaming Services are agnostic across many ecosystems and the GDK is sharing the app model across MILLIONS of devices.

### **Q:  How do I build next-generation games for the Xbox App on Windows 10 and Xbox Game Pass for PC?**

-	[Get started setting up your developer environment here!](https://review.docs.microsoft.com/en-us/gaming/gdk/_content/gc/getstarted/dev-pc-setup?branch=main)
-	[Win32 + GDK]( https://developer.microsoft.com/en-us/games/xbox/docs/gdk/introduction) is the primary, supported app model to build games for Xbox console, Xbox Game Pass (both Xbox and PC), and [Xbox Game Streaming]( https://developer.microsoft.com/en-us/games/products/project-xcloud/)**.
-	Key Feature is that only Win32 + GDK fully supports all Microsoft Gameplay Services (Xbox Live identity, multiplayer, chat, leaderboards, achievements, commerce, etc.), and is *required for Xbox Game Pass(**) on both console and PC.*
-	For developers building Win32 games on PC today, Win32 + GDK builds on the Win32 C/C++ programming models to unify development across Xbox consoles and Windows 10 PCs with the Microsoft Game Development Kit ([GDK](https://aka.ms/gdk)).
-	**Requires software and licensing which only available via an NDA Xbox program (e.g. ID@Xbox program).

### **Q:  How do I run a GDK game built for the Xbox App on Windows 10 or Xbox Game Pass for PC on Xbox Consoles?**

-	You need to download and install the GDKX.  Xbox console development requires the GDKX (Microsoft Game Development Kit with Xbox Extensions).  Games will need to retarget and rebuild for Xbox One or Xbox Series X|S with the GDKX installed.  
-	The GDKX is currently only available under confidential license within an NDA Xbox program (e.g. ID@Xbox).
-	The GDKX is just a bundled installer of the GDK + Xbox Extensions. Building a game with the GDK shares around ~80% of the same interfaces, but does not include the Xbox environment APIs and tools included in the Xbox Extensions.
-	The primary difference between games built with the GDK and the GDKX is the interaction with the Xbox graphics driver and DirectX12 Shader Compiler. 
-	For developers building Xbox One games today, Win32 + GDK is a direct replacement for the WinRT-based Exclusive Resource Application (ERA) app model using the [XDK]( https://docs.microsoft.com/en-us/gaming/xbox-live/get-started/setup-ide/managed-partners/vstudio-xbox/live-where-to-get-xdk), introduced on Xbox One; Xbox 360 developers similarly migrated to ERA in 2013.


### **Q: How does the GDK compare to the Microsoft Universal Windows Platform (UWP)?**

-	[The Universal Windows Platform]( https://docs.microsoft.com/en-us/windows/uwp/gaming/e2e) was introduced in 2015 for Windows 10 as a bridge between all the devices in the Windows family (Windows Phone, Surface, Windows PCs, and Xbox One*).
-	Key feature for is open development and self-publishing to [Windows Mixed Reality (MR)](https://developer.microsoft.com/en-us/mixed-reality/) or the Microsoft Store on Windows 10 PCs and Xbox; particularly well suited for interactive media applications.
-	For developers building Win32 games today, UWP requires porting to the [WinRT programming model]( https://docs.microsoft.com/en-us/windows/uwp/cpp-and-winrt-apis/intro-to-using-cpp-with-winrt)*.
-	UWP apps and games are community-supported only; partners inside Xbox managed programs (Xbox, Xbox Game Pass, Xbox Game Streaming) should use Microsoft Win32 + GDK.

<br></br>
-----



