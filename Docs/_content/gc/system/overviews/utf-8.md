---
author: M-Stahl
title: UTF-8 support in the Microsoft Game Development Kit (GDK)
description: Provides an overview of UTF-8 support in the Microsoft Game Development Kit (GDK).
kindex: utf-8
ms.author: mbattist
ms.topic: conceptual
edited: '08/04/2020'
security: public
---

# UTF-8 support in the Microsoft Game Development Kit
   
  
This topic provides an overview of UTF-8 support in the Microsoft Game Development Kit (GDK).
      
   *  [Overview](#ID4EXB)  
   *  [-A vs. -W APIs](#ID4E4C)  
   *  [Console code page](#ID4E1D)  
   *  [Windows PC code page](#ID4EQE)
   *  [MultiByteToWideChar/WideCharToMultiByte](#ID4EFAAE)
   *  [ICU for advanced UTF-8 and globalization support](#ID4E4F)
   *  [Support for earlier versions of Windows](#ID4EFAAD)

 
<a id="ID4EXB"></a>

   

## Overview
   
  
UTF-8 is the universal code page for internationalization and supports all Unicode code points by using 1&ndash;4 byte variable-width encoding. It's widely used on the web and competing platforms, such as Unix-based systems, that operate by default in UTF-8. By operating in UTF-8, you can ensure maximum compatibility in international scenarios and data interchange with minimal effort and test burden.
   
Windows operates natively in UTF-16 (or `WCHAR`), which requires code page conversions by using `MultiByteToWideChar` and `WideCharToMultiByte`. This is a unique burden that Windows places on code that targets multiple platforms. Even more challenging is the Windows concept of an ANSI code page that can differ by region and user configuration and can result in wildly inconsistent behavior when relied on incorrectly.
  
The Microsoft Game Development Kit (GDK) and Windows in general are moving forward to support UTF-8 to remove this unique burden of Windows on code targeting or interchanging with multiple platforms and the web. Also, this results in fewer internationalization issues in apps and games and reduces the test matrix that's required to get it right.

 
<a id="ID4E4C"></a>

   

## -A vs. -W APIs  
   
  
Win32 APIs often offer -A and -W variants. *-A variants* honor the ANSI code page that's configured on the system and deal with char&#42;. _-W variants_ operate in UTF-16 and deal with `WCHAR`.

Until recently, -A APIs were considered legacy because Windows has been promoting "Unicode" -W variants for decades. However, in recent releases, Windows has used the ANSI code page and -A APIs to introduce UTF-8 support on newer SKUs. If the ANSI code page is configured to UTF-8, -A APIs operate in UTF-8. This model has the benefit of supporting existing code that's built with -A APIs without requiring any code changes.

With the Microsoft Game Development Kit (GDK), UTF-8 is the default and only ANSI code page on console. -A APIs on console will always operate in UTF-8 and is the set of APIs that we recommend to call for maximum portability. -W APIs are also provided for source compatibility with existing Windows code (perhaps from an existing Windows PC version of a game being carried forward).


  
<a id="ID4E1D"></a>

   

## Console code page 
   
  
UTF-8 is the default and only code page on console, so we recommend -A APIs to take full advantage of that.

   
<a id="ID4EQE"></a>

   

## Windows PC code page  
   
  
For compatibility reasons, the default ANSI code page on Windows PC will remain legacy (it varies among regions and user configurations). This imposes a burden on you if you're targeting Windows PC and console and then must consider code page conversions and the test matrix that's needed to get it right.

To mitigate this, Windows introduced a means to force a process to opt-in to UTF-8 as the process code page, regardless of what the system code page is. This can be achieved by using the `appxmanifest` for packaged apps or the fusion manifest for unpackaged apps with the `ActiveCodePage` property. For more information, see the following code examples.
> [!NOTE]
> This functionality is available only in builds of Windows 19H1 or later. You can declare this property and target/run on earlier Windows builds. However, you must handle legacy code page detection and conversion as has been historically necessary. With a minimum target version of 19H1, the process code page will always be UTF-8.

#### appxmanifest (packaged)

```
<?xml version="1.0" encoding="utf-8"?>
<Package xmlns="https://schemas.microsoft.com/appx/manifest/foundation/windows10"
         ...
         xmlns:uap7="https://schemas.microsoft.com/appx/manifest/uap/windows10/7"
         xmlns:uap8="https://schemas.microsoft.com/appx/manifest/uap/windows10/8"
         ...
         IgnorableNamespaces="... uap7 uap8 ...">
 
  <Applications>
    <Application ...>
      <uap7:Properties>
        <uap8:ActiveCodePage>UTF-8</uap8:ActiveCodePage>
      </uap7:Properties>
    </Application>
  </Applications>
</Package>
```

#### Win32 manifest (unpackaged)

```
<?xml version="1.0" encoding="UTF-8" standalone="yes"?>
<assembly manifestVersion="1.0" xmlns="urn:schemas-microsoft-com:asm.v1">
  <assemblyIdentity type="win32" name="..." version="6.0.0.0"/>
  <application>
    <windowsSettings>
      <activeCodePage xmlns="https://schemas.microsoft.com/SMI/2019/WindowsSettings">UTF-8</activeCodePage>
    </windowsSettings>
  </application>
</assembly>

Note: You can add a manifest to an existing executable via the command line with mt.exe -manifest <MANIFEST> -outputresource:<EXE>;#1
```

<a id="ID4EFAAE"></a>

## MultiByteToWideChar/WideCharToMultiByte

Use the [MultiByteToWideChar](/windows/desktop/api/stringapiset/nf-stringapiset-multibytetowidechar) and [WideCharToMultiByte](/windows/desktop/api/stringapiset/nf-stringapiset-widechartomultibyte) functions to convert between UTF-8 and UTF-16 (`WCHAR`) (and other code pages). This is particularly useful when a legacy Win32 API might only understand `WCHAR`. Use these functions to convert UTF-8 input to `WCHAR` to pass into a -W API and then convert any results back, if necessary.

When you use these functions in the Microsoft Game Development Kit (GDK), use CodePage `CP_UTF8` with `dwFlags` of either 0 or `MB_ERR_INVALID_CHARS` per the documentation. Otherwise, you'll receive the `ERROR_INVALID_FLAGS` error. 
> [!NOTE]
> On console, `CP_ACP` is always the same as `CP_UTF8`. Existing code can continue to be used if explicitly switching to `CP_UTF8` is a burden. On Windows PC, `CP_ACP` equates to `CP_UTF8` only if running on 19H1+ and the `ActiveCodePage` property as previously described is set to UTF-8. Otherwise, it honors the legacy system code page. Moving forward, the best practice is to use `CP_UTF8` explicitly.

<a id="ID4E4F"></a>

   

## ICU for advanced UTF-8 and globalization support  


ICU is the [International Components for Unicode library](http://site.icu-project.org/home/). It's an open source and cross-platform internationalization library that supports advanced UTF-8 operations with C/C++ interfaces (for example, collation, normalization, and tokenization).

This library was updated for the Microsoft Game Development Kit (GDK) as of version 64.1. To use it, build the library (see #HowToBuild in the [readme](https://github.com/unicode-org/icu/blob/master/icu4c/readme.html)), and then package the library with your game (see #HowToPackage in the [readme](https://github.com/unicode-org/icu/blob/master/icu4c/readme.html)).
> [!NOTE]
> The [readme](https://github.com/unicode-org/icu/blob/master/icu4c/readme.html) doesn't render directly on GitHub. If you clone the repo locally to build, you can view it locally.
  
<a id="ID4EFAAD"></a>

   

## Support for earlier versions of Windows
   
If you target Windows builds earlier than 19H1 (including Windows 7), you must handle legacy code page detection and conversion.

We're exploring providing a static helper library that provides -Utf8 variants of Win32 APIs that abstract away the need to perform code page detection and conversion. This would provide a common programming surface to target console and Windows PC all the way down to Windows 7.

## See also
 
[System](../gc-system-toc.md)