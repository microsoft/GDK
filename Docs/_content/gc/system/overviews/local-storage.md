---
author: jgup
title: Local storage on Xbox console
description: Describes the temporary local storage available to titles on Xbox consoles and how to access temporary locally stored data, installed game data, and the developer scratch partition.
ms.assetid: cf025461-ee1b-4cae-0a36-e64dbf225a79
kindex:
- Local storage
- Persistent local storage
- PLS
- Growable Persistent Local Storage
- Temp storage
- Temp
- XR-133
ms.author: jgup
ms.topic: conceptual
edited: 10/08/2019
security: public
---

# Local storage
   
  
Four types of local storage are accessible on the Xbox One console: 

*  Temporary local storage
*  Installed game data
*  Developer scratch partition
*  Persistent local storage  

| Storage Type | Location |
| --- | --- |
| Installed Game Data | G:\\ |
| Temporary Local Storage | T:\\ |
| Developer Scratch Partition | D:\\ |
| Persistent Local Storage | Call [XPersistentLocalStorageGetPathSize](../../reference/system/xpersistentlocalstorage/functions/xpersistentlocalstoragegetpathsize.md) and [XPersistentLocalStorageGetPath](../../reference/system/xpersistentlocalstorage/functions/xpersistentlocalstoragegetpath.md) to obtain the path size and data. |
| Downloadable Content | Call [XPackageMount](../../reference/system/xpackage/functions/xpackagemount.md) to mount DLC and [XPackageGetMountPath](../../reference/system/xpackage/functions/xpackagegetmountpath.md) to obtain the path. |


**XR-133: Local Storage Write Limitations**
> [!NOTE]
> Titles running on Xbox Series S, Xbox Series X, or any other consoles in the same console family must not write more than 1 GiB of data to either Persistent Local Storage (PLS) or Temporary Local Storage over a rolling 5 minute window. Titles that exceed 1GiB of writes will not successfully pass certification testing. Developers can look at PIX timing captures for warnings as to when the write limit is exceeded.  Additionally, titles can monitor their write statistics at runtime by calling [XPackageGetWriteStats](../../reference/system/xpackage/functions/xpackagegetwritestats.md).  


 **Temporary local storage**  
Temporary local storage is exposed to titles as *drive T*. Temp storage can be accessed while the title is running by using the */x:/title* to any [XtfFileIO](../../reference/tools/xtf/xtffileio/xtffileio-xbox-microsoft-n.md) commands. Temporary local storage allows storage and remote retrieval of temporary files, such as log files. Files written to temporary local storage are guaranteed to be available only while a title is running and is deleted after a title has been terminated.   
   
  
Temporary local storage also has the following features:  
   
   *  2 GB of dedicated storage  
   *  Content is deleted after the title has been terminated.  
   *  Content persists when suspending and resuming, including quick resume.
   
  
 **Installed game data**   
 &nbsp;&nbsp;The location of the installed game data of the currently running title is mapped to *drive G*. This volume is read only within the running Game's view when using packaged builds. 
   
  
 **Developer scratch partition**   
 &nbsp;&nbsp;The developer scratch partition is exposed as *drive D*. The developer scratch partition is local storage for use during development only. You should compile out all references to it in retail mode to avoid any potential issues.
   
  
 **Persistent Local Storage**  
Titles can request access to Persistent Local Storage (PLS) as part of their manifest.   
   
  
This storage space is intended to be used as a long-term cache for storing non-game-save data, such as replays and custom rendered recordings of gameplay. PLS isn't designed to be a primary data storage space. It's never to be used for game saves, content updates, or any other data that must exist for the title to run. Instead, store game saves using the Connected Storage API, or, optionally for online-only titles, using Xbox Live Title Storage or a publisher-hosted cloud storage service.   
  
  
PLS has the following characteristics:  
   
   *  Title specific: This storage space can be accessed by the title that requested it only.  
   *  Console-specific: This storage space is always created in an XVD which is specific to the console (even if the title is installed on an external drive) and cannot be used on another console.   
   *  Guaranteed allocation: The system ensures that the space is allocated prior to the title being allowed to launch. If insufficient hard drive space is available, the user is prompted to free up space to allow the title to run.   
   *  User-controlled: The storage space can be deleted by users from the system shell. The system never automatically deletes any items in the space.  
   *  Tied to title install lifetime: When a title is uninstalled, the associated local storage space is removed too. If the title is re-installed, none of the previous existing data is restored.  
   *  Resilient and tamper resistant: The storage space is encrypted and integrity checked so that the data saved by the title cannot be tampered with.  

   
  
