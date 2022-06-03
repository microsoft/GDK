---
author: M-Stahl
title: Submission Validator introduction
description: Describes the library called by makepkg that runs a series of basic quality checks on a title or app package.
kindex:
- Submission Validator (SubmissionValidator.dll)
- SubmissionValidator.dll
- validation
ms.author: zhooper
ms.topic: conceptual
edited: 04/03/2020
security: public
---

# Submission Validator (SubmissionValidator.dll)
   
  
Submission Validator is a component of the Microsoft Game Development Kit (GDK) that runs a series of basic quality checks on a title or app package. Submission Validator provides feedback to developers for addressing common problems that would cause titles to fail during the content ingestion and certification process at Microsoft. When a title package is submitted, the most current version of Submission Validator is used to detect any failures that could lead to the title being rejected. The overarching goal of Submission Validator is to automate these checks and push them as early into the process as possible to ensure that partners are able to self-diagnose and correct problems prior to submitting their title package for certification.  
   
   *  [Using Submission Validator](#ID4EU)  
   *  [Problems identified by Submission Validator](#ID4EUC)  
   *  [Understanding the Results Log](#ID4EDD)  
   *  [Updating Submission Validator](#ID4E4E)  
   *  [Submission Validator Release Notes][#SubValUpdates]

 
<a id="ID4EU"></a>

   

## Using Submission Validator  
   
  
Submission Validator isn't a standalone tool that the developer uses. Rather, it's automatically called to check an app whenever the [makepkg pack](../deployment/makepkg.md) command is used. For more information about syntax and command-line use, see the [makepkg](../deployment/makepkg.md) reference page.  
   
  
Submission Validator runs after the title package is created. Failures in the validation are recorded in the validation log, which is written to the output location that's specified on the [makepkg](../deployment/makepkg.md) command line. This is the same output location where the finished title package is created.
   
  
A subset of Submission Validator tests can be run before title package creation by running the [makepkg validate](../deployment/makepkg.md) command line. We recommend running it to catch issues before package creation. 

   
<a id="ID4EUC"></a>

   

## Problems identified by Submission Validator  
   
  
The types of problems that Submission Validator identifies will grow and evolve over time to work toward the goal of smoothing the way from submission, through certification, and to market. For the current list of problems that Submission Validator detects, see [Submission Validator quality checks](submissionvalidator-tests.md).   
  
<a id="ID4EDD"></a>

   

## Understanding the Results Log  
   
  
After the `makepkg` process is complete, the title XVC appears in the output folder. The validation log is in this same folder. You can recognize it by its name in the form of *"Validator_[title and package identifier].xml."* You should examine this log for any failures or warnings. In addition to failures and warnings already shown in previous sections, any `<failure>` tag designates a condition that will cause your submission to be rejected as part of the content ingestion, mastering, and certification phase. Although nothing prevents you from submitting such a package, doing so will cause you wasted time and effort. It's far better to correct the problems identified until the log contains no `<failure>` tags.
   
  
You may also see `<warning>` tags in the log. These generally indicate issues that might require an exception. If you have questions about any warnings that are identified, contact your developer account manager (DAM). Even if you're granted an exception for your title, the `<warning>` tag still appears in the log file. For a full list of log messages, please see [Submission Validator Messages](submissionvalidator-messages.md).   
   
  
The `<validatorrun>` section is at the end of the log, shown as follows. This section contains a `<result>` tag that indicates overall Fail or Success for Submission Validator tests. Any failure in any section results in an overall failure.  
   
```xml
<validatorrun>
  <starttime>Sep 23 2019 16:43:41</starttime>
  <endtime>Sep 23 2019 16:43:41</endtime>
  <result>Fail</result>
</validatorrun>  
```
   
  
The version number for Submission Validator that's being used for the test is at the top of the log file. The following example shows this version number in a log file.  
   
```xml
<XboxOneSubmissionValidator>
  <engineversion>10.0.18362.7198</engineversion>  
```
   
  
Your submission will be tested by using the latest version of Submission Validator when your submission is received at Microsoft. We strongly recommend that you regularly update the version of Submission Validator that you're using as you prepare to submit your title. For more information, see the following section.
  
<a id="ID4E4E"></a>

   

## Updating Submission Validator  
   
  
Submission Validator is implemented as a separate SubmissionValidator.dll found in the `\Bin` directory of the Microsoft Game Development Kit (GDK). Updates to Submission Validator won't always correspond to the release cycle of the Microsoft Game Development Kit (GDK). The current version of Submission Validator is always available for download from [Xbox Developer Downloads->GDK->Submission Validator](https://aka.ms/gdkdl). Download the compressed (.zip) file, open it, and place the updated SubmissionValidator.dll in the `\Bin` directory of the Microsoft Game Development Kit (GDK), overwriting the previous version of Submission Validator. The Certification Tools page also includes the current release version number and date. Inside the compressed file, there's a text file containing release notes for the current version, including known issues and information about changes to the checks performed by Submission Validator that differ from the descriptions in this topic.  
   
  
When an app, a title, or a content package is submitted to Microsoft, the current version of Submission Validator is used to check that submission. Before you submit your app, title, or content package, we recommend that you ensure that you have the current version of Submission Validator on the development PC on which the submission package is being built.   
  
<a id="SubValUpdates"></a>

## Submission Validator Release Notes

For more information on what changes with each release of Submission Validator, please see the [Submission Validator Updates][http://aka.ms/subvalupdates] feed on the Xbox Developer Forums.  

<a id="ID4EOF"></a>

## In this section  
  
[Submission Validator quality checks](submissionvalidator-tests.md)  
Describes the quality checks that are performed by Submission Validator.   

[Submission Validator Messages](submissionvalidator-messages.md) 
Describes the messages (Warnings, Errors and Advisory) that are outputted by Submission Validator.   


## See also   
 [Make package (makepkg.exe)](../deployment/makepkg.md)

 [Title packaging, content updates, and streaming-installation testing](../title-packaging-streaming-install-testing.md)

 Xbox Requirements (XRs) [(Xbox Developer Downloads->Partner, Publishing, and Release Management Information->XGD Partner Documentation)](https://aka.ms/xgddl)

  
<a id="ID4ECG"></a>

   


 