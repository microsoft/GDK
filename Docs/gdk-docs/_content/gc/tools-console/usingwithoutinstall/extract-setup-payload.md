---
author: aablackm
title: Extracting the Microsoft Game Development Kit (GDK) setup payload
description: Describes the process to obtain an extracted Microsoft Game Development Kit (GDK) setup payload.
kindex:
- Extracting the Microsoft Game Development Kit (GDK) setup payload
- "Microsoft Game Development Kit (GDK) manual setup extraction"
- Extract, Microsoft Game Development Kit (GDK), Win10SDK
- winsdksetup.exe, Windows Installer, msiexec.exe
- Windows 10 Software Development Kit, Windows 10 SDK
- Customization, Without Install
- advanced
ms.author: aaronste
ms.topic: conceptual
edited: 10/07/2019
security: public
---

# Extracting the Microsoft Game Development Kit setup payload
   
  
This document describes the process of obtaining an extracted Microsoft Game Development Kit (GDK) to be utilized without installation. This section provides instructions on how to do this for the Microsoft Game Development Kit and the Windows 10 SDK. This process is intended for advanced users.
> [!NOTE]
> This process does not replace the need to install the Microsoft Game Development Kit (GDK) for most scenarios. The process enables the following scenarios:  
>    
   > 1. Extract headers and libraries for use in your build process.  
   > 1. Extract the Sideload folder so that [xbprovision (NDA topic)](../xbox-tools-and-apis/commandlinetools/xbprovision.md) can be run from a given Microsoft Game Development Kit (GDK) without installing that full Microsoft Game Development Kit (GDK).  
> 
>    
>   
> It is possible to run some of the Microsoft Game Development Kit (GDK) tools after extracting the setup payload in this way, however, doing so is not officially supported and you may encounter issues.  
>  

## Downloading the extracted Microsoft Game Development Kit

