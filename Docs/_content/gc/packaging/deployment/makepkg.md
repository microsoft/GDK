---
author: M-Stahl
title: Make package (makepkg.exe)
description: Creates app packages and app package metadata.
kindex:
- Make Package (makepkg.exe)
- makepkg.exe
ms.author: scotmi
ms.topic: conceptual
edited: 10/30/2019
security: public
applies-to: pc-gdk
---

# Make package (makepkg.exe)

Creates app packages and app package metadata.
<table>
<tr><td><code>makepkg </code><i>command</i><code> [/updcompat 3] [/pc] [/gameos &lt;gameos file>] [/priorpackage &lt;prior package file>] [/f &lt;file name>] [/d &lt;content directory>] [/pd &lt;output directory>] [/l | /lk &lt;secret_key.lekb>] [/contentid &lt;ID>] [/productid &lt;ProductIDGUID>] [/nocrashdump] [/resw &lt;resw directory>] [/t &lt;xml output directory>] [/v] [/?]</code>



</td></tr>
</table>




<table>
<tr><th>Option</th><th>Description</th></tr>

<tr><td><i>command</i></td><td> Specifies the package or the app command to be performed.
<table>
<tr><th>

Command</th><th>

Function</th></tr>

 <tr><td>genmap</td><td> Builds an XML file to be used with the pack command based on contents of a target folder. The generated file will contain a single chunk and can be edited to split into chunks or provide tags as needed. <pre>
makepkg genmap /f &lt;targetXmlFile> /d &lt;contentdirectory></pre>
</td></tr>

 <tr><td>genid</td><td> Converts between a Product ID GUID and a Store ID. The generated GUID will match the product ID provided during submission of your product. A product ID GUID can be converted back to a Store ID. <pre>
makepkg genid /storeid &lt;storeId> | /productid &lt;productId></pre>
</td></tr>

<tr><td>pack</td><td> Creates a new app package from files on disk. <pre>
makepkg pack /f &lt;mapping file> /d &lt;content directory> /pd &lt;output package directory> /productid &lt;ProductIDGUID> [/l | /lk &lt;secret_key.lekb>] </pre>
 Creates an app package in the <b>output package directory</b> by adding files specified within the mapping file. For example, to package the contents of a directory with three files-a.txt, b.txt, and game.exe-the following mapping file would be used: <pre>
&lt;Package>
  &lt;Chunk Id="1000" Marker="Launch">
    &lt;FileGroup DestinationPath="\" SourcePath=".\" Include="a.txt"/>
    &lt;FileGroup DestinationPath="\" SourcePath=".\" Include="b.txt"/>
    &lt;FileGroup DestinationPath="\" SourcePath=".\" Include="game.exe"/>
  &lt;/Chunk>
&lt;/Package>
            </pre>
For a description of the mapping file schema, see <a href="atoc-deployment-schema.html">Deployment Package Schema</a>. The content directory specified (/d) must contain a valid game configuration file with the name MicrosoftGame.config. The MicrosoftGame.config file can be found in the build output directory of your app's Visual Studio project. For a description of the game config schema, see <a href="../../reference/system/microsoftgameconfig/microsoftgameconfig-schema.html">MicrosoftGame.config Schema</a>.<br/><br/> By default, <b>makepkg pack</b> encrypts the package by using a well-known encryption key recognized by all Development Kits for testing purposes (also known as the /lt encryption switch). These packages should not be considered cryptographically protected. To protect 
the package file for secure upload use the <b>/lk</b> &lt;local EKB file> switch (recommended for development and submission for console) or <b>/l </b> switch, which will override the default behavior.  <br/><br/><a href="makepkg.html">MakePkg.exe</a> will scan for certain files in your package and will move them to a special <b>registration</b> chunk. Among these files are MicrosoftGame.config, any images referenced within MicrosoftGame.config, and Resources.pri, if present.
<table>
<tr><th><b>NOTE:</b> </th></tr>
<tr><td>Use makepkg <b>localize</b> to generate the Resources.pri file.  For more advanced scenarios, see the topic for the <a href="makepri.html">Make package resource index (makepri.exe)</a> command-line tool.
</td></tr>
</table>

You can manually lay out these files in the layout.xml file, by specifying "Registration" in the ID attribute for the chunk that contains these files.

<table>
<tr><th>

<b>NOTE:</b> </th></tr>

<tr><td>Makepkg rejects binaries that contain relocations from within executable sections. Such relocations require modifications to the executable section at load time, which could enable code modifications to take place during this time. For this reason, makepkg will fail if it's presented a binary with such traits. One common way to prevent this is to avoid merging read-only data sections into another executable section when compiling your binaries.</td></tr>
</table>

 </td></tr>

