---
author: M-Stahl
title: Title packaging, content updates, and streaming-installation testing
description: Describes how to create packages for streaming installation for local iteration, performance validation, pre-submission testing, and final submission. It also describes the steps run by the MakePkg tool during the packaging process.
ms.assetid: 174e4132-5d01-0a6b-0a06-6b1987426c08
kindex:
- Title Packaging Content Updates and Streaming-Installation Testing
- packaging
- content updates
- updating
- streaming installation
- installation, streaming
- testing
- makepkg.exe
ms.author: brianhud
ms.topic: conceptual
edited: 10/04/2019
security: public
---

# Title packaging, content updates, and streaming-installation testing


This topic describes how to create packages for streaming installation for local iteration, performance validation, presubmission testing, and final submission. You'll see the steps run by the MakePkg tool during the packaging process, as well as the steps we recommend for packaging and streaming-installation testing during development.  


<a id="introduction"></a>



## Introduction  


[MakePkg.exe](deployment/makepkg.md) is a tool that places content into a binary packaged file, referred to as an Xbox Virtual Container (XVC). XVCs for console have the file name extension of .xvc and for PC have the file name extension of .msixvc. In addition to the extension difference, there is a suffix added to the package name to differentiate between Xbox One Family (_x) and Xbox Series X&#124;S Family (_xs) packages.


MakePkg.exe uses your title's content and a mapping file as input to produce packages that are encrypted with either a well-known test key, a randomly generated key, or a stable-key safe for encryption. The key used for encryption depends on whether the package will be used for local testing or submission to Microsoft for publishing and use cases are detailed below.  


The XML in the [mapping file](deployment/atoc-deployment-schema.md) serves two purposes. First, it specifies the location of files that will be available to the title at runtime. Second, it specifies the chunk file that each file belongs to. A set of chunks, known as the *launch set*, are always installed before a title is allowed to run. The remaining chunks are installed while the title is running. APIs are available to query the progress of chunk installation and to modify the installation order of chunks that aren't yet installed.  


