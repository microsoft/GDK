---
author: aablackm
title: Application Management (wdapp.exe)
description: Installs and registers applications on the local PC.
ms.assetid: 4b2a4ee4-b4f3-1eae-254a-97b0eda1edc5
kindex:
- Application Management (wdapp.exe)
- PLM events, remote triggering
- application management, remote
- wdapp.exe
- tools options, remote application management
- command-line arguments, passing to an application with wdapp launch
- wdapp.exe, install
- wdapp.exe, uninstall
- wdapp.exe, register
- wdapp.exe, unregister
- wdapp.exe, launch
- wdapp.exe, list
- wdapp.exe, update
ms.author: scotmi
ms.topic: conceptual
edited: 12/13/2019
security: public
applies-to: pc-gdk
---

# Application Management (wdapp.exe)

Application Management (wdapp.exe) is a command-line tool that installs and launches PC Microsoft Game Development Kit (GDK) titles.

wdapp provides the subcommands and functions described in the following table.  

| Command | Description |
| --- | --- |
| [wdapp launch](#wdapp_launch) | Launches an application by specifying the application's Application User Model ID (AUMID). |
| [wdapp list](#wdapp_list) | Lists all sideloaded applications on the PC. |
| [wdapp gamefolder](#wdapp_gamefolder) | Query or set the install folder for drive. |
| [wdapp update](#wdapp_update) | Streams a packaged build update from a network share or local system file path. |
| [wdapp install](#wdapp_install) | Deploys an application by starting the streaming installation of an application package that was created with [makepkg](../../packaging/deployment/makepkg.md). |
| [wdapp register](#wdapp_register) | Registers the application in the specified folder. |
| [wdapp uninstall](#wdapp_uninstall) | Terminates and deregisters all the processes in the package. |
| [wdapp unregister](#wdapp_unregister) | Unregisters an application. |
| [wdapp migrate](#wdapp_migrate) | Migrate to Flat File Install. |


<a id="ID4EFMAC"></a>

   

## Deploying, installing, updating, listing, and removing applications  
 


<a id="wdapp_launch"></a>

   

### wdapp launch 

Launches an application that's defined by providing an AUMID or the path to the executable.

<table>
<tr><td><b>wdapp launch</b> <i>AUMID</i> | <i>Executable</i>
</td></tr>
</table>

<table>
<tr><th>

Option</th><th>

Description</th></tr>

<tr><td><i>AUMID</i></td><td>Specifies the AUMID of the application that's being launched. wdapp launch will take the AUMID option or the Executable option, but not both when specified.</td></tr>
<tr><td><i>Executable</i></td><td>Specifies the path to the executable of the application that's being launched. wdapp launch will take the AUMID option or the Executable option, but not both when specified.</td></tr>

</table>

   
  
 [Return to the top of this topic.](gr-wdapp.md)   
 

 

<a id="wdapp_list"></a>

   

### wdapp list 

<table>
<tr><td><b>wdapp list</b>
</td></tr>
</table>

<table>
<tr><th>

Option</th><th>

Description</th></tr>

<tr><td>/d</td><td>Provides detailed information about the listed applications.</td></tr>

</table>

   
  
 [Return to the top of this topic.](gr-wdapp.md)   
 

 


<a id="wdapp_gamefolder"></a>

   

### wdapp gamefolder 

<table>
<tr><td><b>wdapp gamefolder </b> <i>&lt;DriveLetter>:</i> [/set &lt;FolderPath>]
</td></tr>
</table>

<table>
<tr><th>

Option</th><th>

Description</th></tr>

<tr><td><i>&lt;DriveLetter>:</i></td><td>Specifies the targert drive the streaming install will happen on. Defaults to OS drive in a root folder called XboxGames.</td></tr>

<tr><td>/set</td><td>Sets up the streaming install folder for the drive specified in &lt;DriveLetter>. Defaults to XboxGames.</td></tr>

</table>

   
  
 [Return to the top of this topic.](gr-wdapp.md)   




<a id="wdapp_update"></a>

   

### wdapp update 

<table>
<tr><td><b>wdapp update</b> <i>packagepath</i> [/l|/AllChunks] [/b] [/a] [/m] [/ContentTypes=[semicolon-delimited specifier list] ] [/Languages=[semicolon-delimited specifier list] ] [/Devices=[semicolon-delimited specifier list] ] [/Tags=[semicolon-delimited specifier list] ]
</td></tr>
</table>

<table>
<tr><th>

Option</th><th>

Description</th></tr>

<tr><td><i>packagepath</i></td><td>Specifies the path to the package file that's used for the update.</td></tr>

<tr><td>/l</td><td>Specifies that the update stops after the launch chunk has been received.</td></tr>

<tr><td>/AllChunks</td><td>Specifies that the update will forcefully install all chunks, even if they're unchanged.</td></tr>

<tr><td>/b</td><td>Specifies if the update is allowed to go backward to a previous version.</td></tr>

<tr><td>/a</td><td>Registers the update as available.</td></tr>

<tr><td>/m</td><td>Registers the update as mandatory.</td></tr>

<tr><td>/ContentTypes=[semicolon-delimited specifier list]</td><td>Specify which ContentTypes specifiers to update by default.</td></tr>

<tr><td>/Languages=[semicolon-delimited specifier list]</td><td>Specifies which language specifiers to update by default.</td></tr>

<tr><td>/Devices=[semicolon-delimited specifier list]</td><td>Specify which devices specifiers to update by default.</td></tr>

<tr><td>/Tags=[semicolon-delimited specifier list]</td><td>Specify which tag specifiers to update by default. Specify '/Tags=' to clear all tags.</td></tr>

</table>


   
  
 [Return to the top of this topic.](gr-wdapp.md)   
 

 

<a id="wdapp_install"></a>

   

### wdapp install  
   
  
Deploys an application by starting the streaming installation of an application package that was created with [makepkg](../../packaging/deployment/makepkg.md).   
   
  
The **install** command reflects the streaming installation process that will happen when an application is installed on a retail PC.    
   
  
For more information about testing streaming installation packages, see [Streaming Installation and Intelligent Delivery: an overview](../../packaging/overviews/streaming_install-intelligent_delivery.md).   
   
 
<table>
<tr><td><b>wdapp install</b> [/l|/AllChunks] [/drive=[drive letter] ] [ /ContentTypes=[semicolon-delimited specifier list] ] [/Languages=[semicolon-delimited specifier list] ] [/Devices=[semicolon-delimited specifier list] ] [/Tags=[semicolon-delimited specifier list] ] [/Drive [Optional] ] [/tm] [/l] [/v] [/w] ] <i>{ packagepath &#124; packageURI }</i>



</td></tr>
</table>
  
  

 
<table>
<tr><th>

Option</th><th>

Description</th></tr>
<tr><td>/Features=[semicolon-delimited list of Features]</td><td>Indicates which Features are to be installed by default. Cannot be used with /Tags.</td></tr>

<tr><td>/Recipes=[semicolon-delimited list of Recipes.]</td><td>Indicates which Features are to be installed by default. Cannot be used with /Tags.</td></tr>

<tr><td>/Languages=[semicolon-delimited specifier list]</td><td>Specifies which language specifiers to install by default.</td></tr>

<tr><td>/Devices=[semicolon-delimited specifier list]</td><td>Specify which devices specifiers to install by default.</td></tr>

<tr><td>/Tags=[semicolon-delimited specifier list]</td><td>Specify which tag specifiers to install by default. Specify '/Tags=' to clear all tags.</td></tr>

<tr><td>/drive=[drive letter]</td><td>Specify the target drive that the application should be installed to instead of using the default.</td></tr>

<tr><td>/tm</td><td>Prints a transfer performance metrics summary after all the files have been transferred.</td></tr>

<tr><td>/l</td><td> Specifies that the installation stop after the launch chunk has been received. </td></tr>

<tr><td>/AllChunks</td><td>Specifies that the installation will forcefully install all chunks.</td></tr>

<tr><td>/v</td><td> Display verbose messages. </td></tr>

<tr><td><i>{ packagepath &#124; packageURI }</i></td><td> Specifies the location of the application package by providing either <i>packagepath</i>, which is a path on the development computer, or <i>packageURI</i>, which is a URI. To install from a burned optical disc (DVD or Blu-ray Disc), the xo:\ drive prefix followed by the file name can be provided to xbapp install: <pre>
wdapp install /w xo:\packagepath</pre>
 </td></tr>
</table>

   
  
 [Return to the top of this topic.](gr-wdapp.md)   
 

 

 
<a id="wdapp_register"></a>

### wdapp register  
   
  
Registers the application in the specified folder.

<table>
<tr><td><b>wdapp register </b><i>folder_path</i>  
 </td></tr>
</table>
  
  
  
   
<table>
<tr><th>

Option</th><th>

Description</th></tr>

<tr><td><i>folder_path</i></td><td> Specifies a folder path relative to the application root directory that contains the <a href="../../system/overviews/microsoft-game-config/MicrosoftGameConfig-toc.html">MicrosoftGame.config</a> file that the title should be registered from.</td></tr>

</table>

   
  
 [Return to the top of this topic.](gr-wdapp.md)   
 

 

<a id="wdapp_uninstall"></a>

   

### wdapp uninstall  
   
  
Terminates and deregisters all the processes in the package.  
 
<table>
<tr><td><b>wdapp uninstall </b><i>package_full_name</i>
</td></tr>
</table>



 
<table>
<tr><th>

Option</th><th>

Description</th></tr>

<tr><td><i>package_full_name</i></td><td> Specifies the full package name of the application. For example, <b>mygame_1.0.0.0_neutral__r9wapr0zzdgy</b>.  
 </td></tr>
</table>

   
  
 [Return to the top of this topic.](gr-wdapp.md)   
 

 

 

  
<a id="wdapp_unregister"></a>

   

### wdapp unregister  
   
  
Terminates and unregisters a package.  
 
<table>
<tr><td><b>wdapp unregister </b><i>package_full_name</i>



</td></tr>
</table>



 
<table>
<tr><th>

Option</th><th>

Description</th></tr>

<tr><td><i>package_full_name</i></td><td> Specifies the full package name of the application. For example, <b>mygame_1.0.0.0_neutral__r9wapr0zzdgy</b>.  

 </td></tr>

</table>

   
  
 [Return to the top of this topic.](gr-wdapp.md)   
 

 

<a id="wdapp_migrate"></a>

   

### wdapp migrate 
   
  
Migrates an existing MSIXVC install to the flat file install format. This command is provided to migrate the install format of an existing game that is already installed to the [Flat File Install](../../packaging/packaging-flatfileinstall.md) format when using the March 2022 Microsoft Game Development Kit (GDK).
 
<table>
<tr><td><b>wdapp migrate </b> <i>&lt;PackageFullName></i>
</td></tr>
</table>

<table>
<tr><th>

Option</th><th>

Description</th></tr>

<tr><td><i>&lt;PackageFullName></i></td><td>Specifies the full package name of the application. For example, <b>mygame_1.0.0.0_neutral__r9wapr0zzdgy</b>.</td></tr>

</table>

   
  
 [Return to the top of this topic.](gr-wdapp.md)   



   

 
<a id="remarks"></a>

   

## Remarks  
   
  
For more information on installing and launching PC Microsoft Game Development Kit (GDK) titles, see  [Utilizing Microsoft Game Development Kit tools to install and launch your PC title](../launching-on-pc.md).
  
<a id="ID4EW5AG"></a>

   

## See also  
 [PC Command-line tools](gr-commandlinetools-toc.md) 
 [Flat File Install Overview](../../packaging/packaging-flatfileinstall.md) 
 [Utilizing Microsoft Game Development Kit tools to install and launch your PC title](gr-wdapp.md) 


 