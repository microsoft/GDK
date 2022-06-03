---
author: M-Stahl
title: Framework Packages - automatic dependency installation for common software redistributables
description: Describes how titles can declare dependencies on common software redistributables that can automatically be installed by the Microsoft Store as part of title download and installation.
kindex: Framework Packages
ms.author: brianhud
ms.topic: conceptual
edited: '08/01/2019'
security: public
---

# Framework package dependencies  

If your app has been relying on some redistributable software that's available in the Microsoft Store as a framework package, instead of chain-installing the redistributable, you can declare a dependency on the framework package. However, don't use this if the Microsoft Store has no framework package available for your dependent redistributable. Instead, consider custom installation actions.



## Details

* Develop your app in the normal way by referencing export libraries for the required redistributable.

* Instead of bundling the dependent redistributable with your app, update your manifest to declare the dependency on the relevant framework package.

* When the user installs your app from the Microsoft Store, it detects the dependency and ensures that the framework package is made available to the app.

  If the framework package is already installed on the user’s device, no further action is necessary. Otherwise, the Microsoft Store triggers the installation of the framework package before proceeding with the installation for the app that uses it.

* An x86 build of an app uses an x86 build of the framework package. An x64 build of the app uses an x64 build of the framework package. You don't need to do anything to specify the architecture. The platform takes care of that for you.



## DirectX runtime

