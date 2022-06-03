---
title: System Strings Validatation URIs
description: " System Strings Validatation URIs"
ms.date: 10/12/2017
ms.topic: article
keywords: xbox live, xbox, games, uwp, windows 10, xbox one
ms.author: joanlee
security: public
author: joannaleecy
---

# System Strings Validatation URIs
 
This section provides detail about Universal Resource Identifier (URI) addresses and associated Hypertext Transport Protocol (HTTP) methods from Xbox Live Services for *system strings validation*.
 
Before uploading persistent string data to , it should be validated to ensure it doesn't violate the Code of Conduct or Terms of Use. This REST resource takes an array of strings and returns a result code for each one, indicating whether or not it is acceptable on , and a string containing the offending term.
 
The domain for these URIs is client-strings.xboxlive.com.
 
<a id="ID4EQB"></a>

 
## In this section

[/system/strings/validate](uri-systemstringsvalidate.md)

&nbsp;&nbsp;Accesses an array of strings for validation.
 
<a id="ID4EWB"></a>

 
## See also
 
<a id="ID4EYB"></a>

 
##### Parent 

[Universal Resource Identifier (URI) Reference](../atoc-xboxlivews-reference-uris.md)

   