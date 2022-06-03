---
author: M-Stahl
title: packageutil.exe
description: Retrieves signing key information for a package file and compares a base package file with an updated package file.
kindex: packageutil.exe
ms.author: scotmi
ms.topic: conceptual
edited: 10/30/2019
security: public
applies-to: pc-gdk
---

# packageutil.exe
   
  
PackageUtil is used to retrieve the signing key information for a package file and to compare a base package file with an updated package file.  
   
  
PackageUtil provides the following subcommands and functions:  
 
<table> 
<tr> <th>

Command</th> <th>

Description</th> </tr>
 
<tr> <td><a href="#packageutil_license">packageutil license</a></td> <td>Retrieves information about the signing key used on the specified package</td> </tr>
 
<tr> <td><a href="#packageutil_compare">packageutil compare</a></td> <td>Compares two packages created by MakePkg.exe: a base package file and an updated package file</td> </tr>
 
<tr> <td><a href="#packageutil_info">packageutil info</a></td> <td>Provides information about a package, including the version number, ContentID, ProductID, GameOS version, and Encryption Key IDs</td> </tr>
 
<tr> <td><a href="#packageutil_chunkinfo">packageutil chunkinfo</a></td> <td>Provides information about the chunks in a package, including the ID, chunk size, and specifiers</td> </tr>
<tr> <td><a href="#packageutil_osinfo">osinfo</a></td><td>Provides information about a particular title's OS, including the GUID, edition number, and four-part version number</td></tr>
 </table>

 
<a id="packageutil_license"></a>

   

## packageutil license  
   
  
Retrieves information about the signing encryption key used on the specified package. The license command causes `packageutil` to output one of the following values:  
   
   * Submission signed (/l) - only for submission to Partner Center
   * Test signed - (/lt) - sideload enabled; insecurely encrypted
> [!NOTE]
> Currently, packageutil license will return /lk signed packages as /l signed.
 
<table>
<tr><td><code>packageutil license </code><i>&lt;packagefile></i><code> [&lt;ekbfile>] [/?]</code>



</td></tr>
</table>



 
<table>
<tr><th>

Option</th><th>

Description</th></tr>

<tr><td><i>&lt;packagefile></i></td><td> Specifies the package file to be examined. </td></tr>

<tr><td>&lt;ekbfile></td><td> Optionally verifies that an EKB file is the correct EKB file associated with the package file. When you're submitting your package for certification, this test can be used to ensure you're providing the correct EKB file for the package being certified. If you specify an EKB file, <code>packageutil</code> will display "Matched Package and EKB" or "ERROR: Mismatched Package and EKB" in addition to the signing key information. The EKB file contains the encryption key material and is created along with the encrypted package when a package is being built with <a href="makepkg.html">makepkg /l</a> or <a href="makepkg.html">makepkg /lk.</a> If using makepkg /lk, do not attempt to use the CEKB or LEKB in this parameter. </td></tr>

<tr><td>/?</td><td> Displays help text. </td></tr>
</table>

  
<a id="packageutil_compare"></a>

   

## packageutil compare  
   
  
PackageUtil compares two packages created by makepkg.exe: a base package file and an updated package file. Packages must be created by using the same ContentID, and both must be created with the **/LK** (recommended) encryption option, or the default encryption mode of makepkg.exe. Don't supply the **/L**  command-line switch, as the results will not be accurate.

PackageUtil produces a report that includes a list of data that will be downloaded in order to update from the basepackagefile to the updatedpackagefile. The report uses the same algorithm that a retail console will use to perform the update. The report will list the percent of each file that will be downloaded and within each file the exact ranges of data that will be downloaded.

Finally, PackageUtil provides an estimate of the size of the download that will be performed when the console is updated from the base package to the update package. If the package uses Intelligent Delivery then this estimate is produced for a variety of scenarios of device type and language combinations.  
 
<table>
<tr><td><code>packageutil compare </code><i>&lt;basepackagefile></i> <i>&lt;updatedpackagefile></i><code> [/?]</code>



</td></tr>
</table>



 
<table>
<tr><th>

Option</th><th>

Description</th></tr>

<tr><td><i>&lt;basepackagefile></i></td><td> Specifies the base package file for the comparison </td></tr>

<tr><td><i>&lt;updatedpackagefile></i></td><td> Specifies the updated package file for the comparison </td></tr>

<tr><td>/?</td><td> Displays help text </td></tr>
</table>

  
<a id="packageutil_info"></a>

   

## packageutil info  
   
  
Provides information about a package, including the version number, ContentID, ProductID, GameOS version, and Encryption Key IDs.  
 
<table>
<tr><td><code>packageutil info </code><i>&lt;packagefile></i>



</td></tr>
</table>



 
<table>
<tr><th>

Option</th><th>

Description</th></tr>

<tr><td><i>&lt;packagefile></i></td><td> Specifies the package file to be examined </td></tr>
</table>

  
<a id="packageutil_chunkinfo"></a>

   

## packageutil chunkinfo  
   
  
Provides information about the chunks in a package, including the ID, chunk size, and specifiers.  
 
<table>
<tr><td><code>packageutil chunkinfo </code><i>&lt;packagefile></i>



</td></tr>
</table>



 
<table>
<tr><th>

Option</th><th>

Description</th></tr>

<tr><td><i>&lt;packagefile></i></td><td> Specifies the package file to be examined </td></tr>
</table>

<a id="packageutil_osinfo"></a>
## packageutil osinfo
Provides information about a particular title's OS, including the GUID, edition number, and four-part version number.
<table>
<tr><td><code>packageutil osinfo </code></td></tr>
</table>
  
<a id="ID4EZH"></a>

   

## See also  
 [Deployment package schema](atoc-deployment-schema.md)

 [Make package resource index (makepri.exe)](makepri.md)

  