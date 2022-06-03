---
author: jgup
title: Manage xgamefiles data on PC (xgamesaveutil.exe)
description: Manages XGameSave data on the PC.
ms.assetid: 4d6f8a21-8ac3-602c-a47d-b4fb274355eb
kindex:
- xgamesave, manage data on PC (xgamesaveutil.exe)
- xgamesaveutil.exe
ms.author: jgup
ms.topic: conceptual
edited: 10/15/2020
security: public
---

# Manage XGameSave data on PC (xgamesaveutil.exe)

Use this tool to manage XGameSave data on the PC. The tool provides the following subcommands and functions.   
> [!NOTE]
> If you need to manage XGameSave data on the console, you must use the
[xbstorage.exe command-line tool](../../tools-console/xbox-tools-and-apis/commandlinetools/xbstorage.md).
 
<table> 
<tr> <th>

Command</th> <th>

Description</th> </tr>
 
<tr><td><a href="#xgamesaveutil_reset">reset</a></td><td>Deletes all local data for the specified PFN and SCID on the PC</td></tr>
 
<tr><td><a href="#xgamesaveutil_import">import</a></td><td>Imports data from the specified XML file to an XGameSave storage space</td></tr>
 
<tr><td><a href="#xgamesaveutil_export">export</a></td><td>Exports data from an XGameSave storage space to the specified XML file</td></tr>
 
<tr><td><a href="#xgamesaveutil_delete">delete</a></td><td>Deletes data from an XGameSave storage space</td></tr>
 
<tr><td><a href="#xgamesaveutil_generate">generate</a></td><td>Generates dummy data and saves it to the specified XML file</td></tr>

</table>

 
<a id="xgamesaveutil_reset"></a>

## xgamesaveutil reset  

```
xgamesaveutil reset [/pfn:<PFN>] [/scid:<SCID>] [/context:<infile>]
```
  
Deletes all local data for the specified PFN and SCID.

There are two ways to specify the location of the data to delete:

- If the **/context** parameter is used, and the filename specified by \<infile\> has a *ContextDescription* section that is correctly 
  populated, then that file will be used to specify the target PFN and SCID.

- The PFN and SCID can be partially or fully specified via command-line parameters, which take precedence over the respective elements 
  of the specified PFN and SCID from the input file.
  
<table>
<tr>
<th>Option</th>
<th>Description</th>
</tr>

<tr>
<td>/context:&lt;infile&gt;</td>
<td>Use the specified file to specify the app PFN and SCID.</td>
</tr>

<tr>
<td>/pfn:&lt;PFN&gt;</td>
<td>Specifies the Package Family Name(PFN) for the app to delete the data from. The app must be installed.</td>
</tr>

<tr>
<td>/scid:&lt;SCID&gt;</td>
<td>Specifies the Service Configuration Identifier (SCID). This is from your Xbox Live configuration.</td>
</tr>
</table>

Examples of use are as follows.  

```cmd
xgamesaveutil reset /context:target.xml
xgamesaveutil reset /pfn:MyGame_xxxxxx /scid:2AAEB34B-DAB2-4879-B625-D970069C1D22
```

  
<a id="xgamesaveutil_import"></a>

## xgamesaveutil import  

```
xgamesaveutil import <filename> [/pfn:<PFN>] [/scid:<SCID>] [/replace]
```
  