This framework package provides various side-by-side optional components from the legacy DirectX SDK. If your application makes use of the deprecated Direct3D utility libraries D3DX9, D3DX10, or D3DX11, XAudio 2.7, XInput 1.3, or XACT, then this package can be used to deploy those deprecated DLLs for your packaged Win32 desktop application.  Please see [this blog post](https://aka.ms/dxsetup) for more background on these components.
> [!NOTE]
> The vast majority of titles which use DirectX do NOT actually need this 'legacy DirectX SDK' framework package dependency.

```
D3DCompiler_33.dl - D3DCompiler_43.dll
d3dcsx_42.dll, d3dcsx_43.dll
d3dx10.dll, d3dx10_33.dll - d3dx10_43.dll
d3dx11_42.dll, d3dx11_43.dll
d3dx9_24.dll - D3DX9_43.dll
```

```
x3daudio1_0.dll - X3DAudio1_7.dll
xactengine2_0.dll - xactengine2_9.dll
xactengine3_0.dll - xactengine3_7.dll
XAPOFX1_0.dll - XAPOFX1_5.dll
XAudio2_0.dll - XAudio2_7.dll
```

```
xinput1_1.dll - xinput1_3.dll
```

Alternatively, you can update your application to remove [legacy DirectX SDK](/windows/win32/directx-sdk--august-2009-) dependencies.

* For **XAudio2**, the best option is to upgrade to XAudio 2.9 using the headers in the Windows 10 SDK. For Windows 10, XAudio 2.9, X3DAudio, and XAPOFX are all built in the operating system. For your non-Store versions, you can make use of [XAudio2Redist](https://aka.ms/XAudio2Redist) which has a simple application-local redistributable that supports XAudio2.9 on Windows 7 SP1 or later. This both simplifies deployment, and addresses numerous known bugs with legacy XAudio 2.7. See [Microsoft Docs](/windows/win32/xaudio2/xaudio2-versions).

* For **XInput**, the best option is to use XInput 1.4 using the headers in the Windows 10 SDK. For Windows 10, XInput 1.4 is included in the operating system. For your non-Store versions, you can make use of XInput 9.1.0 which is included in the operating system all the way back to Windows Vista. See [this blog post](https://aka.ms/Mu9kn7).

> Use of legacy XInput 1.3 is strongly discouraged as it has known security issues. The version in the Framework Package has been updated to mitigate this issue as well as updating to SHA-256 codesigning, but the original legacy DirectX End-User Runtime package is unchanged.

* For **Direct3D 10** (``d3dx10``), the best option is to upgrade to Direct3D 11. See [Microsoft Docs](/windows/win32/direct3d11/d3d11-programming-guide-migrating).

* For **Direct3D 11** (``d3dx11``), see [this blog post](https://aka.ms/Kfsdiu) for various replacements for legacy D3DX for Direct3D 11.

> For older titles, you can also consider using the [Microsoft.DXSDK.D3DX](https://www.nuget.org/packages/Microsoft.DXSDK.D3DX) NuGet package which provides the June 2010 versions of D3DX9, D3DX10, and D3DX11 with a side-by-side license. These redistributable DLLs are also SHA-256 code-signed.

* For the **HLSL compiler** (``D3DCompiler``), you can use the latest version in the Windows 10 SDK. For Windows 10, this is included in the operating system. For your non-Store versions, you can include the ``D3DCompiler_47.dll`` with your game as a simple application-local file . See [this blog post](https://aka.ms/Tuoxjd).

> ![alert](../../../resources/gamecore/images/en-us/common/note.gif) Note, neither this framework package nor the legacy DirectX End-User Redistributable modify the DirectX Runtime in any way.

Example ``MicrosoftGame.config`` snippet:

```xml
<Game>

  <DependencyList>
    <KnownDependency Name="DX11"/>
  </DependencyList>

</Game>
```

There are two ways to get the DirectX Framework package onto a development or test machine.

1. Download from the Microsoft Downloads site and double click the Appx files to install (recommended). [DirectX x86 framework package](https://aka.ms/directx_x86_appx), [DirectX x64 framework package](https://aka.ms/directx_x64_appx)
1. Enter the following link from the Run app to acquire a DirectX sample app that installs the DirectX framework dependency package.  (Note: This only works for machines in the RETAIL development sandbox, and this will only install the x64 platform flavor if you are on an x64 platform machine): ms-windows-store://pdp/?productid=9MTF6XHMN17Z

> ![alert](../../../resources/gamecore/images/en-us/common/note.gif) The DirectX Framework package does not install these DLLs into the System32 folder. They are in the search path for your packaged application at runtime. If you are making use of explicit linking, do not use the  ``LoadLibraryEx`` flags ``LOAD_LIBRARY_SEARCH_SYSTEM32`` or ``LOAD_LIBRARY_SEARCH_APPLICATION_DIR`` to load these legacy DirectX libraries.

> The 9.29.1974.0 version of this framework package includes SHA-256 codesigned payload DLLs, as well as a security fix for XInput 1.3.

## Visual Studio C++ runtime

In the specific case of the C/C++ runtime, the traditional redistributable form and the framework package form aren't always identical. Traditional non-Microsoft Store apps have always used the traditional redistributable form.

__Visual C/C++ version__	| __Recommendation__ | __Download link for the APPX framework package__
--- | --- | --- | ---
2015, 2017, 2019 | The traditional redistributable and framework package forms are identical, and you can choose either. However, we recommend using framework packages as a best practice. | [VC 14.0 framework packages for Desktop Bridge](https://aka.ms/Microsoft.VCLibs.x64.14.00.Desktop.appx)
2013 | MSIXVC-packaged apps must use the framework version. If they don't, some APIs might behave unexpectedly. | [VC 12.0 framework packages for Desktop Bridge](https://www.microsoft.com/download/details.aspx?id=53176)
2012 | MSIXVC-packaged apps must use the framework version. If they don't, some APIs might behave unexpectedly. | [VC 11.0 framework packages for Desktop Bridge](https://www.microsoft.com/download/details.aspx?id=53340)
2010 and earlier	| MSIXVC-packaged apps should incorporate the loose files from the traditional redistributable into the appropriate subfolder within the app’s folder. For these versions, neither the traditional redistributable nor the framework package should be used. | Not applicable

The previously mentioned installers place the necessary framework packages in the following _Extension SDKs_ folder:<br/> %PROGRAMFILES(X86)%\Microsoft SDKs\Windows Kits\10\ExtensionSDKs

Make sure to sideload the version that corresponds to the architecture of your app: x86 or x64.

To test your package and its framework dependencies locally, identify the version of Visual Studio that your application was built with, sideload the corresponding APPX framework packages, and then register your app.

See [Microsoft Docs](/troubleshoot/cpp/c-runtime-packages-desktop-bridge) for more information.



### Visual Studio 2012

The following is an example manifest entry for the Visual Studio 2012 VCLibs framework package v11.

```xml
  <DependencyList>
        <KnownDependency Name="VC11"/>
  </DependencyList>
```

To sideload this framework package

* __x86:__<br/>

  1. Locate the framework package:<br/>

      C:\Program Files (x86)\Microsoft SDKs\Windows Kits\10\ExtensionSDKs\Microsoft.VCLibs.Desktop.110\14.0\Appx\Retail\x86\Microsoft.VCLibs.x86.11.00.Desktop.appx

  2. Double-click it to install, or run the following Windows PowerShell command:

      `add-appxpackage "C:\Program Files (x86)\Microsoft SDKs\Windows Kits\10\ExtensionSDKs\Microsoft.VCLibs.Desktop.110\14.0\Appx\Retail\x86\Microsoft.VCLibs.x86.11.00.Desktop.appx"`

* __x64:__<br/>

  1. Locate the framework package:<br/>

      C:\Program Files (x86)\Microsoft SDKs\Windows Kits\10\ExtensionSDKs\Microsoft.VCLibs.Desktop.110\14.0\Appx\Retail\x64\Microsoft.VCLibs.x64.11.00.Desktop.appx

  2. Double-click it to install, or run the following Windows PowerShell command:

      `add-appxpackage "C:\Program Files (x86)\Microsoft SDKs\Windows Kits\10\ExtensionSDKs\Microsoft.VCLibs.Desktop.110\14.0\Appx\Retail\x64\Microsoft.VCLibs.x64.11.00.Desktop.appx"`



### Visual Studio 2013

The following is an example manifest entry for the Visual Studio 2012 VCLibs framework package v12.

```xml
  <DependencyList>
        <KnownDependency Name="VC12"/>
  </DependencyList>
```

To sideload this framework package

* __x86:__<br/>

    1. Locate the framework package:<br/>

        C:\Program Files (x86)\Microsoft SDKs\Windows Kits\10\ExtensionSDKs\Microsoft.VCLibs.Desktop.120\14.0\Appx\Retail\x86\Microsoft.VCLibs.x86.12.00.Desktop.appx

    2. Double-click it to install, or run the following Windows PowerShell command:

        `add-appxpackage "C:\Program Files (x86)\Microsoft SDKs\Windows Kits\10\ExtensionSDKs\Microsoft.VCLibs.Desktop.110\14.0\Appx\Retail\x86\Microsoft.VCLibs.x86.11.00.Desktop.appx"`

* __x64:__<br/>

  1. Locate the framework package:<br/>

      C:\Program Files (x86)\Microsoft SDKs\Windows Kits\10\ExtensionSDKs\Microsoft.VCLibs.Desktop.120\14.0\Appx\Retail\x64\Microsoft.VCLibs.x64.12.00.Desktop.appx

  2. Double-click it to install, or run the following Windows PowerShell command:

      `add-appxpackage "C:\Program Files (x86)\Microsoft SDKs\Windows Kits\10\ExtensionSDKs\Microsoft.VCLibs.Desktop.120\14.0\Appx\Retail\x64\Microsoft.VCLibs.x64.12.00.Desktop.appx"`



### Visual Studio 2015, 2017 and 2019

The following is an example manifest entry for the Visual Studio 2015, Visual Studio 2017 or Visual Studio 2019 VCLibs framework package v14.

```xml
  <DependencyList>
        <KnownDependency Name="VC14"/>
  </DependencyList>
```

To sideload this framework package

* __x86:__<br/>
  1. Locate the framework package:<br/>

      C:\Program Files (x86)\Microsoft SDKs\Windows Kits\10\ExtensionSDKs\Microsoft.VCLibs.Desktop\14.0\Appx\Retail\x86\Microsoft.VCLibs.x86.14.00.Desktop.appx

  2. Double-click it to install, or run the following Windows PowerShell command:

      `add-appxpackage "C:\Program Files (x86)\Microsoft SDKs\Windows Kits\10\ExtensionSDKs\Microsoft.VCLibs.Desktop\14.0\Appx\Retail\x86\Microsoft.VCLibs.x86.14.00.Desktop.appx"`

* __x64:__<br/>
  1. Locate the framework package:<br/>

      C:\Program Files (x86)\Microsoft SDKs\Windows Kits\10\ExtensionSDKs\Microsoft.VCLibs.Desktop\14.0\Appx\Retail\x64\Microsoft.VCLibs.x64.14.00.Desktop.appx

  2. Double-click it to install, or run the following Windows PowerShell command:

      `add-appxpackage "C:\Program Files (x86)\Microsoft SDKs\Windows Kits\10\ExtensionSDKs\Microsoft.VCLibs.Desktop\14.0\Appx\Retail\x64\Microsoft.VCLibs.x64.14.00.Desktop.appx"`


Remember that the VS 2015 Update 3, VS 2017, and VS 2019 all use the same REDIST, with the VS 2019 (16.8) release being the latest one. See [Microsoft Docs](/cpp/porting/binary-compat-2015-2017) for more information.


## Local testing

After you've included the references to the appropriate manifest and sideloaded the APPX framework package, install the loose build version of your app by using the following command:<br/>
`WdApp.exe register loose_build_path`

This ensures that your app is installed and referencing the proper framework. Now run your app from its tile in the Start menu, and then perform the necessary testing and validation steps for your app.

After you have completed testing in the sideload configuration, create an MSIXVC package by using the instructions in the [Getting started with packaging titles for a PC by using the MSIXVC packaging tools](overviews/packaging-getting-started-for-PC.md) topic.

For more details, see the
[Using Visual C++ Runtime in Centennial project](https://blogs.msdn.microsoft.com/vcblog/2016/07/07/using-visual-c-runtime-in-centennial-project/) blog post.
