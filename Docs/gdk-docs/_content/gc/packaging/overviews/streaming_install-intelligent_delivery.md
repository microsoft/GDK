---
author: jgup
title: 'Streaming Installation and Intelligent Delivery: an overview'
description: Provides an overview of the Streaming Installation and Intelligent Delivery features, including how title data is organized into chunks to facilitate fast and flexible installation.
kindex: Streaming Installation and Intelligent Delivery - Overview
ms.author: jgup
ms.topic: conceptual
edited: 10/04/2019
security: public
---

# Streaming Installation and Intelligent Delivery: an overview
   
  
On Xbox One, all titles run from the hard drive. Content can be delivered from any number of sources, but it's primarily delivered via an optical disc and the cloud&mdash;Blu-ray Disc and Xbox Live. 
   
  
To get consumers to start playing games as soon as possible, Xbox One uses a feature called *Streaming Installation*, which allows titles to run before they are completely installed. This feature also allows titles change the order in which content is installed in response to user input or other events.  
 
<a id="ID4EPB"></a>

   

## Benefits of Streaming Installation and Intelligent Delivery  
   
  
The following features of Streaming Installation and Intelligent Delivery provide a smoother experience to users playing a title for the first time.  
     
  
### Only a subset of data is required to launch a title

Each title can specify a subset of its data that's required for the title to start. The system ensures that this content has been copied to the hard drive before the application is registered and made available for launch.   
 
   
  
### Installation data is downloaded and installed only when appropriate

Installation data can be marked with specifiers so that it's downloaded and installed only when appropriate. For example, you can mark assets that apply only to a specific language. Those assets are then delivered only to consoles that are set to that language. In addition, assets that are used only on Xbox One consoles of a specific class can be marked with specifiers so that assets are installed only on consoles of that class.
 
   
  
### Installation of a title continues in the background

A title starts as soon as the minimum data required to launch it is copied to the hard drive. The remaining data is copied from the installation source to the hard drive while the title is running.  
   
  
Installation continues in the background even if the user switches between applications. For example, if a user is playing a game and then decides to watch a movie, the system continues the installation in the background while the movie is playing.  
 
    
<a id="ID4EZC"></a>

   

## Using streaming installation  
   
  
To use streaming installation, you define a list of files that constitute a *chunk* of data; each chunk supports a specific part of your title's gameplay. You also define the order in which chunks are installed by default. This order is specified in an XML file that maps the layout of the chunks. For example, the following sample shows a simple package file.  
   
```xml
  <Package>
    <Chunk Id="1000" Marker="Launch">
      <FileGroup DestinationPath="\" SourcePath="X:\bin" Include="*.*"/>
    </Chunk>
    <Chunk Id="1001">
      <FileGroup DestinationPath="\Data\Maps" SourcePath="Y:\Maps\Level1" Include="*.map"/>
      <FileGroup DestinationPath="\Data\Maps" SourcePath="Y:\Maps\Level2" Include="*.map"/>
      <FileGroup DestinationPath="\Data\Maps" SourcePath="Y:\Maps\Level3" Include="*.map"/>
      <FileGroup DestinationPath="\Data\Maps" SourcePath="W:\ExtraMaps" Include="*.map"/>
      <FileGroup DestinationPath="\Data\Textures" SourcePath="M:\MapTextures" Include="*.png"/>
      <FileGroup DestinationPath="\Data\Textures" SourcePath="W:\ExtraMapTextures" Include="*.png"/>
    </Chunk>
  </Package>  
```
   
  

   
  
To package a title's data for streaming, run the command-line tool `Make Package (makepkg.exe)` with the mapping file as a parameter. 
  
After an application package has been created, test streaming installation on a console by using `xbapp` `install`. For more information about this command, see [Application Management (xbapp.exe) (NDA topic)](../../tools-console/xbox-tools-and-apis/commandlinetools/xbapp.md).  
  

<a id="ID4EXX"></a>

   

## Using Intelligent Delivery  
   
  
To use Intelligent Delivery, mark chunks in your layout file appropriately. The following code sample demonstrates how to mark a chunk so that it's installed only on an Xbox One X console and with the language set to French.

```xml
  <Package>
    <Chunk Id="2002" Devices="Xbox-Scorpio" Languages="fr">
      ...
    </Chunk>
  </Package>  
```
  
<a id="ID4EVF"></a>

## Alignment requirements  

Previous versions of MakePkg tooling required the use of a special alignment chunk in order to avoid larger than expected content updates. This is no longer required.
  
<a id="ID4E1G"></a>

   

## Update  
   
  
Normally, title updates occur in the background, and users aren't aware that an update is in progress. However, in some cases, the title might be running while an update is in progress. Even if this is the case, the updater can update individual chunks. While a chunk is in the process of being updated, a query about its status indicates that the chunk isn't installed.  
   
  
After the chunks in the launch set have been updated, the title can be launched. The system behaves as if the title is being installed again.  
   
 
<a id="ID4EVH"></a>

   

## In this section  

[Dynamic chunk reordering](../packaging-chunkreordering.md)  
Describes how a title can change the order in which data is installed in response to user input.

[Content Update (NDA topic)](../packaging-updates.md)  
Describes how to author and test packages for content update.

[Streaming installation: debugging](../packaging-debugging.md)  
Describes how to pause streaming installation of a title until the debugger is connected to the title.

[Streaming installation: status](../packaging-installstatus.md)  
Describes how a title can monitor the progress of an installation.
  
[Multi-disc functionality](../packaging-multi-disc.md)  
Describes how to create Xbox One titles that span more than one disc. 

[Application packaging during development](../packaging-packaging-during-development.md)  
Describes the three stages of application packaging during the development process: unencrypted packaging, test encryption packaging, and production encryption packaging.

[Intelligent Delivery](intelligentdelivery.md)  
Describes how to use Intelligent Delivery to install only a subset of content.

[Creating test discs (NDA topic)](../creating-test-compilation-discs.md)  
Describes how to create test discs.

[Testing packages on PC](../packaging-testing-PC-install.md)  
Describes how to test packages on a development PC.





 
<a id="ID4EUAAC"></a>

   