<tr><td>validate</td><td> Runs the validation steps without building the package. Steps include running Submission Validator, which generates the log file that documents possible issues with package submission. Takes the same parameters as taken by the <b>makepkg pack</b> command, with the exception of the optional mapfile. <pre>
makepkg validate [options] [/f &lt;mapfile>] /d &lt;sourcedir> /pd &lt;destinationdir>              
            </pre>
 </td></tr>

 <tr><td>localize</td><td> Generates a Resources.pri file from PNG and RESW files in a content directory. A MicrosoftGame.config file must
be present in the directory in order for localized information to be discovered. This file should specify the language definitions
and image files for shell localization. The resulting Resources.pri will be placed at the root of the output directory if supplied
and in the content directory if no output directory is supplied. If a temporary directory is supplied, an XML conversion of the
Resources.pri file will be generated in that temporary directory for manual validation. For more information about using Resources.pri files, see <a href="../../system/overviews/microsoft-game-config/MicrosoftGameConfig-Localization.html">MicrosoftGame.config localization</a>. <pre>
 makepkg localize [/d &lt;content directory>] /pd &lt;destinationdir> /resw &lt;resw directory> /t &lt;xml output directory> /gc &lt;game config path>             
             </pre>
  </td></tr>

<tr>
<td><section id="genkey">genkey</section></td>
<td><p>Generates a local escrowed key blob (LEKB). A random content key is generated
and stored in the LEKB file. </p>
<p> The LEKB generated is for use with the makepkg pack /lk encryption switch. Generally, you will use genkey for every trust boundary you want to have. For example, you could use genkey once and use one key studio-wide, or use one key per product, depending on who should have access to the package. </p>

To generate the LEKB:

<pre>makepkg genkey /ekb &lt;The path to save the generated LEKB file.></pre>

To use the LEKB to encrypt your package, using the /lk encryption switch:

<pre>makepkg pack /lk &lt;The path to your LEKB file created by the genkey command.> </pre>

<p>The LEKB file should be provided as an option to makepkg pack to use a stable encryption key (/lk encryption) during package creation. This has 4 main benefits:</p>

<ol>
  <li>packageutil compare can generate correct update size estimates (unlike /l).</li>
  <li>It enables secure delta upload to Partner Center using the same algorithm that consoles and PCs use to download content updates. (unlike /l) </li>
  <li>It can be installed onto devkits (unlike /l).</li>
  <li> It uses secure encryption key material and can only be decrypted in specific environments (unlike /lt).</li> 
</ol>


<p>The contents of the LEKB file is only lightly obfuscated. It is your responsibility to
ensure the security of your content packages by securing access to the LEKB file.
<b> Anyone possessing the LEKB file and the content package file output by makepkg pack can decrypt its contents. </b> </p>

Note: the extension `.lekb` for the Local EKB file created by genkey is recommended to distinguish it from the `.ekb` file generated by `makepkg pack`, with the "l" standing for "locally created".</td></tr>

<tr><td>/updcompat 3</td><td> Used with the <b>pack</b> command. The only supported value is 3 which uses sub-file content update granularity.</td></tr>

<tr><td>/pc</td><td>Used with the <b>pack</b> command. Optional parameter that indicates that this is an MSIXVC package specifically targeting PC publishing. Packages produced with this flag can be deployed to, tested, or published for Windows 10 PCs only, not for Xbox consoles.</td></tr>

<tr><td>/priorpackage &lt;prior package file></td><td>Used with the <b>pack</b> command. Optional parameter that specifies the prior package file to be used to optimize sub-file content updates. Implies /updcompat 3.</td></tr>


<tr><td>/gameos &lt;gameos file></td><td>Used with the <b>pack</b> command. Optional parameter that specifies the gameos file to be embedded in the package. If this parameter isn't used, or if no gameos file is specified, the GameOs.xvd file is required to be in the layout directory next to the executable.</td></tr>

<tr><td>/storeid &lt;storeId></td><td>Used with the <b>genid</b> command. Specifies the Store ID to use.</td></tr>

<tr><td>/f &lt;file name></td><td>Specifies an input file. When used with the <b>pack</b> or <b>validate</b> command, it specifies a mapping file. When used with the <b>appdata</b> command, it specifies the Application Manifest file.</td></tr>


<tr><td>/d &lt;content directory></td><td>Specifies the content directory. The specified directory (such as the layout\image\loose directory for your project) must contain a valid MicrosoftGame.config file.</td></tr>

<tr><td>/pd &lt;output directory></td><td>Specifies the output directory</td></tr>

<tr><td>/lk &lt;lekbfile></td><td>Encrypts the package with a content license using a specified ekb file. See the <a href="#genkey"> genkey command </a> for more information.

By default, <b>makepkg pack</b> encrypts the package by using a well-known encryption key recognized by all devkits for testing purposes. Both the <b>/lk</b> and <b>/l</b> switch override the default behavior.
<table>
<tr><th>NOTE:</th></tr>
<tr><td>When submitting a package to certification, you must use <b>/l or /lk</b> unless the Certification team has directed you to do otherwise.</td></tr>
</table>
</td></tr>

