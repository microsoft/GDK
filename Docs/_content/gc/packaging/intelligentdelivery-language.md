---
author: M-Stahl
title: 'Intelligent Delivery: language specifiers'
description: Describes how to use Intelligent Delivery to control which language-specific assets are installed on a console.
ms.assetid: 6598dac5-9c45-a140-bf71-7bdfadf47361
kindex: Intelligent Delivery- Language specifiers
ms.author: brianhud
ms.topic: conceptual
edited: '08/05/2019'
security: public
---

# Intelligent Delivery: language specifiers


Language specifiers declare the language to which the content in a chunk is applicable. If you mark chunks in your installation package with one or more language specifiers, then at installation time, the console does the following.
  
1. Determines which chunks are the best match between the language needed by the user and the languages in the package

2. Downloads only the chunks marked for that language and the chunks that don't have a language specifier

If an exact match isn't found, language specifiers can be used to declare a fallback language. 

<a id="ID4EV"></a>



## Language-aware installation  


Intelligent Delivery language specifiers tag content so that only a subset of all localized assets in a package get installed on a console. This saves bandwidth for customers who install digitally, and this saves hard-drive space for all customers.  


To indicate that content is specific to one or more languages, add a `Languages` attribute to a chunk in your layout.xml file. The following example shows a chunk that will be installed only on a console that has determined French as the best match for the language in which the console is running. This chunk will be installed on consoles set to French with a Canadian locale (fr-CA) or a French locale (fr-FR). A chunk without a language specifier will be installed on all consoles unless it's excluded by using other specifiers, such as the device type.

```xml
<Chunk Id="1001" Languages="fr">
    <FileGroup DestinationPath="\Data\Maps\X1\fr" SourcePath="Y:\Maps\Level1\X1\fr" Include="*.map"/>
<Chunk>  
```

<a id="ID4EQB"></a>



## Determining the user's choice of language  


Use the [XPackageGetUserLocale](../reference/system/xpackage/functions/xpackagegetuserlocale.md) function to query the name of the locale
that has been determined by the operating system to best match the title installation on the user's
system.

The locale returned is decided upon by an algorithm that performs roughly the following actions to
determine the best possible match based on all the available data about the user.

1. A list of languages that best match the user's current language setting are generated.
2. A list of all the languages declared in the MicrosoftGame.config/manifest are generated.
3. A list of all the languages currently installed and available in the package are generated.
4. The first language that is declared in the manifest is the ultimate fallback for language selection.
5. The result will always be a language that is declared in the MicrosoftGame.config/manifest, or a user language if no languages are declared.
> [!NOTE]
> The algorithm used might change over time, and isn't necessarily identical to
> the previous description.

The language returned by [XPackageGetUserLocale](../reference/system/xpackage/functions/xpackagegetuserlocale.md) won't necessarily
match the language returned by **GetUserDefaultLocaleName** or other national language support (NLS) and localization-related Win32 API functions, and should be called in preference to it.

For more information about localization and the language settings in MicrosoftGame.config, see the
National Language Support API and Localization GDK sample.
> [!NOTE]
> You must ensure that all languages referenced within your layout.xml file are also present in your MicrosoftGame.config file. The MakePkg tool will produce an error if this is not true.


<a id="BehaviorOnLaunch"></a>

## Behavior when launching your title after the user has switched to a different language

If the user launches your title and the best locale for the user is available as part of your package
but hasn't yet been installed (for example, the user has switched languages while your title wasn't running),
the next time your title is launched they will be offered the opportunity to install the best match language.
> [!NOTE]
> If the user chooses to install a language, they can still run the game
> *in their previous choice of installed language* until the new language has downloaded. We assume
> that if they started out in another language, they likely understand that language and might want to
> play the game while they wait for their *preferred* language to download.
>
> Please note that this behavior has confused many developers. When testing you should verify that
> the new language has completed installation by monitoring the game installation queue before launching
> the title. If the user chooses to install a language [XPackageGetUserLocale](../reference/system/xpackage/functions/xpackagegetuserlocale.md)
> will not report that language until it has downloaded.

<a id="ID4E5B"></a>



## Offering additional languages in your title  


Some titles allow users to choose a language (as part of first-time gameplay or through a menu) without regard to the language setting of the console. At installation, Intelligent Delivery installs only one language for a particular package, according to the language setting of the console and the languages specified in the layout.xml file. Your title should render in this language by default.   


In addition, the Xbox shell allows installing secondary languages. You can expose this option from within your title by using your own UI. Your title can determine the languages available for installation by calling the [XPackageEnumeratePackages](../reference/system/xpackage/functions/xpackageenumeratepackages.md) method. Depending on the language selected and on the installation source, installation could come from a disk or from Xbox Live. When a user selects a language other than the default, your title should call the [XPackageFindChunkAvailability](../reference/system/xpackage/functions/xpackagefindchunkavailability.md) method to determine the installation status of chunks that are tagged with that language. This API returns an [XPackageChunkAvailability](../reference/system/xpackage/enums/xpackagechunkavailability.md) object with one of the values shown in the following table.   
  

| State| Description|
| --- | --- |
| Ready| The chunk is already installed and can be read.|
| Pending| The chunk isn't installed yet but will be.|
| Installable| The chunk won't be installed, but it can be downloaded. To install the assets, call the [XPackageInstallChunks](../reference/system/xpackage/functions/xpackageinstallchunks.md) method with the appropriate specifiers. |
| Unavailable| The chunk cannot be downloaded |
  
If the [XPackageChunkAvailability](../reference/system/xpackage/enums/xpackagechunkavailability.md) returns *Unavailable* then the language specified isn't available online or in the version of the title on the disk.  
  
If a user chooses to install a language that's available but not currently installed, your title should call the [XPackageInstallChunks](../reference/system/xpackage/functions/xpackageinstallchunks.md) method with an [XPackageChunkSelector](../reference/system/xpackage/structs/xpackagechunkselector.md) object that specifies the language to be installed. This call displays system-rendered UI that prompts the user to accept the additional download and installation. Your title can use the returned installation monitor handle, along with the [XPackageGetInstallationProgress](../reference/system/xpackage/functions/xpackagegetinstallationprogress.md) method or the [XPackageRegisterInstallationProgressChanged](../reference/system/xpackage/functions/xpackageregisterinstallationprogresschanged.md) method to monitor the download and installation of the new data or to determine whether the user has declined the additional installation.   


Your title can uninstall a language by calling the [XPackageUninstallChunks](../reference/system/xpackage/functions/xpackageuninstallchunks.md) method. This call is silently ignored if only one language is installed.  

<a id="ID4EYE"></a>

## Changes from Xbox One Software Development Kit

If you have prior experience using Intelligent Delivery on the Xbox One Software Development Kit, note that the way languages are declared and mapped is different. If you have added a `Languages` attribute to a chunk, that language must also be declared in MicrosoftGame.config. Identifying which chunks to install for a language is now based on a single value for the best matching language. For example if your layout file contains a chunk marked with 'en' and another marked with 'en-US', the 'en' chunk will not be installed if the user's language is set to 'en-US'.  If you want this legacy behavior, declare the chunk with all languages it should install for: en;en-US.  
  
## See also  

 [Intelligent Delivery](overviews/intelligentdelivery.md)