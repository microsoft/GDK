---
title: Automating package uploading
description: Describes how to automate uploading of packages to Partner Center.
kindex: Automating package uploading
author: v-redwards
ms.author: v-redwards
ms.topic: conceptual
edited: 00/00/0000
security: public
---

# Package Uploader

Package Uploader is a .NET 5.0-based cross-platform application and library that enables game developers to interact programmatically with Partner Center. 

Package Uploader has a command-line tool and a dynamic linked library (DLL) that you can integrate into your build pipelines or other development workflows. 

The initial 1.0 release of Package Uploader provides the following functionality: 

* Retrieves metadata about a particular product
* Uploads a new Xbox .xvc, .appx, or .msixvc package
* Removes previously uploaded packages
* Imports packages from one branch to another
* Publishes packages to a sandbox

Download the latest version of the Package Uploader tool on GitHub at [https://github.com/microsoft/PackageUploader](https://github.com/microsoft/PackageUploader). 