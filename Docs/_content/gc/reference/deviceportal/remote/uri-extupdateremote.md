---
author: aablackm
title: "/ext/update/remote (API contents)"
description: Recovers the specified Xbox One development console to the recovery hosted on the specified network share. Only supported for the Xbox One platform.
kindex: URI, /ext/update/remote
ms.author: mstahl
ms.topic: conceptual
edited: 01/06/2020
security: public
---

# /ext/update/remote
Recovers the specified Xbox One development console to the recovery hosted on the specified network share.   > [!NOTE]
> Only supported for the Xbox One platform.   
   
   *  [URI parameters](#ID4E4)  

 
<a id="ID4E4"></a>

   

## URI parameters   
   

| Parameter| Description| 
| --- | --- | 
| networkshare| base64-encoded string| The network share location of the system update packages. This network share should be base64-encoded. | 

  
<a id="ID4EWB"></a>

   

## Valid methods   
  
[POST (/ext/update/remote)](uri-extupdateremote-post.md)  
Gets a Boolean value that indicates whether the specified AppXManifest is for an ERA title.
 
<a id="ID4E5B"></a>

   

## See also  
 
<a id="ID4EAC"></a>

   

##### Parent   
 [Remote Recovery URIs](atoc-rest-remote.md)

   