In this topic:  

   *  [Steps during packaging](#steps_during_packaging)  
   *  [Recommended steps for packaging during development](#recommended_steps_for_packaging_during_development)  
   *  [Testing of streaming installation packages](#testing_of_streaming_installation_packages)  
   *  [Best practices](#best_practices)  
   *  [Resources and guidance](#resources_and_guidance)  
   *  [See also](#see_also)


<a id="steps_during_packaging"></a>



## Steps during packaging  


The MakePkg packaging process can be broken down into several steps.  

<a id="MicrosoftGame_config_and_file_existence_validation"></a>



### MicrosoftGame.config and file-existence validation  


The MakePkg command verifies that the [MicrosoftGame.config](../system/overviews/microsoft-game-config/MicrosoftGameConfig-Overview.md) file located in the content source directory is valid and will successfully install.

When the MakePkg **pack** command is run, it ensures that files referenced within the MicrosoftGame.config are in the source directory and are validated to ensure that they will be packaged into the launch set. This includes binaries, image files, and any other resources.  

<a id="binary_signing"></a>


### Binary signing  

Files in your title are scanned and signed by using Xbox Code Integrity (XCI). PE headers detected in files are modified as part of this process before being written to the package file. If signing fails, an error message is reported, along with a command to manually re-run xcihash.exe to gather more details about the signing failure.  

<a id="package_creation"></a>


### Package creation  

As soon as MakePkg has completed the prevalidation steps, a package file is created. MakePkg then copies the source files, including the signed executables, into the package file in the chunks specified by the XML map file.  
> [!NOTE]
> Console only: The last step of package creation involves embedding a GameOS file (GameOS.xvd). This file is part of the GDK and is required to be in the layout directory next to the executable for your game. The **/gameos** flag allows specifying an alternate source location for the GameOS file.  

<a id="encryption"></a>


### Encryption  

|                        | Test Signing (**/lt**) | Random Key (**/l**) | Stable Key (**/lk SECRET.LEKB**) |
| ---                    | ---                    | ---                 | ---                              |
| Delta Upload           | Yes                    | No                  | Yes                              |
| packageutil compare    | Yes                    | No                  | Yes                              |
| Secure Upload          | No                     | Yes                 | Yes                              |
| Package Secure At Rest | No                     | Yes                 | Yes                              |
| Sideload on Devkit     | Yes                    | No                  | Yes                              |
| Sideload on PC         | Yes                    | No                  | No                               |

#### Test Signing (default encryption)
The default MakePkg behavior is to create test-signed packages, but is also denoted when using the  **/lt** switch when calling `makepkg pack`. Test-signing encrypts the generated package file by using a well-known test encryption key, intended for performance testing validation, for running on Xbox and PC. Although the effect of real-time package decryption is designed to be transparent to the title, this ensures that any possible performance issues resulting from encryption are discovered before certification and final mastering of titles. Test-signed packages aren't intended to be used for cryptographically securing content, because the encryption uses a fixed key. A test-signed package can be installed on a Development Kit by using **xbapp install** and on a development PC by using **wdapp install**.

#### Random Key Encryption (/l switch)
The MakePkg **/l** switch encrypts the package file with a randomly generated encryption key. In addition to your title package, **MakePkg /l** emits a file with a name in the format *PackageFullName_licenseName_GUID.EKB*. (Note the use of the underscore (_) character.) Packages created with the **/l** switch can't be installed on a Development Kit or development PC. You should test your title by using test-signed packages until the title passes all checks and presubmission tests. After reaching that state, run MakePkg with the **/l** switch before final submission to Microsoft.  

#### Recommended - Stable Key Encryption  (Genkey + /lk switch)
The Makepkg **/lk** switch encrypts the package with a stable (always the same) key made by the `makepkg genkey` command. In addition to your title package, **MakePkg /lk** emits files named in the format *PackageFullName_licenseName_GUID.EKB* and *PackageFullName_licenseName_GUID.CEKB*. (Note the use of the underscore (_) character.) Packages created with the **/lk** switch can be installed on a Development Kit, but not on a development PC. For PCs, you should test your title by using test-signed packages until the title passes all checks and presubmission tests.

This is the recommended encryption mode for development kit testing and submission, due to these benefits: 
1. packageutil compare can generate correct update size estimates (unlike /l).
2. It enables secure delta upload to Partner Center using the same algorithm that consoles and PCs use to download content updates.
3. It can be installed onto devkits (unlike /l).
4. It uses secure encryption key material and can only be decrypted in specific environments (unlike /lt).

Unlike the **/lt** and **/l** encryption modes, the **/lk** mode requires an extra one time step to use it:
1. One time: Run `makepkg genkey /ekb SECRET_KEY.lekb` to create the SECRET_KEY.lekb file. This is the Local Escrowed Key Blob (LEKB) which
   stores the stable content key that encrypts your package. It should be stored in a secure location with need to know access. In an ideal
   setup only official build machines/accounts should have access to it.
2. Package creation: Run `makepkg pack /lk SECRET_KEY.lekb ...`. This will create a package encrypted using the key stored in the SECRET_KEY.lekb file.
3. Package upload: The XVC and EKB files are uploaded to Partner Center as normal. The LEKB and CEKB files are not uploaded.

**xbapp install** will automatically install the CEKB file necessary to load the package onto an ERA devkit. If you are testing an install
scenario other than tool-based install (game disc, external storage, console-to-console transfer) then the **xbapp installkey** command can
be used to install only the CEKB file.

> ![alert](../../../resources/gamecore/images/en-us/common/note.gif) **DANGER:** The contents of the LEKB file is only lightly obfuscated. It is your responsibility to
ensure the security of your content packages by securing access to the LEKB file.
Anyone possessing the LEKB file and the content package file output by makepkg pack
can decrypt its contents.

> ![alert](../../../resources/gamecore/images/en-us/common/note.gif) **DANGER:** The contents of the CEKB file allows the package to be loaded on any active ERA devkit. It is your responsibility to
ensure the security of your content packages by securing access to the CEKB file.
Anyone possessing the CEKB file, an active ERA devkit, and the content package file output by makepkg pack
can install the package on their devkit, can start the package, and can xbcp the files out of the package.

> ![alert](../../../resources/gamecore/images/en-us/common/note.gif) **COMPATIBILITY:** LEKB files generated prior to the April 2021 GDK will not create a CEKB file. To use the new devkit sideloading
feature the LEKB file must be re-created with April 2021 or later GDK tools.

<a id="submission_validation"></a>


### Submission validation  


MakePkg automatically runs [Submission Validator (SubmissionValidator.dll)](subval/submissionvalidator.md) against the title files after creating the package. The goal of the Submission Validator is to check for errors and issues that can cause problems for titles later in the ingestion, mastering, or certification processes at Microsoft or in future content updates. All detected problems need to be corrected before a signed package can be generated for upload to Partner Center.


The submission validation process generates an XML log file detailing the nature and location of any failures. This log file is written to the same location specified by the **/pd** parameter of MakePkg for output of the package file. This log can contain failures or warnings. Failures must be addressed before a package can be submitted to Microsoft. Warnings should be considered for remediation to ensure that titles comply with policy and Xbox Requirements (XR) guidance.  


When a package is uploaded to Partner Center and published to the mastering process, the validation checks run again. This ensures that the title is checked by using the latest version of Submission Validator and that any problems are caught as early as possible.  

<a id="submission_validation_tests"></a>


#### Submission-validation tests
 

<table>
<tr><th> Submission-validation tests</th>
<th> Description</th></tr>
<tr> <td> <b>Foreign files </b> </td> <td> Verify that the title contains no prohibited files. Prohibited files include source and debug files (for example, *.c, *.cpp, *.obj, *.lib, *.cs, and *.h) and any system files that are contained in the Game OS volume. </td> </tr>

<tr> <td> <b>MicrosoftGame.config </b> </td> <td> A variety of config checks not performed by MakePkg: <ul>
<li>Resolution and bit depth of logo and startup-screen images </li>
<li>Checks packages for proper mod support (PC Desktop only) </li>
</ul>
</td></tr>

<tr><td><b>Binary scan</b></td><td>All .exe and .dll files are scanned for any non-retail dependencies. Any managed-code binaries cause a failure (Console only). Other problems that are detected include non-Xbox executables (Console only) and 32-bit executables (Console only).</td></tr>
</table>

The specific tests will evolve over time as new issues are identified. Passing the Submission Validator checks shouldn't be construed as an indication that other issues won't arise with the title submission during the ingestion and certification process. Rather, the intent is merely to reduce the time and cost of rejections resulting from foreseeable errors. In addition, although the Submission Validator can check for certain security-related issues, it shouldn't be viewed as a security test for a title.  

You can download the latest version of Submission Validator from the Xbox Game Developer (XGD) site. Because the tool can evolve at a different pace than the Xbox One Software Development Kit releases, be sure that you're using the latest version to avoid any validation-failure rejections in the submission process. To get the latest version, see [Xbox Developer Downloads->Xbox One->Submission Validator](https://www.microsoft.com/software-download/devcenter).  

For more information about Submission Validator, see [Submission Validator (SubmissionValidator.dll)](subval/submissionvalidator.md) in the GDK documentation.  

If you have questions about the validation process, contact your developer account manager (DAM).  

<a id="recommended_steps_for_packaging_during_development"></a>


## Recommended steps for packaging during development  

To create packages during development, we recommend the following steps (use **wdapp** instead of **xbapp** when targeting PC).  
   1. Iterate locally by using test-signed packages and **xbapp install** from your development PC.<br/>**MakePkg.exe pack /f** *Mapfile* **/d** *LooseContentDir* **/pd** *OutputFolder*<br/>To get started, see [Streaming Install (Developer Education Materials > All NDA Samples)](https://aka.ms/xgddl)<br/>  
   1. Run your title by launching from the shell or by using **xbapp launch**.<br/>**xbapp install** *local-XVC-path* or **xbapp install** *http-URI*<br/>To test alternate options for streaming installation, see [Testing of streaming installation packages](#testing_of_streaming_installation_packages) later in this topic.<br/>  
   1. Test title installation from the optical drive by using a test-signed package burned to a Blu-ray Disc in the root folder. After inserting the disc into the Xbox One Development Kit, run the following.<br/>**xbapp install XO:\** *XVC-file-name*<br/>  
   1. Prepare your final submission by using the same packaging command as your test-signed package, using the **/l** flag.   


<a id="testing_of_streaming_installation_packages"></a>

## Testing of streaming installation packages (PC)

Use the **wdapp** command to install packages on the test PC.  
> [!NOTE]
> Currently, the test MSIXVC package must exist on a physical drive on the test PC or a web server. In a future update, installation from Universal Naming Convention (UNC) shares will be added.

For more details, see [Getting started packaging for PC](overviews/packaging-getting-started-for-PC.md).

## Testing of streaming installation packages (console) 

There are four ways to test the installation of test-signed streaming installation packages.  

<a id="stream_from_the_development_pc"></a>


### Stream from the development PC  

Streaming from the development PC doesn't support any throughput throttling. The speed of the installation is dependent on the processor and I/O characteristics of your development PC, as well as the bandwidth of the network connection between the development PC and the Development Kit. Speeds of 300 Mbps (approximately 36 MiB/s) or higher can be expected over gigabit Ethernet connections from modern development PCs with mechanical hard drives.  

**xbapp install** *dev-pc-path-to-XVC*  

<a id="host_the_package_on_a_web_server"></a>


### Host the package on a web server  

If your web server supports configuration of bandwidth throttling, hosting the package on a web server allows simulation of different network delivery speeds. The Xbox One platform handles connection failures and retry logic. Your title should run the same when installing from an internet source as from an optical disc, aside from speed.  

**xbapp install** *http-URI-to-package*  

<a id="burn_the_package_to_a_disc_and_install_from_a_command_line"></a>


### Burn the package to a disc, and then install from a command line  

Burn an optical disc with your XVC in the root directory, and then install the package by using the following command.  

**xbapp install** XO:\*xvc-file-name*  

<a id="burn_the_package_to_a_disc_and_install_through_the_shell"></a>


### Burn the package to a disc, and then install through the shell  

Burn an optical disc with a folder named MSXC that contains your package.  

Insert the disc into a running Development Kit. The shell automatically starts installing your title, and the Development Kit displays a notification after the launch set has been installed and the title can be launched.  

<a id="best_practices"></a>


## Best practices

### Use sub-file content updates

Use sub-file content updates, which reduce the size of content updates. Author your package layout to ensure optimal content updates in the future.  
   
For more information about authoring packages for optimal update, see [content update (NDA topic)](packaging-updates.md).  

### Xbox Requirement (XR) 034  
   
Read Xbox Requirement (XR) 034, Streaming Install Initial Play Marker. Validate that your launch set is smaller than 12 GB.  
   
Your title's set of launch chunks and associated metadata must be smaller than 12 GB to ensure a consistent startup time for users. For a more complete description of XR-034, see [Xbox Developer Downloads->Partner, Publishing, and Release Management Information->XGD Partner Documentation](https://www.microsoft.com/software-download/devcenter).

### Test your title 
   
Test your title while it's being installed from various sources and different speeds.  

### Use the latest Submission Validator  
   
Always use the most up-to-date version of Submission Validator.  

The latest version of Submission Validator is available from [Xbox Developer Downloads->Xbox One->Submission Validator](https://www.microsoft.com/software-download/devcenter).  

<a id="resources_and_guidance"></a>

## Resources and guidance  

You may want to familiarize yourself with the following topics—useful jumping-off points in the documentation.  
   *  System > Overviews > [Streaming Installation and Intelligent Delivery: an overview](overviews/streaming_install-intelligent_delivery.md)  
   *  System > Overviews > Streaming Installation > [Dynamic reordering of chunks](packaging-chunkreordering.md)  
   *  System > Overviews > Streaming Installation > [Streaming Installation: status](packaging-installstatus.md)  
   *  Test, Automation, and Publishing > Tools > Streaming Installation > [Deployment Package Schema](deployment/atoc-deployment-schema.md)  
   *  Test, Automation, and Publishing > Tools > Streaming Installation > [Make Package (makepkg.exe)](deployment/makepkg.md)  

<a id="see_also"></a>

## See also

[MicrosoftGame.config](../system/overviews/microsoft-game-config/MicrosoftGameConfig-toc.md)  
[Submission Validator (SubmissionValidator.dll)](subval/submissionvalidator.md)  
[Submission Validator Quality Tests](subval/submissionvalidator-tests.md)