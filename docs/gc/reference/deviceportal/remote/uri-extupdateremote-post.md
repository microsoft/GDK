---
author: aablackm
title: POST (/ext/update/remote)
description: Gets a Boolean value that indicates whether the specified AppXManifest is for an ERA title.
ms.assetid: 84c0df50-77e0-b363-68d5-73c143f1ce80
kindex: POST, /ext/update/remote
ms.author: mstahl
ms.topic: conceptual
edited: 00/00/0000
security: public
---

# POST (/ext/update/remote)
Gets a Boolean value that indicates whether the specified AppXManifest is for an ERA title.   
   *  [URI parameters](#ID4ET)  
   *  [Required request headers](#ID4EMB)  
   *  [Required request body](#ID4ETB)  
   *  [Response](#ID4ETC)  

 
<a id="ID4ET"></a>

   

## URI parameters   
   

| Parameter| Description| 
| --- | --- | 
| networkshare| base64-encoded string| The network share location of the system update packages. This network share should be base64-encoded. | 

  
<a id="ID4EMB"></a>

   

## Required request headers  
   
  
None.   
  
<a id="ID4ETB"></a>

   

## Required request body   
   
  
if credentials are required to access the network share, the request must contain a JSON body that contains optional username and password parameters and a Boolean parameter **AllowSameBuild** that indicates whether the recovery should be allowed to proceed even if the console is already on this build. The JSON should also contain an array named **RecoverOptions** which contains ParamName to ParamValue key-value pairs specifying the following update options:   
   
   *  X-UpdateDownloadPolicy : 1 or 0, where 0 means the console will show an update prompt and 1 supresses that prompt.  
   *  X-ForceFactoryReset : bool indicating if a factory reset should be performed.  
   *  X-FactoryResetOptions : 0xdededede if performing a factory reset, 0 otherwise.  
   *  X-HostName : should be set to "&lt;save>" to preserve the hostname, even in factory reset scenarios.   
   *  X-InhibitIdleTimeout : bool indicating if the screen dim settings should be respected while updating.  
   *  X-SandboxId : the sandbox id to set as part of the recovery.  

  
<a id="ID4ETC"></a>

   

## Response  
 
<a id="ID4EZC"></a>

   

### HTTP status codes   
   
  
The service returns one of the status codes in this section in response to a request made with this method on this resource.   
   

| Code| Description| 
| --- | --- | --- | --- | 
| 200| The console was successfully updated to the specified recovery.| 
| 4XX| Error codes. | 
| 5XX| Error codes. | 

   
<a id="ID4EAE"></a>

   

## See also  
 
<a id="ID4ECE"></a>

   

##### Parent  
 [/ext/update/remote](uri-extupdateremote.md)

   