Imports the data that's specified in *filename* to a storage space. This XML file contains the data. For an example, 
see [xgamesaveutil generate](#xgamesaveutil_generate) in this topic. For more information about the file's XML format, see 
[Import and export file format](#xgamesaveutil_fileformat) in this topic.  
  
There are two ways to specify where to import the XGameSave data to:
   
- If the **/context** parameter is used, and the filename specified by \<filename\> has a *ContextDescription* section that is correctly 
  populated, then that file will be used to specify the target PFN and SCID.

- The PFN and SCID can be partially or fully specified via command-line parameters, which take precedence over the respective elements 
  of the specified PFN and SCID from the input file.

<table>
<tr>
<th>Option</th>
<th>Description</th>
</tr>

<tr>
<td>/pfn:&lt;PFN&gt;</td>
<td>Specifies the Package Family Name(PFN) for the app to delete the data from. The app must be installed.</td>
</tr>

<tr>
<td>/scid:&lt;SCID&gt;</td>
<td>Specifies the Service Configuration Identifier (SCID). This is from your Xbox Live configuration.</td>
</tr>

<tr>
<td>/replace</td>
<td>Delete all containers before performing the import.</td>
</tr>
</table>  
  
Examples of use are as follows.  
   
```cmd
xgamesaveutil import mydata.xml
xgamesaveutil import mydata.xml /replace
xgamesaveutil import mydata.xml /pfn:MyGame_xxxxxx /scid:2AAEB34B-DAB2-4879-B625-D970069C1D22
```

Before importing to the specified XGameSave storage space, the system attempts to synchronize with the cloud by using the same 
logic that runs when the space is acquired by a running game. 

If a game with the same Primary service configuration identifier (SCID) is running, this operation could cause a race condition and 
put the contents of the XGameSave storage space in an indeterminate state.  

If **/replace** isn't specified, the containers that are specified in the input file are erased before the blobs that are specified 
in the input file are written. Containers in the XGameSave storage space that aren't specified in the input file won't be touched.  

  
<a id="xgamesaveutil_export"></a>

## xgamesaveutil export  

```
xgamesaveutil export <outfile> [/pfn:<PFN>] [/scid:<SCID>] [/context:<infile>]
```

Exports data from a Connected Storage space to the file that's specified by **outfile**. This XML file contains the data. For 
details about generating an example, see [xgamesaveutil generate](#xgamesaveutil_generate) in this topic. For details about the file's 
XML format, see [Import and export file format](#xgamesaveutil_fileformat) in this topic.  

There are two ways to specify where to export the XGameSave data from:
   
- If the **/context** parameter is used, and the filename specified by \<infile\> has a *ContextDescription* section that is correctly 
  populated, then that file will be used to specify the target PFN and SCID.

- The PFN and SCID can be partially or fully specified via command-line parameters, which take precedence over the respective elements 
  of the specified PFN and SCID from the input file. 
  
  
<table>
<tr>
<th>Option</th>
<th>Description</th>
</tr>

<tr>
<td>/pfn:&lt;PFN&gt;</td>
<td>Specifies the Package Family Name(PFN) for the app to delete the data from. The app must be installed.</td>
</tr>

<tr>
<td>/scid:&lt;SCID&gt;</td>
<td>Specifies the Service Configuration Identifier (SCID). This is from your Xbox Live configuration.</td>
</tr>
</table>  
  
Examples of use are as follows.  
   
```cmd
xgamesaveutil export exporteddata.xml /context:target.xml
xgamesaveutil export exporteddata.xml /pfn:MyGame_xxxxxx /scid:2AAEB34B-DAB2-4879-B625-D970069C1D22
```
   
Before exporting the specified XGameSave storage space, the system attempts to synchronize with the cloud by using the same 
logic that runs when a storage space is acquired by a running app.  

If an app with the same Primary SCID is running, this operation could cause a race condition and put the contents of the 
XGameSave storage space in an indeterminate state.  


<a id="xgamesaveutil_delete"></a>

## xgamesaveutil delete  

```
xgamesaveutil delete [/pfn:<PFN>] [/scid:<SCID>] [/context:<infile>]
```

Deletes all data from an XGameSave storage space. 

There are two ways to specify where to delete the XGameSave data from:
   
- If the **/context** parameter is used, and the filename specified by \<infile\> has a *ContextDescription* section that is correctly 
  populated, then that file will be used to specify the target PFN and SCID.

- The PFN and SCID can be partially or fully specified via command-line parameters, which take precedence over the respective elements 
  of the specified PFN and SCID from the input file. 

<table>
<tr>
<th>Option</th>
<th>Description</th>
</tr>

<tr>
<td>/pfn:&lt;PFN&gt;</td>
<td>Specifies the Package Family Name(PFN) for the app to delete the data from. The app must be installed.</td>
</tr>

<tr>
<td>/scid:&lt;SCID&gt;</td>
<td>Specifies the Service Configuration Identifier (SCID). This is from your Xbox Live configuration.</td>
</tr>
</table>  

Examples of use are as follows.  
   
```cmd
xgamesaveutil delete /context:target.xml
xgamesaveutil delete /pfn:MyGame_xxxxxx /scid:2AAEB34B-DAB2-4879-B625-D970069C1D22 
```

Before deleting the specified XGameSave storage space, the system attempts to synchronize with the cloud by using the same 
logic that runs when the storage space is acquired by a running app.  

If an app with the same Primary SCID is running, this operation could cause a race condition and put the contents of the 
storage space in an indeterminate state.  

 
<a id="xgamesaveutil_generate"></a>

## xgamesaveutil generate  

```
xgamesaveutil generate <filename> [/containers:<n>] [/blobs:<n>] [/blobsize:<n>]
```
  
Generates dummy data and saves it to a file that's specified by <filename>. For more information about the file's 
XML format, see [Import and export file format](#xgamesaveutil_fileformat) in this topic.  
  
The SCID will be set to 00000000-0000-0000-0000-000000000000. Developers should change those values, editting the 
file directly after it's generated.  
   
<table>
<tr>
<th>Option</th>
<th>Description</th>
</tr>

<tr>
<td>/containers:&lt;n&gt;</td>
<td>Specifies how many containers to generate. Default is 2.</td>
</tr>

<tr>
<td>/blobs:&lt;n&gt;</td>
<td>Specifies how many blobs per container to generate. Default is 3.</td>
</tr>

<tr>
<td>/blobsize:&lt;n&gt;</td>
<td>Specifies how many bytes per blob. Default is 1024.</td>
</tr>


</table>  



Examples of use are as follows.  
   
```cmd
xgamesaveutil generate dummydata.xml
xgamesaveutil generate dummydata.xml /containers:4
xgamesaveutil generate dummydata.xml /blobs:10
xgamesaveutil generate dummydata.xml /containers:4 /blobs:10
xgamesaveutil generate dummydata.xml /containers:4 /blobs:10 /blobsize:512
```

The byte data is a simple ascending sequence. For example, a 5-byte blob would have the following bytes: 00 01 02 03 04.  

To specify a per-user XGameSave storage space, change the **Account** node in the XML file to something like the following example.  

```
<Account msa="user@example.com"/>  
```
  
<a id="xgamesaveutil_fileformat"></a>

## Import and export file format  
  
The XML file that's used with the **import**, **export**, and **generate** commands has the format that's shown in the following example.
   
```xml
  <?xml version="1.0" encoding="UTF-8"?> 
  <XbConnectedStorageSpace> 
    <ContextDescription> 
      <Account msa="user@example.com"/>
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
   
The format of data in this XML file isn't identical to the format on the platform. The format might change in the 
future, so the files should be treated as if they have an intermediate or utility format, not an archival format.  
  
The **ContextDescription** node is optional. If you're making an XGameSave storage space for a user, you can use 
`<Account msa="user@example.com"/>` instead of `<Account machine="true"/>`. Otherwise, the context can be specified 
on the command line for importation.
  
Blobs and containers should have the corresponding names given to them by the game or app for which the file is 
being generated.  
  
The contents of each blob should be a string wrapped in a **CDATA** tag, which is generated by calling 
**CryptBinaryToStringW** with the flag **CRYPT_STRING_BASE64**, providing the data for that blob as a raw-byte 
array. Conversely, blob data can be converted back by calling **CryptStringToBinary** to provide the formerly 
encrypted string. For an example of using these two functions, see 
[CryptBinaryToString returns invalid bytes](https://social.msdn.microsoft.com/Forums/vstudio/9acac904-c226-4ae0-9b7f-261993b9fda2/cryptbinarytostring-returns-invalid-bytes?forum=vcgeneral).  
  
<a id="ID4EWBAE"></a>

## See also  
[XGameSave overview](../../system/overviews/game-save/game-saves.md)
[XGameSaveFiles overview](../../system/overviews/game-save/game-save-win32.md)  
[Managing XGameSave Storage on console](../../tools-console/xbox-tools-and-apis/commandlinetools/xbstorage.md)