<tr><td>/l</td><td>Encrypts the package with a unique content license. Used with the <b>pack</b> command. 
<br/>
By default, <b>makepkg pack</b> encrypts the package by using a well-known encryption key recognized by all devkits for testing purposes. Both the <b>/lk</b> and <b>/l</b> switch override the default behavior. 
<table>
<tr><th>NOTE:</th></tr>
<tr><td>When submitting a package to certification, you must use <b>/l or /lk</b> unless the Certification team has directed you to do otherwise.</td></tr>
</table>
</td></tr>

<tr><td>/contentid &lt;ID></td><td>Optional parameter that specifies the content ID to which this package belongs. The ID is a GUID. If this parameter isn't present or is specified with a value of 00000000-0000-0000-0000-000000000000, a stable GUID based upon the package family name will be used. This parameter isn't necessary when you prepare builds for submission. It's used with the <b>pack</b> command.  It is recommended that you do not specify this option or that you keep this option the same between different invocations of makepkg per game product, to enable calculation of update sizes using the [packageutil compare utility](packageutil.md).</td></tr>

<tr><td>/productid &lt;ProductIDGUID></td><td>Optional parameter that specifies the product ID to which this package belongs. The ID is a GUID. If this parameter isn't present, the GUID will be 00000000-0000-0000-0000-000000000000. This parameter isn't necessary when you prepare builds for submission. It's used with the <b>pack</b> and <b>genid</b> commands. ProductID is to be included when you want to enumerate the DLC packages installed from burned discs, or when the system is running offline.</td></tr>

<tr><td>/symbolpaths</td><td>Allows specifying additional paths for symbol resolution lookup during the symbol bundling. The paths should be specified as a semicolon-delimited list.</td></tr>

<tr><td>/skipsymbolbundling</td><td>Specifies that the symbol-bundling step is to be skipped. We don't recommend the use of this flag.</td></tr>

<tr><td>/skipvalidation</td><td>Specifies that the validation step is to be skipped. No Submission Validator log file will be generated when this flag is used. We don't recommend the use of this flag for builds that might be  submitted to certification, but it can speed up local iteration times.</td></tr>

<tr><td>/validationcritical</td><td>Specifies that failures in Submission Validator are to be treated as critical failures for the MakePkg process.</td></tr>

<tr><td>/t</td><td> Used with the <b>localize</b> command. Optional directory for converting the Resources.pri contents to an XML format.  Viewing the contents of Resources.pri in an xml format is convenient for ensuring the contents of Resources.pri are what you expect.</td></tr>

<tr><td>/resw</td><td> Used with the <b>localize</b> command. Optional directory path relative to the root directory, which contains RESW files if they aren't present in the immediate root directory.</td></tr>

<tr><td>/gc</td><td> Used with the <b>localize</b> command. Optional path to the MicrosoftGame.config file if it isn't located at the base of the content directory or has a name other than MicrosoftGame.config.</td></tr>

<tr><td>/v</td><td>Enables verbose output to the console.</td></tr>

<tr><td>/loggable</td><td>Suppresses output containing control characters which are not suitable for being written to a log file. For example, copy progress uses a rolling percentage in non-verbose mode which can bloat log files.</td></tr>

<tr><td>/?</td><td>Displays help.</td></tr>
</table>
</td></tr>
</table>


<a id="remarks"></a>



## Remarks  

When **makepkg pack** is run, a binary package file is created, referred to as an Xbox Virtual Container (XVC). XVCs for console have the file name extension of .xvc and for PC have the file name extension of .msixvc. In addition to the extension difference, there is a suffix added to the package name to differentiate between Xbox One Family (_x) and Xbox Series X&#124;S Family (_xs) packages. 

When **makepkg pack** or **makepkg validate** is run, a set of validation tests is performed. The amount of time taken by these tests depends on the size of the title and the number of files.

The results of the validation test are logged to an XML file that's in the same output directory as the one used for the app package output. The log lists all the errors that must be corrected for the title to pass validation. The validation tests check for common errors that historically have led to titles being delayed or later rejected from the mastering and certification process.

**makepkg** sets the following exit codes:  

<table>
<tr><th>

Exit code</th><th>

Description</th></tr>

<tr><td>0</td><td>Success</td></tr>

<tr><td>1</td><td>Bad environment: kernel driver isn't installed; not running in an elevated command prompt</td></tr>

<tr><td>2</td><td>Invalid command line</td></tr>

<tr><td>3</td><td>Failed to build the output</td></tr>
</table>



More extensive information is also logged to stderr.  


<a id="ID4ESJAC"></a>


## See also  
[Deployment package schema](atoc-deployment-schema.md)

[Make package resource index (makepri.exe)](makepri.md)

[MicrosoftGame.config](../../system/overviews/microsoft-game-config/MicrosoftGameConfig-toc.md)