The extracted Microsoft Game Development Kit (GDK), an option available to advanced users, allows specific files to be integrated into a build system without installing the full Microsoft Game Development Kit (GDK). The extracted Microsoft Game Development Kit (GDK) is available as a separate download option on the [Xbox Developer Downloads](https://aka.ms/gdkdl) site. The download option is listed with the word Extracted in the title to differentiate from the GDK installer download option.

> ![alert](../../../../resources/gamecore/images/en-us/common/note.gif)**TIP**: Using this download option will allow you to skip the manual extraction process for the Microsoft Game Development Kit. This is the recommended option.

## Manually extracting the Microsoft Game Development Kit

As an alternative to downloading the extracted Microsoft Game Development Kit (GDK), you can manually extract files from the regular Microsoft Game Development Kit (GDK) installer. After you download the regular Microsoft Game Development Kit (GDK), you can use Windows Installer (msiexec.exe) to extract each installer package to access its individual files.

> ![alert](../../../../resources/gamecore/images/en-us/common/note.gif)**TIP**: The following procedures show a specific use of Windows Installer (msiexec.exe). For more information about msiexec.exe, see [Windows Installer](/windows/desktop/Msi/windows-installer-portal).

### Extracting contents of all Microsoft Game Development Kit (GDK) MSIs (Using ExtractXboxOneDKs.cmd)

1. Download the Microsoft Game Development Kit installer on the [Xbox Developer Downloads](https://aka.ms/gdkdl) site. Or, download the public Microsoft Game Development Kit (GDK) installer from the [GitHub repo](https://github.com/microsoft/GDK) (supports PC development only).
The file you download will have a name such as *GDK_03_2022.zip*. Make note of its location on your computer. 
2. Extract the contents of the local .zip file.
3. Open a Command Prompt and navigate to the **SetupScripts** directory within the folder the contents were extracted to (i.e. C:\GDKDownload\SetupScripts)
	* The ExtractXboxOneDKs.cmd script in this directory can be used to extract the GDK. It's usage is:
		* ExtractXboxOneDKs.cmd **MSI_Source_Folder Target_Directory**
		* As an example, the MSI_Source_Folder is where the .zip file was extracted to (i.e. C:\GDKDownload). The target directory is where the extracted contents will go (i.e. C:\ExtractedGDK\220300)
4.  After running the ExtractXboxOneDKs.cmd script, the extracted files will exist in the target directory (i.e. C:\ExtractedGDK\220300)
5. Navigate to the target directory, then copy the extracted GDK files to the location required by your build system.
> [!NOTE]
> The target directory includes a set of .msi files and a Windows Kits folder as part of the extraction. These should be ignored and can be deleted. The Microsoft GDK folder is the only folder in the Extraction target directory that is necessary to keep.

### Extracting contents of all Microsoft Game Development Kit (GDK) MSIs (Manual)

1. After you unzip the GDK (steps 1-2 in the above section), you can use Windows Installer (msiexec.exe) to extract each installer package to access its individual files.
1. In a command prompt window, navigate to the folder with the extracted files from the .zip file, then run the following command line:<br/>
      ```
      for /F "delims=" %G in ('dir /b /s "installation_folder\*.msi"') DO (
      start /wait msiexec.exe /a "%G" TARGETDIR="msi_extraction_path" /qb
      )  
      ```
      where **installation_folder** is the path to the downloaded files of the GDK download, and **msi_extraction_path** specifies the folder where you want the files of the Windows Installer (.msi) files to be extracted. For example:<br/>
      ```
      for /F "delims=" %G in ('dir /b /s "C:\GDKDownload\*.msi"') DO (
      start /wait msiexec.exe /a "%G" TARGETDIR="C:\ExtractedGDK\220300\" /qb
      )  
      ```
      > [!NOTE]
      > If this code example is used in a script instead of directly from the command line, the %G needs to be replaced with %%G.
1. Navigate to msi_extraction_path, then copy the extracted GDK files to the location required by your build system. 

## Extracting the Windows 10 SDK

Manual extraction of the Windows 10 SDK (Win10SDK) setup payload, an option available to advanced users, allows specific files to be integrated into a build system without installing the full Win10SDK. This step is not required to use an extracted Microsoft Game Development Kit (GDK), as long as the Windows 10 SDK is installed on the system.

### Extracting contents of all Windows 10 SDK MSIs (Using ExtractXboxOneDKs.cmd)
> [!NOTE]
> As of the May 2020 GDK, the GDK now requires the 20H1 version of the Windows 10 SDK (Version 10.0.19041.0) or later.

1. Download the Win10SDK Installer from [Windows Dev Center](https://developer.microsoft.com/windows/downloads/windows-10-sdk) (Version 10.0.19041.0 or later is required). The file you download will have a name such as winsdksetup.exe. Make note of its location on your computer.
2. Open a command prompt and run **winsdksetup.exe /layout C:\Win10SDKDownload** in the directory the exe was downloaded to (this will extract the msi files from the exe).
3. Step through the UI, leave all of the checkboxes checked, and let it download all of the files.
4. Navigate to the **C:\Win10SDKDownload** to confirm the .msi files are present.

> ![alert](../../../../resources/gamecore/images/en-us/common/note.gif)**TIP:** Alternately, you can download the Win10SDK .ISO and mount it. It contains the same .msi files produced by steps 1-4.

5. Using the script noted in the **Extracting contents of all Microsoft Game Development Kit (GDK) MSIs (Using ExtractXboxOneDKs.cmd)** above, point to the msi folder (i.e. C:\Win10SDKDownload) for the MSI_Source_Folder and another folder (i.e. C:\ExtractedWin10SDK) for the target directory where the extracted contents will go.
> [!NOTE]
> Due to long paths of included files, it is recommended to keep the source and target directories (for extraction only) limited to 45 characters (including drive letter). They can then be moved after the extraction is completed. **Exceeding 45 characters in the folder path will cause extraction failures** due to exceeding max file path length.

6. After running the ExtractXboxOneDKs.cmd script, the extracted files will exist in the target directory (i.e. C:\ExtractedWin10SDK)
7. Navigate to the target directory, then copy the extracted Win10SDK files to the location required by your build system.
	> [!NOTE]
> Many files/folders will exist in the target directory after this extraction. The Windows Kits\10 folder is the folder utilized in this example for build system reference. Other folders may be required depending on the desired action.

### Extracting contents of all Windows 10 SDK MSIs (Manual)

1. After you get a set of .msi files from the winsdksetup.exe (steps 1-4 in the above section), you can use Windows Installer (msiexec.exe) to extract each installer package to access its individual files.
1. In a command prompt window, navigate to the folder with the extracted files from the .zip file, then run the following command line:<br/>
      ```
      for /F "delims=" %G in ('dir /b /s "installation_folder\*.msi"') DO (
      start /wait msiexec.exe /a "%G" TARGETDIR="msi_extraction_path" /qb
      )  
      ```
      where **installation_folder** is the path to the downloaded files of the WIn10 SDK download, and **msi_extraction_path** specifies the folder where you want the files of the Windows Installer (.msi) files to be extracted. For example:<br/>
      ```
      for /F "delims=" %G in ('dir /b /s "C:\Win10SDKDownload\*.msi"') DO (
      start /wait msiexec.exe /a "%G" TARGETDIR="C:\ExtractedWin10SDK" /qb
      )  
      ```
      > [!NOTE]
      > If this code example is used in a script instead of directly from the command line, the %G needs to be replaced with %%G.
1. Navigate to msi_extraction_path, then copy the extracted Win10SDK files to the location required by your build system. 

## Recommended layout for supporting multiple extracted Microsoft Game Development Kit (GDK) versions.

When extracting the Microsoft Game Development Kit, it is assumed this folder will live in a shared location or source control system to be accessed when building your title. There may be a scenario where multiple versions of the Microsoft Game Development Kit (GDK) are desired. In this scenario, our recommendation regarding the layout of multiple extracted Microsoft Game Development Kit (GDK) versions is as follows:

* ...\ExtractedGDK\211000\Microsoft GDK\...
* ...\ExtractedGDK\220300\Microsoft GDK\...

This allows for the full payload to be present for each version. We recommend you use a build environment variable to switch between versions to define what is used during your build compilation process.

## See also

[Configuring Build Environment without installing Microsoft Game Development Kit (GDK)](build-environment-withoutinstall.md)  

[Using the Microsoft Game Development Kit (GDK) without installation](gc-usingwithoutinstall-toc.md)