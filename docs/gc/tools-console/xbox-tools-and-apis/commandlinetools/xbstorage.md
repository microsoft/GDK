---
author: jgup
title: Manage XGameSave storage on console (xbstorage.exe)
description: Manages XGameSave storage on the console.
ms.assetid: 4d6f8a21-8ac3-602c-a47d-b4fb274355eb
kindex:
- Manage XGameSave storage on console(xbstorage.exe)
- xbstorage.exe
ms.author: jgup
ms.topic: conceptual
edited: 10/15/2020
security: public
---

# Manage XGameSave storage on Console (xbstorage.exe)

Use this tool to manage XGameSave storage on the console. The tool provides the following subcommands and functions.   
> [!NOTE]
> If you need to manage XGameSave files on the PC, you must use the
[xgamesaveutil.exe command-line tool](../../../tools-pc/commandlinetools/gr-xgamesaveutil.md).
 
<table> 
<tr> <th>

Command</th> <th>

Description</th> </tr>
 
<tr><td><a href="#xbstorage_reset">reset</a></td><td>Deletes all local data for the specified PFN and SCID on the console</td></tr>
 
<tr><td><a href="#xbstorage_import">import</a></td><td>Imports data from the specified XML file to an XGameSave storage space</td></tr>
 
<tr><td><a href="#xbstorage_export">export</a></td><td>Exports data from an XGameSave storage space to the specified XML file</td></tr>
 
<tr><td><a href="#xbstorage_delete">delete</a></td><td>Deletes data from an XGameSave storage space</td></tr>
 
<tr><td><a href="#xbstorage_generate">generate</a></td><td>Generates dummy data and saves it to the specified XML file</td></tr>
 
<tr><td><a href="#xbstorage_simulate">simulate</a></td><td>Simulates out-of-storage-space conditions</td></tr>
 </table>

 
<a id="xbstorage_reset"></a>

## xbstorage reset  
  
Erases all local data in XGameSave storage on the local console, restoring it to factory settings. Data persisted to the cloud isn't modified and is downloaded again, if necessary.  
 
<table>
<tr><td><b>xbstorage reset</b> [/force]

</td></tr>
</table>


<table>
<tr><th>

Option</th><th>

Description</th></tr>

<tr><td>/force</td><td> Confirms that XGameSave storage should be reset. Running the <b>reset</b> command without specifying <b>/force</b> causes the following message to be displayed, "As Connected Storage factory reset is a potentially destructive operation this command does not perform the reset unless the <b>/force</b> flag is present."</td></tr>
</table>

  
<a id="xbstorage_import"></a>

## xbstorage import  
  