To request PLS, add the following markup to the MicrosoftGame.config as a child of &lt;Game>.   
   
```xml
<?xml version="1.0" encoding="utf-8"?>
<Game configVersion="1">
    <!-- snip -->
    <PersistentLocalStorage><SizeMB>1024</SizeMB></PersistentLocalStorage>
</Game>
```
   
  
To acquire local persistent storage space, call [XPersistentLocalStorageGetPathSize](../../reference/system/xpersistentlocalstorage/functions/xpersistentlocalstoragegetpathsize.md) and [XPersistentLocalStorageGetPath](../../reference/system/xpersistentlocalstorage/functions/xpersistentlocalstoragegetpath.md) to obtain the path size and data, which returns the path of the persistent storage for the title. The total amount of space available is determined by what the title requested in the MicrosoftGame.config declaration for local storage.   

If the title uses a content update to increases the size of their requested persistent local storage space, the previous storage space will be deleted and its content will be lost during the upgrade.

**Growable Persistent Local Storage**  
Growable Persistent Local Storage is an extension of PLS, which allows titles to request access to a much larger amount of local storage space, without permanently reserving that space up front.  It is suitable for use by titles that have some scenarios which require additional space, for example User Generated Content (UGC) downloads, or large local replay files, which not all users may utilize.

To request Growable PLS, add the following markup to the MicrosoftGame.config as a child of &lt;Game>.

```xml
<?xml version="1.0" encoding="utf-8"?>
<Game configVersion="1">
    <!-- snip -->
    <PersistentLocalStorage>
        <!-- <SizeMB>1024</SizeMB>   --Optional.  To be used if your title always wants 1024 MBs pre-allocated even before launch -->
        <GrowableToMB>20480</GrowableToMB> <!-- This is not a static reservation, but the largest size your title PLS can grow to -->
    </PersistentLocalStorage>
</Game>
```

Before writing to Growable PLS, your title must check for available space using the [XPersistentLocalStorageGetSpaceInfo](../../reference/system/xpersistentlocalstorage/functions/xpersistentlocalstoragegetspaceinfo.md) API.

If your title needs more space than is available, has not filled its Growable PLS allocation, but there is insufficient underlying space on the drive for the PLS XVD to be increased, you will need to prompt the end user to free up the requested additional space your title needs by using the [XPersistentLocalStoragePromptUserForSpaceAsync](../../reference/system/xpersistentlocalstorage/functions/xpersistentlocalstoragepromptuserforspaceasync.md) function.

If the title uses a content update to change from using a non-growable persistent local storage to a growable storage space, the previous storage space will be deleted and its content will be lost during the upgrade.

**Downloadable content**   

&nbsp;&nbsp;Downloadable content, after it's installed, can be mounted and unmounted on demand. Call [XPackageMount](../../reference/system/xpackage/functions/xpackagemount.md) to mount DLC and [XPackageGetMountPath](../../reference/system/xpackage/functions/xpackagegetmountpath.md) to obtain the path.


![alert](../../../../resources/gamecore/images/en-us/common/note.gif) **NOTE:** **Never** hardcode returned path values because they might vary over time and are valid only after a package is mounted.


 
  
<a id="ID4EFCAC"></a>

   

## Accessing game data with the remote console tools  
   
  
The remote console tools can use the same mapping as running titles by specifying **/title** with the **/X** switch. Then, the remote console tools can access data written to the scratch volume and the installed game data for the current title.   
   
  
To copy scratch volume files to your development PC, use **xbcp** in the following way:   
    
  
 <strong>xbcp /x:/title xd:\\</strong><em>file-name</em> <strong>c:\\</strong><em>local-path</em>   
    
  
To copy files from your development PC to the title volume, use **xbcp** in the following way:  
    
  
 <strong>xbcp /x:/title c:\\</strong><em>file-name</em> <strong>xg:\\</strong><em>dest-path</em>   
    
  
You can access PLS from a development PC when the title is running only. Files can be copied to and from this location using the xb commands. For example:  
    
  
 <strong>xbcp /x:/title c:\\</strong><em>file-name</em> <strong>xr:\\</strong><em>dest-path</em>  
    
  
For more information about the syntax to use remote console tools to work with files on the console, see [File copy (xbcp.exe) (NDA topic)](../../tools-console/xbox-tools-and-apis/commandlinetools/xbcp.md).   
  
<a id="ID4ELEAC"></a>

   

## See also  
 [Game save overview](game-save/game-saves.md)

 
  