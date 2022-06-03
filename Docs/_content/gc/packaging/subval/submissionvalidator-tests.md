---
author: M-Stahl
title: Submission Validator quality checks
description: Describes the quality checks that are performed by Submission Validator.
kindex:
- Submission Validator Quality Checks
- SubmissionValidator.dll, tests
ms.author: zhooper
ms.topic: conceptual
edited: 04/02/2020
security: public
---

# Submission Validator quality checks
   
  
The types of problems that Submission Validator identifies will grow and evolve over time to work toward the goal of smoothing the way from submission through certification, and to market.   
   
  
Submission Validator runs the following quality checks.  
   
   *  [Available version](#ID4EY)  
   *  [Approved Game OS](#ID4EKB)  
   *  [Launch marker in final chunk for content (downloadable content (DLC))](#ID4EHD)
   *  [Additional Resources.pri files](#ID4EDE)
   *  [Missing Resources.pri file](#ID4ERF)
   *  [One application per package](#ID4EBBAC)  
   *  [Maximum package size](#ID4E3BAC)  
   *  [Foreign File](#ID4EDCAC)  
   *  [Binary Scan](#ID4EEEAC)  
   *  [Microsoft (MS) Component Versions](#ID4ESFAC)

 
<a id="ID4EY"></a>

   

## Available version  
   
  
Submission Validator checks to ensure that the version you've installed is the most current and correct version. If it isn't, there will be a failure logged in the Submission Validator output log. That failure message, shown as follows, will contain a link from which to download the correct version.   
   
```xml
<component>Available Version Check</component>
<failure>A required update to Submission Validator is available. The latest version can be downloaded from https://go.microsoft.com/fwlink/?LinkId=393356. Download and install the update, then rebuild the package. Contact your 
Developer Account Manager for assistance.</failure> 
```
  
<a id="ID4EKB"></a>

   

## Approved Game OS  
   
  
Submission Validator checks that the Game OS and any optional components from the Microsoft Game Development Kit (GDK) are from the same release of the Microsoft Game Development Kit (GDK) and that they're an approved version for use in released titles. If the version isn't on the approved or deprecated list, a failure will be included in the validator log, shown as follows.
   
```xml
<failure>The GameOS included in this package is not an approved version. Use only 
supported GameOS versions according to the Approved Libraries page on the Developer 
Network Portal</failure>  
```
   
  
If the version is found to on the deprecated list, a warning is included in the validator log, indicating that this is only valid for content updates for titles originally released on that deprecated version, shown as follows.  
   
```xml
<warning>The GameOS included in this package is not approved for new title submissions. 
This version is allowed only for Content Updates where the original release used this 
version. Use only supported GameOS versions according to the Approved Libraries page on 
the Developer Network Portal</warning>  
```
   
  
If the versions of the components don't match each other or if the version isn't on the approved or deprecated lists, a failure will be logged, shown as follows.  
   
```xml
<failure>The GameOS version does not match the version of other Microsoft components 
included in this package. Use only components from the same Microsoft Game Development Kit (GDK)/Xbox One Software Development Kit release. Refer to the 
Approved Libraries page on the Developer Network Portal</failure>  
```
   > [!NOTE]
> Submission Validator might not complete its validation checks if the development PC on which it's running can't access online information, for example, it has no internet access, is blocked by a firewall, or has no network connectivity.
  
<a id="ID4EHD"></a>

   

## Launch marker in final chunk for content (downloadable content (DLC))  
   
  
To ensure proper operation in all scenarios, content packages must mark the final chunk with the launch marker attribute. If the final chunk doesn't include the launch marker, it's possible that the package could be tested correctly but cause problems for end users in some cases. The failure message is shown as follows.  
   
```xml
<failure>Content Packages require final layout chunk to include attribute marker="Launch"</failure>  
```
  
<a id="ID4EWD"></a>

   


  
<a id="ID4EDE"></a>

   

## Additional Resources.pri files  
   
  
Submission Validator checks that no additional *Resources.pri* files exist in other directories of the layout. As with *MicrosoftGame.config*, only the one in the root is used. However, having multiple copies could lead to confusion about which one is correct and what the developers' intent is concerning these other files.  
   
  
This parallels a similar check for additional copies of *MicrosoftGame.config*. In this case, additional copies result in a failure in the Foreign Files Check section of the log, shown as follows.  
   
```xml
<failure>D:\path\mytitle\mytitlesubdirectory\resources.pri</failure>  
```
  
<a id="ID4ERF"></a>

   

## Missing Resources.pri file  
   
  
Applications aren't required to be localized, but if an application doesn't include a *Resources.pri* file in the root (the same location as *MicrosoftGame.config*), the following warning appears in the Foreign Files Check section of the output log.  
   
```xml
<warning>Non-localized app: 'resources.pri' is missing</warning>  
```
  
<a id="ID4EBBAC"></a>


## One application per package  
   
  
Submission Validator now validates packages only contain one non-DevOnly application per package.  

  
<a id="ID4E3BAC"></a>

   

## Maximum package size  
   
  
Submission Validator checks to ensure that the package doesn't exceed the maximum package size of 49,900,000,000 bytes.  
  
<a id="ID4EDCAC"></a>

   

## Foreign File 
   
  
One of the problems encountered in reviewing submissions for the Xbox&nbsp;360 program was the inclusion of various files with the submission, generally accidentally, that shouldn't be part of a retail title.   
   
  
The Foreign File Check uses the layout .xml file to check all files brought into the title package for particular file names and extensions that aren't allowed in the package. This check is based on only the file names, not on the contents of the files. The disallowed files include extensions that are related to source and debug files, *Thumb.db*, extraneous registration files other than the ones in the root, and the full list of Xbox operating system files that can't appear in title packages. This check is used to validate the Xbox Requirement XR-003: Title Quality for Submission.   
   
  
The following table shows the file types and extensions that aren't allowed in the submitted title package.  
   

| File type| Extensions| 
| --- | --- | 
| Source-code&ndash;related files| .c .cpp, .cs, .lib, .h, .obj| 
| Debug/symbol information files| .pdb, .sym| 
| Legacy binary files| .xbe| 

   
  
We recognize the potential for a title to legitimately use almost any imaginable file extension and that this could lead to potential conflicts with the extensions checks. If this is an issue for your title, alert your developer account manager (DAM).  
   
  
If you feel you have an exceptional case that requires a file to be included in your title package for which you are receiving a "failure" message in the Submission Validator log, you should consult with your DAM.  
   
  
The following example shows the log output showing failures in the Foreign File Check.  
   
```xml
<component>Foreign File Check</component>
<failures>
  <failure>c:\MyTitle\loose\bar.cpp</failure>
  <failure>c:\MyTitle\loose\MySubDir\example.h</failure>
  <failure>c:\MyTitle\loose\MySubDir\PDBs\BlockedFiles\foo.pdb</failure>
</failures>
<filecount>3</filecount>  
```
  
<a id="ID4EEEAC"></a>

   

## Binary Scan 
   
  
Xbox console binaries (.exe and .dll) files must be built for AMD64 and be only native code. Currently, managed code binaries aren't supported on the platform. The Binary Scan Check examines each .exe and .dll file that will be included in the title package and ensures that it meets these requirements. This check is used to validate XR-003: Title Quality for Submission.  
   
  
The Binary Scan section is also where each .exe and .dll file is checked for dependencies that are blocked for security reasons on retail consoles. Generally, this takes the form of linking to a debug version of a platform file, *PIXEvt.dll*, or Xbox Studio.  
   
  
The following example shows the log output showing failures in the Binary Scan Check. The first two failures are the result of an .exe file being linked to two files that aren't allowed for retail consoles. The third failure is a managed .exe file. The final failure is a non-AMD64 native code .dll file.  
   
```xml
<component>Binary Scan</component>
      <dumpbinlocation>C:\Program Files (x86)\Microsoft Visual Studio 10.0\VC\bin\amd64\dumpbin.exe</dumpbinlocation>
      <failures>
   <failure>Non-retail dependency in file c:\MyTitle\loose\ExeWithDebugDependencies.exe: MSVCR110D.dll</failure>
  <failure>Non-retail dependency in file c:\MyTitle\loose\ExeWithDebugDependencies.exe: PIXEvt.dll</failure>
  </failures>
  <failure>Managed: Not AMD64: c:\MyTitle\loose\MySubDir\ABC.exe</failure>
  <failure>Not AMD64: c:\MyTitle\loose\MySubDir\XYZ.dll</failure>
</failures>  
```
   
  
Developers should ensure that such debugging-focused dependencies are excluded from release builds of binaries to be included in a submission package.  
  
<a id="ID4ESFAC"></a>

   

## Microsoft (MS) Component Versions  
   
  
With Xbox, much of the platform surface area has been encompassed in the Game OS. There are, however, a set of Microsoft-supplied binaries that are redistributed with titles. These files and their approved versions are listed on the Approved Libraries page on the Xbox Game Developer (XGD) site.  
   
  
The Submission Validator checks the versions of these files to ensure that any of the optional .dll files are of matching versions. It will also capture the Version ID of the Game OS that is being packaged into the XVC for an exclusive partition title. It's important that developers check the versions against the published approved library information before submitting.   
   
  
Submission Validator will also extract the version information for the optional Kinect and Xbox Services .dll files, if your title includes them.  
   
  
The following example shows the version information that appears in the Submission Validator log file.   
   
```xml
<component>MS Component Versions</component>
<component name="GameOS">60BBA05C-22F0-4452-84B6-DD278594716E</component>
<component name="Microsoft.Xbox.Services.dll">10.0.18362.7198</component>  
```
 
   
<a id="ID4E5OAC"></a>

   

## See also  
 [Submission Validator (SubmissionValidator.dll)](submissionvalidator.md)

 [Submission Validator Messages](submissionvalidator-messages.md) 

 [Make package (makepkg.exe)](../deployment/makepkg.md)

 [Title packaging, content updates, and streaming-installation testing](../title-packaging-streaming-install-testing.md)

 Xbox Requirements (XRs) [(Xbox Developer Downloads->Partner, Publishing, and Release Management Information->XGD Partner Documentation)](https://aka.ms/xgddl)

  