Imports the data that's specified in *filename* to a XGameSave storage space. This XML file contains the data. For an example, see [xbstorage generate](#xbstorage_generate) in this topic. For more information about the file's XML format, see [Import and export file format](#xbstorage_fileformat) in this topic.  
  
There are two ways to specify a XGameSave storage space.  
   
*  If the input file has a **ContextDescription** section that's populated correctly, this information is used to specify the XGameSave storage space.<br/>  
  
*  The storage space can also be partially or fully specified via command-line parameters, which take precedence over the respective elements of the storage space that's specified in the input file.<br/>  

   
  
Examples of use are as follows.  
   
```
  xbstorage import mydata.xml
  xbstorage import mydata.xml /replace
  xbstorage import mydata.xml /machine /scid:2AAEB34B-DAB2-4879-B625-D970069C1D22
  xbstorage import mydata.xml /msa:user@example.com /scid:2AAEB34B-DAB2-4879-B625-D970069C1D22
  xbstorage import mydata.xml /verbose  
```

Before importing to the specified XGameSave storage space, the system attempts to synchronize with the cloud by using the same logic that runs when a XGameSave storage space is acquired by a running app.  

If an app with the same Primary service configuration identifier (SCID) is running, this operation could cause a race condition and put the contents of the XGameSave storage space in an indeterminate state.  

If **/replace** isn't specified, the containers that are specified in the input file are erased before the blobs that are specified in the input file are written. Containers in the XGameSave storage space that aren't specified in the input file won't be touched.  

 
<table>
<tr><td><b>xbstorage import </b><i>file-name</i> [/scid:<i>SCID</i>] [/machine] [/msa:<i>account</i>] [/replace] [/verbose]

</td></tr>
</table>


<table>
<tr><th>

Option</th><th>

Description</th></tr>

<tr><td><i>file-name</i></td><td>The XML file that contains the data to be imported.</td></tr>

<tr><td>/scid:<i>SCID</i></td><td>The SCID.</td></tr>

<tr><td>/machine</td><td> A per-machine XGameSave storage space. This option can't be used simultaneously with the <b>/msa</b> option.</td></tr>

<tr><td>/msa:<i>account</i></td><td> The account to be used for a per-user XGameSave storage. The user must be signed in to the console for the space to be used. This option can't be used simultaneously with the <b>/machine</b> option.</td></tr>

<tr><td>/replace</td><td>Before the importation, deletes all containers in the specified XGameSave storage space.</td></tr>

<tr><td>/verbose</td><td>Displays the status of the importation.</td></tr>
</table>

  
<a id="xbstorage_export"></a>

## xbstorage export  

Exports data from a XGameSave storage space to the file that's specified by **outfile**. This XML file contains the data. For details about generating an example, see [xbstorage generate](#xbstorage_generate) in this topic. For details about the file's XML format, see [Import and export file format](#xbstorage_fileformat) in this topic.  

There are two ways to specify the XGameSave storage space.  

*  If the **/context** parameter is used and the file name that's specified by &lt;infile> has a **ContextDescription** section that's populated correctly, that file is used to specify the XGameSave storage space.<br/>  

*  The storage space can also be partially or fully specified via command-line parameters, which take precedence over the respective elements of the storage space that's specified in **/context**.<br/>  

   
  
Examples of use are as follows.  
   
```
  xbstorage export exporteddata.xml /context:space.xml
  xbstorage export exporteddata.xml /machine /scid:2AAEB34B-DAB2-4879-B625-D970069C1D22
  xbstorage export exporteddata.xml /msa:user@example.com /scid:2AAEB34B-DAB2-4879-B625-D970069C1D22
  xbstorage export exporteddata.xml /context:space.xml /verbose  
```
   
Before exporting the specified XGameSave storage space, the system attempts to synchronize with the cloud by using the same logic that runs when a XGameSave storage space is acquired by a running app.  

If an app with the same Primary SCID is running, this operation could cause a race condition and put the contents of the XGameSave storage space in an indeterminate state.  

 
<table>
<tr><td><b>xbstorage export </b><i>outfile</i> [/context:<i>input-file</i>] [/scid:<i>SCID</i>] [/machine] [/msa:<i>account</i>] [/verbose]


</td></tr>
</table>

 
<table>
<tr><th>

Option</th><th>

Description</th></tr>

<tr><td><i>outfile</i></td><td>The XML file to which the data is exported.</td></tr>

<tr><td>/context:<i>input-file</i></td><td>The input file from which the space information is to be read.</td></tr>

<tr><td>/scid:<i>SCID</i></td><td>The SCID.</td></tr>

<tr><td>/machine</td><td> A per-machine XGameSave storage space. This option can't be used simultaneously with the <b>/msa</b> option.</td></tr>

<tr><td>/msa:<i>account</i></td><td> An account to be used for a per-user XGameSave storage. The user must be signed in to the console for the space to be used. This option can't be used simultaneously with the <b>/machine</b> option.</td></tr>

<tr><td>/verbose</td><td>Displays the status of the <b>export</b> operation.</td></tr>
</table>

  
<a id="xbstorage_delete"></a>

## xbstorage delete  

Deletes all data from a XGameSave storage space. There are two ways to specify the XGameSave storage space.  
   
*  If the **/context** parameter is used and the file name that's specified by &lt;infile> has a **ContextDescription** section that's populated correctly, that file is used to specify the XGameSave storage space.<br/>  

*  The storage space can also be partially or fully specified via command-line parameters, which take precedence over the respective elements of the storage space that's specified in **/context**.<br/>  


Examples of use are as follows.  
   
```
  xbstorage delete /context:space.xml
  xbstorage delete /machine /scid:2AAEB34B-DAB2-4879-B625-D970069C1D22
  xbstorage delete /msa:user@example.com /scid:2AAEB34B-DAB2-4879-B625-D970069C1D22
  xbstorage delete /context:space.xml /verbose  
```

Before deleting the specified XGameSave storage space, the system attempts to synchronize with the cloud by using the same logic that runs when a XGameSave storage space is acquired by a running app.  

If an app with the same Primary SCID is running, this operation could cause a race condition and put the contents of the XGameSave storage space in an indeterminate state.  

<table>
<tr><td><b>xbstorage delete</b> [/context:<i>input-file</i>] [/scid:<i>SCID</i>] [/machine] [/msa:<i>account</i>] [/verbose]

</td></tr>
</table>

<table>
<tr><th>

Option</th><th>

Description</th></tr>

<tr><td>/context:<i>input-file</i></td><td>The input file from which the space information is to be read.</td></tr>

<tr><td>/scid:<i>SCID</i></td><td>The SCID.</td></tr>

<tr><td>/machine</td><td> A per-machine XGameSave storage space. This option can't be used simultaneously with the <b>/msa</b> option.</td></tr>

<tr><td>/msa:<i>account</i></td><td> The account to be used for a per-user XGameSave storage. The user must be signed in to the console for the space to be used. This option can't be used simultaneously with the <b>/machine</b> option.</td></tr>

<tr><td>/verbose</td><td>Displays the status of the <b>delete</b> operation.</td></tr>
</table>

  
<a id="xbstorage_generate"></a>

## xbstorage generate  
  
Generates dummy data and saves it to a file that's specified by &lt;filename>. For more information about the file's XML format, see [Import and export file format](#xbstorage_fileformat) in this topic.  
  
The SCID will be set to 00000000-0000-0000-0000-000000000000, and the account will be set for a per-machine XGameSave storage space. To change those values, edit the file directly after it's generated.  
   
  
Examples of use are as follows.  
   
```
  xbstorage generate dummydata.xml
  xbstorage generate dummydata.xml /containers:4
  xbstorage generate dummydata.xml /blobs:10
  xbstorage generate dummydata.xml /containers:4 /blobs:10
  xbstorage generate dummydata.xml /containers:4 /blobs:10 /blobsize:512  
```

The byte data is a simple ascending sequence. For example, a 5-byte blob would have the following bytes: 00 01 02 03 04.  

To specify a per-user XGameSave storage space, change the **Account** node in the XML file to something like the following example.  

```
  
   <Account msa="user@example.com"/>  
 ```
   
 
<table>
<tr><td><b>xbstorage generate </b><i>file-name</i> [/containers:<i>n</i>] [/blobs:<i>n</i>] [/blobsize:<i>n</i>]

</td></tr>
</table>


<table>
<tr><th>

Option</th><th>

Description</th></tr>

<tr><td><i>file-name</i></td><td>The XML file to which the data is written.</td></tr>

<tr><td>/containers:<i>n</i></td><td>The number of containers to be generated. The default value of <i>n</i> is 2. </td></tr>

<tr><td>/blobs:<i>n</i></td><td>The number of blobs to be generated. The default value of <i>n</i> is 3. </td></tr>

<tr><td>/blobsize:<i>n</i></td><td>The number of bytes per blob. The default value of <i>n</i> is 1024.</td></tr>
</table>

  
<a id="xbstorage_simulate"></a>

## xbstorage simulate  
  
Simulates out-of-local-storage conditions for the XGameSave storage service.  
 
<table>
<tr><td><b>xbstorage simulate</b> [/reserveremainingspace] [/forceoutoflocalstorage] [/stop] [/verbose]

</td></tr>
</table>


<table>
<tr><th>

Option</th><th>

Description</th></tr>

<tr><td>/reserveremainingspace</td><td>Reserves all remaining space in XGameSave storage. Deleting something from XGameSave storage makes some space available for use.</td></tr>

<tr><td>/forceoutoflocalstorage</td><td>Simulates the XGameSave storage service that has no available space left. Deleting something from XGameSave storage doesn't change the XGameSave storage service from reporting out of memory.</td></tr>

<tr><td>/stop</td><td>Stops all simulations.</td></tr>

<tr><td>/verbose</td><td>Displays the status of the <b>simulate</b> operation.</td></tr>
</table>

  
<a id="ID4E4MAC"></a>

## Common options  
 
<table>
<tr><td><b>xbstorage</b> [/?] [/X<i>:address</i> [<i>+accesskey</i>] ]

</td></tr>
</table>


<table>
<tr><th>

Option</th><th>

Description</th></tr>

<tr><td>/?</td><td> Displays help for xbstorage.exe. </td></tr>

<tr><td>/X<i>:address</i> [<i>+accesskey</i>]</td><td><ul><li>Use this option to specify the host name or address (shown as <b>Tools IP</b> on the console) of a targeted console without changing the default console. For details about setting a host name for a console, see <a href="../../../getstarted/common-settings/setting-a-hostname.html">Setting a host name for the console IP address</a>.</li><li>If you don't use this option, the default console (previously set by <a href="xbconnect.html">Connect (xbconnect.exe)</a>) is used.</li><li>Use the <i>accesskey</i> string to provide console access only to those people who have the access key.</li><li> Set the access key by using the command <b>xbconfig</b> <b>accesskey=<i>your-key</i></b>, and then restart your console to make the access key effective.</li><li>To access a console that's configured with an access key, include a plus sign (+) and the access key after the IP address or host name of the console.</li><li>If an access key is provided when the default console is set by <a href="xbconnect.html">xbconnect</a>, the access key is stored as part of the default console's address.</li><li>For more information about access keys, see <a href="xbconfig.html">xbconfig accesskey</a>.</li></ul> 


 </td></tr>
</table>

  
<a id="xbstorage_fileformat"></a>

## Import and export file format  
  
The XML file that's used with the **import**, **export**, and **generate** commands has the format that's shown in the following example.
   
```xml
  <?xml version="1.0" encoding="UTF-8"?> 
  <XbConnectedStorageSpace> 
    <ContextDescription> 
      <Account machine="true" /> 
      <Title scid="00000000-0000-0000-0000-000000000000" /> 
    </ContextDescription> 
    <Data> 
      <Containers> 
        <Container name="Container1"> 
          <Blobs> 
            <Blob name="Blob1"> 
              <![CDATA[... ] ]> 
            </Blob> 
            ... 
            <Blob name="BlobN"> 
              <![CDATA[... ] ]> 
            </Blob> 
          </Blobs>
        </Container> 
        ... 
        <Container name="ContainerN"> 
        ... 
        </Container> 
      </Containers> 
    </Data> 
  </XbConnectedStorageSpace>  
```
   
The format of data in this XML file isn't identical to the format on the platform. The format might change in the future, so the files should be treated as if they have an intermediate or utility format, not an archival format.  
  
The **ContextDescription** node is optional. If you're making a XGameSave storage space for a user, you can use `<Account msa="user@example.com"/>` instead of `<Account machine="true"/>`. Otherwise, the context can be specified on the command line for importation.  
  
Blobs and containers should have the corresponding names given to them by the game or app for which the file is being generated.  
  
The contents of each blob should be a string wrapped in a **CDATA** tag, which is generated by calling **CryptBinaryToStringW** with the flag **CRYPT_STRING_BASE64**, providing the data for that blob as a raw-byte array. Conversely, blob data can be converted back by calling **CryptStringToBinary** to provide the formerly encrypted string. For an example of using these two functions, see [CryptBinaryToString returns invalid bytes](https://social.msdn.microsoft.com/Forums/vstudio/9acac904-c226-4ae0-9b7f-261993b9fda2/cryptbinarytostring-returns-invalid-bytes?forum=vcgeneral).  
  
<a id="ID4EWBAE"></a>

## See also  
[Command-line tools (NDA topic)](commandlinetools.md)  

[XTF transport errors (NDA topic)](xtf-transport-errors.md)  

[Connect (xbconnect.exe) (NDA topic)](xbconnect.md)  

[Manage xgamesave files data on PC (xgamesaveutil.exe)](../../../tools-pc/commandlinetools/gr-xgamesaveutil.md)